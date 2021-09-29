{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.MQ.CreateBroker
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a broker. Note: This API is asynchronous.
--
-- To create a broker, you must either use the AmazonMQFullAccess IAM
-- policy or include the following EC2 permissions in your IAM policy.
--
-- -   ec2:CreateNetworkInterface
--
--     This permission is required to allow Amazon MQ to create an elastic
--     network interface (ENI) on behalf of your account.
--
-- -   ec2:CreateNetworkInterfacePermission
--
--     This permission is required to attach the ENI to the broker
--     instance.
--
-- -   ec2:DeleteNetworkInterface
--
-- -   ec2:DeleteNetworkInterfacePermission
--
-- -   ec2:DetachNetworkInterface
--
-- -   ec2:DescribeInternetGateways
--
-- -   ec2:DescribeNetworkInterfaces
--
-- -   ec2:DescribeNetworkInterfacePermissions
--
-- -   ec2:DescribeRouteTables
--
-- -   ec2:DescribeSecurityGroups
--
-- -   ec2:DescribeSubnets
--
-- -   ec2:DescribeVpcs
--
-- For more information, see
-- <https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/amazon-mq-setting-up.html#create-iam-user Create an IAM User and Get Your AWS Credentials>
-- and
-- <https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/connecting-to-amazon-mq.html#never-modify-delete-elastic-network-interface Never Modify or Delete the Amazon MQ Elastic Network Interface>
-- in the /Amazon MQ Developer Guide/.
module Network.AWS.MQ.CreateBroker
  ( -- * Creating a Request
    CreateBroker (..),
    newCreateBroker,

    -- * Request Lenses
    createBroker_encryptionOptions,
    createBroker_ldapServerMetadata,
    createBroker_storageType,
    createBroker_authenticationStrategy,
    createBroker_configuration,
    createBroker_creatorRequestId,
    createBroker_subnetIds,
    createBroker_securityGroups,
    createBroker_logs,
    createBroker_maintenanceWindowStartTime,
    createBroker_tags,
    createBroker_engineVersion,
    createBroker_hostInstanceType,
    createBroker_autoMinorVersionUpgrade,
    createBroker_users,
    createBroker_brokerName,
    createBroker_deploymentMode,
    createBroker_engineType,
    createBroker_publiclyAccessible,

    -- * Destructuring the Response
    CreateBrokerResponse (..),
    newCreateBrokerResponse,

    -- * Response Lenses
    createBrokerResponse_brokerId,
    createBrokerResponse_brokerArn,
    createBrokerResponse_httpStatus,
  )
where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import Network.AWS.MQ.Types
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | Creates a broker using the specified properties.
--
-- /See:/ 'newCreateBroker' smart constructor.
data CreateBroker = CreateBroker'
  { -- | Encryption options for the broker. Does not apply to RabbitMQ brokers.
    encryptionOptions :: Prelude.Maybe EncryptionOptions,
    -- | Optional. The metadata of the LDAP server used to authenticate and
    -- authorize connections to the broker. Does not apply to RabbitMQ brokers.
    ldapServerMetadata :: Prelude.Maybe LdapServerMetadataInput,
    -- | The broker\'s storage type.
    storageType :: Prelude.Maybe BrokerStorageType,
    -- | Optional. The authentication strategy used to secure the broker. The
    -- default is SIMPLE.
    authenticationStrategy :: Prelude.Maybe AuthenticationStrategy,
    -- | A list of information about the configuration.
    configuration :: Prelude.Maybe ConfigurationId,
    -- | The unique ID that the requester receives for the created broker. Amazon
    -- MQ passes your ID with the API action. Note: We recommend using a
    -- Universally Unique Identifier (UUID) for the creatorRequestId. You may
    -- omit the creatorRequestId if your application doesn\'t require
    -- idempotency.
    creatorRequestId :: Prelude.Maybe Prelude.Text,
    -- | The list of groups that define which subnets and IP ranges the broker
    -- can use from different Availability Zones. If you specify more than one
    -- subnet, the subnets must be in different Availability Zones. Amazon MQ
    -- will not be able to create VPC endpoints for your broker with multiple
    -- subnets in the same Availability Zone. A SINGLE_INSTANCE deployment
    -- requires one subnet (for example, the default subnet). An
    -- ACTIVE_STANDBY_MULTI_AZ Amazon MQ for ActiveMQ deployment requires two
    -- subnets. A CLUSTER_MULTI_AZ Amazon MQ for RabbitMQ deployment has no
    -- subnet requirements when deployed with public accessibility. Deployment
    -- without public accessibility requires at least one subnet.
    --
    -- If you specify subnets in a
    -- <https://docs.aws.amazon.com/vpc/latest/userguide/vpc-sharing.html shared VPC>
    -- for a RabbitMQ broker, the associated VPC to which the specified subnets
    -- belong must be owned by your AWS account. Amazon MQ will not be able to
    -- create VPC endpoints in VPCs that are not owned by your AWS account.
    subnetIds :: Prelude.Maybe [Prelude.Text],
    -- | The list of rules (1 minimum, 125 maximum) that authorize connections to
    -- brokers.
    securityGroups :: Prelude.Maybe [Prelude.Text],
    -- | Enables Amazon CloudWatch logging for brokers.
    logs :: Prelude.Maybe Logs,
    -- | The parameters that determine the WeeklyStartTime.
    maintenanceWindowStartTime :: Prelude.Maybe WeeklyStartTime,
    -- | Create tags when creating the broker.
    tags :: Prelude.Maybe (Prelude.HashMap Prelude.Text Prelude.Text),
    -- | Required. The broker engine\'s version. For a list of supported engine
    -- versions, see
    -- <https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/broker-engine.html Supported engines>.
    engineVersion :: Prelude.Text,
    -- | Required. The broker\'s instance type.
    hostInstanceType :: Prelude.Text,
    -- | Enables automatic upgrades to new minor versions for brokers, as new
    -- versions are released and supported by Amazon MQ. Automatic upgrades
    -- occur during the scheduled maintenance window of the broker or after a
    -- manual broker reboot. Set to true by default, if no value is specified.
    autoMinorVersionUpgrade :: Prelude.Bool,
    -- | Required. The list of broker users (persons or applications) who can
    -- access queues and topics. This value can contain only alphanumeric
    -- characters, dashes, periods, underscores, and tildes (- . _ ~). This
    -- value must be 2-100 characters long.
    --
    -- Amazon MQ for RabbitMQ
    --
    -- When you create an Amazon MQ for RabbitMQ broker, one and only one
    -- administrative user is accepted and created when a broker is first
    -- provisioned. All subsequent broker users are created by making RabbitMQ
    -- API calls directly to brokers or via the RabbitMQ web console.
    users :: [User],
    -- | Required. The broker\'s name. This value must be unique in your AWS
    -- account, 1-50 characters long, must contain only letters, numbers,
    -- dashes, and underscores, and must not contain white spaces, brackets,
    -- wildcard characters, or special characters.
    brokerName :: Prelude.Text,
    -- | Required. The broker\'s deployment mode.
    deploymentMode :: DeploymentMode,
    -- | Required. The type of broker engine. Currently, Amazon MQ supports
    -- ACTIVEMQ and RABBITMQ.
    engineType :: EngineType,
    -- | Enables connections from applications outside of the VPC that hosts the
    -- broker\'s subnets. Set to false by default, if no value is provided.
    publiclyAccessible :: Prelude.Bool
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'CreateBroker' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'encryptionOptions', 'createBroker_encryptionOptions' - Encryption options for the broker. Does not apply to RabbitMQ brokers.
--
-- 'ldapServerMetadata', 'createBroker_ldapServerMetadata' - Optional. The metadata of the LDAP server used to authenticate and
-- authorize connections to the broker. Does not apply to RabbitMQ brokers.
--
-- 'storageType', 'createBroker_storageType' - The broker\'s storage type.
--
-- 'authenticationStrategy', 'createBroker_authenticationStrategy' - Optional. The authentication strategy used to secure the broker. The
-- default is SIMPLE.
--
-- 'configuration', 'createBroker_configuration' - A list of information about the configuration.
--
-- 'creatorRequestId', 'createBroker_creatorRequestId' - The unique ID that the requester receives for the created broker. Amazon
-- MQ passes your ID with the API action. Note: We recommend using a
-- Universally Unique Identifier (UUID) for the creatorRequestId. You may
-- omit the creatorRequestId if your application doesn\'t require
-- idempotency.
--
-- 'subnetIds', 'createBroker_subnetIds' - The list of groups that define which subnets and IP ranges the broker
-- can use from different Availability Zones. If you specify more than one
-- subnet, the subnets must be in different Availability Zones. Amazon MQ
-- will not be able to create VPC endpoints for your broker with multiple
-- subnets in the same Availability Zone. A SINGLE_INSTANCE deployment
-- requires one subnet (for example, the default subnet). An
-- ACTIVE_STANDBY_MULTI_AZ Amazon MQ for ActiveMQ deployment requires two
-- subnets. A CLUSTER_MULTI_AZ Amazon MQ for RabbitMQ deployment has no
-- subnet requirements when deployed with public accessibility. Deployment
-- without public accessibility requires at least one subnet.
--
-- If you specify subnets in a
-- <https://docs.aws.amazon.com/vpc/latest/userguide/vpc-sharing.html shared VPC>
-- for a RabbitMQ broker, the associated VPC to which the specified subnets
-- belong must be owned by your AWS account. Amazon MQ will not be able to
-- create VPC endpoints in VPCs that are not owned by your AWS account.
--
-- 'securityGroups', 'createBroker_securityGroups' - The list of rules (1 minimum, 125 maximum) that authorize connections to
-- brokers.
--
-- 'logs', 'createBroker_logs' - Enables Amazon CloudWatch logging for brokers.
--
-- 'maintenanceWindowStartTime', 'createBroker_maintenanceWindowStartTime' - The parameters that determine the WeeklyStartTime.
--
-- 'tags', 'createBroker_tags' - Create tags when creating the broker.
--
-- 'engineVersion', 'createBroker_engineVersion' - Required. The broker engine\'s version. For a list of supported engine
-- versions, see
-- <https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/broker-engine.html Supported engines>.
--
-- 'hostInstanceType', 'createBroker_hostInstanceType' - Required. The broker\'s instance type.
--
-- 'autoMinorVersionUpgrade', 'createBroker_autoMinorVersionUpgrade' - Enables automatic upgrades to new minor versions for brokers, as new
-- versions are released and supported by Amazon MQ. Automatic upgrades
-- occur during the scheduled maintenance window of the broker or after a
-- manual broker reboot. Set to true by default, if no value is specified.
--
-- 'users', 'createBroker_users' - Required. The list of broker users (persons or applications) who can
-- access queues and topics. This value can contain only alphanumeric
-- characters, dashes, periods, underscores, and tildes (- . _ ~). This
-- value must be 2-100 characters long.
--
-- Amazon MQ for RabbitMQ
--
-- When you create an Amazon MQ for RabbitMQ broker, one and only one
-- administrative user is accepted and created when a broker is first
-- provisioned. All subsequent broker users are created by making RabbitMQ
-- API calls directly to brokers or via the RabbitMQ web console.
--
-- 'brokerName', 'createBroker_brokerName' - Required. The broker\'s name. This value must be unique in your AWS
-- account, 1-50 characters long, must contain only letters, numbers,
-- dashes, and underscores, and must not contain white spaces, brackets,
-- wildcard characters, or special characters.
--
-- 'deploymentMode', 'createBroker_deploymentMode' - Required. The broker\'s deployment mode.
--
-- 'engineType', 'createBroker_engineType' - Required. The type of broker engine. Currently, Amazon MQ supports
-- ACTIVEMQ and RABBITMQ.
--
-- 'publiclyAccessible', 'createBroker_publiclyAccessible' - Enables connections from applications outside of the VPC that hosts the
-- broker\'s subnets. Set to false by default, if no value is provided.
newCreateBroker ::
  -- | 'engineVersion'
  Prelude.Text ->
  -- | 'hostInstanceType'
  Prelude.Text ->
  -- | 'autoMinorVersionUpgrade'
  Prelude.Bool ->
  -- | 'brokerName'
  Prelude.Text ->
  -- | 'deploymentMode'
  DeploymentMode ->
  -- | 'engineType'
  EngineType ->
  -- | 'publiclyAccessible'
  Prelude.Bool ->
  CreateBroker
newCreateBroker
  pEngineVersion_
  pHostInstanceType_
  pAutoMinorVersionUpgrade_
  pBrokerName_
  pDeploymentMode_
  pEngineType_
  pPubliclyAccessible_ =
    CreateBroker'
      { encryptionOptions = Prelude.Nothing,
        ldapServerMetadata = Prelude.Nothing,
        storageType = Prelude.Nothing,
        authenticationStrategy = Prelude.Nothing,
        configuration = Prelude.Nothing,
        creatorRequestId = Prelude.Nothing,
        subnetIds = Prelude.Nothing,
        securityGroups = Prelude.Nothing,
        logs = Prelude.Nothing,
        maintenanceWindowStartTime = Prelude.Nothing,
        tags = Prelude.Nothing,
        engineVersion = pEngineVersion_,
        hostInstanceType = pHostInstanceType_,
        autoMinorVersionUpgrade = pAutoMinorVersionUpgrade_,
        users = Prelude.mempty,
        brokerName = pBrokerName_,
        deploymentMode = pDeploymentMode_,
        engineType = pEngineType_,
        publiclyAccessible = pPubliclyAccessible_
      }

-- | Encryption options for the broker. Does not apply to RabbitMQ brokers.
createBroker_encryptionOptions :: Lens.Lens' CreateBroker (Prelude.Maybe EncryptionOptions)
createBroker_encryptionOptions = Lens.lens (\CreateBroker' {encryptionOptions} -> encryptionOptions) (\s@CreateBroker' {} a -> s {encryptionOptions = a} :: CreateBroker)

-- | Optional. The metadata of the LDAP server used to authenticate and
-- authorize connections to the broker. Does not apply to RabbitMQ brokers.
createBroker_ldapServerMetadata :: Lens.Lens' CreateBroker (Prelude.Maybe LdapServerMetadataInput)
createBroker_ldapServerMetadata = Lens.lens (\CreateBroker' {ldapServerMetadata} -> ldapServerMetadata) (\s@CreateBroker' {} a -> s {ldapServerMetadata = a} :: CreateBroker)

-- | The broker\'s storage type.
createBroker_storageType :: Lens.Lens' CreateBroker (Prelude.Maybe BrokerStorageType)
createBroker_storageType = Lens.lens (\CreateBroker' {storageType} -> storageType) (\s@CreateBroker' {} a -> s {storageType = a} :: CreateBroker)

-- | Optional. The authentication strategy used to secure the broker. The
-- default is SIMPLE.
createBroker_authenticationStrategy :: Lens.Lens' CreateBroker (Prelude.Maybe AuthenticationStrategy)
createBroker_authenticationStrategy = Lens.lens (\CreateBroker' {authenticationStrategy} -> authenticationStrategy) (\s@CreateBroker' {} a -> s {authenticationStrategy = a} :: CreateBroker)

-- | A list of information about the configuration.
createBroker_configuration :: Lens.Lens' CreateBroker (Prelude.Maybe ConfigurationId)
createBroker_configuration = Lens.lens (\CreateBroker' {configuration} -> configuration) (\s@CreateBroker' {} a -> s {configuration = a} :: CreateBroker)

-- | The unique ID that the requester receives for the created broker. Amazon
-- MQ passes your ID with the API action. Note: We recommend using a
-- Universally Unique Identifier (UUID) for the creatorRequestId. You may
-- omit the creatorRequestId if your application doesn\'t require
-- idempotency.
createBroker_creatorRequestId :: Lens.Lens' CreateBroker (Prelude.Maybe Prelude.Text)
createBroker_creatorRequestId = Lens.lens (\CreateBroker' {creatorRequestId} -> creatorRequestId) (\s@CreateBroker' {} a -> s {creatorRequestId = a} :: CreateBroker)

-- | The list of groups that define which subnets and IP ranges the broker
-- can use from different Availability Zones. If you specify more than one
-- subnet, the subnets must be in different Availability Zones. Amazon MQ
-- will not be able to create VPC endpoints for your broker with multiple
-- subnets in the same Availability Zone. A SINGLE_INSTANCE deployment
-- requires one subnet (for example, the default subnet). An
-- ACTIVE_STANDBY_MULTI_AZ Amazon MQ for ActiveMQ deployment requires two
-- subnets. A CLUSTER_MULTI_AZ Amazon MQ for RabbitMQ deployment has no
-- subnet requirements when deployed with public accessibility. Deployment
-- without public accessibility requires at least one subnet.
--
-- If you specify subnets in a
-- <https://docs.aws.amazon.com/vpc/latest/userguide/vpc-sharing.html shared VPC>
-- for a RabbitMQ broker, the associated VPC to which the specified subnets
-- belong must be owned by your AWS account. Amazon MQ will not be able to
-- create VPC endpoints in VPCs that are not owned by your AWS account.
createBroker_subnetIds :: Lens.Lens' CreateBroker (Prelude.Maybe [Prelude.Text])
createBroker_subnetIds = Lens.lens (\CreateBroker' {subnetIds} -> subnetIds) (\s@CreateBroker' {} a -> s {subnetIds = a} :: CreateBroker) Prelude.. Lens.mapping Lens._Coerce

-- | The list of rules (1 minimum, 125 maximum) that authorize connections to
-- brokers.
createBroker_securityGroups :: Lens.Lens' CreateBroker (Prelude.Maybe [Prelude.Text])
createBroker_securityGroups = Lens.lens (\CreateBroker' {securityGroups} -> securityGroups) (\s@CreateBroker' {} a -> s {securityGroups = a} :: CreateBroker) Prelude.. Lens.mapping Lens._Coerce

-- | Enables Amazon CloudWatch logging for brokers.
createBroker_logs :: Lens.Lens' CreateBroker (Prelude.Maybe Logs)
createBroker_logs = Lens.lens (\CreateBroker' {logs} -> logs) (\s@CreateBroker' {} a -> s {logs = a} :: CreateBroker)

-- | The parameters that determine the WeeklyStartTime.
createBroker_maintenanceWindowStartTime :: Lens.Lens' CreateBroker (Prelude.Maybe WeeklyStartTime)
createBroker_maintenanceWindowStartTime = Lens.lens (\CreateBroker' {maintenanceWindowStartTime} -> maintenanceWindowStartTime) (\s@CreateBroker' {} a -> s {maintenanceWindowStartTime = a} :: CreateBroker)

-- | Create tags when creating the broker.
createBroker_tags :: Lens.Lens' CreateBroker (Prelude.Maybe (Prelude.HashMap Prelude.Text Prelude.Text))
createBroker_tags = Lens.lens (\CreateBroker' {tags} -> tags) (\s@CreateBroker' {} a -> s {tags = a} :: CreateBroker) Prelude.. Lens.mapping Lens._Coerce

-- | Required. The broker engine\'s version. For a list of supported engine
-- versions, see
-- <https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/broker-engine.html Supported engines>.
createBroker_engineVersion :: Lens.Lens' CreateBroker Prelude.Text
createBroker_engineVersion = Lens.lens (\CreateBroker' {engineVersion} -> engineVersion) (\s@CreateBroker' {} a -> s {engineVersion = a} :: CreateBroker)

-- | Required. The broker\'s instance type.
createBroker_hostInstanceType :: Lens.Lens' CreateBroker Prelude.Text
createBroker_hostInstanceType = Lens.lens (\CreateBroker' {hostInstanceType} -> hostInstanceType) (\s@CreateBroker' {} a -> s {hostInstanceType = a} :: CreateBroker)

-- | Enables automatic upgrades to new minor versions for brokers, as new
-- versions are released and supported by Amazon MQ. Automatic upgrades
-- occur during the scheduled maintenance window of the broker or after a
-- manual broker reboot. Set to true by default, if no value is specified.
createBroker_autoMinorVersionUpgrade :: Lens.Lens' CreateBroker Prelude.Bool
createBroker_autoMinorVersionUpgrade = Lens.lens (\CreateBroker' {autoMinorVersionUpgrade} -> autoMinorVersionUpgrade) (\s@CreateBroker' {} a -> s {autoMinorVersionUpgrade = a} :: CreateBroker)

-- | Required. The list of broker users (persons or applications) who can
-- access queues and topics. This value can contain only alphanumeric
-- characters, dashes, periods, underscores, and tildes (- . _ ~). This
-- value must be 2-100 characters long.
--
-- Amazon MQ for RabbitMQ
--
-- When you create an Amazon MQ for RabbitMQ broker, one and only one
-- administrative user is accepted and created when a broker is first
-- provisioned. All subsequent broker users are created by making RabbitMQ
-- API calls directly to brokers or via the RabbitMQ web console.
createBroker_users :: Lens.Lens' CreateBroker [User]
createBroker_users = Lens.lens (\CreateBroker' {users} -> users) (\s@CreateBroker' {} a -> s {users = a} :: CreateBroker) Prelude.. Lens._Coerce

-- | Required. The broker\'s name. This value must be unique in your AWS
-- account, 1-50 characters long, must contain only letters, numbers,
-- dashes, and underscores, and must not contain white spaces, brackets,
-- wildcard characters, or special characters.
createBroker_brokerName :: Lens.Lens' CreateBroker Prelude.Text
createBroker_brokerName = Lens.lens (\CreateBroker' {brokerName} -> brokerName) (\s@CreateBroker' {} a -> s {brokerName = a} :: CreateBroker)

-- | Required. The broker\'s deployment mode.
createBroker_deploymentMode :: Lens.Lens' CreateBroker DeploymentMode
createBroker_deploymentMode = Lens.lens (\CreateBroker' {deploymentMode} -> deploymentMode) (\s@CreateBroker' {} a -> s {deploymentMode = a} :: CreateBroker)

-- | Required. The type of broker engine. Currently, Amazon MQ supports
-- ACTIVEMQ and RABBITMQ.
createBroker_engineType :: Lens.Lens' CreateBroker EngineType
createBroker_engineType = Lens.lens (\CreateBroker' {engineType} -> engineType) (\s@CreateBroker' {} a -> s {engineType = a} :: CreateBroker)

-- | Enables connections from applications outside of the VPC that hosts the
-- broker\'s subnets. Set to false by default, if no value is provided.
createBroker_publiclyAccessible :: Lens.Lens' CreateBroker Prelude.Bool
createBroker_publiclyAccessible = Lens.lens (\CreateBroker' {publiclyAccessible} -> publiclyAccessible) (\s@CreateBroker' {} a -> s {publiclyAccessible = a} :: CreateBroker)

instance Core.AWSRequest CreateBroker where
  type AWSResponse CreateBroker = CreateBrokerResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          CreateBrokerResponse'
            Prelude.<$> (x Core..?> "brokerId")
            Prelude.<*> (x Core..?> "brokerArn")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable CreateBroker

instance Prelude.NFData CreateBroker

instance Core.ToHeaders CreateBroker where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToJSON CreateBroker where
  toJSON CreateBroker' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("encryptionOptions" Core..=)
              Prelude.<$> encryptionOptions,
            ("ldapServerMetadata" Core..=)
              Prelude.<$> ldapServerMetadata,
            ("storageType" Core..=) Prelude.<$> storageType,
            ("authenticationStrategy" Core..=)
              Prelude.<$> authenticationStrategy,
            ("configuration" Core..=) Prelude.<$> configuration,
            ("creatorRequestId" Core..=)
              Prelude.<$> creatorRequestId,
            ("subnetIds" Core..=) Prelude.<$> subnetIds,
            ("securityGroups" Core..=)
              Prelude.<$> securityGroups,
            ("logs" Core..=) Prelude.<$> logs,
            ("maintenanceWindowStartTime" Core..=)
              Prelude.<$> maintenanceWindowStartTime,
            ("tags" Core..=) Prelude.<$> tags,
            Prelude.Just ("engineVersion" Core..= engineVersion),
            Prelude.Just
              ("hostInstanceType" Core..= hostInstanceType),
            Prelude.Just
              ( "autoMinorVersionUpgrade"
                  Core..= autoMinorVersionUpgrade
              ),
            Prelude.Just ("users" Core..= users),
            Prelude.Just ("brokerName" Core..= brokerName),
            Prelude.Just
              ("deploymentMode" Core..= deploymentMode),
            Prelude.Just ("engineType" Core..= engineType),
            Prelude.Just
              ("publiclyAccessible" Core..= publiclyAccessible)
          ]
      )

instance Core.ToPath CreateBroker where
  toPath = Prelude.const "/v1/brokers"

instance Core.ToQuery CreateBroker where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newCreateBrokerResponse' smart constructor.
data CreateBrokerResponse = CreateBrokerResponse'
  { -- | The unique ID that Amazon MQ generates for the broker.
    brokerId :: Prelude.Maybe Prelude.Text,
    -- | The broker\'s Amazon Resource Name (ARN).
    brokerArn :: Prelude.Maybe Prelude.Text,
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'CreateBrokerResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'brokerId', 'createBrokerResponse_brokerId' - The unique ID that Amazon MQ generates for the broker.
--
-- 'brokerArn', 'createBrokerResponse_brokerArn' - The broker\'s Amazon Resource Name (ARN).
--
-- 'httpStatus', 'createBrokerResponse_httpStatus' - The response's http status code.
newCreateBrokerResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  CreateBrokerResponse
newCreateBrokerResponse pHttpStatus_ =
  CreateBrokerResponse'
    { brokerId = Prelude.Nothing,
      brokerArn = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | The unique ID that Amazon MQ generates for the broker.
createBrokerResponse_brokerId :: Lens.Lens' CreateBrokerResponse (Prelude.Maybe Prelude.Text)
createBrokerResponse_brokerId = Lens.lens (\CreateBrokerResponse' {brokerId} -> brokerId) (\s@CreateBrokerResponse' {} a -> s {brokerId = a} :: CreateBrokerResponse)

-- | The broker\'s Amazon Resource Name (ARN).
createBrokerResponse_brokerArn :: Lens.Lens' CreateBrokerResponse (Prelude.Maybe Prelude.Text)
createBrokerResponse_brokerArn = Lens.lens (\CreateBrokerResponse' {brokerArn} -> brokerArn) (\s@CreateBrokerResponse' {} a -> s {brokerArn = a} :: CreateBrokerResponse)

-- | The response's http status code.
createBrokerResponse_httpStatus :: Lens.Lens' CreateBrokerResponse Prelude.Int
createBrokerResponse_httpStatus = Lens.lens (\CreateBrokerResponse' {httpStatus} -> httpStatus) (\s@CreateBrokerResponse' {} a -> s {httpStatus = a} :: CreateBrokerResponse)

instance Prelude.NFData CreateBrokerResponse
