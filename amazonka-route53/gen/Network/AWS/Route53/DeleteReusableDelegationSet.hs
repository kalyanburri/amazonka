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

-- Module      : Network.AWS.Route53.DeleteReusableDelegationSet
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | This action deletes a reusable delegation set. To delete a reusable
-- delegation set, send a DELETE request to the
-- 2013-04-01/delegationset/delegation set ID resource. You can delete a
-- reusable delegation set only if there are no associated hosted zones. If
-- your reusable delegation set contains associated hosted zones, you must
-- delete them before you can delete your reusable delegation set. If you try
-- to delete a reusable delegation set that contains associated hosted zones,
-- Route 53 will deny your request with a DelegationSetInUse error.
module Network.AWS.Route53.DeleteReusableDelegationSet
    (
    -- * Request
      DeleteReusableDelegationSet
    -- ** Request constructor
    , deleteReusableDelegationSet
    -- ** Request lenses
    , drdsId

    -- * Response
    , DeleteReusableDelegationSetResponse
    -- ** Response constructor
    , deleteReusableDelegationSetResponse
    ) where

import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Route53.Types

newtype DeleteReusableDelegationSet = DeleteReusableDelegationSet
    { _drdsId :: Text
    } (Eq, Ord, Show, Generic, Monoid)

-- | 'DeleteReusableDelegationSet' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'drdsId' @::@ 'Text'
--
deleteReusableDelegationSet :: Text -- ^ 'drdsId'
                            -> DeleteReusableDelegationSet
deleteReusableDelegationSet p1 = DeleteReusableDelegationSet
    { _drdsId = p1
    }

-- | The ID of the reusable delegation set you want to delete.
drdsId :: Lens' DeleteReusableDelegationSet Text
drdsId = lens _drdsId (\s a -> s { _drdsId = a })

instance ToPath DeleteReusableDelegationSet where
    toPath DeleteReusableDelegationSet{..} = mconcat
        [ "/2013-04-01/delegationset/"
        , toText _drdsId
        ]

instance ToQuery DeleteReusableDelegationSet where
    toQuery = const mempty

instance ToHeaders DeleteReusableDelegationSet

data DeleteReusableDelegationSetResponse = DeleteReusableDelegationSetResponse
    deriving (Eq, Ord, Show, Generic)

-- | 'DeleteReusableDelegationSetResponse' constructor.
deleteReusableDelegationSetResponse :: DeleteReusableDelegationSetResponse
deleteReusableDelegationSetResponse = DeleteReusableDelegationSetResponse

instance FromXML DeleteReusableDelegationSetResponse where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "DeleteReusableDelegationSetResponse"
instance AWSRequest DeleteReusableDelegationSet where
    type Sv DeleteReusableDelegationSet = Route53
    type Rs DeleteReusableDelegationSet = DeleteReusableDelegationSetResponse

    request  = delete
    response = nullaryResponse DeleteReusableDelegationSetResponse
