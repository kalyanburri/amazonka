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

-- Module      : Network.AWS.SimpleDB.DeleteAttributes
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes one or more attributes associated with an item. If all attributes
-- of the item are deleted, the item is deleted. DeleteAttributes is an
-- idempotent operation; running it multiple times on the same item or
-- attribute does not result in an error response. Because Amazon SimpleDB
-- makes multiple copies of item data and uses an eventual consistency update
-- model, performing a GetAttributes or Select operation (read) immediately
-- after a DeleteAttributes or PutAttributes operation (write) might not
-- return updated item data.
module Network.AWS.SimpleDB.DeleteAttributes
    (
    -- * Request
      DeleteAttributes
    -- ** Request constructor
    , deleteAttributes
    -- ** Request lenses
    , daAttributes
    , daDomainName
    , daExpected
    , daItemName

    -- * Response
    , DeleteAttributesResponse
    -- ** Response constructor
    , deleteAttributesResponse
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.Query
import Network.AWS.SimpleDB.Types

data DeleteAttributes = DeleteAttributes
    { _daAttributes :: [Attribute]
    , _daDomainName :: Text
    , _daExpected   :: Maybe UpdateCondition
    , _daItemName   :: Text
    } (Eq, Show, Generic)

-- | 'DeleteAttributes' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'daAttributes' @::@ ['Attribute']
--
-- * 'daDomainName' @::@ 'Text'
--
-- * 'daExpected' @::@ 'Maybe' 'UpdateCondition'
--
-- * 'daItemName' @::@ 'Text'
--
deleteAttributes :: Text -- ^ 'daDomainName'
                 -> Text -- ^ 'daItemName'
                 -> DeleteAttributes
deleteAttributes p1 p2 = DeleteAttributes
    { _daDomainName = p1
    , _daItemName   = p2
    , _daAttributes = mempty
    , _daExpected   = Nothing
    }

-- | A list of Attributes. Similar to columns on a spreadsheet, attributes
-- represent categories of data that can be assigned to items.
daAttributes :: Lens' DeleteAttributes [Attribute]
daAttributes = lens _daAttributes (\s a -> s { _daAttributes = a })

-- | The name of the domain in which to perform the operation.
daDomainName :: Lens' DeleteAttributes Text
daDomainName = lens _daDomainName (\s a -> s { _daDomainName = a })

-- | The update condition which, if specified, determines whether the
-- specified attributes will be deleted or not. The update condition must be
-- satisfied in order for this request to be processed and the attributes to
-- be deleted.
daExpected :: Lens' DeleteAttributes (Maybe UpdateCondition)
daExpected = lens _daExpected (\s a -> s { _daExpected = a })

-- | The name of the item. Similar to rows on a spreadsheet, items represent
-- individual objects that contain one or more value-attribute pairs.
daItemName :: Lens' DeleteAttributes Text
daItemName = lens _daItemName (\s a -> s { _daItemName = a })
instance ToQuery DeleteAttributes

instance ToPath DeleteAttributes where
    toPath = const "/"

data DeleteAttributesResponse = DeleteAttributesResponse
    deriving (Eq, Ord, Show, Generic)

-- | 'DeleteAttributesResponse' constructor.
deleteAttributesResponse :: DeleteAttributesResponse
deleteAttributesResponse = DeleteAttributesResponse

instance FromXML DeleteAttributesResponse where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "DeleteAttributesResponse"

instance AWSRequest DeleteAttributes where
    type Sv DeleteAttributes = SimpleDB
    type Rs DeleteAttributes = DeleteAttributesResponse

    request  = post "DeleteAttributes"
    response = nullaryResponse DeleteAttributesResponse
