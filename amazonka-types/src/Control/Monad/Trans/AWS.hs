{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE KindSignatures             #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE RankNTypes                 #-}
{-# LANGUAGE RecordWildCards            #-}
{-# LANGUAGE UndecidableInstances       #-}

-- Module      : Control.Monad.Trans.AWS
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Control.Monad.Trans.AWS
    -- ( AWST
    -- , runAWST

    -- , send
    -- , paginate
    -- , presign
    where

import           Control.Applicative
import           Control.Error
import           Control.Monad.Base
import           Control.Monad.Catch
import           Control.Monad.IO.Class
import           Control.Monad.Morph
import           Control.Monad.Reader
import           Control.Monad.Trans
import           Control.Monad.Trans.Resource
import           Data.Conduit
import           Data.Monoid
import           Data.Time
import qualified Network.AWS                  as AWS
import           Network.AWS.Auth
import           Network.AWS.Signing.Types    hiding (presign)
import           Network.AWS.Types
import           Network.HTTP.Conduit

-- FIXME: Does switching to ExceptT gain anything? (Besides a hoist from mmorph)

data Env = Env
    { _envAuth     :: Auth
    , _envRegion   :: Region
    , _envMananger :: Manager
    , _envState    :: InternalState
    }

withEnv :: MonadReader Env m => (Env -> m a) -> m a
withEnv f = ask >>= f

type AWS a = AWST IO

newtype AWST m a = AWST { _unAWST :: ReaderT Env (EitherT Error m) a }
    deriving
        ( Functor
        , Applicative
        , Alternative
        , Monad
        , MonadIO
        , MonadPlus
        , MonadReader Env
        )

instance MonadTrans AWST where
    lift = AWST . lift . lift

instance MonadBase IO m => MonadBase IO (AWST m) where
    liftBase = liftBaseDefault

instance MonadThrow m => MonadThrow (AWST m) where
    throwM = AWST . lift . lift . throwM

instance MonadCatch m => MonadCatch (AWST m) where
    catch m f = AWST (catch (_unAWST m) (_unAWST . f))

instance (MonadIO m, MonadBase IO m, MonadThrow m) => MonadResource (AWST m) where
    liftResourceT f = AWST $ asks _envState >>= liftIO . runInternalState f

instance MFunctor AWST where
    hoist nat m = mapAWST nat m

runAWST :: (MonadBase IO m, MonadMask m)
        => AWST m a        -- ^ Monadic action to run.
        -> Auth            -- ^ AWS authentication credentials.
        -> Region          -- ^ AWS Region.
        -> ManagerSettings -- ^ HTTP Manager settings.
        -> m (Either Error a)
runAWST (AWST rt) a r s = bracket open close $
    runEitherT . runReaderT rt . uncurry (Env a r)
  where
    open = (,)
        <$> liftBase (newManager s)
        <*> createInternalState

    close (m, i) =
        liftBase (closeManager m)
            `finally` closeInternalState i

mapAWST :: forall (m :: * -> *) (n :: * -> *) a b
         . (m (Either Error a) -> n (Either Error b)) -- ^ Transform the underlying monad and value.
        -> AWST m a                                   -- ^ The monadic action to transform.
        -> AWST n b
mapAWST f m = AWST . ReaderT $ \r -> EitherT (unwrap r)
  where
    unwrap = f . runEitherT . runReaderT (_unAWST m)

hoistError :: (Monad m, AWSError e) => Either e a -> AWST m a
hoistError = AWST . lift . hoistEither . fmapL toError

send :: ( MonadIO m
        , MonadBase IO m
        , MonadThrow m
        , AWSRequest a
        , AWSSigner (Signer' (Service' a))
        )
     => a -- ^ Request to send.
     -> AWST m (Response' a)
send rq = withEnv $ \Env{..} ->
    AWS.send _envAuth _envRegion rq _envMananger
        >>= hoistError

-- -- paginate :: ( MonadIO m
-- --             , MonadBase IO m
-- --             , MonadThrow m
-- --             , AWSPager a
-- --             , AWSSigner (Signer' (Service' a))
-- --             )
-- --          => a -- ^ Seed request to send.
-- --          -> Source (AWST m) (Either (Error' (Service' a)) (Response' a))
-- -- paginate rq = withEnv $ \Env{..} ->
-- --     AWS.paginate _envAuth _envRegion rq _envMananger

-- -- presign :: ( Monad m
-- --            , AWSRequest a
-- --            , AWSPresigner (Signer' (Service' a))
-- --            )
-- --         => a
-- --         -> Int     -- ^ Expiry time in seconds.
-- --         -> UTCTime -- ^ Signing time.
-- --         -> AWST m (Signed a (Signer' (Service' a)))
-- -- presign rq e t = withEnv $ \Env{..} -> return $
-- --     AWS.presign _envAuth _envRegion rq e t

-- -- -- async ?


-- --     -- start r = maybe (return ()) (timer r <=< delay)

-- --     -- delay n = truncate . diffUTCTime n <$> getCurrentTime

-- --     -- -- FIXME:
-- --     -- --  guard against a lower expiration than the -60
-- --     -- --  remove the error . show shenanigans
-- --     -- timer r n = void . forkIO $ do
-- --     --     threadDelay $ (n - 60) * 1000000
-- --     --     !a@Auth{..} <- eitherT throwIO return auth
-- --     --     atomicWriteIORef (_authRef r) a
-- --     --     start r _authExpiry
-- --     -- !a@Auth{..} <- auth
-- --     -- runIO $ do
-- --     --     r <- newAuth a
-- --     --     start r _authExpiry
-- --     --     return r

-- -- -- The IONewRef wrapper + timer is designed so that multiple concurrenct
-- -- -- accesses of 'Auth' from the 'AWS' environment are not required to calculate
-- -- -- expiry and sequentially queue to update it.
-- -- --
-- -- -- The forked timer ensures a singular owner and pre-emptive refresh of the
-- -- -- temporary session credentials.
