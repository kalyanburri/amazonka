{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE NoImplicitPrelude          #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE RecordWildCards            #-}
{-# LANGUAGE TypeFamilies               #-}

-- {-# OPTIONS_GHC -fno-warn-unused-imports #-}
-- {-# OPTIONS_GHC -fno-warn-unused-binds  #-} doesnt work if wall is used
{-# OPTIONS_GHC -w #-}

-- Module      : Network.AWS.Redshift.ModifyEventSubscription
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Modifies an existing Amazon Redshift event notification subscription.
module Network.AWS.Redshift.ModifyEventSubscription
    (
    -- * Request
      ModifyEventSubscriptionMessage
    -- ** Request constructor
    , modifyEventSubscriptionMessage
    -- ** Request lenses
    , mesmEnabled
    , mesmEventCategories
    , mesmSeverity
    , mesmSnsTopicArn
    , mesmSourceIds
    , mesmSourceType
    , mesmSubscriptionName

    -- * Response
    , ModifyEventSubscriptionResult
    -- ** Response constructor
    , modifyEventSubscriptionResult
    -- ** Response lenses
    , mesrEventSubscription
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.Query
import Network.AWS.Redshift.Types

data ModifyEventSubscriptionMessage = ModifyEventSubscriptionMessage
    { _mesmEnabled          :: Maybe Bool
    , _mesmEventCategories  :: [Text]
    , _mesmSeverity         :: Maybe Text
    , _mesmSnsTopicArn      :: Maybe Text
    , _mesmSourceIds        :: [Text]
    , _mesmSourceType       :: Maybe Text
    , _mesmSubscriptionName :: Text
    } (Eq, Ord, Show, Generic)

-- | 'ModifyEventSubscriptionMessage' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'mesmEnabled' @::@ 'Maybe' 'Bool'
--
-- * 'mesmEventCategories' @::@ ['Text']
--
-- * 'mesmSeverity' @::@ 'Maybe' 'Text'
--
-- * 'mesmSnsTopicArn' @::@ 'Maybe' 'Text'
--
-- * 'mesmSourceIds' @::@ ['Text']
--
-- * 'mesmSourceType' @::@ 'Maybe' 'Text'
--
-- * 'mesmSubscriptionName' @::@ 'Text'
--
modifyEventSubscriptionMessage :: Text -- ^ 'mesmSubscriptionName'
                               -> ModifyEventSubscriptionMessage
modifyEventSubscriptionMessage p1 = ModifyEventSubscriptionMessage
    { _mesmSubscriptionName = p1
    , _mesmSnsTopicArn      = Nothing
    , _mesmSourceType       = Nothing
    , _mesmSourceIds        = mempty
    , _mesmEventCategories  = mempty
    , _mesmSeverity         = Nothing
    , _mesmEnabled          = Nothing
    }

-- | A Boolean value indicating if the subscription is enabled. true indicates
-- the subscription is enabled.
mesmEnabled :: Lens' ModifyEventSubscriptionMessage (Maybe Bool)
mesmEnabled = lens _mesmEnabled (\s a -> s { _mesmEnabled = a })

-- | Specifies the Amazon Redshift event categories to be published by the
-- event notification subscription. Values: Configuration, Management,
-- Monitoring, Security.
mesmEventCategories :: Lens' ModifyEventSubscriptionMessage [Text]
mesmEventCategories =
    lens _mesmEventCategories (\s a -> s { _mesmEventCategories = a })

-- | Specifies the Amazon Redshift event severity to be published by the event
-- notification subscription. Values: ERROR, INFO.
mesmSeverity :: Lens' ModifyEventSubscriptionMessage (Maybe Text)
mesmSeverity = lens _mesmSeverity (\s a -> s { _mesmSeverity = a })

-- | The Amazon Resource Name (ARN) of the SNS topic to be used by the event
-- notification subscription.
mesmSnsTopicArn :: Lens' ModifyEventSubscriptionMessage (Maybe Text)
mesmSnsTopicArn = lens _mesmSnsTopicArn (\s a -> s { _mesmSnsTopicArn = a })

-- | A list of one or more identifiers of Amazon Redshift source objects. All
-- of the objects must be of the same type as was specified in the source
-- type parameter. The event subscription will return only events generated
-- by the specified objects. If not specified, then events are returned for
-- all objects within the source type specified. Example: my-cluster-1,
-- my-cluster-2 Example: my-snapshot-20131010.
mesmSourceIds :: Lens' ModifyEventSubscriptionMessage [Text]
mesmSourceIds = lens _mesmSourceIds (\s a -> s { _mesmSourceIds = a })

-- | The type of source that will be generating the events. For example, if
-- you want to be notified of events generated by a cluster, you would set
-- this parameter to cluster. If this value is not specified, events are
-- returned for all Amazon Redshift objects in your AWS account. You must
-- specify a source type in order to specify source IDs. Valid values:
-- cluster, cluster-parameter-group, cluster-security-group, and
-- cluster-snapshot.
mesmSourceType :: Lens' ModifyEventSubscriptionMessage (Maybe Text)
mesmSourceType = lens _mesmSourceType (\s a -> s { _mesmSourceType = a })

-- | The name of the modified Amazon Redshift event notification subscription.
mesmSubscriptionName :: Lens' ModifyEventSubscriptionMessage Text
mesmSubscriptionName =
    lens _mesmSubscriptionName (\s a -> s { _mesmSubscriptionName = a })
instance ToQuery ModifyEventSubscriptionMessage

instance ToPath ModifyEventSubscriptionMessage where
    toPath = const "/"

newtype ModifyEventSubscriptionResult = ModifyEventSubscriptionResult
    { _mesrEventSubscription :: Maybe EventSubscription
    } (Eq, Show, Generic)

-- | 'ModifyEventSubscriptionResult' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'mesrEventSubscription' @::@ 'Maybe' 'EventSubscription'
--
modifyEventSubscriptionResult :: ModifyEventSubscriptionResult
modifyEventSubscriptionResult = ModifyEventSubscriptionResult
    { _mesrEventSubscription = Nothing
    }

mesrEventSubscription :: Lens' ModifyEventSubscriptionResult (Maybe EventSubscription)
mesrEventSubscription =
    lens _mesrEventSubscription (\s a -> s { _mesrEventSubscription = a })

instance FromXML ModifyEventSubscriptionResult where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ModifyEventSubscriptionResult"

instance AWSRequest ModifyEventSubscriptionMessage where
    type Sv ModifyEventSubscriptionMessage = Redshift
    type Rs ModifyEventSubscriptionMessage = ModifyEventSubscriptionResult

    request  = post "ModifyEventSubscription"
    response = xmlResponse $ \h x -> ModifyEventSubscriptionResult
        <$> x %| "EventSubscription"
