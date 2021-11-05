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
-- Module      : Network.AWS.Braket.CreateQuantumTask
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a quantum task.
module Network.AWS.Braket.CreateQuantumTask
  ( -- * Creating a Request
    CreateQuantumTask (..),
    newCreateQuantumTask,

    -- * Request Lenses
    createQuantumTask_deviceParameters,
    createQuantumTask_tags,
    createQuantumTask_action,
    createQuantumTask_clientToken,
    createQuantumTask_deviceArn,
    createQuantumTask_outputS3Bucket,
    createQuantumTask_outputS3KeyPrefix,
    createQuantumTask_shots,

    -- * Destructuring the Response
    CreateQuantumTaskResponse (..),
    newCreateQuantumTaskResponse,

    -- * Response Lenses
    createQuantumTaskResponse_httpStatus,
    createQuantumTaskResponse_quantumTaskArn,
  )
where

import Network.AWS.Braket.Types
import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newCreateQuantumTask' smart constructor.
data CreateQuantumTask = CreateQuantumTask'
  { -- | The parameters for the device to run the task on.
    deviceParameters :: Prelude.Maybe Prelude.Text,
    -- | Tags to be added to the quantum task you\'re creating.
    tags :: Prelude.Maybe (Prelude.HashMap Prelude.Text Prelude.Text),
    -- | The action associated with the task.
    action :: Prelude.Text,
    -- | The client token associated with the request.
    clientToken :: Prelude.Text,
    -- | The ARN of the device to run the task on.
    deviceArn :: Prelude.Text,
    -- | The S3 bucket to store task result files in.
    outputS3Bucket :: Prelude.Text,
    -- | The key prefix for the location in the S3 bucket to store task results
    -- in.
    outputS3KeyPrefix :: Prelude.Text,
    -- | The number of shots to use for the task.
    shots :: Prelude.Natural
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'CreateQuantumTask' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'deviceParameters', 'createQuantumTask_deviceParameters' - The parameters for the device to run the task on.
--
-- 'tags', 'createQuantumTask_tags' - Tags to be added to the quantum task you\'re creating.
--
-- 'action', 'createQuantumTask_action' - The action associated with the task.
--
-- 'clientToken', 'createQuantumTask_clientToken' - The client token associated with the request.
--
-- 'deviceArn', 'createQuantumTask_deviceArn' - The ARN of the device to run the task on.
--
-- 'outputS3Bucket', 'createQuantumTask_outputS3Bucket' - The S3 bucket to store task result files in.
--
-- 'outputS3KeyPrefix', 'createQuantumTask_outputS3KeyPrefix' - The key prefix for the location in the S3 bucket to store task results
-- in.
--
-- 'shots', 'createQuantumTask_shots' - The number of shots to use for the task.
newCreateQuantumTask ::
  -- | 'action'
  Prelude.Text ->
  -- | 'clientToken'
  Prelude.Text ->
  -- | 'deviceArn'
  Prelude.Text ->
  -- | 'outputS3Bucket'
  Prelude.Text ->
  -- | 'outputS3KeyPrefix'
  Prelude.Text ->
  -- | 'shots'
  Prelude.Natural ->
  CreateQuantumTask
newCreateQuantumTask
  pAction_
  pClientToken_
  pDeviceArn_
  pOutputS3Bucket_
  pOutputS3KeyPrefix_
  pShots_ =
    CreateQuantumTask'
      { deviceParameters =
          Prelude.Nothing,
        tags = Prelude.Nothing,
        action = pAction_,
        clientToken = pClientToken_,
        deviceArn = pDeviceArn_,
        outputS3Bucket = pOutputS3Bucket_,
        outputS3KeyPrefix = pOutputS3KeyPrefix_,
        shots = pShots_
      }

-- | The parameters for the device to run the task on.
createQuantumTask_deviceParameters :: Lens.Lens' CreateQuantumTask (Prelude.Maybe Prelude.Text)
createQuantumTask_deviceParameters = Lens.lens (\CreateQuantumTask' {deviceParameters} -> deviceParameters) (\s@CreateQuantumTask' {} a -> s {deviceParameters = a} :: CreateQuantumTask)

-- | Tags to be added to the quantum task you\'re creating.
createQuantumTask_tags :: Lens.Lens' CreateQuantumTask (Prelude.Maybe (Prelude.HashMap Prelude.Text Prelude.Text))
createQuantumTask_tags = Lens.lens (\CreateQuantumTask' {tags} -> tags) (\s@CreateQuantumTask' {} a -> s {tags = a} :: CreateQuantumTask) Prelude.. Lens.mapping Lens.coerced

-- | The action associated with the task.
createQuantumTask_action :: Lens.Lens' CreateQuantumTask Prelude.Text
createQuantumTask_action = Lens.lens (\CreateQuantumTask' {action} -> action) (\s@CreateQuantumTask' {} a -> s {action = a} :: CreateQuantumTask)

-- | The client token associated with the request.
createQuantumTask_clientToken :: Lens.Lens' CreateQuantumTask Prelude.Text
createQuantumTask_clientToken = Lens.lens (\CreateQuantumTask' {clientToken} -> clientToken) (\s@CreateQuantumTask' {} a -> s {clientToken = a} :: CreateQuantumTask)

-- | The ARN of the device to run the task on.
createQuantumTask_deviceArn :: Lens.Lens' CreateQuantumTask Prelude.Text
createQuantumTask_deviceArn = Lens.lens (\CreateQuantumTask' {deviceArn} -> deviceArn) (\s@CreateQuantumTask' {} a -> s {deviceArn = a} :: CreateQuantumTask)

-- | The S3 bucket to store task result files in.
createQuantumTask_outputS3Bucket :: Lens.Lens' CreateQuantumTask Prelude.Text
createQuantumTask_outputS3Bucket = Lens.lens (\CreateQuantumTask' {outputS3Bucket} -> outputS3Bucket) (\s@CreateQuantumTask' {} a -> s {outputS3Bucket = a} :: CreateQuantumTask)

-- | The key prefix for the location in the S3 bucket to store task results
-- in.
createQuantumTask_outputS3KeyPrefix :: Lens.Lens' CreateQuantumTask Prelude.Text
createQuantumTask_outputS3KeyPrefix = Lens.lens (\CreateQuantumTask' {outputS3KeyPrefix} -> outputS3KeyPrefix) (\s@CreateQuantumTask' {} a -> s {outputS3KeyPrefix = a} :: CreateQuantumTask)

-- | The number of shots to use for the task.
createQuantumTask_shots :: Lens.Lens' CreateQuantumTask Prelude.Natural
createQuantumTask_shots = Lens.lens (\CreateQuantumTask' {shots} -> shots) (\s@CreateQuantumTask' {} a -> s {shots = a} :: CreateQuantumTask)

instance Core.AWSRequest CreateQuantumTask where
  type
    AWSResponse CreateQuantumTask =
      CreateQuantumTaskResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          CreateQuantumTaskResponse'
            Prelude.<$> (Prelude.pure (Prelude.fromEnum s))
            Prelude.<*> (x Core..:> "quantumTaskArn")
      )

instance Prelude.Hashable CreateQuantumTask

instance Prelude.NFData CreateQuantumTask

instance Core.ToHeaders CreateQuantumTask where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToJSON CreateQuantumTask where
  toJSON CreateQuantumTask' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("deviceParameters" Core..=)
              Prelude.<$> deviceParameters,
            ("tags" Core..=) Prelude.<$> tags,
            Prelude.Just ("action" Core..= action),
            Prelude.Just ("clientToken" Core..= clientToken),
            Prelude.Just ("deviceArn" Core..= deviceArn),
            Prelude.Just
              ("outputS3Bucket" Core..= outputS3Bucket),
            Prelude.Just
              ("outputS3KeyPrefix" Core..= outputS3KeyPrefix),
            Prelude.Just ("shots" Core..= shots)
          ]
      )

instance Core.ToPath CreateQuantumTask where
  toPath = Prelude.const "/quantum-task"

instance Core.ToQuery CreateQuantumTask where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newCreateQuantumTaskResponse' smart constructor.
data CreateQuantumTaskResponse = CreateQuantumTaskResponse'
  { -- | The response's http status code.
    httpStatus :: Prelude.Int,
    -- | The ARN of the task created by the request.
    quantumTaskArn :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'CreateQuantumTaskResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'httpStatus', 'createQuantumTaskResponse_httpStatus' - The response's http status code.
--
-- 'quantumTaskArn', 'createQuantumTaskResponse_quantumTaskArn' - The ARN of the task created by the request.
newCreateQuantumTaskResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  -- | 'quantumTaskArn'
  Prelude.Text ->
  CreateQuantumTaskResponse
newCreateQuantumTaskResponse
  pHttpStatus_
  pQuantumTaskArn_ =
    CreateQuantumTaskResponse'
      { httpStatus =
          pHttpStatus_,
        quantumTaskArn = pQuantumTaskArn_
      }

-- | The response's http status code.
createQuantumTaskResponse_httpStatus :: Lens.Lens' CreateQuantumTaskResponse Prelude.Int
createQuantumTaskResponse_httpStatus = Lens.lens (\CreateQuantumTaskResponse' {httpStatus} -> httpStatus) (\s@CreateQuantumTaskResponse' {} a -> s {httpStatus = a} :: CreateQuantumTaskResponse)

-- | The ARN of the task created by the request.
createQuantumTaskResponse_quantumTaskArn :: Lens.Lens' CreateQuantumTaskResponse Prelude.Text
createQuantumTaskResponse_quantumTaskArn = Lens.lens (\CreateQuantumTaskResponse' {quantumTaskArn} -> quantumTaskArn) (\s@CreateQuantumTaskResponse' {} a -> s {quantumTaskArn = a} :: CreateQuantumTaskResponse)

instance Prelude.NFData CreateQuantumTaskResponse
