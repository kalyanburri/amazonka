{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Firehose.Types.Product
-- Copyright   : (c) 2013-2017 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Network.AWS.Firehose.Types.Product where

import Network.AWS.Firehose.Types.Sum
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Describes hints for the buffering to perform before delivering data to the destination. Please note that these options are treated as hints, and therefore Kinesis Firehose may choose to use different values when it is optimal.
--
--
--
-- /See:/ 'bufferingHints' smart constructor.
data BufferingHints = BufferingHints'
  { _bhSizeInMBs         :: {-# NOUNPACK #-}!(Maybe Nat)
  , _bhIntervalInSeconds :: {-# NOUNPACK #-}!(Maybe Nat)
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'BufferingHints' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'bhSizeInMBs' - Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The default value is 5. We recommend setting this parameter to a value greater than the amount of data you typically ingest into the delivery stream in 10 seconds. For example, if you typically ingest data at 1 MB/sec, the value should be 10 MB or higher.
--
-- * 'bhIntervalInSeconds' - Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. The default value is 300.
bufferingHints
    :: BufferingHints
bufferingHints =
  BufferingHints' {_bhSizeInMBs = Nothing, _bhIntervalInSeconds = Nothing}


-- | Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The default value is 5. We recommend setting this parameter to a value greater than the amount of data you typically ingest into the delivery stream in 10 seconds. For example, if you typically ingest data at 1 MB/sec, the value should be 10 MB or higher.
bhSizeInMBs :: Lens' BufferingHints (Maybe Natural)
bhSizeInMBs = lens _bhSizeInMBs (\ s a -> s{_bhSizeInMBs = a}) . mapping _Nat;

-- | Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. The default value is 300.
bhIntervalInSeconds :: Lens' BufferingHints (Maybe Natural)
bhIntervalInSeconds = lens _bhIntervalInSeconds (\ s a -> s{_bhIntervalInSeconds = a}) . mapping _Nat;

instance FromJSON BufferingHints where
        parseJSON
          = withObject "BufferingHints"
              (\ x ->
                 BufferingHints' <$>
                   (x .:? "SizeInMBs") <*> (x .:? "IntervalInSeconds"))

instance Hashable BufferingHints where

instance NFData BufferingHints where

instance ToJSON BufferingHints where
        toJSON BufferingHints'{..}
          = object
              (catMaybes
                 [("SizeInMBs" .=) <$> _bhSizeInMBs,
                  ("IntervalInSeconds" .=) <$> _bhIntervalInSeconds])

-- | Describes the Amazon CloudWatch logging options for your delivery stream.
--
--
--
-- /See:/ 'cloudWatchLoggingOptions' smart constructor.
data CloudWatchLoggingOptions = CloudWatchLoggingOptions'
  { _cwloEnabled       :: {-# NOUNPACK #-}!(Maybe Bool)
  , _cwloLogGroupName  :: {-# NOUNPACK #-}!(Maybe Text)
  , _cwloLogStreamName :: {-# NOUNPACK #-}!(Maybe Text)
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'CloudWatchLoggingOptions' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cwloEnabled' - Enables or disables CloudWatch logging.
--
-- * 'cwloLogGroupName' - The CloudWatch group name for logging. This value is required if CloudWatch logging is enabled.
--
-- * 'cwloLogStreamName' - The CloudWatch log stream name for logging. This value is required if CloudWatch logging is enabled.
cloudWatchLoggingOptions
    :: CloudWatchLoggingOptions
cloudWatchLoggingOptions =
  CloudWatchLoggingOptions'
  { _cwloEnabled = Nothing
  , _cwloLogGroupName = Nothing
  , _cwloLogStreamName = Nothing
  }


-- | Enables or disables CloudWatch logging.
cwloEnabled :: Lens' CloudWatchLoggingOptions (Maybe Bool)
cwloEnabled = lens _cwloEnabled (\ s a -> s{_cwloEnabled = a});

-- | The CloudWatch group name for logging. This value is required if CloudWatch logging is enabled.
cwloLogGroupName :: Lens' CloudWatchLoggingOptions (Maybe Text)
cwloLogGroupName = lens _cwloLogGroupName (\ s a -> s{_cwloLogGroupName = a});

-- | The CloudWatch log stream name for logging. This value is required if CloudWatch logging is enabled.
cwloLogStreamName :: Lens' CloudWatchLoggingOptions (Maybe Text)
cwloLogStreamName = lens _cwloLogStreamName (\ s a -> s{_cwloLogStreamName = a});

instance FromJSON CloudWatchLoggingOptions where
        parseJSON
          = withObject "CloudWatchLoggingOptions"
              (\ x ->
                 CloudWatchLoggingOptions' <$>
                   (x .:? "Enabled") <*> (x .:? "LogGroupName") <*>
                     (x .:? "LogStreamName"))

instance Hashable CloudWatchLoggingOptions where

instance NFData CloudWatchLoggingOptions where

instance ToJSON CloudWatchLoggingOptions where
        toJSON CloudWatchLoggingOptions'{..}
          = object
              (catMaybes
                 [("Enabled" .=) <$> _cwloEnabled,
                  ("LogGroupName" .=) <$> _cwloLogGroupName,
                  ("LogStreamName" .=) <$> _cwloLogStreamName])

-- | Describes a @COPY@ command for Amazon Redshift.
--
--
--
-- /See:/ 'copyCommand' smart constructor.
data CopyCommand = CopyCommand'
  { _ccCopyOptions      :: {-# NOUNPACK #-}!(Maybe Text)
  , _ccDataTableColumns :: {-# NOUNPACK #-}!(Maybe Text)
  , _ccDataTableName    :: {-# NOUNPACK #-}!Text
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'CopyCommand' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ccCopyOptions' - Optional parameters to use with the Amazon Redshift @COPY@ command. For more information, see the "Optional Parameters" section of <http://docs.aws.amazon.com/redshift/latest/dg/r_COPY.html Amazon Redshift COPY command> . Some possible examples that would apply to Kinesis Firehose are as follows: @delimiter '\t' lzop;@ - fields are delimited with "\t" (TAB character) and compressed using lzop. @delimiter '|'@ - fields are delimited with "|" (this is the default delimiter). @delimiter '|' escape@ - the delimiter should be escaped. @fixedwidth 'venueid:3,venuename:25,venuecity:12,venuestate:2,venueseats:6'@ - fields are fixed width in the source, with each width specified after every column in the table. @JSON 's3://mybucket/jsonpaths.txt'@ - data is in JSON format, and the path specified is the format of the data. For more examples, see <http://docs.aws.amazon.com/redshift/latest/dg/r_COPY_command_examples.html Amazon Redshift COPY command examples> .
--
-- * 'ccDataTableColumns' - A comma-separated list of column names.
--
-- * 'ccDataTableName' - The name of the target table. The table must already exist in the database.
copyCommand
    :: Text -- ^ 'ccDataTableName'
    -> CopyCommand
copyCommand pDataTableName_ =
  CopyCommand'
  { _ccCopyOptions = Nothing
  , _ccDataTableColumns = Nothing
  , _ccDataTableName = pDataTableName_
  }


-- | Optional parameters to use with the Amazon Redshift @COPY@ command. For more information, see the "Optional Parameters" section of <http://docs.aws.amazon.com/redshift/latest/dg/r_COPY.html Amazon Redshift COPY command> . Some possible examples that would apply to Kinesis Firehose are as follows: @delimiter '\t' lzop;@ - fields are delimited with "\t" (TAB character) and compressed using lzop. @delimiter '|'@ - fields are delimited with "|" (this is the default delimiter). @delimiter '|' escape@ - the delimiter should be escaped. @fixedwidth 'venueid:3,venuename:25,venuecity:12,venuestate:2,venueseats:6'@ - fields are fixed width in the source, with each width specified after every column in the table. @JSON 's3://mybucket/jsonpaths.txt'@ - data is in JSON format, and the path specified is the format of the data. For more examples, see <http://docs.aws.amazon.com/redshift/latest/dg/r_COPY_command_examples.html Amazon Redshift COPY command examples> .
ccCopyOptions :: Lens' CopyCommand (Maybe Text)
ccCopyOptions = lens _ccCopyOptions (\ s a -> s{_ccCopyOptions = a});

-- | A comma-separated list of column names.
ccDataTableColumns :: Lens' CopyCommand (Maybe Text)
ccDataTableColumns = lens _ccDataTableColumns (\ s a -> s{_ccDataTableColumns = a});

-- | The name of the target table. The table must already exist in the database.
ccDataTableName :: Lens' CopyCommand Text
ccDataTableName = lens _ccDataTableName (\ s a -> s{_ccDataTableName = a});

instance FromJSON CopyCommand where
        parseJSON
          = withObject "CopyCommand"
              (\ x ->
                 CopyCommand' <$>
                   (x .:? "CopyOptions") <*> (x .:? "DataTableColumns")
                     <*> (x .: "DataTableName"))

instance Hashable CopyCommand where

instance NFData CopyCommand where

instance ToJSON CopyCommand where
        toJSON CopyCommand'{..}
          = object
              (catMaybes
                 [("CopyOptions" .=) <$> _ccCopyOptions,
                  ("DataTableColumns" .=) <$> _ccDataTableColumns,
                  Just ("DataTableName" .= _ccDataTableName)])

-- | Contains information about a delivery stream.
--
--
--
-- /See:/ 'deliveryStreamDescription' smart constructor.
data DeliveryStreamDescription = DeliveryStreamDescription'
  { _dsdCreateTimestamp      :: {-# NOUNPACK #-}!(Maybe POSIX)
  , _dsdSource               :: {-# NOUNPACK #-}!(Maybe SourceDescription)
  , _dsdLastUpdateTimestamp  :: {-# NOUNPACK #-}!(Maybe POSIX)
  , _dsdDeliveryStreamName   :: {-# NOUNPACK #-}!Text
  , _dsdDeliveryStreamARN    :: {-# NOUNPACK #-}!Text
  , _dsdDeliveryStreamStatus :: {-# NOUNPACK #-}!DeliveryStreamStatus
  , _dsdDeliveryStreamType   :: {-# NOUNPACK #-}!DeliveryStreamType
  , _dsdVersionId            :: {-# NOUNPACK #-}!Text
  , _dsdDestinations         :: {-# NOUNPACK #-}![DestinationDescription]
  , _dsdHasMoreDestinations  :: {-# NOUNPACK #-}!Bool
  } deriving (Eq, Show, Data, Typeable, Generic)


-- | Creates a value of 'DeliveryStreamDescription' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dsdCreateTimestamp' - The date and time that the delivery stream was created.
--
-- * 'dsdSource' - If the @DeliveryStreamType@ parameter is @KinesisStreamAsSource@ , a 'SourceDescription' object describing the source Kinesis stream.
--
-- * 'dsdLastUpdateTimestamp' - The date and time that the delivery stream was last updated.
--
-- * 'dsdDeliveryStreamName' - The name of the delivery stream.
--
-- * 'dsdDeliveryStreamARN' - The Amazon Resource Name (ARN) of the delivery stream.
--
-- * 'dsdDeliveryStreamStatus' - The status of the delivery stream.
--
-- * 'dsdDeliveryStreamType' - The delivery stream type. This can be one of the following values:     * @DirectPut@ : Provider applications access the delivery stream directly.     * @KinesisStreamAsSource@ : The delivery stream uses a Kinesis stream as a source.
--
-- * 'dsdVersionId' - Each time the destination is updated for a delivery stream, the version ID is changed, and the current version ID is required when updating the destination. This is so that the service knows it is applying the changes to the correct version of the delivery stream.
--
-- * 'dsdDestinations' - The destinations.
--
-- * 'dsdHasMoreDestinations' - Indicates whether there are more destinations available to list.
deliveryStreamDescription
    :: Text -- ^ 'dsdDeliveryStreamName'
    -> Text -- ^ 'dsdDeliveryStreamARN'
    -> DeliveryStreamStatus -- ^ 'dsdDeliveryStreamStatus'
    -> DeliveryStreamType -- ^ 'dsdDeliveryStreamType'
    -> Text -- ^ 'dsdVersionId'
    -> Bool -- ^ 'dsdHasMoreDestinations'
    -> DeliveryStreamDescription
deliveryStreamDescription pDeliveryStreamName_ pDeliveryStreamARN_ pDeliveryStreamStatus_ pDeliveryStreamType_ pVersionId_ pHasMoreDestinations_ =
  DeliveryStreamDescription'
  { _dsdCreateTimestamp = Nothing
  , _dsdSource = Nothing
  , _dsdLastUpdateTimestamp = Nothing
  , _dsdDeliveryStreamName = pDeliveryStreamName_
  , _dsdDeliveryStreamARN = pDeliveryStreamARN_
  , _dsdDeliveryStreamStatus = pDeliveryStreamStatus_
  , _dsdDeliveryStreamType = pDeliveryStreamType_
  , _dsdVersionId = pVersionId_
  , _dsdDestinations = mempty
  , _dsdHasMoreDestinations = pHasMoreDestinations_
  }


-- | The date and time that the delivery stream was created.
dsdCreateTimestamp :: Lens' DeliveryStreamDescription (Maybe UTCTime)
dsdCreateTimestamp = lens _dsdCreateTimestamp (\ s a -> s{_dsdCreateTimestamp = a}) . mapping _Time;

-- | If the @DeliveryStreamType@ parameter is @KinesisStreamAsSource@ , a 'SourceDescription' object describing the source Kinesis stream.
dsdSource :: Lens' DeliveryStreamDescription (Maybe SourceDescription)
dsdSource = lens _dsdSource (\ s a -> s{_dsdSource = a});

-- | The date and time that the delivery stream was last updated.
dsdLastUpdateTimestamp :: Lens' DeliveryStreamDescription (Maybe UTCTime)
dsdLastUpdateTimestamp = lens _dsdLastUpdateTimestamp (\ s a -> s{_dsdLastUpdateTimestamp = a}) . mapping _Time;

-- | The name of the delivery stream.
dsdDeliveryStreamName :: Lens' DeliveryStreamDescription Text
dsdDeliveryStreamName = lens _dsdDeliveryStreamName (\ s a -> s{_dsdDeliveryStreamName = a});

-- | The Amazon Resource Name (ARN) of the delivery stream.
dsdDeliveryStreamARN :: Lens' DeliveryStreamDescription Text
dsdDeliveryStreamARN = lens _dsdDeliveryStreamARN (\ s a -> s{_dsdDeliveryStreamARN = a});

-- | The status of the delivery stream.
dsdDeliveryStreamStatus :: Lens' DeliveryStreamDescription DeliveryStreamStatus
dsdDeliveryStreamStatus = lens _dsdDeliveryStreamStatus (\ s a -> s{_dsdDeliveryStreamStatus = a});

-- | The delivery stream type. This can be one of the following values:     * @DirectPut@ : Provider applications access the delivery stream directly.     * @KinesisStreamAsSource@ : The delivery stream uses a Kinesis stream as a source.
dsdDeliveryStreamType :: Lens' DeliveryStreamDescription DeliveryStreamType
dsdDeliveryStreamType = lens _dsdDeliveryStreamType (\ s a -> s{_dsdDeliveryStreamType = a});

-- | Each time the destination is updated for a delivery stream, the version ID is changed, and the current version ID is required when updating the destination. This is so that the service knows it is applying the changes to the correct version of the delivery stream.
dsdVersionId :: Lens' DeliveryStreamDescription Text
dsdVersionId = lens _dsdVersionId (\ s a -> s{_dsdVersionId = a});

-- | The destinations.
dsdDestinations :: Lens' DeliveryStreamDescription [DestinationDescription]
dsdDestinations = lens _dsdDestinations (\ s a -> s{_dsdDestinations = a}) . _Coerce;

-- | Indicates whether there are more destinations available to list.
dsdHasMoreDestinations :: Lens' DeliveryStreamDescription Bool
dsdHasMoreDestinations = lens _dsdHasMoreDestinations (\ s a -> s{_dsdHasMoreDestinations = a});

instance FromJSON DeliveryStreamDescription where
        parseJSON
          = withObject "DeliveryStreamDescription"
              (\ x ->
                 DeliveryStreamDescription' <$>
                   (x .:? "CreateTimestamp") <*> (x .:? "Source") <*>
                     (x .:? "LastUpdateTimestamp")
                     <*> (x .: "DeliveryStreamName")
                     <*> (x .: "DeliveryStreamARN")
                     <*> (x .: "DeliveryStreamStatus")
                     <*> (x .: "DeliveryStreamType")
                     <*> (x .: "VersionId")
                     <*> (x .:? "Destinations" .!= mempty)
                     <*> (x .: "HasMoreDestinations"))

instance Hashable DeliveryStreamDescription where

instance NFData DeliveryStreamDescription where

-- | Describes the destination for a delivery stream.
--
--
--
-- /See:/ 'destinationDescription' smart constructor.
data DestinationDescription = DestinationDescription'
  { _ddS3DestinationDescription :: {-# NOUNPACK #-}!(Maybe S3DestinationDescription)
  , _ddExtendedS3DestinationDescription :: {-# NOUNPACK #-}!(Maybe ExtendedS3DestinationDescription)
  , _ddElasticsearchDestinationDescription :: {-# NOUNPACK #-}!(Maybe ElasticsearchDestinationDescription)
  , _ddRedshiftDestinationDescription :: {-# NOUNPACK #-}!(Maybe RedshiftDestinationDescription)
  , _ddDestinationId :: {-# NOUNPACK #-}!Text
  } deriving (Eq, Show, Data, Typeable, Generic)


-- | Creates a value of 'DestinationDescription' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ddS3DestinationDescription' - [Deprecated] The destination in Amazon S3.
--
-- * 'ddExtendedS3DestinationDescription' - The destination in Amazon S3.
--
-- * 'ddElasticsearchDestinationDescription' - The destination in Amazon ES.
--
-- * 'ddRedshiftDestinationDescription' - The destination in Amazon Redshift.
--
-- * 'ddDestinationId' - The ID of the destination.
destinationDescription
    :: Text -- ^ 'ddDestinationId'
    -> DestinationDescription
destinationDescription pDestinationId_ =
  DestinationDescription'
  { _ddS3DestinationDescription = Nothing
  , _ddExtendedS3DestinationDescription = Nothing
  , _ddElasticsearchDestinationDescription = Nothing
  , _ddRedshiftDestinationDescription = Nothing
  , _ddDestinationId = pDestinationId_
  }


-- | [Deprecated] The destination in Amazon S3.
ddS3DestinationDescription :: Lens' DestinationDescription (Maybe S3DestinationDescription)
ddS3DestinationDescription = lens _ddS3DestinationDescription (\ s a -> s{_ddS3DestinationDescription = a});

-- | The destination in Amazon S3.
ddExtendedS3DestinationDescription :: Lens' DestinationDescription (Maybe ExtendedS3DestinationDescription)
ddExtendedS3DestinationDescription = lens _ddExtendedS3DestinationDescription (\ s a -> s{_ddExtendedS3DestinationDescription = a});

-- | The destination in Amazon ES.
ddElasticsearchDestinationDescription :: Lens' DestinationDescription (Maybe ElasticsearchDestinationDescription)
ddElasticsearchDestinationDescription = lens _ddElasticsearchDestinationDescription (\ s a -> s{_ddElasticsearchDestinationDescription = a});

-- | The destination in Amazon Redshift.
ddRedshiftDestinationDescription :: Lens' DestinationDescription (Maybe RedshiftDestinationDescription)
ddRedshiftDestinationDescription = lens _ddRedshiftDestinationDescription (\ s a -> s{_ddRedshiftDestinationDescription = a});

-- | The ID of the destination.
ddDestinationId :: Lens' DestinationDescription Text
ddDestinationId = lens _ddDestinationId (\ s a -> s{_ddDestinationId = a});

instance FromJSON DestinationDescription where
        parseJSON
          = withObject "DestinationDescription"
              (\ x ->
                 DestinationDescription' <$>
                   (x .:? "S3DestinationDescription") <*>
                     (x .:? "ExtendedS3DestinationDescription")
                     <*> (x .:? "ElasticsearchDestinationDescription")
                     <*> (x .:? "RedshiftDestinationDescription")
                     <*> (x .: "DestinationId"))

instance Hashable DestinationDescription where

instance NFData DestinationDescription where

-- | Describes the buffering to perform before delivering data to the Amazon ES destination.
--
--
--
-- /See:/ 'elasticsearchBufferingHints' smart constructor.
data ElasticsearchBufferingHints = ElasticsearchBufferingHints'
  { _ebhSizeInMBs         :: {-# NOUNPACK #-}!(Maybe Nat)
  , _ebhIntervalInSeconds :: {-# NOUNPACK #-}!(Maybe Nat)
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'ElasticsearchBufferingHints' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ebhSizeInMBs' - Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The default value is 5. We recommend setting this parameter to a value greater than the amount of data you typically ingest into the delivery stream in 10 seconds. For example, if you typically ingest data at 1 MB/sec, the value should be 10 MB or higher.
--
-- * 'ebhIntervalInSeconds' - Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. The default value is 300 (5 minutes).
elasticsearchBufferingHints
    :: ElasticsearchBufferingHints
elasticsearchBufferingHints =
  ElasticsearchBufferingHints'
  {_ebhSizeInMBs = Nothing, _ebhIntervalInSeconds = Nothing}


-- | Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The default value is 5. We recommend setting this parameter to a value greater than the amount of data you typically ingest into the delivery stream in 10 seconds. For example, if you typically ingest data at 1 MB/sec, the value should be 10 MB or higher.
ebhSizeInMBs :: Lens' ElasticsearchBufferingHints (Maybe Natural)
ebhSizeInMBs = lens _ebhSizeInMBs (\ s a -> s{_ebhSizeInMBs = a}) . mapping _Nat;

-- | Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. The default value is 300 (5 minutes).
ebhIntervalInSeconds :: Lens' ElasticsearchBufferingHints (Maybe Natural)
ebhIntervalInSeconds = lens _ebhIntervalInSeconds (\ s a -> s{_ebhIntervalInSeconds = a}) . mapping _Nat;

instance FromJSON ElasticsearchBufferingHints where
        parseJSON
          = withObject "ElasticsearchBufferingHints"
              (\ x ->
                 ElasticsearchBufferingHints' <$>
                   (x .:? "SizeInMBs") <*> (x .:? "IntervalInSeconds"))

instance Hashable ElasticsearchBufferingHints where

instance NFData ElasticsearchBufferingHints where

instance ToJSON ElasticsearchBufferingHints where
        toJSON ElasticsearchBufferingHints'{..}
          = object
              (catMaybes
                 [("SizeInMBs" .=) <$> _ebhSizeInMBs,
                  ("IntervalInSeconds" .=) <$> _ebhIntervalInSeconds])

-- | Describes the configuration of a destination in Amazon ES.
--
--
--
-- /See:/ 'elasticsearchDestinationConfiguration' smart constructor.
data ElasticsearchDestinationConfiguration = ElasticsearchDestinationConfiguration'
  { _edcIndexRotationPeriod :: {-# NOUNPACK #-}!(Maybe ElasticsearchIndexRotationPeriod)
  , _edcS3BackupMode :: {-# NOUNPACK #-}!(Maybe ElasticsearchS3BackupMode)
  , _edcCloudWatchLoggingOptions :: {-# NOUNPACK #-}!(Maybe CloudWatchLoggingOptions)
  , _edcBufferingHints :: {-# NOUNPACK #-}!(Maybe ElasticsearchBufferingHints)
  , _edcRetryOptions :: {-# NOUNPACK #-}!(Maybe ElasticsearchRetryOptions)
  , _edcProcessingConfiguration :: {-# NOUNPACK #-}!(Maybe ProcessingConfiguration)
  , _edcRoleARN :: {-# NOUNPACK #-}!Text
  , _edcDomainARN :: {-# NOUNPACK #-}!Text
  , _edcIndexName :: {-# NOUNPACK #-}!Text
  , _edcTypeName :: {-# NOUNPACK #-}!Text
  , _edcS3Configuration :: {-# NOUNPACK #-}!S3DestinationConfiguration
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'ElasticsearchDestinationConfiguration' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'edcIndexRotationPeriod' - The Elasticsearch index rotation period. Index rotation appends a time stamp to the IndexName to facilitate the expiration of old data. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-index-rotation Index Rotation for Amazon Elasticsearch Service Destination> . The default value is @OneDay@ .
--
-- * 'edcS3BackupMode' - Defines how documents should be delivered to Amazon S3. When set to FailedDocumentsOnly, Kinesis Firehose writes any documents that could not be indexed to the configured Amazon S3 destination, with elasticsearch-failed/ appended to the key prefix. When set to AllDocuments, Kinesis Firehose delivers all incoming records to Amazon S3, and also writes failed documents with elasticsearch-failed/ appended to the prefix. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-s3-backup Amazon S3 Backup for Amazon Elasticsearch Service Destination> . Default value is FailedDocumentsOnly.
--
-- * 'edcCloudWatchLoggingOptions' - The CloudWatch logging options for your delivery stream.
--
-- * 'edcBufferingHints' - The buffering options. If no value is specified, the default values for __ElasticsearchBufferingHints__ are used.
--
-- * 'edcRetryOptions' - The retry behavior in case Kinesis Firehose is unable to deliver documents to Amazon ES. The default value is 300 (5 minutes).
--
-- * 'edcProcessingConfiguration' - The data processing configuration.
--
-- * 'edcRoleARN' - The ARN of the IAM role to be assumed by Kinesis Firehose for calling the Amazon ES Configuration API and for indexing documents. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3 Amazon S3 Bucket Access> .
--
-- * 'edcDomainARN' - The ARN of the Amazon ES domain. The IAM role must have permissions for @DescribeElasticsearchDomain@ , @DescribeElasticsearchDomains@ , and @DescribeElasticsearchDomainConfig@ after assuming the role specified in __RoleARN__ .
--
-- * 'edcIndexName' - The Elasticsearch index name.
--
-- * 'edcTypeName' - The Elasticsearch type name.
--
-- * 'edcS3Configuration' - The configuration for the backup Amazon S3 location.
elasticsearchDestinationConfiguration
    :: Text -- ^ 'edcRoleARN'
    -> Text -- ^ 'edcDomainARN'
    -> Text -- ^ 'edcIndexName'
    -> Text -- ^ 'edcTypeName'
    -> S3DestinationConfiguration -- ^ 'edcS3Configuration'
    -> ElasticsearchDestinationConfiguration
elasticsearchDestinationConfiguration pRoleARN_ pDomainARN_ pIndexName_ pTypeName_ pS3Configuration_ =
  ElasticsearchDestinationConfiguration'
  { _edcIndexRotationPeriod = Nothing
  , _edcS3BackupMode = Nothing
  , _edcCloudWatchLoggingOptions = Nothing
  , _edcBufferingHints = Nothing
  , _edcRetryOptions = Nothing
  , _edcProcessingConfiguration = Nothing
  , _edcRoleARN = pRoleARN_
  , _edcDomainARN = pDomainARN_
  , _edcIndexName = pIndexName_
  , _edcTypeName = pTypeName_
  , _edcS3Configuration = pS3Configuration_
  }


-- | The Elasticsearch index rotation period. Index rotation appends a time stamp to the IndexName to facilitate the expiration of old data. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-index-rotation Index Rotation for Amazon Elasticsearch Service Destination> . The default value is @OneDay@ .
edcIndexRotationPeriod :: Lens' ElasticsearchDestinationConfiguration (Maybe ElasticsearchIndexRotationPeriod)
edcIndexRotationPeriod = lens _edcIndexRotationPeriod (\ s a -> s{_edcIndexRotationPeriod = a});

-- | Defines how documents should be delivered to Amazon S3. When set to FailedDocumentsOnly, Kinesis Firehose writes any documents that could not be indexed to the configured Amazon S3 destination, with elasticsearch-failed/ appended to the key prefix. When set to AllDocuments, Kinesis Firehose delivers all incoming records to Amazon S3, and also writes failed documents with elasticsearch-failed/ appended to the prefix. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-s3-backup Amazon S3 Backup for Amazon Elasticsearch Service Destination> . Default value is FailedDocumentsOnly.
edcS3BackupMode :: Lens' ElasticsearchDestinationConfiguration (Maybe ElasticsearchS3BackupMode)
edcS3BackupMode = lens _edcS3BackupMode (\ s a -> s{_edcS3BackupMode = a});

-- | The CloudWatch logging options for your delivery stream.
edcCloudWatchLoggingOptions :: Lens' ElasticsearchDestinationConfiguration (Maybe CloudWatchLoggingOptions)
edcCloudWatchLoggingOptions = lens _edcCloudWatchLoggingOptions (\ s a -> s{_edcCloudWatchLoggingOptions = a});

-- | The buffering options. If no value is specified, the default values for __ElasticsearchBufferingHints__ are used.
edcBufferingHints :: Lens' ElasticsearchDestinationConfiguration (Maybe ElasticsearchBufferingHints)
edcBufferingHints = lens _edcBufferingHints (\ s a -> s{_edcBufferingHints = a});

-- | The retry behavior in case Kinesis Firehose is unable to deliver documents to Amazon ES. The default value is 300 (5 minutes).
edcRetryOptions :: Lens' ElasticsearchDestinationConfiguration (Maybe ElasticsearchRetryOptions)
edcRetryOptions = lens _edcRetryOptions (\ s a -> s{_edcRetryOptions = a});

-- | The data processing configuration.
edcProcessingConfiguration :: Lens' ElasticsearchDestinationConfiguration (Maybe ProcessingConfiguration)
edcProcessingConfiguration = lens _edcProcessingConfiguration (\ s a -> s{_edcProcessingConfiguration = a});

-- | The ARN of the IAM role to be assumed by Kinesis Firehose for calling the Amazon ES Configuration API and for indexing documents. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3 Amazon S3 Bucket Access> .
edcRoleARN :: Lens' ElasticsearchDestinationConfiguration Text
edcRoleARN = lens _edcRoleARN (\ s a -> s{_edcRoleARN = a});

-- | The ARN of the Amazon ES domain. The IAM role must have permissions for @DescribeElasticsearchDomain@ , @DescribeElasticsearchDomains@ , and @DescribeElasticsearchDomainConfig@ after assuming the role specified in __RoleARN__ .
edcDomainARN :: Lens' ElasticsearchDestinationConfiguration Text
edcDomainARN = lens _edcDomainARN (\ s a -> s{_edcDomainARN = a});

-- | The Elasticsearch index name.
edcIndexName :: Lens' ElasticsearchDestinationConfiguration Text
edcIndexName = lens _edcIndexName (\ s a -> s{_edcIndexName = a});

-- | The Elasticsearch type name.
edcTypeName :: Lens' ElasticsearchDestinationConfiguration Text
edcTypeName = lens _edcTypeName (\ s a -> s{_edcTypeName = a});

-- | The configuration for the backup Amazon S3 location.
edcS3Configuration :: Lens' ElasticsearchDestinationConfiguration S3DestinationConfiguration
edcS3Configuration = lens _edcS3Configuration (\ s a -> s{_edcS3Configuration = a});

instance Hashable
           ElasticsearchDestinationConfiguration
         where

instance NFData ElasticsearchDestinationConfiguration
         where

instance ToJSON ElasticsearchDestinationConfiguration
         where
        toJSON ElasticsearchDestinationConfiguration'{..}
          = object
              (catMaybes
                 [("IndexRotationPeriod" .=) <$>
                    _edcIndexRotationPeriod,
                  ("S3BackupMode" .=) <$> _edcS3BackupMode,
                  ("CloudWatchLoggingOptions" .=) <$>
                    _edcCloudWatchLoggingOptions,
                  ("BufferingHints" .=) <$> _edcBufferingHints,
                  ("RetryOptions" .=) <$> _edcRetryOptions,
                  ("ProcessingConfiguration" .=) <$>
                    _edcProcessingConfiguration,
                  Just ("RoleARN" .= _edcRoleARN),
                  Just ("DomainARN" .= _edcDomainARN),
                  Just ("IndexName" .= _edcIndexName),
                  Just ("TypeName" .= _edcTypeName),
                  Just ("S3Configuration" .= _edcS3Configuration)])

-- | The destination description in Amazon ES.
--
--
--
-- /See:/ 'elasticsearchDestinationDescription' smart constructor.
data ElasticsearchDestinationDescription = ElasticsearchDestinationDescription'
  { _eddIndexRotationPeriod :: {-# NOUNPACK #-}!(Maybe ElasticsearchIndexRotationPeriod)
  , _eddTypeName :: {-# NOUNPACK #-}!(Maybe Text)
  , _eddS3BackupMode :: {-# NOUNPACK #-}!(Maybe ElasticsearchS3BackupMode)
  , _eddDomainARN :: {-# NOUNPACK #-}!(Maybe Text)
  , _eddCloudWatchLoggingOptions :: {-# NOUNPACK #-}!(Maybe CloudWatchLoggingOptions)
  , _eddS3DestinationDescription :: {-# NOUNPACK #-}!(Maybe S3DestinationDescription)
  , _eddBufferingHints :: {-# NOUNPACK #-}!(Maybe ElasticsearchBufferingHints)
  , _eddRetryOptions :: {-# NOUNPACK #-}!(Maybe ElasticsearchRetryOptions)
  , _eddProcessingConfiguration :: {-# NOUNPACK #-}!(Maybe ProcessingConfiguration)
  , _eddRoleARN :: {-# NOUNPACK #-}!(Maybe Text)
  , _eddIndexName :: {-# NOUNPACK #-}!(Maybe Text)
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'ElasticsearchDestinationDescription' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'eddIndexRotationPeriod' - The Elasticsearch index rotation period
--
-- * 'eddTypeName' - The Elasticsearch type name.
--
-- * 'eddS3BackupMode' - The Amazon S3 backup mode.
--
-- * 'eddDomainARN' - The ARN of the Amazon ES domain.
--
-- * 'eddCloudWatchLoggingOptions' - The CloudWatch logging options.
--
-- * 'eddS3DestinationDescription' - The Amazon S3 destination.
--
-- * 'eddBufferingHints' - The buffering options.
--
-- * 'eddRetryOptions' - The Amazon ES retry options.
--
-- * 'eddProcessingConfiguration' - The data processing configuration.
--
-- * 'eddRoleARN' - The ARN of the AWS credentials.
--
-- * 'eddIndexName' - The Elasticsearch index name.
elasticsearchDestinationDescription
    :: ElasticsearchDestinationDescription
elasticsearchDestinationDescription =
  ElasticsearchDestinationDescription'
  { _eddIndexRotationPeriod = Nothing
  , _eddTypeName = Nothing
  , _eddS3BackupMode = Nothing
  , _eddDomainARN = Nothing
  , _eddCloudWatchLoggingOptions = Nothing
  , _eddS3DestinationDescription = Nothing
  , _eddBufferingHints = Nothing
  , _eddRetryOptions = Nothing
  , _eddProcessingConfiguration = Nothing
  , _eddRoleARN = Nothing
  , _eddIndexName = Nothing
  }


-- | The Elasticsearch index rotation period
eddIndexRotationPeriod :: Lens' ElasticsearchDestinationDescription (Maybe ElasticsearchIndexRotationPeriod)
eddIndexRotationPeriod = lens _eddIndexRotationPeriod (\ s a -> s{_eddIndexRotationPeriod = a});

-- | The Elasticsearch type name.
eddTypeName :: Lens' ElasticsearchDestinationDescription (Maybe Text)
eddTypeName = lens _eddTypeName (\ s a -> s{_eddTypeName = a});

-- | The Amazon S3 backup mode.
eddS3BackupMode :: Lens' ElasticsearchDestinationDescription (Maybe ElasticsearchS3BackupMode)
eddS3BackupMode = lens _eddS3BackupMode (\ s a -> s{_eddS3BackupMode = a});

-- | The ARN of the Amazon ES domain.
eddDomainARN :: Lens' ElasticsearchDestinationDescription (Maybe Text)
eddDomainARN = lens _eddDomainARN (\ s a -> s{_eddDomainARN = a});

-- | The CloudWatch logging options.
eddCloudWatchLoggingOptions :: Lens' ElasticsearchDestinationDescription (Maybe CloudWatchLoggingOptions)
eddCloudWatchLoggingOptions = lens _eddCloudWatchLoggingOptions (\ s a -> s{_eddCloudWatchLoggingOptions = a});

-- | The Amazon S3 destination.
eddS3DestinationDescription :: Lens' ElasticsearchDestinationDescription (Maybe S3DestinationDescription)
eddS3DestinationDescription = lens _eddS3DestinationDescription (\ s a -> s{_eddS3DestinationDescription = a});

-- | The buffering options.
eddBufferingHints :: Lens' ElasticsearchDestinationDescription (Maybe ElasticsearchBufferingHints)
eddBufferingHints = lens _eddBufferingHints (\ s a -> s{_eddBufferingHints = a});

-- | The Amazon ES retry options.
eddRetryOptions :: Lens' ElasticsearchDestinationDescription (Maybe ElasticsearchRetryOptions)
eddRetryOptions = lens _eddRetryOptions (\ s a -> s{_eddRetryOptions = a});

-- | The data processing configuration.
eddProcessingConfiguration :: Lens' ElasticsearchDestinationDescription (Maybe ProcessingConfiguration)
eddProcessingConfiguration = lens _eddProcessingConfiguration (\ s a -> s{_eddProcessingConfiguration = a});

-- | The ARN of the AWS credentials.
eddRoleARN :: Lens' ElasticsearchDestinationDescription (Maybe Text)
eddRoleARN = lens _eddRoleARN (\ s a -> s{_eddRoleARN = a});

-- | The Elasticsearch index name.
eddIndexName :: Lens' ElasticsearchDestinationDescription (Maybe Text)
eddIndexName = lens _eddIndexName (\ s a -> s{_eddIndexName = a});

instance FromJSON ElasticsearchDestinationDescription
         where
        parseJSON
          = withObject "ElasticsearchDestinationDescription"
              (\ x ->
                 ElasticsearchDestinationDescription' <$>
                   (x .:? "IndexRotationPeriod") <*> (x .:? "TypeName")
                     <*> (x .:? "S3BackupMode")
                     <*> (x .:? "DomainARN")
                     <*> (x .:? "CloudWatchLoggingOptions")
                     <*> (x .:? "S3DestinationDescription")
                     <*> (x .:? "BufferingHints")
                     <*> (x .:? "RetryOptions")
                     <*> (x .:? "ProcessingConfiguration")
                     <*> (x .:? "RoleARN")
                     <*> (x .:? "IndexName"))

instance Hashable ElasticsearchDestinationDescription
         where

instance NFData ElasticsearchDestinationDescription
         where

-- | Describes an update for a destination in Amazon ES.
--
--
--
-- /See:/ 'elasticsearchDestinationUpdate' smart constructor.
data ElasticsearchDestinationUpdate = ElasticsearchDestinationUpdate'
  { _eduIndexRotationPeriod :: {-# NOUNPACK #-}!(Maybe ElasticsearchIndexRotationPeriod)
  , _eduTypeName :: {-# NOUNPACK #-}!(Maybe Text)
  , _eduDomainARN :: {-# NOUNPACK #-}!(Maybe Text)
  , _eduCloudWatchLoggingOptions :: {-# NOUNPACK #-}!(Maybe CloudWatchLoggingOptions)
  , _eduS3Update :: {-# NOUNPACK #-}!(Maybe S3DestinationUpdate)
  , _eduBufferingHints :: {-# NOUNPACK #-}!(Maybe ElasticsearchBufferingHints)
  , _eduRetryOptions :: {-# NOUNPACK #-}!(Maybe ElasticsearchRetryOptions)
  , _eduProcessingConfiguration :: {-# NOUNPACK #-}!(Maybe ProcessingConfiguration)
  , _eduRoleARN :: {-# NOUNPACK #-}!(Maybe Text)
  , _eduIndexName :: {-# NOUNPACK #-}!(Maybe Text)
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'ElasticsearchDestinationUpdate' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'eduIndexRotationPeriod' - The Elasticsearch index rotation period. Index rotation appends a time stamp to IndexName to facilitate the expiration of old data. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-index-rotation Index Rotation for Amazon Elasticsearch Service Destination> . Default value is @OneDay@ .
--
-- * 'eduTypeName' - The Elasticsearch type name.
--
-- * 'eduDomainARN' - The ARN of the Amazon ES domain. The IAM role must have permissions for @DescribeElasticsearchDomain@ , @DescribeElasticsearchDomains@ , and @DescribeElasticsearchDomainConfig@ after assuming the IAM role specified in __RoleARN__ .
--
-- * 'eduCloudWatchLoggingOptions' - The CloudWatch logging options for your delivery stream.
--
-- * 'eduS3Update' - The Amazon S3 destination.
--
-- * 'eduBufferingHints' - The buffering options. If no value is specified, __ElasticsearchBufferingHints__ object default values are used.
--
-- * 'eduRetryOptions' - The retry behavior in case Kinesis Firehose is unable to deliver documents to Amazon ES. The default value is 300 (5 minutes).
--
-- * 'eduProcessingConfiguration' - The data processing configuration.
--
-- * 'eduRoleARN' - The ARN of the IAM role to be assumed by Kinesis Firehose for calling the Amazon ES Configuration API and for indexing documents. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3 Amazon S3 Bucket Access> .
--
-- * 'eduIndexName' - The Elasticsearch index name.
elasticsearchDestinationUpdate
    :: ElasticsearchDestinationUpdate
elasticsearchDestinationUpdate =
  ElasticsearchDestinationUpdate'
  { _eduIndexRotationPeriod = Nothing
  , _eduTypeName = Nothing
  , _eduDomainARN = Nothing
  , _eduCloudWatchLoggingOptions = Nothing
  , _eduS3Update = Nothing
  , _eduBufferingHints = Nothing
  , _eduRetryOptions = Nothing
  , _eduProcessingConfiguration = Nothing
  , _eduRoleARN = Nothing
  , _eduIndexName = Nothing
  }


-- | The Elasticsearch index rotation period. Index rotation appends a time stamp to IndexName to facilitate the expiration of old data. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-index-rotation Index Rotation for Amazon Elasticsearch Service Destination> . Default value is @OneDay@ .
eduIndexRotationPeriod :: Lens' ElasticsearchDestinationUpdate (Maybe ElasticsearchIndexRotationPeriod)
eduIndexRotationPeriod = lens _eduIndexRotationPeriod (\ s a -> s{_eduIndexRotationPeriod = a});

-- | The Elasticsearch type name.
eduTypeName :: Lens' ElasticsearchDestinationUpdate (Maybe Text)
eduTypeName = lens _eduTypeName (\ s a -> s{_eduTypeName = a});

-- | The ARN of the Amazon ES domain. The IAM role must have permissions for @DescribeElasticsearchDomain@ , @DescribeElasticsearchDomains@ , and @DescribeElasticsearchDomainConfig@ after assuming the IAM role specified in __RoleARN__ .
eduDomainARN :: Lens' ElasticsearchDestinationUpdate (Maybe Text)
eduDomainARN = lens _eduDomainARN (\ s a -> s{_eduDomainARN = a});

-- | The CloudWatch logging options for your delivery stream.
eduCloudWatchLoggingOptions :: Lens' ElasticsearchDestinationUpdate (Maybe CloudWatchLoggingOptions)
eduCloudWatchLoggingOptions = lens _eduCloudWatchLoggingOptions (\ s a -> s{_eduCloudWatchLoggingOptions = a});

-- | The Amazon S3 destination.
eduS3Update :: Lens' ElasticsearchDestinationUpdate (Maybe S3DestinationUpdate)
eduS3Update = lens _eduS3Update (\ s a -> s{_eduS3Update = a});

-- | The buffering options. If no value is specified, __ElasticsearchBufferingHints__ object default values are used.
eduBufferingHints :: Lens' ElasticsearchDestinationUpdate (Maybe ElasticsearchBufferingHints)
eduBufferingHints = lens _eduBufferingHints (\ s a -> s{_eduBufferingHints = a});

-- | The retry behavior in case Kinesis Firehose is unable to deliver documents to Amazon ES. The default value is 300 (5 minutes).
eduRetryOptions :: Lens' ElasticsearchDestinationUpdate (Maybe ElasticsearchRetryOptions)
eduRetryOptions = lens _eduRetryOptions (\ s a -> s{_eduRetryOptions = a});

-- | The data processing configuration.
eduProcessingConfiguration :: Lens' ElasticsearchDestinationUpdate (Maybe ProcessingConfiguration)
eduProcessingConfiguration = lens _eduProcessingConfiguration (\ s a -> s{_eduProcessingConfiguration = a});

-- | The ARN of the IAM role to be assumed by Kinesis Firehose for calling the Amazon ES Configuration API and for indexing documents. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3 Amazon S3 Bucket Access> .
eduRoleARN :: Lens' ElasticsearchDestinationUpdate (Maybe Text)
eduRoleARN = lens _eduRoleARN (\ s a -> s{_eduRoleARN = a});

-- | The Elasticsearch index name.
eduIndexName :: Lens' ElasticsearchDestinationUpdate (Maybe Text)
eduIndexName = lens _eduIndexName (\ s a -> s{_eduIndexName = a});

instance Hashable ElasticsearchDestinationUpdate
         where

instance NFData ElasticsearchDestinationUpdate where

instance ToJSON ElasticsearchDestinationUpdate where
        toJSON ElasticsearchDestinationUpdate'{..}
          = object
              (catMaybes
                 [("IndexRotationPeriod" .=) <$>
                    _eduIndexRotationPeriod,
                  ("TypeName" .=) <$> _eduTypeName,
                  ("DomainARN" .=) <$> _eduDomainARN,
                  ("CloudWatchLoggingOptions" .=) <$>
                    _eduCloudWatchLoggingOptions,
                  ("S3Update" .=) <$> _eduS3Update,
                  ("BufferingHints" .=) <$> _eduBufferingHints,
                  ("RetryOptions" .=) <$> _eduRetryOptions,
                  ("ProcessingConfiguration" .=) <$>
                    _eduProcessingConfiguration,
                  ("RoleARN" .=) <$> _eduRoleARN,
                  ("IndexName" .=) <$> _eduIndexName])

-- | Configures retry behavior in case Kinesis Firehose is unable to deliver documents to Amazon ES.
--
--
--
-- /See:/ 'elasticsearchRetryOptions' smart constructor.
newtype ElasticsearchRetryOptions = ElasticsearchRetryOptions'
  { _eroDurationInSeconds :: Maybe Nat
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'ElasticsearchRetryOptions' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'eroDurationInSeconds' - After an initial failure to deliver to Amazon ES, the total amount of time during which Kinesis Firehose re-attempts delivery (including the first attempt). After this time has elapsed, the failed documents are written to Amazon S3. Default value is 300 seconds (5 minutes). A value of 0 (zero) results in no retries.
elasticsearchRetryOptions
    :: ElasticsearchRetryOptions
elasticsearchRetryOptions =
  ElasticsearchRetryOptions' {_eroDurationInSeconds = Nothing}


-- | After an initial failure to deliver to Amazon ES, the total amount of time during which Kinesis Firehose re-attempts delivery (including the first attempt). After this time has elapsed, the failed documents are written to Amazon S3. Default value is 300 seconds (5 minutes). A value of 0 (zero) results in no retries.
eroDurationInSeconds :: Lens' ElasticsearchRetryOptions (Maybe Natural)
eroDurationInSeconds = lens _eroDurationInSeconds (\ s a -> s{_eroDurationInSeconds = a}) . mapping _Nat;

instance FromJSON ElasticsearchRetryOptions where
        parseJSON
          = withObject "ElasticsearchRetryOptions"
              (\ x ->
                 ElasticsearchRetryOptions' <$>
                   (x .:? "DurationInSeconds"))

instance Hashable ElasticsearchRetryOptions where

instance NFData ElasticsearchRetryOptions where

instance ToJSON ElasticsearchRetryOptions where
        toJSON ElasticsearchRetryOptions'{..}
          = object
              (catMaybes
                 [("DurationInSeconds" .=) <$> _eroDurationInSeconds])

-- | Describes the encryption for a destination in Amazon S3.
--
--
--
-- /See:/ 'encryptionConfiguration' smart constructor.
data EncryptionConfiguration = EncryptionConfiguration'
  { _ecNoEncryptionConfig  :: {-# NOUNPACK #-}!(Maybe NoEncryptionConfig)
  , _ecKMSEncryptionConfig :: {-# NOUNPACK #-}!(Maybe KMSEncryptionConfig)
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'EncryptionConfiguration' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ecNoEncryptionConfig' - Specifically override existing encryption information to ensure that no encryption is used.
--
-- * 'ecKMSEncryptionConfig' - The encryption key.
encryptionConfiguration
    :: EncryptionConfiguration
encryptionConfiguration =
  EncryptionConfiguration'
  {_ecNoEncryptionConfig = Nothing, _ecKMSEncryptionConfig = Nothing}


-- | Specifically override existing encryption information to ensure that no encryption is used.
ecNoEncryptionConfig :: Lens' EncryptionConfiguration (Maybe NoEncryptionConfig)
ecNoEncryptionConfig = lens _ecNoEncryptionConfig (\ s a -> s{_ecNoEncryptionConfig = a});

-- | The encryption key.
ecKMSEncryptionConfig :: Lens' EncryptionConfiguration (Maybe KMSEncryptionConfig)
ecKMSEncryptionConfig = lens _ecKMSEncryptionConfig (\ s a -> s{_ecKMSEncryptionConfig = a});

instance FromJSON EncryptionConfiguration where
        parseJSON
          = withObject "EncryptionConfiguration"
              (\ x ->
                 EncryptionConfiguration' <$>
                   (x .:? "NoEncryptionConfig") <*>
                     (x .:? "KMSEncryptionConfig"))

instance Hashable EncryptionConfiguration where

instance NFData EncryptionConfiguration where

instance ToJSON EncryptionConfiguration where
        toJSON EncryptionConfiguration'{..}
          = object
              (catMaybes
                 [("NoEncryptionConfig" .=) <$> _ecNoEncryptionConfig,
                  ("KMSEncryptionConfig" .=) <$>
                    _ecKMSEncryptionConfig])

-- | Describes the configuration of a destination in Amazon S3.
--
--
--
-- /See:/ 'extendedS3DestinationConfiguration' smart constructor.
data ExtendedS3DestinationConfiguration = ExtendedS3DestinationConfiguration'
  { _esdcS3BackupMode :: {-# NOUNPACK #-}!(Maybe S3BackupMode)
  , _esdcPrefix :: {-# NOUNPACK #-}!(Maybe Text)
  , _esdcCloudWatchLoggingOptions :: {-# NOUNPACK #-}!(Maybe CloudWatchLoggingOptions)
  , _esdcS3BackupConfiguration :: {-# NOUNPACK #-}!(Maybe S3DestinationConfiguration)
  , _esdcEncryptionConfiguration :: {-# NOUNPACK #-}!(Maybe EncryptionConfiguration)
  , _esdcCompressionFormat :: {-# NOUNPACK #-}!(Maybe CompressionFormat)
  , _esdcBufferingHints :: {-# NOUNPACK #-}!(Maybe BufferingHints)
  , _esdcProcessingConfiguration :: {-# NOUNPACK #-}!(Maybe ProcessingConfiguration)
  , _esdcRoleARN :: {-# NOUNPACK #-}!Text
  , _esdcBucketARN :: {-# NOUNPACK #-}!Text
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'ExtendedS3DestinationConfiguration' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'esdcS3BackupMode' - The Amazon S3 backup mode.
--
-- * 'esdcPrefix' - The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix. If the prefix ends with a slash, it appears as a folder in the S3 bucket. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html Amazon S3 Object Name Format> in the /Amazon Kinesis Firehose Developer Guide/ .
--
-- * 'esdcCloudWatchLoggingOptions' - The CloudWatch logging options for your delivery stream.
--
-- * 'esdcS3BackupConfiguration' - The configuration for backup in Amazon S3.
--
-- * 'esdcEncryptionConfiguration' - The encryption configuration. If no value is specified, the default is no encryption.
--
-- * 'esdcCompressionFormat' - The compression format. If no value is specified, the default is UNCOMPRESSED.
--
-- * 'esdcBufferingHints' - The buffering option.
--
-- * 'esdcProcessingConfiguration' - The data processing configuration.
--
-- * 'esdcRoleARN' - The ARN of the AWS credentials.
--
-- * 'esdcBucketARN' - The ARN of the S3 bucket.
extendedS3DestinationConfiguration
    :: Text -- ^ 'esdcRoleARN'
    -> Text -- ^ 'esdcBucketARN'
    -> ExtendedS3DestinationConfiguration
extendedS3DestinationConfiguration pRoleARN_ pBucketARN_ =
  ExtendedS3DestinationConfiguration'
  { _esdcS3BackupMode = Nothing
  , _esdcPrefix = Nothing
  , _esdcCloudWatchLoggingOptions = Nothing
  , _esdcS3BackupConfiguration = Nothing
  , _esdcEncryptionConfiguration = Nothing
  , _esdcCompressionFormat = Nothing
  , _esdcBufferingHints = Nothing
  , _esdcProcessingConfiguration = Nothing
  , _esdcRoleARN = pRoleARN_
  , _esdcBucketARN = pBucketARN_
  }


-- | The Amazon S3 backup mode.
esdcS3BackupMode :: Lens' ExtendedS3DestinationConfiguration (Maybe S3BackupMode)
esdcS3BackupMode = lens _esdcS3BackupMode (\ s a -> s{_esdcS3BackupMode = a});

-- | The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix. If the prefix ends with a slash, it appears as a folder in the S3 bucket. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html Amazon S3 Object Name Format> in the /Amazon Kinesis Firehose Developer Guide/ .
esdcPrefix :: Lens' ExtendedS3DestinationConfiguration (Maybe Text)
esdcPrefix = lens _esdcPrefix (\ s a -> s{_esdcPrefix = a});

-- | The CloudWatch logging options for your delivery stream.
esdcCloudWatchLoggingOptions :: Lens' ExtendedS3DestinationConfiguration (Maybe CloudWatchLoggingOptions)
esdcCloudWatchLoggingOptions = lens _esdcCloudWatchLoggingOptions (\ s a -> s{_esdcCloudWatchLoggingOptions = a});

-- | The configuration for backup in Amazon S3.
esdcS3BackupConfiguration :: Lens' ExtendedS3DestinationConfiguration (Maybe S3DestinationConfiguration)
esdcS3BackupConfiguration = lens _esdcS3BackupConfiguration (\ s a -> s{_esdcS3BackupConfiguration = a});

-- | The encryption configuration. If no value is specified, the default is no encryption.
esdcEncryptionConfiguration :: Lens' ExtendedS3DestinationConfiguration (Maybe EncryptionConfiguration)
esdcEncryptionConfiguration = lens _esdcEncryptionConfiguration (\ s a -> s{_esdcEncryptionConfiguration = a});

-- | The compression format. If no value is specified, the default is UNCOMPRESSED.
esdcCompressionFormat :: Lens' ExtendedS3DestinationConfiguration (Maybe CompressionFormat)
esdcCompressionFormat = lens _esdcCompressionFormat (\ s a -> s{_esdcCompressionFormat = a});

-- | The buffering option.
esdcBufferingHints :: Lens' ExtendedS3DestinationConfiguration (Maybe BufferingHints)
esdcBufferingHints = lens _esdcBufferingHints (\ s a -> s{_esdcBufferingHints = a});

-- | The data processing configuration.
esdcProcessingConfiguration :: Lens' ExtendedS3DestinationConfiguration (Maybe ProcessingConfiguration)
esdcProcessingConfiguration = lens _esdcProcessingConfiguration (\ s a -> s{_esdcProcessingConfiguration = a});

-- | The ARN of the AWS credentials.
esdcRoleARN :: Lens' ExtendedS3DestinationConfiguration Text
esdcRoleARN = lens _esdcRoleARN (\ s a -> s{_esdcRoleARN = a});

-- | The ARN of the S3 bucket.
esdcBucketARN :: Lens' ExtendedS3DestinationConfiguration Text
esdcBucketARN = lens _esdcBucketARN (\ s a -> s{_esdcBucketARN = a});

instance Hashable ExtendedS3DestinationConfiguration
         where

instance NFData ExtendedS3DestinationConfiguration
         where

instance ToJSON ExtendedS3DestinationConfiguration
         where
        toJSON ExtendedS3DestinationConfiguration'{..}
          = object
              (catMaybes
                 [("S3BackupMode" .=) <$> _esdcS3BackupMode,
                  ("Prefix" .=) <$> _esdcPrefix,
                  ("CloudWatchLoggingOptions" .=) <$>
                    _esdcCloudWatchLoggingOptions,
                  ("S3BackupConfiguration" .=) <$>
                    _esdcS3BackupConfiguration,
                  ("EncryptionConfiguration" .=) <$>
                    _esdcEncryptionConfiguration,
                  ("CompressionFormat" .=) <$> _esdcCompressionFormat,
                  ("BufferingHints" .=) <$> _esdcBufferingHints,
                  ("ProcessingConfiguration" .=) <$>
                    _esdcProcessingConfiguration,
                  Just ("RoleARN" .= _esdcRoleARN),
                  Just ("BucketARN" .= _esdcBucketARN)])

-- | Describes a destination in Amazon S3.
--
--
--
-- /See:/ 'extendedS3DestinationDescription' smart constructor.
data ExtendedS3DestinationDescription = ExtendedS3DestinationDescription'
  { _esddS3BackupMode :: {-# NOUNPACK #-}!(Maybe S3BackupMode)
  , _esddS3BackupDescription :: {-# NOUNPACK #-}!(Maybe S3DestinationDescription)
  , _esddPrefix :: {-# NOUNPACK #-}!(Maybe Text)
  , _esddCloudWatchLoggingOptions :: {-# NOUNPACK #-}!(Maybe CloudWatchLoggingOptions)
  , _esddProcessingConfiguration :: {-# NOUNPACK #-}!(Maybe ProcessingConfiguration)
  , _esddRoleARN :: {-# NOUNPACK #-}!Text
  , _esddBucketARN :: {-# NOUNPACK #-}!Text
  , _esddBufferingHints :: {-# NOUNPACK #-}!BufferingHints
  , _esddCompressionFormat :: {-# NOUNPACK #-}!CompressionFormat
  , _esddEncryptionConfiguration :: {-# NOUNPACK #-}!EncryptionConfiguration
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'ExtendedS3DestinationDescription' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'esddS3BackupMode' - The Amazon S3 backup mode.
--
-- * 'esddS3BackupDescription' - The configuration for backup in Amazon S3.
--
-- * 'esddPrefix' - The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix. If the prefix ends with a slash, it appears as a folder in the S3 bucket. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html Amazon S3 Object Name Format> in the /Amazon Kinesis Firehose Developer Guide/ .
--
-- * 'esddCloudWatchLoggingOptions' - The CloudWatch logging options for your delivery stream.
--
-- * 'esddProcessingConfiguration' - The data processing configuration.
--
-- * 'esddRoleARN' - The ARN of the AWS credentials.
--
-- * 'esddBucketARN' - The ARN of the S3 bucket.
--
-- * 'esddBufferingHints' - The buffering option.
--
-- * 'esddCompressionFormat' - The compression format. If no value is specified, the default is @UNCOMPRESSED@ .
--
-- * 'esddEncryptionConfiguration' - The encryption configuration. If no value is specified, the default is no encryption.
extendedS3DestinationDescription
    :: Text -- ^ 'esddRoleARN'
    -> Text -- ^ 'esddBucketARN'
    -> BufferingHints -- ^ 'esddBufferingHints'
    -> CompressionFormat -- ^ 'esddCompressionFormat'
    -> EncryptionConfiguration -- ^ 'esddEncryptionConfiguration'
    -> ExtendedS3DestinationDescription
extendedS3DestinationDescription pRoleARN_ pBucketARN_ pBufferingHints_ pCompressionFormat_ pEncryptionConfiguration_ =
  ExtendedS3DestinationDescription'
  { _esddS3BackupMode = Nothing
  , _esddS3BackupDescription = Nothing
  , _esddPrefix = Nothing
  , _esddCloudWatchLoggingOptions = Nothing
  , _esddProcessingConfiguration = Nothing
  , _esddRoleARN = pRoleARN_
  , _esddBucketARN = pBucketARN_
  , _esddBufferingHints = pBufferingHints_
  , _esddCompressionFormat = pCompressionFormat_
  , _esddEncryptionConfiguration = pEncryptionConfiguration_
  }


-- | The Amazon S3 backup mode.
esddS3BackupMode :: Lens' ExtendedS3DestinationDescription (Maybe S3BackupMode)
esddS3BackupMode = lens _esddS3BackupMode (\ s a -> s{_esddS3BackupMode = a});

-- | The configuration for backup in Amazon S3.
esddS3BackupDescription :: Lens' ExtendedS3DestinationDescription (Maybe S3DestinationDescription)
esddS3BackupDescription = lens _esddS3BackupDescription (\ s a -> s{_esddS3BackupDescription = a});

-- | The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix. If the prefix ends with a slash, it appears as a folder in the S3 bucket. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html Amazon S3 Object Name Format> in the /Amazon Kinesis Firehose Developer Guide/ .
esddPrefix :: Lens' ExtendedS3DestinationDescription (Maybe Text)
esddPrefix = lens _esddPrefix (\ s a -> s{_esddPrefix = a});

-- | The CloudWatch logging options for your delivery stream.
esddCloudWatchLoggingOptions :: Lens' ExtendedS3DestinationDescription (Maybe CloudWatchLoggingOptions)
esddCloudWatchLoggingOptions = lens _esddCloudWatchLoggingOptions (\ s a -> s{_esddCloudWatchLoggingOptions = a});

-- | The data processing configuration.
esddProcessingConfiguration :: Lens' ExtendedS3DestinationDescription (Maybe ProcessingConfiguration)
esddProcessingConfiguration = lens _esddProcessingConfiguration (\ s a -> s{_esddProcessingConfiguration = a});

-- | The ARN of the AWS credentials.
esddRoleARN :: Lens' ExtendedS3DestinationDescription Text
esddRoleARN = lens _esddRoleARN (\ s a -> s{_esddRoleARN = a});

-- | The ARN of the S3 bucket.
esddBucketARN :: Lens' ExtendedS3DestinationDescription Text
esddBucketARN = lens _esddBucketARN (\ s a -> s{_esddBucketARN = a});

-- | The buffering option.
esddBufferingHints :: Lens' ExtendedS3DestinationDescription BufferingHints
esddBufferingHints = lens _esddBufferingHints (\ s a -> s{_esddBufferingHints = a});

-- | The compression format. If no value is specified, the default is @UNCOMPRESSED@ .
esddCompressionFormat :: Lens' ExtendedS3DestinationDescription CompressionFormat
esddCompressionFormat = lens _esddCompressionFormat (\ s a -> s{_esddCompressionFormat = a});

-- | The encryption configuration. If no value is specified, the default is no encryption.
esddEncryptionConfiguration :: Lens' ExtendedS3DestinationDescription EncryptionConfiguration
esddEncryptionConfiguration = lens _esddEncryptionConfiguration (\ s a -> s{_esddEncryptionConfiguration = a});

instance FromJSON ExtendedS3DestinationDescription
         where
        parseJSON
          = withObject "ExtendedS3DestinationDescription"
              (\ x ->
                 ExtendedS3DestinationDescription' <$>
                   (x .:? "S3BackupMode") <*>
                     (x .:? "S3BackupDescription")
                     <*> (x .:? "Prefix")
                     <*> (x .:? "CloudWatchLoggingOptions")
                     <*> (x .:? "ProcessingConfiguration")
                     <*> (x .: "RoleARN")
                     <*> (x .: "BucketARN")
                     <*> (x .: "BufferingHints")
                     <*> (x .: "CompressionFormat")
                     <*> (x .: "EncryptionConfiguration"))

instance Hashable ExtendedS3DestinationDescription
         where

instance NFData ExtendedS3DestinationDescription
         where

-- | Describes an update for a destination in Amazon S3.
--
--
--
-- /See:/ 'extendedS3DestinationUpdate' smart constructor.
data ExtendedS3DestinationUpdate = ExtendedS3DestinationUpdate'
  { _esduS3BackupMode :: {-# NOUNPACK #-}!(Maybe S3BackupMode)
  , _esduPrefix :: {-# NOUNPACK #-}!(Maybe Text)
  , _esduCloudWatchLoggingOptions :: {-# NOUNPACK #-}!(Maybe CloudWatchLoggingOptions)
  , _esduS3BackupUpdate :: {-# NOUNPACK #-}!(Maybe S3DestinationUpdate)
  , _esduEncryptionConfiguration :: {-# NOUNPACK #-}!(Maybe EncryptionConfiguration)
  , _esduCompressionFormat :: {-# NOUNPACK #-}!(Maybe CompressionFormat)
  , _esduBufferingHints :: {-# NOUNPACK #-}!(Maybe BufferingHints)
  , _esduBucketARN :: {-# NOUNPACK #-}!(Maybe Text)
  , _esduProcessingConfiguration :: {-# NOUNPACK #-}!(Maybe ProcessingConfiguration)
  , _esduRoleARN :: {-# NOUNPACK #-}!(Maybe Text)
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'ExtendedS3DestinationUpdate' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'esduS3BackupMode' - Enables or disables Amazon S3 backup mode.
--
-- * 'esduPrefix' - The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix. If the prefix ends with a slash, it appears as a folder in the S3 bucket. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html Amazon S3 Object Name Format> in the /Amazon Kinesis Firehose Developer Guide/ .
--
-- * 'esduCloudWatchLoggingOptions' - The CloudWatch logging options for your delivery stream.
--
-- * 'esduS3BackupUpdate' - The Amazon S3 destination for backup.
--
-- * 'esduEncryptionConfiguration' - The encryption configuration. If no value is specified, the default is no encryption.
--
-- * 'esduCompressionFormat' - The compression format. If no value is specified, the default is @UNCOMPRESSED@ .
--
-- * 'esduBufferingHints' - The buffering option.
--
-- * 'esduBucketARN' - The ARN of the S3 bucket.
--
-- * 'esduProcessingConfiguration' - The data processing configuration.
--
-- * 'esduRoleARN' - The ARN of the AWS credentials.
extendedS3DestinationUpdate
    :: ExtendedS3DestinationUpdate
extendedS3DestinationUpdate =
  ExtendedS3DestinationUpdate'
  { _esduS3BackupMode = Nothing
  , _esduPrefix = Nothing
  , _esduCloudWatchLoggingOptions = Nothing
  , _esduS3BackupUpdate = Nothing
  , _esduEncryptionConfiguration = Nothing
  , _esduCompressionFormat = Nothing
  , _esduBufferingHints = Nothing
  , _esduBucketARN = Nothing
  , _esduProcessingConfiguration = Nothing
  , _esduRoleARN = Nothing
  }


-- | Enables or disables Amazon S3 backup mode.
esduS3BackupMode :: Lens' ExtendedS3DestinationUpdate (Maybe S3BackupMode)
esduS3BackupMode = lens _esduS3BackupMode (\ s a -> s{_esduS3BackupMode = a});

-- | The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix. If the prefix ends with a slash, it appears as a folder in the S3 bucket. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html Amazon S3 Object Name Format> in the /Amazon Kinesis Firehose Developer Guide/ .
esduPrefix :: Lens' ExtendedS3DestinationUpdate (Maybe Text)
esduPrefix = lens _esduPrefix (\ s a -> s{_esduPrefix = a});

-- | The CloudWatch logging options for your delivery stream.
esduCloudWatchLoggingOptions :: Lens' ExtendedS3DestinationUpdate (Maybe CloudWatchLoggingOptions)
esduCloudWatchLoggingOptions = lens _esduCloudWatchLoggingOptions (\ s a -> s{_esduCloudWatchLoggingOptions = a});

-- | The Amazon S3 destination for backup.
esduS3BackupUpdate :: Lens' ExtendedS3DestinationUpdate (Maybe S3DestinationUpdate)
esduS3BackupUpdate = lens _esduS3BackupUpdate (\ s a -> s{_esduS3BackupUpdate = a});

-- | The encryption configuration. If no value is specified, the default is no encryption.
esduEncryptionConfiguration :: Lens' ExtendedS3DestinationUpdate (Maybe EncryptionConfiguration)
esduEncryptionConfiguration = lens _esduEncryptionConfiguration (\ s a -> s{_esduEncryptionConfiguration = a});

-- | The compression format. If no value is specified, the default is @UNCOMPRESSED@ .
esduCompressionFormat :: Lens' ExtendedS3DestinationUpdate (Maybe CompressionFormat)
esduCompressionFormat = lens _esduCompressionFormat (\ s a -> s{_esduCompressionFormat = a});

-- | The buffering option.
esduBufferingHints :: Lens' ExtendedS3DestinationUpdate (Maybe BufferingHints)
esduBufferingHints = lens _esduBufferingHints (\ s a -> s{_esduBufferingHints = a});

-- | The ARN of the S3 bucket.
esduBucketARN :: Lens' ExtendedS3DestinationUpdate (Maybe Text)
esduBucketARN = lens _esduBucketARN (\ s a -> s{_esduBucketARN = a});

-- | The data processing configuration.
esduProcessingConfiguration :: Lens' ExtendedS3DestinationUpdate (Maybe ProcessingConfiguration)
esduProcessingConfiguration = lens _esduProcessingConfiguration (\ s a -> s{_esduProcessingConfiguration = a});

-- | The ARN of the AWS credentials.
esduRoleARN :: Lens' ExtendedS3DestinationUpdate (Maybe Text)
esduRoleARN = lens _esduRoleARN (\ s a -> s{_esduRoleARN = a});

instance Hashable ExtendedS3DestinationUpdate where

instance NFData ExtendedS3DestinationUpdate where

instance ToJSON ExtendedS3DestinationUpdate where
        toJSON ExtendedS3DestinationUpdate'{..}
          = object
              (catMaybes
                 [("S3BackupMode" .=) <$> _esduS3BackupMode,
                  ("Prefix" .=) <$> _esduPrefix,
                  ("CloudWatchLoggingOptions" .=) <$>
                    _esduCloudWatchLoggingOptions,
                  ("S3BackupUpdate" .=) <$> _esduS3BackupUpdate,
                  ("EncryptionConfiguration" .=) <$>
                    _esduEncryptionConfiguration,
                  ("CompressionFormat" .=) <$> _esduCompressionFormat,
                  ("BufferingHints" .=) <$> _esduBufferingHints,
                  ("BucketARN" .=) <$> _esduBucketARN,
                  ("ProcessingConfiguration" .=) <$>
                    _esduProcessingConfiguration,
                  ("RoleARN" .=) <$> _esduRoleARN])

-- | Describes an encryption key for a destination in Amazon S3.
--
--
--
-- /See:/ 'kmsEncryptionConfig' smart constructor.
newtype KMSEncryptionConfig = KMSEncryptionConfig'
  { _kecAWSKMSKeyARN :: Text
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'KMSEncryptionConfig' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'kecAWSKMSKeyARN' - The ARN of the encryption key. Must belong to the same region as the destination Amazon S3 bucket.
kmsEncryptionConfig
    :: Text -- ^ 'kecAWSKMSKeyARN'
    -> KMSEncryptionConfig
kmsEncryptionConfig pAWSKMSKeyARN_ =
  KMSEncryptionConfig' {_kecAWSKMSKeyARN = pAWSKMSKeyARN_}


-- | The ARN of the encryption key. Must belong to the same region as the destination Amazon S3 bucket.
kecAWSKMSKeyARN :: Lens' KMSEncryptionConfig Text
kecAWSKMSKeyARN = lens _kecAWSKMSKeyARN (\ s a -> s{_kecAWSKMSKeyARN = a});

instance FromJSON KMSEncryptionConfig where
        parseJSON
          = withObject "KMSEncryptionConfig"
              (\ x ->
                 KMSEncryptionConfig' <$> (x .: "AWSKMSKeyARN"))

instance Hashable KMSEncryptionConfig where

instance NFData KMSEncryptionConfig where

instance ToJSON KMSEncryptionConfig where
        toJSON KMSEncryptionConfig'{..}
          = object
              (catMaybes
                 [Just ("AWSKMSKeyARN" .= _kecAWSKMSKeyARN)])

-- | The stream and role ARNs for a Kinesis stream used as the source for a delivery stream.
--
--
--
-- /See:/ 'kinesisStreamSourceConfiguration' smart constructor.
data KinesisStreamSourceConfiguration = KinesisStreamSourceConfiguration'
  { _ksscKinesisStreamARN :: {-# NOUNPACK #-}!Text
  , _ksscRoleARN          :: {-# NOUNPACK #-}!Text
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'KinesisStreamSourceConfiguration' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ksscKinesisStreamARN' - The ARN of the source Kinesis stream.
--
-- * 'ksscRoleARN' - The ARN of the role that provides access to the source Kinesis stream.
kinesisStreamSourceConfiguration
    :: Text -- ^ 'ksscKinesisStreamARN'
    -> Text -- ^ 'ksscRoleARN'
    -> KinesisStreamSourceConfiguration
kinesisStreamSourceConfiguration pKinesisStreamARN_ pRoleARN_ =
  KinesisStreamSourceConfiguration'
  {_ksscKinesisStreamARN = pKinesisStreamARN_, _ksscRoleARN = pRoleARN_}


-- | The ARN of the source Kinesis stream.
ksscKinesisStreamARN :: Lens' KinesisStreamSourceConfiguration Text
ksscKinesisStreamARN = lens _ksscKinesisStreamARN (\ s a -> s{_ksscKinesisStreamARN = a});

-- | The ARN of the role that provides access to the source Kinesis stream.
ksscRoleARN :: Lens' KinesisStreamSourceConfiguration Text
ksscRoleARN = lens _ksscRoleARN (\ s a -> s{_ksscRoleARN = a});

instance Hashable KinesisStreamSourceConfiguration
         where

instance NFData KinesisStreamSourceConfiguration
         where

instance ToJSON KinesisStreamSourceConfiguration
         where
        toJSON KinesisStreamSourceConfiguration'{..}
          = object
              (catMaybes
                 [Just ("KinesisStreamARN" .= _ksscKinesisStreamARN),
                  Just ("RoleARN" .= _ksscRoleARN)])

-- | Details about a Kinesis stream used as the source for a Kinesis Firehose delivery stream.
--
--
--
-- /See:/ 'kinesisStreamSourceDescription' smart constructor.
data KinesisStreamSourceDescription = KinesisStreamSourceDescription'
  { _kssdDeliveryStartTimestamp :: {-# NOUNPACK #-}!(Maybe POSIX)
  , _kssdKinesisStreamARN       :: {-# NOUNPACK #-}!(Maybe Text)
  , _kssdRoleARN                :: {-# NOUNPACK #-}!(Maybe Text)
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'KinesisStreamSourceDescription' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'kssdDeliveryStartTimestamp' - Kinesis Firehose starts retrieving records from the Kinesis stream starting with this time stamp.
--
-- * 'kssdKinesisStreamARN' - The ARN of the source Kinesis stream.
--
-- * 'kssdRoleARN' - The ARN of the role used by the source Kinesis stream.
kinesisStreamSourceDescription
    :: KinesisStreamSourceDescription
kinesisStreamSourceDescription =
  KinesisStreamSourceDescription'
  { _kssdDeliveryStartTimestamp = Nothing
  , _kssdKinesisStreamARN = Nothing
  , _kssdRoleARN = Nothing
  }


-- | Kinesis Firehose starts retrieving records from the Kinesis stream starting with this time stamp.
kssdDeliveryStartTimestamp :: Lens' KinesisStreamSourceDescription (Maybe UTCTime)
kssdDeliveryStartTimestamp = lens _kssdDeliveryStartTimestamp (\ s a -> s{_kssdDeliveryStartTimestamp = a}) . mapping _Time;

-- | The ARN of the source Kinesis stream.
kssdKinesisStreamARN :: Lens' KinesisStreamSourceDescription (Maybe Text)
kssdKinesisStreamARN = lens _kssdKinesisStreamARN (\ s a -> s{_kssdKinesisStreamARN = a});

-- | The ARN of the role used by the source Kinesis stream.
kssdRoleARN :: Lens' KinesisStreamSourceDescription (Maybe Text)
kssdRoleARN = lens _kssdRoleARN (\ s a -> s{_kssdRoleARN = a});

instance FromJSON KinesisStreamSourceDescription
         where
        parseJSON
          = withObject "KinesisStreamSourceDescription"
              (\ x ->
                 KinesisStreamSourceDescription' <$>
                   (x .:? "DeliveryStartTimestamp") <*>
                     (x .:? "KinesisStreamARN")
                     <*> (x .:? "RoleARN"))

instance Hashable KinesisStreamSourceDescription
         where

instance NFData KinesisStreamSourceDescription where

-- | Describes a data processing configuration.
--
--
--
-- /See:/ 'processingConfiguration' smart constructor.
data ProcessingConfiguration = ProcessingConfiguration'
  { _pcEnabled    :: {-# NOUNPACK #-}!(Maybe Bool)
  , _pcProcessors :: {-# NOUNPACK #-}!(Maybe [Processor])
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'ProcessingConfiguration' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'pcEnabled' - Enables or disables data processing.
--
-- * 'pcProcessors' - The data processors.
processingConfiguration
    :: ProcessingConfiguration
processingConfiguration =
  ProcessingConfiguration' {_pcEnabled = Nothing, _pcProcessors = Nothing}


-- | Enables or disables data processing.
pcEnabled :: Lens' ProcessingConfiguration (Maybe Bool)
pcEnabled = lens _pcEnabled (\ s a -> s{_pcEnabled = a});

-- | The data processors.
pcProcessors :: Lens' ProcessingConfiguration [Processor]
pcProcessors = lens _pcProcessors (\ s a -> s{_pcProcessors = a}) . _Default . _Coerce;

instance FromJSON ProcessingConfiguration where
        parseJSON
          = withObject "ProcessingConfiguration"
              (\ x ->
                 ProcessingConfiguration' <$>
                   (x .:? "Enabled") <*>
                     (x .:? "Processors" .!= mempty))

instance Hashable ProcessingConfiguration where

instance NFData ProcessingConfiguration where

instance ToJSON ProcessingConfiguration where
        toJSON ProcessingConfiguration'{..}
          = object
              (catMaybes
                 [("Enabled" .=) <$> _pcEnabled,
                  ("Processors" .=) <$> _pcProcessors])

-- | Describes a data processor.
--
--
--
-- /See:/ 'processor' smart constructor.
data Processor = Processor'
  { _pParameters :: {-# NOUNPACK #-}!(Maybe [ProcessorParameter])
  , _pType       :: {-# NOUNPACK #-}!ProcessorType
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'Processor' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'pParameters' - The processor parameters.
--
-- * 'pType' - The type of processor.
processor
    :: ProcessorType -- ^ 'pType'
    -> Processor
processor pType_ = Processor' {_pParameters = Nothing, _pType = pType_}


-- | The processor parameters.
pParameters :: Lens' Processor [ProcessorParameter]
pParameters = lens _pParameters (\ s a -> s{_pParameters = a}) . _Default . _Coerce;

-- | The type of processor.
pType :: Lens' Processor ProcessorType
pType = lens _pType (\ s a -> s{_pType = a});

instance FromJSON Processor where
        parseJSON
          = withObject "Processor"
              (\ x ->
                 Processor' <$>
                   (x .:? "Parameters" .!= mempty) <*> (x .: "Type"))

instance Hashable Processor where

instance NFData Processor where

instance ToJSON Processor where
        toJSON Processor'{..}
          = object
              (catMaybes
                 [("Parameters" .=) <$> _pParameters,
                  Just ("Type" .= _pType)])

-- | Describes the processor parameter.
--
--
--
-- /See:/ 'processorParameter' smart constructor.
data ProcessorParameter = ProcessorParameter'
  { _ppParameterName  :: {-# NOUNPACK #-}!ProcessorParameterName
  , _ppParameterValue :: {-# NOUNPACK #-}!Text
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'ProcessorParameter' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ppParameterName' - The name of the parameter.
--
-- * 'ppParameterValue' - The parameter value.
processorParameter
    :: ProcessorParameterName -- ^ 'ppParameterName'
    -> Text -- ^ 'ppParameterValue'
    -> ProcessorParameter
processorParameter pParameterName_ pParameterValue_ =
  ProcessorParameter'
  {_ppParameterName = pParameterName_, _ppParameterValue = pParameterValue_}


-- | The name of the parameter.
ppParameterName :: Lens' ProcessorParameter ProcessorParameterName
ppParameterName = lens _ppParameterName (\ s a -> s{_ppParameterName = a});

-- | The parameter value.
ppParameterValue :: Lens' ProcessorParameter Text
ppParameterValue = lens _ppParameterValue (\ s a -> s{_ppParameterValue = a});

instance FromJSON ProcessorParameter where
        parseJSON
          = withObject "ProcessorParameter"
              (\ x ->
                 ProcessorParameter' <$>
                   (x .: "ParameterName") <*> (x .: "ParameterValue"))

instance Hashable ProcessorParameter where

instance NFData ProcessorParameter where

instance ToJSON ProcessorParameter where
        toJSON ProcessorParameter'{..}
          = object
              (catMaybes
                 [Just ("ParameterName" .= _ppParameterName),
                  Just ("ParameterValue" .= _ppParameterValue)])

-- | Contains the result for an individual record from a 'PutRecordBatch' request. If the record is successfully added to your delivery stream, it receives a record ID. If the record fails to be added to your delivery stream, the result includes an error code and an error message.
--
--
--
-- /See:/ 'putRecordBatchResponseEntry' smart constructor.
data PutRecordBatchResponseEntry = PutRecordBatchResponseEntry'
  { _prbreRecordId     :: {-# NOUNPACK #-}!(Maybe Text)
  , _prbreErrorCode    :: {-# NOUNPACK #-}!(Maybe Text)
  , _prbreErrorMessage :: {-# NOUNPACK #-}!(Maybe Text)
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'PutRecordBatchResponseEntry' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'prbreRecordId' - The ID of the record.
--
-- * 'prbreErrorCode' - The error code for an individual record result.
--
-- * 'prbreErrorMessage' - The error message for an individual record result.
putRecordBatchResponseEntry
    :: PutRecordBatchResponseEntry
putRecordBatchResponseEntry =
  PutRecordBatchResponseEntry'
  { _prbreRecordId = Nothing
  , _prbreErrorCode = Nothing
  , _prbreErrorMessage = Nothing
  }


-- | The ID of the record.
prbreRecordId :: Lens' PutRecordBatchResponseEntry (Maybe Text)
prbreRecordId = lens _prbreRecordId (\ s a -> s{_prbreRecordId = a});

-- | The error code for an individual record result.
prbreErrorCode :: Lens' PutRecordBatchResponseEntry (Maybe Text)
prbreErrorCode = lens _prbreErrorCode (\ s a -> s{_prbreErrorCode = a});

-- | The error message for an individual record result.
prbreErrorMessage :: Lens' PutRecordBatchResponseEntry (Maybe Text)
prbreErrorMessage = lens _prbreErrorMessage (\ s a -> s{_prbreErrorMessage = a});

instance FromJSON PutRecordBatchResponseEntry where
        parseJSON
          = withObject "PutRecordBatchResponseEntry"
              (\ x ->
                 PutRecordBatchResponseEntry' <$>
                   (x .:? "RecordId") <*> (x .:? "ErrorCode") <*>
                     (x .:? "ErrorMessage"))

instance Hashable PutRecordBatchResponseEntry where

instance NFData PutRecordBatchResponseEntry where

-- | The unit of data in a delivery stream.
--
--
--
-- /See:/ 'record' smart constructor.
newtype Record = Record'
  { _rData :: Base64
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'Record' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rData' - The data blob, which is base64-encoded when the blob is serialized. The maximum size of the data blob, before base64-encoding, is 1,000 KB.-- /Note:/ This 'Lens' automatically encodes and decodes Base64 data. The underlying isomorphism will encode to Base64 representation during serialisation, and decode from Base64 representation during deserialisation. This 'Lens' accepts and returns only raw unencoded data.
record
    :: ByteString -- ^ 'rData'
    -> Record
record pData_ = Record' {_rData = _Base64 # pData_}


-- | The data blob, which is base64-encoded when the blob is serialized. The maximum size of the data blob, before base64-encoding, is 1,000 KB.-- /Note:/ This 'Lens' automatically encodes and decodes Base64 data. The underlying isomorphism will encode to Base64 representation during serialisation, and decode from Base64 representation during deserialisation. This 'Lens' accepts and returns only raw unencoded data.
rData :: Lens' Record ByteString
rData = lens _rData (\ s a -> s{_rData = a}) . _Base64;

instance Hashable Record where

instance NFData Record where

instance ToJSON Record where
        toJSON Record'{..}
          = object (catMaybes [Just ("Data" .= _rData)])

-- | Describes the configuration of a destination in Amazon Redshift.
--
--
--
-- /See:/ 'redshiftDestinationConfiguration' smart constructor.
data RedshiftDestinationConfiguration = RedshiftDestinationConfiguration'
  { _rdcS3BackupMode :: {-# NOUNPACK #-}!(Maybe RedshiftS3BackupMode)
  , _rdcCloudWatchLoggingOptions :: {-# NOUNPACK #-}!(Maybe CloudWatchLoggingOptions)
  , _rdcS3BackupConfiguration :: {-# NOUNPACK #-}!(Maybe S3DestinationConfiguration)
  , _rdcRetryOptions :: {-# NOUNPACK #-}!(Maybe RedshiftRetryOptions)
  , _rdcProcessingConfiguration :: {-# NOUNPACK #-}!(Maybe ProcessingConfiguration)
  , _rdcRoleARN :: {-# NOUNPACK #-}!Text
  , _rdcClusterJDBCURL :: {-# NOUNPACK #-}!Text
  , _rdcCopyCommand :: {-# NOUNPACK #-}!CopyCommand
  , _rdcUsername :: {-# NOUNPACK #-}!(Sensitive Text)
  , _rdcPassword :: {-# NOUNPACK #-}!(Sensitive Text)
  , _rdcS3Configuration :: {-# NOUNPACK #-}!S3DestinationConfiguration
  } deriving (Eq, Show, Data, Typeable, Generic)


-- | Creates a value of 'RedshiftDestinationConfiguration' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rdcS3BackupMode' - The Amazon S3 backup mode.
--
-- * 'rdcCloudWatchLoggingOptions' - The CloudWatch logging options for your delivery stream.
--
-- * 'rdcS3BackupConfiguration' - The configuration for backup in Amazon S3.
--
-- * 'rdcRetryOptions' - The retry behavior in case Kinesis Firehose is unable to deliver documents to Amazon Redshift. Default value is 3600 (60 minutes).
--
-- * 'rdcProcessingConfiguration' - The data processing configuration.
--
-- * 'rdcRoleARN' - The ARN of the AWS credentials.
--
-- * 'rdcClusterJDBCURL' - The database connection string.
--
-- * 'rdcCopyCommand' - The @COPY@ command.
--
-- * 'rdcUsername' - The name of the user.
--
-- * 'rdcPassword' - The user password.
--
-- * 'rdcS3Configuration' - The configuration for the intermediate Amazon S3 location from which Amazon Redshift obtains data. Restrictions are described in the topic for 'CreateDeliveryStream' . The compression formats @SNAPPY@ or @ZIP@ cannot be specified in __RedshiftDestinationConfiguration.S3Configuration__ because the Amazon Redshift @COPY@ operation that reads from the S3 bucket doesn't support these compression formats.
redshiftDestinationConfiguration
    :: Text -- ^ 'rdcRoleARN'
    -> Text -- ^ 'rdcClusterJDBCURL'
    -> CopyCommand -- ^ 'rdcCopyCommand'
    -> Text -- ^ 'rdcUsername'
    -> Text -- ^ 'rdcPassword'
    -> S3DestinationConfiguration -- ^ 'rdcS3Configuration'
    -> RedshiftDestinationConfiguration
redshiftDestinationConfiguration pRoleARN_ pClusterJDBCURL_ pCopyCommand_ pUsername_ pPassword_ pS3Configuration_ =
  RedshiftDestinationConfiguration'
  { _rdcS3BackupMode = Nothing
  , _rdcCloudWatchLoggingOptions = Nothing
  , _rdcS3BackupConfiguration = Nothing
  , _rdcRetryOptions = Nothing
  , _rdcProcessingConfiguration = Nothing
  , _rdcRoleARN = pRoleARN_
  , _rdcClusterJDBCURL = pClusterJDBCURL_
  , _rdcCopyCommand = pCopyCommand_
  , _rdcUsername = _Sensitive # pUsername_
  , _rdcPassword = _Sensitive # pPassword_
  , _rdcS3Configuration = pS3Configuration_
  }


-- | The Amazon S3 backup mode.
rdcS3BackupMode :: Lens' RedshiftDestinationConfiguration (Maybe RedshiftS3BackupMode)
rdcS3BackupMode = lens _rdcS3BackupMode (\ s a -> s{_rdcS3BackupMode = a});

-- | The CloudWatch logging options for your delivery stream.
rdcCloudWatchLoggingOptions :: Lens' RedshiftDestinationConfiguration (Maybe CloudWatchLoggingOptions)
rdcCloudWatchLoggingOptions = lens _rdcCloudWatchLoggingOptions (\ s a -> s{_rdcCloudWatchLoggingOptions = a});

-- | The configuration for backup in Amazon S3.
rdcS3BackupConfiguration :: Lens' RedshiftDestinationConfiguration (Maybe S3DestinationConfiguration)
rdcS3BackupConfiguration = lens _rdcS3BackupConfiguration (\ s a -> s{_rdcS3BackupConfiguration = a});

-- | The retry behavior in case Kinesis Firehose is unable to deliver documents to Amazon Redshift. Default value is 3600 (60 minutes).
rdcRetryOptions :: Lens' RedshiftDestinationConfiguration (Maybe RedshiftRetryOptions)
rdcRetryOptions = lens _rdcRetryOptions (\ s a -> s{_rdcRetryOptions = a});

-- | The data processing configuration.
rdcProcessingConfiguration :: Lens' RedshiftDestinationConfiguration (Maybe ProcessingConfiguration)
rdcProcessingConfiguration = lens _rdcProcessingConfiguration (\ s a -> s{_rdcProcessingConfiguration = a});

-- | The ARN of the AWS credentials.
rdcRoleARN :: Lens' RedshiftDestinationConfiguration Text
rdcRoleARN = lens _rdcRoleARN (\ s a -> s{_rdcRoleARN = a});

-- | The database connection string.
rdcClusterJDBCURL :: Lens' RedshiftDestinationConfiguration Text
rdcClusterJDBCURL = lens _rdcClusterJDBCURL (\ s a -> s{_rdcClusterJDBCURL = a});

-- | The @COPY@ command.
rdcCopyCommand :: Lens' RedshiftDestinationConfiguration CopyCommand
rdcCopyCommand = lens _rdcCopyCommand (\ s a -> s{_rdcCopyCommand = a});

-- | The name of the user.
rdcUsername :: Lens' RedshiftDestinationConfiguration Text
rdcUsername = lens _rdcUsername (\ s a -> s{_rdcUsername = a}) . _Sensitive;

-- | The user password.
rdcPassword :: Lens' RedshiftDestinationConfiguration Text
rdcPassword = lens _rdcPassword (\ s a -> s{_rdcPassword = a}) . _Sensitive;

-- | The configuration for the intermediate Amazon S3 location from which Amazon Redshift obtains data. Restrictions are described in the topic for 'CreateDeliveryStream' . The compression formats @SNAPPY@ or @ZIP@ cannot be specified in __RedshiftDestinationConfiguration.S3Configuration__ because the Amazon Redshift @COPY@ operation that reads from the S3 bucket doesn't support these compression formats.
rdcS3Configuration :: Lens' RedshiftDestinationConfiguration S3DestinationConfiguration
rdcS3Configuration = lens _rdcS3Configuration (\ s a -> s{_rdcS3Configuration = a});

instance Hashable RedshiftDestinationConfiguration
         where

instance NFData RedshiftDestinationConfiguration
         where

instance ToJSON RedshiftDestinationConfiguration
         where
        toJSON RedshiftDestinationConfiguration'{..}
          = object
              (catMaybes
                 [("S3BackupMode" .=) <$> _rdcS3BackupMode,
                  ("CloudWatchLoggingOptions" .=) <$>
                    _rdcCloudWatchLoggingOptions,
                  ("S3BackupConfiguration" .=) <$>
                    _rdcS3BackupConfiguration,
                  ("RetryOptions" .=) <$> _rdcRetryOptions,
                  ("ProcessingConfiguration" .=) <$>
                    _rdcProcessingConfiguration,
                  Just ("RoleARN" .= _rdcRoleARN),
                  Just ("ClusterJDBCURL" .= _rdcClusterJDBCURL),
                  Just ("CopyCommand" .= _rdcCopyCommand),
                  Just ("Username" .= _rdcUsername),
                  Just ("Password" .= _rdcPassword),
                  Just ("S3Configuration" .= _rdcS3Configuration)])

-- | Describes a destination in Amazon Redshift.
--
--
--
-- /See:/ 'redshiftDestinationDescription' smart constructor.
data RedshiftDestinationDescription = RedshiftDestinationDescription'
  { _rddS3BackupMode :: {-# NOUNPACK #-}!(Maybe RedshiftS3BackupMode)
  , _rddS3BackupDescription :: {-# NOUNPACK #-}!(Maybe S3DestinationDescription)
  , _rddCloudWatchLoggingOptions :: {-# NOUNPACK #-}!(Maybe CloudWatchLoggingOptions)
  , _rddRetryOptions :: {-# NOUNPACK #-}!(Maybe RedshiftRetryOptions)
  , _rddProcessingConfiguration :: {-# NOUNPACK #-}!(Maybe ProcessingConfiguration)
  , _rddRoleARN :: {-# NOUNPACK #-}!Text
  , _rddClusterJDBCURL :: {-# NOUNPACK #-}!Text
  , _rddCopyCommand :: {-# NOUNPACK #-}!CopyCommand
  , _rddUsername :: {-# NOUNPACK #-}!(Sensitive Text)
  , _rddS3DestinationDescription :: {-# NOUNPACK #-}!S3DestinationDescription
  } deriving (Eq, Show, Data, Typeable, Generic)


-- | Creates a value of 'RedshiftDestinationDescription' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rddS3BackupMode' - The Amazon S3 backup mode.
--
-- * 'rddS3BackupDescription' - The configuration for backup in Amazon S3.
--
-- * 'rddCloudWatchLoggingOptions' - The CloudWatch logging options for your delivery stream.
--
-- * 'rddRetryOptions' - The retry behavior in case Kinesis Firehose is unable to deliver documents to Amazon Redshift. Default value is 3600 (60 minutes).
--
-- * 'rddProcessingConfiguration' - The data processing configuration.
--
-- * 'rddRoleARN' - The ARN of the AWS credentials.
--
-- * 'rddClusterJDBCURL' - The database connection string.
--
-- * 'rddCopyCommand' - The @COPY@ command.
--
-- * 'rddUsername' - The name of the user.
--
-- * 'rddS3DestinationDescription' - The Amazon S3 destination.
redshiftDestinationDescription
    :: Text -- ^ 'rddRoleARN'
    -> Text -- ^ 'rddClusterJDBCURL'
    -> CopyCommand -- ^ 'rddCopyCommand'
    -> Text -- ^ 'rddUsername'
    -> S3DestinationDescription -- ^ 'rddS3DestinationDescription'
    -> RedshiftDestinationDescription
redshiftDestinationDescription pRoleARN_ pClusterJDBCURL_ pCopyCommand_ pUsername_ pS3DestinationDescription_ =
  RedshiftDestinationDescription'
  { _rddS3BackupMode = Nothing
  , _rddS3BackupDescription = Nothing
  , _rddCloudWatchLoggingOptions = Nothing
  , _rddRetryOptions = Nothing
  , _rddProcessingConfiguration = Nothing
  , _rddRoleARN = pRoleARN_
  , _rddClusterJDBCURL = pClusterJDBCURL_
  , _rddCopyCommand = pCopyCommand_
  , _rddUsername = _Sensitive # pUsername_
  , _rddS3DestinationDescription = pS3DestinationDescription_
  }


-- | The Amazon S3 backup mode.
rddS3BackupMode :: Lens' RedshiftDestinationDescription (Maybe RedshiftS3BackupMode)
rddS3BackupMode = lens _rddS3BackupMode (\ s a -> s{_rddS3BackupMode = a});

-- | The configuration for backup in Amazon S3.
rddS3BackupDescription :: Lens' RedshiftDestinationDescription (Maybe S3DestinationDescription)
rddS3BackupDescription = lens _rddS3BackupDescription (\ s a -> s{_rddS3BackupDescription = a});

-- | The CloudWatch logging options for your delivery stream.
rddCloudWatchLoggingOptions :: Lens' RedshiftDestinationDescription (Maybe CloudWatchLoggingOptions)
rddCloudWatchLoggingOptions = lens _rddCloudWatchLoggingOptions (\ s a -> s{_rddCloudWatchLoggingOptions = a});

-- | The retry behavior in case Kinesis Firehose is unable to deliver documents to Amazon Redshift. Default value is 3600 (60 minutes).
rddRetryOptions :: Lens' RedshiftDestinationDescription (Maybe RedshiftRetryOptions)
rddRetryOptions = lens _rddRetryOptions (\ s a -> s{_rddRetryOptions = a});

-- | The data processing configuration.
rddProcessingConfiguration :: Lens' RedshiftDestinationDescription (Maybe ProcessingConfiguration)
rddProcessingConfiguration = lens _rddProcessingConfiguration (\ s a -> s{_rddProcessingConfiguration = a});

-- | The ARN of the AWS credentials.
rddRoleARN :: Lens' RedshiftDestinationDescription Text
rddRoleARN = lens _rddRoleARN (\ s a -> s{_rddRoleARN = a});

-- | The database connection string.
rddClusterJDBCURL :: Lens' RedshiftDestinationDescription Text
rddClusterJDBCURL = lens _rddClusterJDBCURL (\ s a -> s{_rddClusterJDBCURL = a});

-- | The @COPY@ command.
rddCopyCommand :: Lens' RedshiftDestinationDescription CopyCommand
rddCopyCommand = lens _rddCopyCommand (\ s a -> s{_rddCopyCommand = a});

-- | The name of the user.
rddUsername :: Lens' RedshiftDestinationDescription Text
rddUsername = lens _rddUsername (\ s a -> s{_rddUsername = a}) . _Sensitive;

-- | The Amazon S3 destination.
rddS3DestinationDescription :: Lens' RedshiftDestinationDescription S3DestinationDescription
rddS3DestinationDescription = lens _rddS3DestinationDescription (\ s a -> s{_rddS3DestinationDescription = a});

instance FromJSON RedshiftDestinationDescription
         where
        parseJSON
          = withObject "RedshiftDestinationDescription"
              (\ x ->
                 RedshiftDestinationDescription' <$>
                   (x .:? "S3BackupMode") <*>
                     (x .:? "S3BackupDescription")
                     <*> (x .:? "CloudWatchLoggingOptions")
                     <*> (x .:? "RetryOptions")
                     <*> (x .:? "ProcessingConfiguration")
                     <*> (x .: "RoleARN")
                     <*> (x .: "ClusterJDBCURL")
                     <*> (x .: "CopyCommand")
                     <*> (x .: "Username")
                     <*> (x .: "S3DestinationDescription"))

instance Hashable RedshiftDestinationDescription
         where

instance NFData RedshiftDestinationDescription where

-- | Describes an update for a destination in Amazon Redshift.
--
--
--
-- /See:/ 'redshiftDestinationUpdate' smart constructor.
data RedshiftDestinationUpdate = RedshiftDestinationUpdate'
  { _rduS3BackupMode :: {-# NOUNPACK #-}!(Maybe RedshiftS3BackupMode)
  , _rduCloudWatchLoggingOptions :: {-# NOUNPACK #-}!(Maybe CloudWatchLoggingOptions)
  , _rduUsername :: {-# NOUNPACK #-}!(Maybe (Sensitive Text))
  , _rduS3Update :: {-# NOUNPACK #-}!(Maybe S3DestinationUpdate)
  , _rduPassword :: {-# NOUNPACK #-}!(Maybe (Sensitive Text))
  , _rduS3BackupUpdate :: {-# NOUNPACK #-}!(Maybe S3DestinationUpdate)
  , _rduCopyCommand :: {-# NOUNPACK #-}!(Maybe CopyCommand)
  , _rduRetryOptions :: {-# NOUNPACK #-}!(Maybe RedshiftRetryOptions)
  , _rduProcessingConfiguration :: {-# NOUNPACK #-}!(Maybe ProcessingConfiguration)
  , _rduClusterJDBCURL :: {-# NOUNPACK #-}!(Maybe Text)
  , _rduRoleARN :: {-# NOUNPACK #-}!(Maybe Text)
  } deriving (Eq, Show, Data, Typeable, Generic)


-- | Creates a value of 'RedshiftDestinationUpdate' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rduS3BackupMode' - The Amazon S3 backup mode.
--
-- * 'rduCloudWatchLoggingOptions' - The CloudWatch logging options for your delivery stream.
--
-- * 'rduUsername' - The name of the user.
--
-- * 'rduS3Update' - The Amazon S3 destination. The compression formats @SNAPPY@ or @ZIP@ cannot be specified in __RedshiftDestinationUpdate.S3Update__ because the Amazon Redshift @COPY@ operation that reads from the S3 bucket doesn't support these compression formats.
--
-- * 'rduPassword' - The user password.
--
-- * 'rduS3BackupUpdate' - The Amazon S3 destination for backup.
--
-- * 'rduCopyCommand' - The @COPY@ command.
--
-- * 'rduRetryOptions' - The retry behavior in case Kinesis Firehose is unable to deliver documents to Amazon Redshift. Default value is 3600 (60 minutes).
--
-- * 'rduProcessingConfiguration' - The data processing configuration.
--
-- * 'rduClusterJDBCURL' - The database connection string.
--
-- * 'rduRoleARN' - The ARN of the AWS credentials.
redshiftDestinationUpdate
    :: RedshiftDestinationUpdate
redshiftDestinationUpdate =
  RedshiftDestinationUpdate'
  { _rduS3BackupMode = Nothing
  , _rduCloudWatchLoggingOptions = Nothing
  , _rduUsername = Nothing
  , _rduS3Update = Nothing
  , _rduPassword = Nothing
  , _rduS3BackupUpdate = Nothing
  , _rduCopyCommand = Nothing
  , _rduRetryOptions = Nothing
  , _rduProcessingConfiguration = Nothing
  , _rduClusterJDBCURL = Nothing
  , _rduRoleARN = Nothing
  }


-- | The Amazon S3 backup mode.
rduS3BackupMode :: Lens' RedshiftDestinationUpdate (Maybe RedshiftS3BackupMode)
rduS3BackupMode = lens _rduS3BackupMode (\ s a -> s{_rduS3BackupMode = a});

-- | The CloudWatch logging options for your delivery stream.
rduCloudWatchLoggingOptions :: Lens' RedshiftDestinationUpdate (Maybe CloudWatchLoggingOptions)
rduCloudWatchLoggingOptions = lens _rduCloudWatchLoggingOptions (\ s a -> s{_rduCloudWatchLoggingOptions = a});

-- | The name of the user.
rduUsername :: Lens' RedshiftDestinationUpdate (Maybe Text)
rduUsername = lens _rduUsername (\ s a -> s{_rduUsername = a}) . mapping _Sensitive;

-- | The Amazon S3 destination. The compression formats @SNAPPY@ or @ZIP@ cannot be specified in __RedshiftDestinationUpdate.S3Update__ because the Amazon Redshift @COPY@ operation that reads from the S3 bucket doesn't support these compression formats.
rduS3Update :: Lens' RedshiftDestinationUpdate (Maybe S3DestinationUpdate)
rduS3Update = lens _rduS3Update (\ s a -> s{_rduS3Update = a});

-- | The user password.
rduPassword :: Lens' RedshiftDestinationUpdate (Maybe Text)
rduPassword = lens _rduPassword (\ s a -> s{_rduPassword = a}) . mapping _Sensitive;

-- | The Amazon S3 destination for backup.
rduS3BackupUpdate :: Lens' RedshiftDestinationUpdate (Maybe S3DestinationUpdate)
rduS3BackupUpdate = lens _rduS3BackupUpdate (\ s a -> s{_rduS3BackupUpdate = a});

-- | The @COPY@ command.
rduCopyCommand :: Lens' RedshiftDestinationUpdate (Maybe CopyCommand)
rduCopyCommand = lens _rduCopyCommand (\ s a -> s{_rduCopyCommand = a});

-- | The retry behavior in case Kinesis Firehose is unable to deliver documents to Amazon Redshift. Default value is 3600 (60 minutes).
rduRetryOptions :: Lens' RedshiftDestinationUpdate (Maybe RedshiftRetryOptions)
rduRetryOptions = lens _rduRetryOptions (\ s a -> s{_rduRetryOptions = a});

-- | The data processing configuration.
rduProcessingConfiguration :: Lens' RedshiftDestinationUpdate (Maybe ProcessingConfiguration)
rduProcessingConfiguration = lens _rduProcessingConfiguration (\ s a -> s{_rduProcessingConfiguration = a});

-- | The database connection string.
rduClusterJDBCURL :: Lens' RedshiftDestinationUpdate (Maybe Text)
rduClusterJDBCURL = lens _rduClusterJDBCURL (\ s a -> s{_rduClusterJDBCURL = a});

-- | The ARN of the AWS credentials.
rduRoleARN :: Lens' RedshiftDestinationUpdate (Maybe Text)
rduRoleARN = lens _rduRoleARN (\ s a -> s{_rduRoleARN = a});

instance Hashable RedshiftDestinationUpdate where

instance NFData RedshiftDestinationUpdate where

instance ToJSON RedshiftDestinationUpdate where
        toJSON RedshiftDestinationUpdate'{..}
          = object
              (catMaybes
                 [("S3BackupMode" .=) <$> _rduS3BackupMode,
                  ("CloudWatchLoggingOptions" .=) <$>
                    _rduCloudWatchLoggingOptions,
                  ("Username" .=) <$> _rduUsername,
                  ("S3Update" .=) <$> _rduS3Update,
                  ("Password" .=) <$> _rduPassword,
                  ("S3BackupUpdate" .=) <$> _rduS3BackupUpdate,
                  ("CopyCommand" .=) <$> _rduCopyCommand,
                  ("RetryOptions" .=) <$> _rduRetryOptions,
                  ("ProcessingConfiguration" .=) <$>
                    _rduProcessingConfiguration,
                  ("ClusterJDBCURL" .=) <$> _rduClusterJDBCURL,
                  ("RoleARN" .=) <$> _rduRoleARN])

-- | Configures retry behavior in case Kinesis Firehose is unable to deliver documents to Amazon Redshift.
--
--
--
-- /See:/ 'redshiftRetryOptions' smart constructor.
newtype RedshiftRetryOptions = RedshiftRetryOptions'
  { _rroDurationInSeconds :: Maybe Nat
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'RedshiftRetryOptions' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rroDurationInSeconds' - The length of time during which Kinesis Firehose retries delivery after a failure, starting from the initial request and including the first attempt. The default value is 3600 seconds (60 minutes). Kinesis Firehose does not retry if the value of @DurationInSeconds@ is 0 (zero) or if the first delivery attempt takes longer than the current value.
redshiftRetryOptions
    :: RedshiftRetryOptions
redshiftRetryOptions = RedshiftRetryOptions' {_rroDurationInSeconds = Nothing}


-- | The length of time during which Kinesis Firehose retries delivery after a failure, starting from the initial request and including the first attempt. The default value is 3600 seconds (60 minutes). Kinesis Firehose does not retry if the value of @DurationInSeconds@ is 0 (zero) or if the first delivery attempt takes longer than the current value.
rroDurationInSeconds :: Lens' RedshiftRetryOptions (Maybe Natural)
rroDurationInSeconds = lens _rroDurationInSeconds (\ s a -> s{_rroDurationInSeconds = a}) . mapping _Nat;

instance FromJSON RedshiftRetryOptions where
        parseJSON
          = withObject "RedshiftRetryOptions"
              (\ x ->
                 RedshiftRetryOptions' <$>
                   (x .:? "DurationInSeconds"))

instance Hashable RedshiftRetryOptions where

instance NFData RedshiftRetryOptions where

instance ToJSON RedshiftRetryOptions where
        toJSON RedshiftRetryOptions'{..}
          = object
              (catMaybes
                 [("DurationInSeconds" .=) <$> _rroDurationInSeconds])

-- | Describes the configuration of a destination in Amazon S3.
--
--
--
-- /See:/ 's3DestinationConfiguration' smart constructor.
data S3DestinationConfiguration = S3DestinationConfiguration'
  { _sdcPrefix :: {-# NOUNPACK #-}!(Maybe Text)
  , _sdcCloudWatchLoggingOptions :: {-# NOUNPACK #-}!(Maybe CloudWatchLoggingOptions)
  , _sdcEncryptionConfiguration :: {-# NOUNPACK #-}!(Maybe EncryptionConfiguration)
  , _sdcCompressionFormat :: {-# NOUNPACK #-}!(Maybe CompressionFormat)
  , _sdcBufferingHints :: {-# NOUNPACK #-}!(Maybe BufferingHints)
  , _sdcRoleARN :: {-# NOUNPACK #-}!Text
  , _sdcBucketARN :: {-# NOUNPACK #-}!Text
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'S3DestinationConfiguration' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'sdcPrefix' - The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix. If the prefix ends with a slash, it appears as a folder in the S3 bucket. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html Amazon S3 Object Name Format> in the /Amazon Kinesis Firehose Developer Guide/ .
--
-- * 'sdcCloudWatchLoggingOptions' - The CloudWatch logging options for your delivery stream.
--
-- * 'sdcEncryptionConfiguration' - The encryption configuration. If no value is specified, the default is no encryption.
--
-- * 'sdcCompressionFormat' - The compression format. If no value is specified, the default is @UNCOMPRESSED@ . The compression formats @SNAPPY@ or @ZIP@ cannot be specified for Amazon Redshift destinations because they are not supported by the Amazon Redshift @COPY@ operation that reads from the S3 bucket.
--
-- * 'sdcBufferingHints' - The buffering option. If no value is specified, __BufferingHints__ object default values are used.
--
-- * 'sdcRoleARN' - The ARN of the AWS credentials.
--
-- * 'sdcBucketARN' - The ARN of the S3 bucket.
s3DestinationConfiguration
    :: Text -- ^ 'sdcRoleARN'
    -> Text -- ^ 'sdcBucketARN'
    -> S3DestinationConfiguration
s3DestinationConfiguration pRoleARN_ pBucketARN_ =
  S3DestinationConfiguration'
  { _sdcPrefix = Nothing
  , _sdcCloudWatchLoggingOptions = Nothing
  , _sdcEncryptionConfiguration = Nothing
  , _sdcCompressionFormat = Nothing
  , _sdcBufferingHints = Nothing
  , _sdcRoleARN = pRoleARN_
  , _sdcBucketARN = pBucketARN_
  }


-- | The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix. If the prefix ends with a slash, it appears as a folder in the S3 bucket. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html Amazon S3 Object Name Format> in the /Amazon Kinesis Firehose Developer Guide/ .
sdcPrefix :: Lens' S3DestinationConfiguration (Maybe Text)
sdcPrefix = lens _sdcPrefix (\ s a -> s{_sdcPrefix = a});

-- | The CloudWatch logging options for your delivery stream.
sdcCloudWatchLoggingOptions :: Lens' S3DestinationConfiguration (Maybe CloudWatchLoggingOptions)
sdcCloudWatchLoggingOptions = lens _sdcCloudWatchLoggingOptions (\ s a -> s{_sdcCloudWatchLoggingOptions = a});

-- | The encryption configuration. If no value is specified, the default is no encryption.
sdcEncryptionConfiguration :: Lens' S3DestinationConfiguration (Maybe EncryptionConfiguration)
sdcEncryptionConfiguration = lens _sdcEncryptionConfiguration (\ s a -> s{_sdcEncryptionConfiguration = a});

-- | The compression format. If no value is specified, the default is @UNCOMPRESSED@ . The compression formats @SNAPPY@ or @ZIP@ cannot be specified for Amazon Redshift destinations because they are not supported by the Amazon Redshift @COPY@ operation that reads from the S3 bucket.
sdcCompressionFormat :: Lens' S3DestinationConfiguration (Maybe CompressionFormat)
sdcCompressionFormat = lens _sdcCompressionFormat (\ s a -> s{_sdcCompressionFormat = a});

-- | The buffering option. If no value is specified, __BufferingHints__ object default values are used.
sdcBufferingHints :: Lens' S3DestinationConfiguration (Maybe BufferingHints)
sdcBufferingHints = lens _sdcBufferingHints (\ s a -> s{_sdcBufferingHints = a});

-- | The ARN of the AWS credentials.
sdcRoleARN :: Lens' S3DestinationConfiguration Text
sdcRoleARN = lens _sdcRoleARN (\ s a -> s{_sdcRoleARN = a});

-- | The ARN of the S3 bucket.
sdcBucketARN :: Lens' S3DestinationConfiguration Text
sdcBucketARN = lens _sdcBucketARN (\ s a -> s{_sdcBucketARN = a});

instance Hashable S3DestinationConfiguration where

instance NFData S3DestinationConfiguration where

instance ToJSON S3DestinationConfiguration where
        toJSON S3DestinationConfiguration'{..}
          = object
              (catMaybes
                 [("Prefix" .=) <$> _sdcPrefix,
                  ("CloudWatchLoggingOptions" .=) <$>
                    _sdcCloudWatchLoggingOptions,
                  ("EncryptionConfiguration" .=) <$>
                    _sdcEncryptionConfiguration,
                  ("CompressionFormat" .=) <$> _sdcCompressionFormat,
                  ("BufferingHints" .=) <$> _sdcBufferingHints,
                  Just ("RoleARN" .= _sdcRoleARN),
                  Just ("BucketARN" .= _sdcBucketARN)])

-- | Describes a destination in Amazon S3.
--
--
--
-- /See:/ 's3DestinationDescription' smart constructor.
data S3DestinationDescription = S3DestinationDescription'
  { _sddPrefix :: {-# NOUNPACK #-}!(Maybe Text)
  , _sddCloudWatchLoggingOptions :: {-# NOUNPACK #-}!(Maybe CloudWatchLoggingOptions)
  , _sddRoleARN :: {-# NOUNPACK #-}!Text
  , _sddBucketARN :: {-# NOUNPACK #-}!Text
  , _sddBufferingHints :: {-# NOUNPACK #-}!BufferingHints
  , _sddCompressionFormat :: {-# NOUNPACK #-}!CompressionFormat
  , _sddEncryptionConfiguration :: {-# NOUNPACK #-}!EncryptionConfiguration
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'S3DestinationDescription' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'sddPrefix' - The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix. If the prefix ends with a slash, it appears as a folder in the S3 bucket. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html Amazon S3 Object Name Format> in the /Amazon Kinesis Firehose Developer Guide/ .
--
-- * 'sddCloudWatchLoggingOptions' - The CloudWatch logging options for your delivery stream.
--
-- * 'sddRoleARN' - The ARN of the AWS credentials.
--
-- * 'sddBucketARN' - The ARN of the S3 bucket.
--
-- * 'sddBufferingHints' - The buffering option. If no value is specified, __BufferingHints__ object default values are used.
--
-- * 'sddCompressionFormat' - The compression format. If no value is specified, the default is @UNCOMPRESSED@ .
--
-- * 'sddEncryptionConfiguration' - The encryption configuration. If no value is specified, the default is no encryption.
s3DestinationDescription
    :: Text -- ^ 'sddRoleARN'
    -> Text -- ^ 'sddBucketARN'
    -> BufferingHints -- ^ 'sddBufferingHints'
    -> CompressionFormat -- ^ 'sddCompressionFormat'
    -> EncryptionConfiguration -- ^ 'sddEncryptionConfiguration'
    -> S3DestinationDescription
s3DestinationDescription pRoleARN_ pBucketARN_ pBufferingHints_ pCompressionFormat_ pEncryptionConfiguration_ =
  S3DestinationDescription'
  { _sddPrefix = Nothing
  , _sddCloudWatchLoggingOptions = Nothing
  , _sddRoleARN = pRoleARN_
  , _sddBucketARN = pBucketARN_
  , _sddBufferingHints = pBufferingHints_
  , _sddCompressionFormat = pCompressionFormat_
  , _sddEncryptionConfiguration = pEncryptionConfiguration_
  }


-- | The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix. If the prefix ends with a slash, it appears as a folder in the S3 bucket. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html Amazon S3 Object Name Format> in the /Amazon Kinesis Firehose Developer Guide/ .
sddPrefix :: Lens' S3DestinationDescription (Maybe Text)
sddPrefix = lens _sddPrefix (\ s a -> s{_sddPrefix = a});

-- | The CloudWatch logging options for your delivery stream.
sddCloudWatchLoggingOptions :: Lens' S3DestinationDescription (Maybe CloudWatchLoggingOptions)
sddCloudWatchLoggingOptions = lens _sddCloudWatchLoggingOptions (\ s a -> s{_sddCloudWatchLoggingOptions = a});

-- | The ARN of the AWS credentials.
sddRoleARN :: Lens' S3DestinationDescription Text
sddRoleARN = lens _sddRoleARN (\ s a -> s{_sddRoleARN = a});

-- | The ARN of the S3 bucket.
sddBucketARN :: Lens' S3DestinationDescription Text
sddBucketARN = lens _sddBucketARN (\ s a -> s{_sddBucketARN = a});

-- | The buffering option. If no value is specified, __BufferingHints__ object default values are used.
sddBufferingHints :: Lens' S3DestinationDescription BufferingHints
sddBufferingHints = lens _sddBufferingHints (\ s a -> s{_sddBufferingHints = a});

-- | The compression format. If no value is specified, the default is @UNCOMPRESSED@ .
sddCompressionFormat :: Lens' S3DestinationDescription CompressionFormat
sddCompressionFormat = lens _sddCompressionFormat (\ s a -> s{_sddCompressionFormat = a});

-- | The encryption configuration. If no value is specified, the default is no encryption.
sddEncryptionConfiguration :: Lens' S3DestinationDescription EncryptionConfiguration
sddEncryptionConfiguration = lens _sddEncryptionConfiguration (\ s a -> s{_sddEncryptionConfiguration = a});

instance FromJSON S3DestinationDescription where
        parseJSON
          = withObject "S3DestinationDescription"
              (\ x ->
                 S3DestinationDescription' <$>
                   (x .:? "Prefix") <*>
                     (x .:? "CloudWatchLoggingOptions")
                     <*> (x .: "RoleARN")
                     <*> (x .: "BucketARN")
                     <*> (x .: "BufferingHints")
                     <*> (x .: "CompressionFormat")
                     <*> (x .: "EncryptionConfiguration"))

instance Hashable S3DestinationDescription where

instance NFData S3DestinationDescription where

-- | Describes an update for a destination in Amazon S3.
--
--
--
-- /See:/ 's3DestinationUpdate' smart constructor.
data S3DestinationUpdate = S3DestinationUpdate'
  { _sduPrefix :: {-# NOUNPACK #-}!(Maybe Text)
  , _sduCloudWatchLoggingOptions :: {-# NOUNPACK #-}!(Maybe CloudWatchLoggingOptions)
  , _sduEncryptionConfiguration :: {-# NOUNPACK #-}!(Maybe EncryptionConfiguration)
  , _sduCompressionFormat :: {-# NOUNPACK #-}!(Maybe CompressionFormat)
  , _sduBufferingHints :: {-# NOUNPACK #-}!(Maybe BufferingHints)
  , _sduBucketARN :: {-# NOUNPACK #-}!(Maybe Text)
  , _sduRoleARN :: {-# NOUNPACK #-}!(Maybe Text)
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'S3DestinationUpdate' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'sduPrefix' - The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix. If the prefix ends with a slash, it appears as a folder in the S3 bucket. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html Amazon S3 Object Name Format> in the /Amazon Kinesis Firehose Developer Guide/ .
--
-- * 'sduCloudWatchLoggingOptions' - The CloudWatch logging options for your delivery stream.
--
-- * 'sduEncryptionConfiguration' - The encryption configuration. If no value is specified, the default is no encryption.
--
-- * 'sduCompressionFormat' - The compression format. If no value is specified, the default is @UNCOMPRESSED@ . The compression formats @SNAPPY@ or @ZIP@ cannot be specified for Amazon Redshift destinations because they are not supported by the Amazon Redshift @COPY@ operation that reads from the S3 bucket.
--
-- * 'sduBufferingHints' - The buffering option. If no value is specified, __BufferingHints__ object default values are used.
--
-- * 'sduBucketARN' - The ARN of the S3 bucket.
--
-- * 'sduRoleARN' - The ARN of the AWS credentials.
s3DestinationUpdate
    :: S3DestinationUpdate
s3DestinationUpdate =
  S3DestinationUpdate'
  { _sduPrefix = Nothing
  , _sduCloudWatchLoggingOptions = Nothing
  , _sduEncryptionConfiguration = Nothing
  , _sduCompressionFormat = Nothing
  , _sduBufferingHints = Nothing
  , _sduBucketARN = Nothing
  , _sduRoleARN = Nothing
  }


-- | The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix. If the prefix ends with a slash, it appears as a folder in the S3 bucket. For more information, see <http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html Amazon S3 Object Name Format> in the /Amazon Kinesis Firehose Developer Guide/ .
sduPrefix :: Lens' S3DestinationUpdate (Maybe Text)
sduPrefix = lens _sduPrefix (\ s a -> s{_sduPrefix = a});

-- | The CloudWatch logging options for your delivery stream.
sduCloudWatchLoggingOptions :: Lens' S3DestinationUpdate (Maybe CloudWatchLoggingOptions)
sduCloudWatchLoggingOptions = lens _sduCloudWatchLoggingOptions (\ s a -> s{_sduCloudWatchLoggingOptions = a});

-- | The encryption configuration. If no value is specified, the default is no encryption.
sduEncryptionConfiguration :: Lens' S3DestinationUpdate (Maybe EncryptionConfiguration)
sduEncryptionConfiguration = lens _sduEncryptionConfiguration (\ s a -> s{_sduEncryptionConfiguration = a});

-- | The compression format. If no value is specified, the default is @UNCOMPRESSED@ . The compression formats @SNAPPY@ or @ZIP@ cannot be specified for Amazon Redshift destinations because they are not supported by the Amazon Redshift @COPY@ operation that reads from the S3 bucket.
sduCompressionFormat :: Lens' S3DestinationUpdate (Maybe CompressionFormat)
sduCompressionFormat = lens _sduCompressionFormat (\ s a -> s{_sduCompressionFormat = a});

-- | The buffering option. If no value is specified, __BufferingHints__ object default values are used.
sduBufferingHints :: Lens' S3DestinationUpdate (Maybe BufferingHints)
sduBufferingHints = lens _sduBufferingHints (\ s a -> s{_sduBufferingHints = a});

-- | The ARN of the S3 bucket.
sduBucketARN :: Lens' S3DestinationUpdate (Maybe Text)
sduBucketARN = lens _sduBucketARN (\ s a -> s{_sduBucketARN = a});

-- | The ARN of the AWS credentials.
sduRoleARN :: Lens' S3DestinationUpdate (Maybe Text)
sduRoleARN = lens _sduRoleARN (\ s a -> s{_sduRoleARN = a});

instance Hashable S3DestinationUpdate where

instance NFData S3DestinationUpdate where

instance ToJSON S3DestinationUpdate where
        toJSON S3DestinationUpdate'{..}
          = object
              (catMaybes
                 [("Prefix" .=) <$> _sduPrefix,
                  ("CloudWatchLoggingOptions" .=) <$>
                    _sduCloudWatchLoggingOptions,
                  ("EncryptionConfiguration" .=) <$>
                    _sduEncryptionConfiguration,
                  ("CompressionFormat" .=) <$> _sduCompressionFormat,
                  ("BufferingHints" .=) <$> _sduBufferingHints,
                  ("BucketARN" .=) <$> _sduBucketARN,
                  ("RoleARN" .=) <$> _sduRoleARN])

-- | /See:/ 'sessionCredentials' smart constructor.
data SessionCredentials = SessionCredentials'
  { _scAccessKeyId     :: {-# NOUNPACK #-}!Text
  , _scSecretAccessKey :: {-# NOUNPACK #-}!Text
  , _scSessionToken    :: {-# NOUNPACK #-}!Text
  , _scExpiration      :: {-# NOUNPACK #-}!POSIX
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'SessionCredentials' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'scAccessKeyId' - Undocumented member.
--
-- * 'scSecretAccessKey' - Undocumented member.
--
-- * 'scSessionToken' - Undocumented member.
--
-- * 'scExpiration' - Undocumented member.
sessionCredentials
    :: Text -- ^ 'scAccessKeyId'
    -> Text -- ^ 'scSecretAccessKey'
    -> Text -- ^ 'scSessionToken'
    -> UTCTime -- ^ 'scExpiration'
    -> SessionCredentials
sessionCredentials pAccessKeyId_ pSecretAccessKey_ pSessionToken_ pExpiration_ =
  SessionCredentials'
  { _scAccessKeyId = pAccessKeyId_
  , _scSecretAccessKey = pSecretAccessKey_
  , _scSessionToken = pSessionToken_
  , _scExpiration = _Time # pExpiration_
  }


-- | Undocumented member.
scAccessKeyId :: Lens' SessionCredentials Text
scAccessKeyId = lens _scAccessKeyId (\ s a -> s{_scAccessKeyId = a});

-- | Undocumented member.
scSecretAccessKey :: Lens' SessionCredentials Text
scSecretAccessKey = lens _scSecretAccessKey (\ s a -> s{_scSecretAccessKey = a});

-- | Undocumented member.
scSessionToken :: Lens' SessionCredentials Text
scSessionToken = lens _scSessionToken (\ s a -> s{_scSessionToken = a});

-- | Undocumented member.
scExpiration :: Lens' SessionCredentials UTCTime
scExpiration = lens _scExpiration (\ s a -> s{_scExpiration = a}) . _Time;

instance FromJSON SessionCredentials where
        parseJSON
          = withObject "SessionCredentials"
              (\ x ->
                 SessionCredentials' <$>
                   (x .: "AccessKeyId") <*> (x .: "SecretAccessKey") <*>
                     (x .: "SessionToken")
                     <*> (x .: "Expiration"))

instance Hashable SessionCredentials where

instance NFData SessionCredentials where

-- | Details about a Kinesis stream used as the source for a Kinesis Firehose delivery stream.
--
--
--
-- /See:/ 'sourceDescription' smart constructor.
newtype SourceDescription = SourceDescription'
  { _sdKinesisStreamSourceDescription :: Maybe KinesisStreamSourceDescription
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'SourceDescription' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'sdKinesisStreamSourceDescription' - The 'KinesisStreamSourceDescription' value for the source Kinesis stream.
sourceDescription
    :: SourceDescription
sourceDescription =
  SourceDescription' {_sdKinesisStreamSourceDescription = Nothing}


-- | The 'KinesisStreamSourceDescription' value for the source Kinesis stream.
sdKinesisStreamSourceDescription :: Lens' SourceDescription (Maybe KinesisStreamSourceDescription)
sdKinesisStreamSourceDescription = lens _sdKinesisStreamSourceDescription (\ s a -> s{_sdKinesisStreamSourceDescription = a});

instance FromJSON SourceDescription where
        parseJSON
          = withObject "SourceDescription"
              (\ x ->
                 SourceDescription' <$>
                   (x .:? "KinesisStreamSourceDescription"))

instance Hashable SourceDescription where

instance NFData SourceDescription where
