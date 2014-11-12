{-# LANGUAGE DeriveDataTypeable          #-}
{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE GeneralizedNewtypeDeriving  #-}
{-# LANGUAGE LambdaCase                  #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE TypeFamilies                #-}

-- {-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CloudFormation.Types
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Network.AWS.CloudFormation.Types
    (
    -- * Service
      CloudFormation
    -- ** Error
    , RESTError
    -- ** XML
    , xmlOptions

    -- * Tag
    , Tag
    , tag
    , tagKey
    , tagValue

    -- * StackStatus
    , StackStatus (..)

    -- * StackEvent
    , StackEvent
    , stackEvent
    , seEventId
    , seLogicalResourceId
    , sePhysicalResourceId
    , seResourceProperties
    , seResourceStatus
    , seResourceStatusReason
    , seResourceType
    , seStackId
    , seStackName
    , seTimestamp

    -- * StackSummary
    , StackSummary
    , stackSummary
    , ssCreationTime
    , ssDeletionTime
    , ssLastUpdatedTime
    , ssStackId
    , ssStackName
    , ssStackStatus
    , ssStackStatusReason
    , ssTemplateDescription

    -- * StackResourceDetail
    , StackResourceDetail
    , stackResourceDetail
    , srdDescription
    , srdLastUpdatedTimestamp
    , srdLogicalResourceId
    , srdMetadata
    , srdPhysicalResourceId
    , srdResourceStatus
    , srdResourceStatusReason
    , srdResourceType
    , srdStackId
    , srdStackName

    -- * ResourceStatus
    , ResourceStatus (..)

    -- * TemplateParameter
    , TemplateParameter
    , templateParameter
    , tpDefaultValue
    , tpDescription
    , tpNoEcho
    , tpParameterKey

    -- * StackResource
    , StackResource
    , stackResource
    , srDescription
    , srLogicalResourceId
    , srPhysicalResourceId
    , srResourceStatus
    , srResourceStatusReason
    , srResourceType
    , srStackId
    , srStackName
    , srTimestamp

    -- * Output
    , Output
    , output
    , oDescription
    , oOutputKey
    , oOutputValue

    -- * StackResourceSummary
    , StackResourceSummary
    , stackResourceSummary
    , srsLastUpdatedTimestamp
    , srsLogicalResourceId
    , srsPhysicalResourceId
    , srsResourceStatus
    , srsResourceStatusReason
    , srsResourceType

    -- * Capability
    , Capability (..)

    -- * Stack
    , Stack
    , stack
    , sCapabilities
    , sCreationTime
    , sDescription
    , sDisableRollback
    , sLastUpdatedTime
    , sNotificationARNs
    , sOutputs
    , sParameters
    , sStackId
    , sStackName
    , sStackStatus
    , sStackStatusReason
    , sTags
    , sTimeoutInMinutes

    -- * OnFailure
    , OnFailure (..)

    -- * Parameter
    , Parameter
    , parameter
    , pParameterKey
    , pParameterValue
    , pUsePreviousValue
    ) where

import Network.AWS.Prelude
import Network.AWS.Signing.V4

-- | Supported version (@2010-05-15@) of the Amazon CloudFormation.
data CloudFormation deriving (Typeable)

instance AWSService CloudFormation where
    type Sg CloudFormation = V4
    type Er CloudFormation = RESTError

    service = Service
        { _svcEndpoint = regional
        , _svcAbbrev   = "CloudFormation"
        , _svcPrefix   = "cloudformation"
        , _svcVersion  = "2010-05-15"
        , _svcTarget   = Nothing
        }

    handle = xmlError alwaysFail

xmlOptions :: Tagged a XMLOptions
xmlOptions = Tagged def
    { xmlNamespace = Just "http://cloudformation.amazonaws.com/doc/2010-05-15/"
    }

data Tag = Tag
    { _tagKey   :: Maybe Text
    , _tagValue :: Maybe Text
    } (Eq, Ord, Show, Generic)

-- | 'Tag' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'tagKey' @::@ 'Maybe' 'Text'
--
-- * 'tagValue' @::@ 'Maybe' 'Text'
--
tag :: Tag
tag = Tag
    { _tagKey   = Nothing
    , _tagValue = Nothing
    }

-- | Required. A string used to identify this tag. You can specify a maximum
-- of 128 characters for a tag key. Tags owned by Amazon Web Services (AWS)
-- have the reserved prefix: aws:.
tagKey :: Lens' Tag (Maybe Text)
tagKey = lens _tagKey (\s a -> s { _tagKey = a })

-- | Required. A string containing the value for this tag. You can specify a
-- maximum of 256 characters for a tag value.
tagValue :: Lens' Tag (Maybe Text)
tagValue = lens _tagValue (\s a -> s { _tagValue = a })

instance FromXML Tag where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "Tag"

instance ToQuery Tag

data StackStatus
    = CreateComplete                          -- ^ CREATE_COMPLETE
    | CreateFailed                            -- ^ CREATE_FAILED
    | CreateInProgress                        -- ^ CREATE_IN_PROGRESS
    | DeleteComplete                          -- ^ DELETE_COMPLETE
    | DeleteFailed                            -- ^ DELETE_FAILED
    | DeleteInProgress                        -- ^ DELETE_IN_PROGRESS
    | RollbackComplete                        -- ^ ROLLBACK_COMPLETE
    | RollbackFailed                          -- ^ ROLLBACK_FAILED
    | RollbackInProgress                      -- ^ ROLLBACK_IN_PROGRESS
    | UpdateComplete                          -- ^ UPDATE_COMPLETE
    | UpdateCompleteCleanupInProgress         -- ^ UPDATE_COMPLETE_CLEANUP_IN_PROGRESS
    | UpdateInProgress                        -- ^ UPDATE_IN_PROGRESS
    | UpdateRollbackComplete                  -- ^ UPDATE_ROLLBACK_COMPLETE
    | UpdateRollbackCompleteCleanupInProgress -- ^ UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS
    | UpdateRollbackFailed                    -- ^ UPDATE_ROLLBACK_FAILED
    | UpdateRollbackInProgress                -- ^ UPDATE_ROLLBACK_IN_PROGRESS
      deriving (Eq, Ord, Enum, Show, Generic)

instance Hashable StackStatus

instance FromText StackStatus where
    parser = match "CREATE_COMPLETE"                              CreateComplete
         <|> match "CREATE_FAILED"                                CreateFailed
         <|> match "CREATE_IN_PROGRESS"                           CreateInProgress
         <|> match "DELETE_COMPLETE"                              DeleteComplete
         <|> match "DELETE_FAILED"                                DeleteFailed
         <|> match "DELETE_IN_PROGRESS"                           DeleteInProgress
         <|> match "ROLLBACK_COMPLETE"                            RollbackComplete
         <|> match "ROLLBACK_FAILED"                              RollbackFailed
         <|> match "ROLLBACK_IN_PROGRESS"                         RollbackInProgress
         <|> match "UPDATE_COMPLETE"                              UpdateComplete
         <|> match "UPDATE_COMPLETE_CLEANUP_IN_PROGRESS"          UpdateCompleteCleanupInProgress
         <|> match "UPDATE_IN_PROGRESS"                           UpdateInProgress
         <|> match "UPDATE_ROLLBACK_COMPLETE"                     UpdateRollbackComplete
         <|> match "UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS" UpdateRollbackCompleteCleanupInProgress
         <|> match "UPDATE_ROLLBACK_FAILED"                       UpdateRollbackFailed
         <|> match "UPDATE_ROLLBACK_IN_PROGRESS"                  UpdateRollbackInProgress

instance ToText StackStatus where
    toText = \case
        CreateComplete                          -> "CREATE_COMPLETE"
        CreateFailed                            -> "CREATE_FAILED"
        CreateInProgress                        -> "CREATE_IN_PROGRESS"
        DeleteComplete                          -> "DELETE_COMPLETE"
        DeleteFailed                            -> "DELETE_FAILED"
        DeleteInProgress                        -> "DELETE_IN_PROGRESS"
        RollbackComplete                        -> "ROLLBACK_COMPLETE"
        RollbackFailed                          -> "ROLLBACK_FAILED"
        RollbackInProgress                      -> "ROLLBACK_IN_PROGRESS"
        UpdateComplete                          -> "UPDATE_COMPLETE"
        UpdateCompleteCleanupInProgress         -> "UPDATE_COMPLETE_CLEANUP_IN_PROGRESS"
        UpdateInProgress                        -> "UPDATE_IN_PROGRESS"
        UpdateRollbackComplete                  -> "UPDATE_ROLLBACK_COMPLETE"
        UpdateRollbackCompleteCleanupInProgress -> "UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS"
        UpdateRollbackFailed                    -> "UPDATE_ROLLBACK_FAILED"
        UpdateRollbackInProgress                -> "UPDATE_ROLLBACK_IN_PROGRESS"

instance FromXML StackStatus where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "StackStatus"

instance ToQuery StackStatus

data StackEvent = StackEvent
    { _seEventId              :: Text
    , _seLogicalResourceId    :: Maybe Text
    , _sePhysicalResourceId   :: Maybe Text
    , _seResourceProperties   :: Maybe Text
    , _seResourceStatus       :: Maybe Text
    , _seResourceStatusReason :: Maybe Text
    , _seResourceType         :: Maybe Text
    , _seStackId              :: Text
    , _seStackName            :: Text
    , _seTimestamp            :: RFC822
    } (Eq, Ord, Show, Generic)

-- | 'StackEvent' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'seEventId' @::@ 'Text'
--
-- * 'seLogicalResourceId' @::@ 'Maybe' 'Text'
--
-- * 'sePhysicalResourceId' @::@ 'Maybe' 'Text'
--
-- * 'seResourceProperties' @::@ 'Maybe' 'Text'
--
-- * 'seResourceStatus' @::@ 'Maybe' 'Text'
--
-- * 'seResourceStatusReason' @::@ 'Maybe' 'Text'
--
-- * 'seResourceType' @::@ 'Maybe' 'Text'
--
-- * 'seStackId' @::@ 'Text'
--
-- * 'seStackName' @::@ 'Text'
--
-- * 'seTimestamp' @::@ 'UTCTime'
--
stackEvent :: Text -- ^ 'seStackId'
           -> Text -- ^ 'seEventId'
           -> Text -- ^ 'seStackName'
           -> UTCTime -- ^ 'seTimestamp'
           -> StackEvent
stackEvent p1 p2 p3 p4 = StackEvent
    { _seStackId              = p1
    , _seEventId              = p2
    , _seStackName            = p3
    , _seTimestamp            = withIso _Time (const id) p4
    , _seLogicalResourceId    = Nothing
    , _sePhysicalResourceId   = Nothing
    , _seResourceType         = Nothing
    , _seResourceStatus       = Nothing
    , _seResourceStatusReason = Nothing
    , _seResourceProperties   = Nothing
    }

-- | The unique ID of this event.
seEventId :: Lens' StackEvent Text
seEventId = lens _seEventId (\s a -> s { _seEventId = a })

-- | The logical name of the resource specified in the template.
seLogicalResourceId :: Lens' StackEvent (Maybe Text)
seLogicalResourceId =
    lens _seLogicalResourceId (\s a -> s { _seLogicalResourceId = a })

-- | The name or unique identifier associated with the physical instance of
-- the resource.
sePhysicalResourceId :: Lens' StackEvent (Maybe Text)
sePhysicalResourceId =
    lens _sePhysicalResourceId (\s a -> s { _sePhysicalResourceId = a })

-- | BLOB of the properties used to create the resource.
seResourceProperties :: Lens' StackEvent (Maybe Text)
seResourceProperties =
    lens _seResourceProperties (\s a -> s { _seResourceProperties = a })

-- | Current status of the resource.
seResourceStatus :: Lens' StackEvent (Maybe Text)
seResourceStatus = lens _seResourceStatus (\s a -> s { _seResourceStatus = a })

-- | Success/failure message associated with the resource.
seResourceStatusReason :: Lens' StackEvent (Maybe Text)
seResourceStatusReason =
    lens _seResourceStatusReason (\s a -> s { _seResourceStatusReason = a })

-- | Type of resource. (For more information, go to AWS Resource Types
-- Reference in the AWS CloudFormation User Guide.).
seResourceType :: Lens' StackEvent (Maybe Text)
seResourceType = lens _seResourceType (\s a -> s { _seResourceType = a })

-- | The unique ID name of the instance of the stack.
seStackId :: Lens' StackEvent Text
seStackId = lens _seStackId (\s a -> s { _seStackId = a })

-- | The name associated with a stack.
seStackName :: Lens' StackEvent Text
seStackName = lens _seStackName (\s a -> s { _seStackName = a })

-- | Time the status was updated.
seTimestamp :: Lens' StackEvent UTCTime
seTimestamp = lens _seTimestamp (\s a -> s { _seTimestamp = a })
    . _Time

instance FromXML StackEvent where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "StackEvent"

instance ToQuery StackEvent

data StackSummary = StackSummary
    { _ssCreationTime        :: RFC822
    , _ssDeletionTime        :: Maybe RFC822
    , _ssLastUpdatedTime     :: Maybe RFC822
    , _ssStackId             :: Maybe Text
    , _ssStackName           :: Text
    , _ssStackStatus         :: Text
    , _ssStackStatusReason   :: Maybe Text
    , _ssTemplateDescription :: Maybe Text
    } (Eq, Ord, Show, Generic)

-- | 'StackSummary' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ssCreationTime' @::@ 'UTCTime'
--
-- * 'ssDeletionTime' @::@ 'Maybe' 'UTCTime'
--
-- * 'ssLastUpdatedTime' @::@ 'Maybe' 'UTCTime'
--
-- * 'ssStackId' @::@ 'Maybe' 'Text'
--
-- * 'ssStackName' @::@ 'Text'
--
-- * 'ssStackStatus' @::@ 'Text'
--
-- * 'ssStackStatusReason' @::@ 'Maybe' 'Text'
--
-- * 'ssTemplateDescription' @::@ 'Maybe' 'Text'
--
stackSummary :: Text -- ^ 'ssStackName'
             -> UTCTime -- ^ 'ssCreationTime'
             -> Text -- ^ 'ssStackStatus'
             -> StackSummary
stackSummary p1 p2 p3 = StackSummary
    { _ssStackName           = p1
    , _ssCreationTime        = withIso _Time (const id) p2
    , _ssStackStatus         = p3
    , _ssStackId             = Nothing
    , _ssTemplateDescription = Nothing
    , _ssLastUpdatedTime     = Nothing
    , _ssDeletionTime        = Nothing
    , _ssStackStatusReason   = Nothing
    }

-- | The time the stack was created.
ssCreationTime :: Lens' StackSummary UTCTime
ssCreationTime = lens _ssCreationTime (\s a -> s { _ssCreationTime = a })
    . _Time

-- | The time the stack was deleted.
ssDeletionTime :: Lens' StackSummary (Maybe UTCTime)
ssDeletionTime = lens _ssDeletionTime (\s a -> s { _ssDeletionTime = a })
    . mapping _Time

-- | The time the stack was last updated. This field will only be returned if
-- the stack has been updated at least once.
ssLastUpdatedTime :: Lens' StackSummary (Maybe UTCTime)
ssLastUpdatedTime =
    lens _ssLastUpdatedTime (\s a -> s { _ssLastUpdatedTime = a })
        . mapping _Time

-- | Unique stack identifier.
ssStackId :: Lens' StackSummary (Maybe Text)
ssStackId = lens _ssStackId (\s a -> s { _ssStackId = a })

-- | The name associated with the stack.
ssStackName :: Lens' StackSummary Text
ssStackName = lens _ssStackName (\s a -> s { _ssStackName = a })

-- | The current status of the stack.
ssStackStatus :: Lens' StackSummary Text
ssStackStatus = lens _ssStackStatus (\s a -> s { _ssStackStatus = a })

-- | Success/Failure message associated with the stack status.
ssStackStatusReason :: Lens' StackSummary (Maybe Text)
ssStackStatusReason =
    lens _ssStackStatusReason (\s a -> s { _ssStackStatusReason = a })

-- | The template description of the template used to create the stack.
ssTemplateDescription :: Lens' StackSummary (Maybe Text)
ssTemplateDescription =
    lens _ssTemplateDescription (\s a -> s { _ssTemplateDescription = a })

instance FromXML StackSummary where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "StackSummary"

instance ToQuery StackSummary

data StackResourceDetail = StackResourceDetail
    { _srdDescription          :: Maybe Text
    , _srdLastUpdatedTimestamp :: RFC822
    , _srdLogicalResourceId    :: Text
    , _srdMetadata             :: Maybe Text
    , _srdPhysicalResourceId   :: Maybe Text
    , _srdResourceStatus       :: Text
    , _srdResourceStatusReason :: Maybe Text
    , _srdResourceType         :: Text
    , _srdStackId              :: Maybe Text
    , _srdStackName            :: Maybe Text
    } (Eq, Ord, Show, Generic)

-- | 'StackResourceDetail' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'srdDescription' @::@ 'Maybe' 'Text'
--
-- * 'srdLastUpdatedTimestamp' @::@ 'UTCTime'
--
-- * 'srdLogicalResourceId' @::@ 'Text'
--
-- * 'srdMetadata' @::@ 'Maybe' 'Text'
--
-- * 'srdPhysicalResourceId' @::@ 'Maybe' 'Text'
--
-- * 'srdResourceStatus' @::@ 'Text'
--
-- * 'srdResourceStatusReason' @::@ 'Maybe' 'Text'
--
-- * 'srdResourceType' @::@ 'Text'
--
-- * 'srdStackId' @::@ 'Maybe' 'Text'
--
-- * 'srdStackName' @::@ 'Maybe' 'Text'
--
stackResourceDetail :: Text -- ^ 'srdLogicalResourceId'
                    -> Text -- ^ 'srdResourceType'
                    -> UTCTime -- ^ 'srdLastUpdatedTimestamp'
                    -> Text -- ^ 'srdResourceStatus'
                    -> StackResourceDetail
stackResourceDetail p1 p2 p3 p4 = StackResourceDetail
    { _srdLogicalResourceId    = p1
    , _srdResourceType         = p2
    , _srdLastUpdatedTimestamp = withIso _Time (const id) p3
    , _srdResourceStatus       = p4
    , _srdStackName            = Nothing
    , _srdStackId              = Nothing
    , _srdPhysicalResourceId   = Nothing
    , _srdResourceStatusReason = Nothing
    , _srdDescription          = Nothing
    , _srdMetadata             = Nothing
    }

-- | User defined description associated with the resource.
srdDescription :: Lens' StackResourceDetail (Maybe Text)
srdDescription = lens _srdDescription (\s a -> s { _srdDescription = a })

-- | Time the status was updated.
srdLastUpdatedTimestamp :: Lens' StackResourceDetail UTCTime
srdLastUpdatedTimestamp =
    lens _srdLastUpdatedTimestamp (\s a -> s { _srdLastUpdatedTimestamp = a })
        . _Time

-- | The logical name of the resource specified in the template.
srdLogicalResourceId :: Lens' StackResourceDetail Text
srdLogicalResourceId =
    lens _srdLogicalResourceId (\s a -> s { _srdLogicalResourceId = a })

-- | The JSON format content of the Metadata attribute declared for the
-- resource. For more information, see Metadata Attribute in the AWS
-- CloudFormation User Guide.
srdMetadata :: Lens' StackResourceDetail (Maybe Text)
srdMetadata = lens _srdMetadata (\s a -> s { _srdMetadata = a })

-- | The name or unique identifier that corresponds to a physical instance ID
-- of a resource supported by AWS CloudFormation.
srdPhysicalResourceId :: Lens' StackResourceDetail (Maybe Text)
srdPhysicalResourceId =
    lens _srdPhysicalResourceId (\s a -> s { _srdPhysicalResourceId = a })

-- | Current status of the resource.
srdResourceStatus :: Lens' StackResourceDetail Text
srdResourceStatus =
    lens _srdResourceStatus (\s a -> s { _srdResourceStatus = a })

-- | Success/failure message associated with the resource.
srdResourceStatusReason :: Lens' StackResourceDetail (Maybe Text)
srdResourceStatusReason =
    lens _srdResourceStatusReason (\s a -> s { _srdResourceStatusReason = a })

-- | Type of resource. ((For more information, go to AWS Resource Types
-- Reference in the AWS CloudFormation User Guide.).
srdResourceType :: Lens' StackResourceDetail Text
srdResourceType = lens _srdResourceType (\s a -> s { _srdResourceType = a })

-- | Unique identifier of the stack.
srdStackId :: Lens' StackResourceDetail (Maybe Text)
srdStackId = lens _srdStackId (\s a -> s { _srdStackId = a })

-- | The name associated with the stack.
srdStackName :: Lens' StackResourceDetail (Maybe Text)
srdStackName = lens _srdStackName (\s a -> s { _srdStackName = a })

instance FromXML StackResourceDetail where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "StackResourceDetail"

instance ToQuery StackResourceDetail

data ResourceStatus
    = RSCreateComplete   -- ^ CREATE_COMPLETE
    | RSCreateFailed     -- ^ CREATE_FAILED
    | RSCreateInProgress -- ^ CREATE_IN_PROGRESS
    | RSDeleteComplete   -- ^ DELETE_COMPLETE
    | RSDeleteFailed     -- ^ DELETE_FAILED
    | RSDeleteInProgress -- ^ DELETE_IN_PROGRESS
    | RSUpdateComplete   -- ^ UPDATE_COMPLETE
    | RSUpdateFailed     -- ^ UPDATE_FAILED
    | RSUpdateInProgress -- ^ UPDATE_IN_PROGRESS
      deriving (Eq, Ord, Enum, Show, Generic)

instance Hashable ResourceStatus

instance FromText ResourceStatus where
    parser = match "CREATE_COMPLETE"    RSCreateComplete
         <|> match "CREATE_FAILED"      RSCreateFailed
         <|> match "CREATE_IN_PROGRESS" RSCreateInProgress
         <|> match "DELETE_COMPLETE"    RSDeleteComplete
         <|> match "DELETE_FAILED"      RSDeleteFailed
         <|> match "DELETE_IN_PROGRESS" RSDeleteInProgress
         <|> match "UPDATE_COMPLETE"    RSUpdateComplete
         <|> match "UPDATE_FAILED"      RSUpdateFailed
         <|> match "UPDATE_IN_PROGRESS" RSUpdateInProgress

instance ToText ResourceStatus where
    toText = \case
        RSCreateComplete   -> "CREATE_COMPLETE"
        RSCreateFailed     -> "CREATE_FAILED"
        RSCreateInProgress -> "CREATE_IN_PROGRESS"
        RSDeleteComplete   -> "DELETE_COMPLETE"
        RSDeleteFailed     -> "DELETE_FAILED"
        RSDeleteInProgress -> "DELETE_IN_PROGRESS"
        RSUpdateComplete   -> "UPDATE_COMPLETE"
        RSUpdateFailed     -> "UPDATE_FAILED"
        RSUpdateInProgress -> "UPDATE_IN_PROGRESS"

instance FromXML ResourceStatus where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ResourceStatus"

instance ToQuery ResourceStatus

data TemplateParameter = TemplateParameter
    { _tpDefaultValue :: Maybe Text
    , _tpDescription  :: Maybe Text
    , _tpNoEcho       :: Maybe Bool
    , _tpParameterKey :: Maybe Text
    } (Eq, Ord, Show, Generic)

-- | 'TemplateParameter' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'tpDefaultValue' @::@ 'Maybe' 'Text'
--
-- * 'tpDescription' @::@ 'Maybe' 'Text'
--
-- * 'tpNoEcho' @::@ 'Maybe' 'Bool'
--
-- * 'tpParameterKey' @::@ 'Maybe' 'Text'
--
templateParameter :: TemplateParameter
templateParameter = TemplateParameter
    { _tpParameterKey = Nothing
    , _tpDefaultValue = Nothing
    , _tpNoEcho       = Nothing
    , _tpDescription  = Nothing
    }

-- | The default value associated with the parameter.
tpDefaultValue :: Lens' TemplateParameter (Maybe Text)
tpDefaultValue = lens _tpDefaultValue (\s a -> s { _tpDefaultValue = a })

-- | User defined description associated with the parameter.
tpDescription :: Lens' TemplateParameter (Maybe Text)
tpDescription = lens _tpDescription (\s a -> s { _tpDescription = a })

-- | Flag indicating whether the parameter should be displayed as plain text
-- in logs and UIs.
tpNoEcho :: Lens' TemplateParameter (Maybe Bool)
tpNoEcho = lens _tpNoEcho (\s a -> s { _tpNoEcho = a })

-- | The name associated with the parameter.
tpParameterKey :: Lens' TemplateParameter (Maybe Text)
tpParameterKey = lens _tpParameterKey (\s a -> s { _tpParameterKey = a })

instance FromXML TemplateParameter where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "TemplateParameter"

instance ToQuery TemplateParameter

data StackResource = StackResource
    { _srDescription          :: Maybe Text
    , _srLogicalResourceId    :: Text
    , _srPhysicalResourceId   :: Maybe Text
    , _srResourceStatus       :: Text
    , _srResourceStatusReason :: Maybe Text
    , _srResourceType         :: Text
    , _srStackId              :: Maybe Text
    , _srStackName            :: Maybe Text
    , _srTimestamp            :: RFC822
    } (Eq, Ord, Show, Generic)

-- | 'StackResource' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'srDescription' @::@ 'Maybe' 'Text'
--
-- * 'srLogicalResourceId' @::@ 'Text'
--
-- * 'srPhysicalResourceId' @::@ 'Maybe' 'Text'
--
-- * 'srResourceStatus' @::@ 'Text'
--
-- * 'srResourceStatusReason' @::@ 'Maybe' 'Text'
--
-- * 'srResourceType' @::@ 'Text'
--
-- * 'srStackId' @::@ 'Maybe' 'Text'
--
-- * 'srStackName' @::@ 'Maybe' 'Text'
--
-- * 'srTimestamp' @::@ 'UTCTime'
--
stackResource :: Text -- ^ 'srLogicalResourceId'
              -> Text -- ^ 'srResourceType'
              -> UTCTime -- ^ 'srTimestamp'
              -> Text -- ^ 'srResourceStatus'
              -> StackResource
stackResource p1 p2 p3 p4 = StackResource
    { _srLogicalResourceId    = p1
    , _srResourceType         = p2
    , _srTimestamp            = withIso _Time (const id) p3
    , _srResourceStatus       = p4
    , _srStackName            = Nothing
    , _srStackId              = Nothing
    , _srPhysicalResourceId   = Nothing
    , _srResourceStatusReason = Nothing
    , _srDescription          = Nothing
    }

-- | User defined description associated with the resource.
srDescription :: Lens' StackResource (Maybe Text)
srDescription = lens _srDescription (\s a -> s { _srDescription = a })

-- | The logical name of the resource specified in the template.
srLogicalResourceId :: Lens' StackResource Text
srLogicalResourceId =
    lens _srLogicalResourceId (\s a -> s { _srLogicalResourceId = a })

-- | The name or unique identifier that corresponds to a physical instance ID
-- of a resource supported by AWS CloudFormation.
srPhysicalResourceId :: Lens' StackResource (Maybe Text)
srPhysicalResourceId =
    lens _srPhysicalResourceId (\s a -> s { _srPhysicalResourceId = a })

-- | Current status of the resource.
srResourceStatus :: Lens' StackResource Text
srResourceStatus = lens _srResourceStatus (\s a -> s { _srResourceStatus = a })

-- | Success/failure message associated with the resource.
srResourceStatusReason :: Lens' StackResource (Maybe Text)
srResourceStatusReason =
    lens _srResourceStatusReason (\s a -> s { _srResourceStatusReason = a })

-- | Type of resource. (For more information, go to AWS Resource Types
-- Reference in the AWS CloudFormation User Guide.).
srResourceType :: Lens' StackResource Text
srResourceType = lens _srResourceType (\s a -> s { _srResourceType = a })

-- | Unique identifier of the stack.
srStackId :: Lens' StackResource (Maybe Text)
srStackId = lens _srStackId (\s a -> s { _srStackId = a })

-- | The name associated with the stack.
srStackName :: Lens' StackResource (Maybe Text)
srStackName = lens _srStackName (\s a -> s { _srStackName = a })

-- | Time the status was updated.
srTimestamp :: Lens' StackResource UTCTime
srTimestamp = lens _srTimestamp (\s a -> s { _srTimestamp = a })
    . _Time

instance FromXML StackResource where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "StackResource"

instance ToQuery StackResource

data Output = Output
    { _oDescription :: Maybe Text
    , _oOutputKey   :: Maybe Text
    , _oOutputValue :: Maybe Text
    } (Eq, Ord, Show, Generic)

-- | 'Output' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'oDescription' @::@ 'Maybe' 'Text'
--
-- * 'oOutputKey' @::@ 'Maybe' 'Text'
--
-- * 'oOutputValue' @::@ 'Maybe' 'Text'
--
output :: Output
output = Output
    { _oOutputKey   = Nothing
    , _oOutputValue = Nothing
    , _oDescription = Nothing
    }

-- | User defined description associated with the output.
oDescription :: Lens' Output (Maybe Text)
oDescription = lens _oDescription (\s a -> s { _oDescription = a })

-- | The key associated with the output.
oOutputKey :: Lens' Output (Maybe Text)
oOutputKey = lens _oOutputKey (\s a -> s { _oOutputKey = a })

-- | The value associated with the output.
oOutputValue :: Lens' Output (Maybe Text)
oOutputValue = lens _oOutputValue (\s a -> s { _oOutputValue = a })

instance FromXML Output where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "Output"

instance ToQuery Output

data StackResourceSummary = StackResourceSummary
    { _srsLastUpdatedTimestamp :: RFC822
    , _srsLogicalResourceId    :: Text
    , _srsPhysicalResourceId   :: Maybe Text
    , _srsResourceStatus       :: Text
    , _srsResourceStatusReason :: Maybe Text
    , _srsResourceType         :: Text
    } (Eq, Ord, Show, Generic)

-- | 'StackResourceSummary' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'srsLastUpdatedTimestamp' @::@ 'UTCTime'
--
-- * 'srsLogicalResourceId' @::@ 'Text'
--
-- * 'srsPhysicalResourceId' @::@ 'Maybe' 'Text'
--
-- * 'srsResourceStatus' @::@ 'Text'
--
-- * 'srsResourceStatusReason' @::@ 'Maybe' 'Text'
--
-- * 'srsResourceType' @::@ 'Text'
--
stackResourceSummary :: Text -- ^ 'srsLogicalResourceId'
                     -> Text -- ^ 'srsResourceType'
                     -> UTCTime -- ^ 'srsLastUpdatedTimestamp'
                     -> Text -- ^ 'srsResourceStatus'
                     -> StackResourceSummary
stackResourceSummary p1 p2 p3 p4 = StackResourceSummary
    { _srsLogicalResourceId    = p1
    , _srsResourceType         = p2
    , _srsLastUpdatedTimestamp = withIso _Time (const id) p3
    , _srsResourceStatus       = p4
    , _srsPhysicalResourceId   = Nothing
    , _srsResourceStatusReason = Nothing
    }

-- | Time the status was updated.
srsLastUpdatedTimestamp :: Lens' StackResourceSummary UTCTime
srsLastUpdatedTimestamp =
    lens _srsLastUpdatedTimestamp (\s a -> s { _srsLastUpdatedTimestamp = a })
        . _Time

-- | The logical name of the resource specified in the template.
srsLogicalResourceId :: Lens' StackResourceSummary Text
srsLogicalResourceId =
    lens _srsLogicalResourceId (\s a -> s { _srsLogicalResourceId = a })

-- | The name or unique identifier that corresponds to a physical instance ID
-- of the resource.
srsPhysicalResourceId :: Lens' StackResourceSummary (Maybe Text)
srsPhysicalResourceId =
    lens _srsPhysicalResourceId (\s a -> s { _srsPhysicalResourceId = a })

-- | Current status of the resource.
srsResourceStatus :: Lens' StackResourceSummary Text
srsResourceStatus =
    lens _srsResourceStatus (\s a -> s { _srsResourceStatus = a })

-- | Success/failure message associated with the resource.
srsResourceStatusReason :: Lens' StackResourceSummary (Maybe Text)
srsResourceStatusReason =
    lens _srsResourceStatusReason (\s a -> s { _srsResourceStatusReason = a })

-- | Type of resource. (For more information, go to AWS Resource Types
-- Reference in the AWS CloudFormation User Guide.).
srsResourceType :: Lens' StackResourceSummary Text
srsResourceType = lens _srsResourceType (\s a -> s { _srsResourceType = a })

instance FromXML StackResourceSummary where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "StackResourceSummary"

instance ToQuery StackResourceSummary

data Capability
    = CapabilityIam -- ^ CAPABILITY_IAM
      deriving (Eq, Ord, Enum, Show, Generic)

instance Hashable Capability

instance FromText Capability where
    parser = match "CAPABILITY_IAM" CapabilityIam

instance ToText Capability where
    toText CapabilityIam = "CAPABILITY_IAM"

instance FromXML Capability where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "Capability"

instance ToQuery Capability

data Stack = Stack
    { _sCapabilities      :: [Text]
    , _sCreationTime      :: RFC822
    , _sDescription       :: Maybe Text
    , _sDisableRollback   :: Maybe Bool
    , _sLastUpdatedTime   :: Maybe RFC822
    , _sNotificationARNs  :: [Text]
    , _sOutputs           :: [Output]
    , _sParameters        :: [Parameter]
    , _sStackId           :: Maybe Text
    , _sStackName         :: Text
    , _sStackStatus       :: Text
    , _sStackStatusReason :: Maybe Text
    , _sTags              :: [Tag]
    , _sTimeoutInMinutes  :: Maybe Natural
    } (Eq, Show, Generic)

-- | 'Stack' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'sCapabilities' @::@ ['Text']
--
-- * 'sCreationTime' @::@ 'UTCTime'
--
-- * 'sDescription' @::@ 'Maybe' 'Text'
--
-- * 'sDisableRollback' @::@ 'Maybe' 'Bool'
--
-- * 'sLastUpdatedTime' @::@ 'Maybe' 'UTCTime'
--
-- * 'sNotificationARNs' @::@ ['Text']
--
-- * 'sOutputs' @::@ ['Output']
--
-- * 'sParameters' @::@ ['Parameter']
--
-- * 'sStackId' @::@ 'Maybe' 'Text'
--
-- * 'sStackName' @::@ 'Text'
--
-- * 'sStackStatus' @::@ 'Text'
--
-- * 'sStackStatusReason' @::@ 'Maybe' 'Text'
--
-- * 'sTags' @::@ ['Tag']
--
-- * 'sTimeoutInMinutes' @::@ 'Maybe' 'Natural'
--
stack :: Text -- ^ 'sStackName'
      -> UTCTime -- ^ 'sCreationTime'
      -> Text -- ^ 'sStackStatus'
      -> Stack
stack p1 p2 p3 = Stack
    { _sStackName         = p1
    , _sCreationTime      = withIso _Time (const id) p2
    , _sStackStatus       = p3
    , _sStackId           = Nothing
    , _sDescription       = Nothing
    , _sParameters        = mempty
    , _sLastUpdatedTime   = Nothing
    , _sStackStatusReason = Nothing
    , _sDisableRollback   = Nothing
    , _sNotificationARNs  = mempty
    , _sTimeoutInMinutes  = Nothing
    , _sCapabilities      = mempty
    , _sOutputs           = mempty
    , _sTags              = mempty
    }

-- | The capabilities allowed in the stack.
sCapabilities :: Lens' Stack [Text]
sCapabilities = lens _sCapabilities (\s a -> s { _sCapabilities = a })

-- | Time at which the stack was created.
sCreationTime :: Lens' Stack UTCTime
sCreationTime = lens _sCreationTime (\s a -> s { _sCreationTime = a })
    . _Time

-- | User defined description associated with the stack.
sDescription :: Lens' Stack (Maybe Text)
sDescription = lens _sDescription (\s a -> s { _sDescription = a })

-- | Boolean to enable or disable rollback on stack creation failures: true:
-- disable rollback false: enable rollback.
sDisableRollback :: Lens' Stack (Maybe Bool)
sDisableRollback = lens _sDisableRollback (\s a -> s { _sDisableRollback = a })

-- | The time the stack was last updated. This field will only be returned if
-- the stack has been updated at least once.
sLastUpdatedTime :: Lens' Stack (Maybe UTCTime)
sLastUpdatedTime = lens _sLastUpdatedTime (\s a -> s { _sLastUpdatedTime = a })
    . mapping _Time

-- | SNS topic ARNs to which stack related events are published.
sNotificationARNs :: Lens' Stack [Text]
sNotificationARNs =
    lens _sNotificationARNs (\s a -> s { _sNotificationARNs = a })

-- | A list of output structures.
sOutputs :: Lens' Stack [Output]
sOutputs = lens _sOutputs (\s a -> s { _sOutputs = a })

-- | A list of Parameter structures.
sParameters :: Lens' Stack [Parameter]
sParameters = lens _sParameters (\s a -> s { _sParameters = a })

-- | Unique identifier of the stack.
sStackId :: Lens' Stack (Maybe Text)
sStackId = lens _sStackId (\s a -> s { _sStackId = a })

-- | The name associated with the stack.
sStackName :: Lens' Stack Text
sStackName = lens _sStackName (\s a -> s { _sStackName = a })

-- | Current status of the stack.
sStackStatus :: Lens' Stack Text
sStackStatus = lens _sStackStatus (\s a -> s { _sStackStatus = a })

-- | Success/failure message associated with the stack status.
sStackStatusReason :: Lens' Stack (Maybe Text)
sStackStatusReason =
    lens _sStackStatusReason (\s a -> s { _sStackStatusReason = a })

-- | A list of Tags that specify cost allocation information for the stack.
sTags :: Lens' Stack [Tag]
sTags = lens _sTags (\s a -> s { _sTags = a })

-- | The amount of time within which stack creation should complete.
sTimeoutInMinutes :: Lens' Stack (Maybe Natural)
sTimeoutInMinutes =
    lens _sTimeoutInMinutes (\s a -> s { _sTimeoutInMinutes = a })

instance FromXML Stack where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "Stack"

instance ToQuery Stack

data OnFailure
    = Delete    -- ^ DELETE
    | DoNothing -- ^ DO_NOTHING
    | Rollback  -- ^ ROLLBACK
      deriving (Eq, Ord, Enum, Show, Generic)

instance Hashable OnFailure

instance FromText OnFailure where
    parser = match "DELETE"     Delete
         <|> match "DO_NOTHING" DoNothing
         <|> match "ROLLBACK"   Rollback

instance ToText OnFailure where
    toText = \case
        Delete    -> "DELETE"
        DoNothing -> "DO_NOTHING"
        Rollback  -> "ROLLBACK"

instance FromXML OnFailure where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "OnFailure"

instance ToQuery OnFailure

data Parameter = Parameter
    { _pParameterKey     :: Maybe Text
    , _pParameterValue   :: Maybe Text
    , _pUsePreviousValue :: Maybe Bool
    } (Eq, Ord, Show, Generic)

-- | 'Parameter' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'pParameterKey' @::@ 'Maybe' 'Text'
--
-- * 'pParameterValue' @::@ 'Maybe' 'Text'
--
-- * 'pUsePreviousValue' @::@ 'Maybe' 'Bool'
--
parameter :: Parameter
parameter = Parameter
    { _pParameterKey     = Nothing
    , _pParameterValue   = Nothing
    , _pUsePreviousValue = Nothing
    }

-- | The key associated with the parameter.
pParameterKey :: Lens' Parameter (Maybe Text)
pParameterKey = lens _pParameterKey (\s a -> s { _pParameterKey = a })

-- | The value associated with the parameter.
pParameterValue :: Lens' Parameter (Maybe Text)
pParameterValue = lens _pParameterValue (\s a -> s { _pParameterValue = a })

-- | During a stack update, use the existing parameter value that is being
-- used for the stack.
pUsePreviousValue :: Lens' Parameter (Maybe Bool)
pUsePreviousValue =
    lens _pUsePreviousValue (\s a -> s { _pUsePreviousValue = a })

instance FromXML Parameter where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "Parameter"

instance ToQuery Parameter
