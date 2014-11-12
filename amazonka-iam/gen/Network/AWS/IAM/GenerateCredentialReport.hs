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

-- Module      : Network.AWS.IAM.GenerateCredentialReport
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Generates a credential report for the AWS account. For more information
-- about the credential report, see Getting Credential Reports in the Using
-- IAM guide.
module Network.AWS.IAM.GenerateCredentialReport
    (
    -- * Request
      GenerateCredentialReport
    -- ** Request constructor
    , generateCredentialReport

    -- * Response
    , GenerateCredentialReportResponse
    -- ** Response constructor
    , generateCredentialReportResponse
    -- ** Response lenses
    , gcrrDescription
    , gcrrState
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.Query
import Network.AWS.IAM.Types

data GenerateCredentialReport = GenerateCredentialReport
    deriving (Eq, Ord, Show, Generic)

-- | 'GenerateCredentialReport' constructor.
generateCredentialReport :: GenerateCredentialReport
generateCredentialReport = GenerateCredentialReport
instance ToQuery GenerateCredentialReport

instance ToPath GenerateCredentialReport where
    toPath = const "/"

data GenerateCredentialReportResponse = GenerateCredentialReportResponse
    { _gcrrDescription :: Maybe Text
    , _gcrrState       :: Maybe Text
    } (Eq, Ord, Show, Generic)

-- | 'GenerateCredentialReportResponse' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gcrrDescription' @::@ 'Maybe' 'Text'
--
-- * 'gcrrState' @::@ 'Maybe' 'Text'
--
generateCredentialReportResponse :: GenerateCredentialReportResponse
generateCredentialReportResponse = GenerateCredentialReportResponse
    { _gcrrState       = Nothing
    , _gcrrDescription = Nothing
    }

-- | Information about the credential report.
gcrrDescription :: Lens' GenerateCredentialReportResponse (Maybe Text)
gcrrDescription = lens _gcrrDescription (\s a -> s { _gcrrDescription = a })

-- | Information about the state of a credential report.
gcrrState :: Lens' GenerateCredentialReportResponse (Maybe Text)
gcrrState = lens _gcrrState (\s a -> s { _gcrrState = a })

instance FromXML GenerateCredentialReportResponse where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "GenerateCredentialReportResponse"

instance AWSRequest GenerateCredentialReport where
    type Sv GenerateCredentialReport = IAM
    type Rs GenerateCredentialReport = GenerateCredentialReportResponse

    request  = post "GenerateCredentialReport"
    response = xmlResponse $ \h x -> GenerateCredentialReportResponse
        <$> x %| "Description"
        <*> x %| "State"
