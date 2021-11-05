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
-- Module      : Network.AWS.VoiceId.StartFraudsterRegistrationJob
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Starts a new batch fraudster registration job using provided details.
module Network.AWS.VoiceId.StartFraudsterRegistrationJob
  ( -- * Creating a Request
    StartFraudsterRegistrationJob (..),
    newStartFraudsterRegistrationJob,

    -- * Request Lenses
    startFraudsterRegistrationJob_clientToken,
    startFraudsterRegistrationJob_jobName,
    startFraudsterRegistrationJob_registrationConfig,
    startFraudsterRegistrationJob_dataAccessRoleArn,
    startFraudsterRegistrationJob_domainId,
    startFraudsterRegistrationJob_inputDataConfig,
    startFraudsterRegistrationJob_outputDataConfig,

    -- * Destructuring the Response
    StartFraudsterRegistrationJobResponse (..),
    newStartFraudsterRegistrationJobResponse,

    -- * Response Lenses
    startFraudsterRegistrationJobResponse_job,
    startFraudsterRegistrationJobResponse_httpStatus,
  )
where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response
import Network.AWS.VoiceId.Types

-- | /See:/ 'newStartFraudsterRegistrationJob' smart constructor.
data StartFraudsterRegistrationJob = StartFraudsterRegistrationJob'
  { -- | The idempotency token for starting a new fraudster registration job. If
    -- not provided, Amazon Web Services SDK populates this field.
    clientToken :: Prelude.Maybe Prelude.Text,
    -- | The name of the new fraudster registration job.
    jobName :: Prelude.Maybe (Core.Sensitive Prelude.Text),
    -- | The registration config containing details such as the action to take
    -- when a duplicate fraudster is detected, and the similarity threshold to
    -- use for detecting a duplicate fraudster.
    registrationConfig :: Prelude.Maybe RegistrationConfig,
    -- | The IAM role Amazon Resource Name (ARN) that grants Voice ID permissions
    -- to access customer\'s buckets to read the input manifest file and write
    -- the Job output file. Refer to the
    -- <https://docs.aws.amazon.com/connect/latest/adminguide/voiceid-fraudster-watchlist.html Create and edit a fraudster watchlist>
    -- documentation for the permissions needed in this role.
    dataAccessRoleArn :: Prelude.Text,
    -- | The identifier of the domain containing the fraudster registration job
    -- and in which the fraudsters are registered.
    domainId :: Prelude.Text,
    -- | The input data config containing an S3 URI for the input manifest file
    -- that contains the list of fraudster registration requests.
    inputDataConfig :: InputDataConfig,
    -- | The output data config containing the S3 location where Voice ID writes
    -- the job output file; you must also include a KMS Key ID to encrypt the
    -- file.
    outputDataConfig :: OutputDataConfig
  }
  deriving (Prelude.Eq, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'StartFraudsterRegistrationJob' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'clientToken', 'startFraudsterRegistrationJob_clientToken' - The idempotency token for starting a new fraudster registration job. If
-- not provided, Amazon Web Services SDK populates this field.
--
-- 'jobName', 'startFraudsterRegistrationJob_jobName' - The name of the new fraudster registration job.
--
-- 'registrationConfig', 'startFraudsterRegistrationJob_registrationConfig' - The registration config containing details such as the action to take
-- when a duplicate fraudster is detected, and the similarity threshold to
-- use for detecting a duplicate fraudster.
--
-- 'dataAccessRoleArn', 'startFraudsterRegistrationJob_dataAccessRoleArn' - The IAM role Amazon Resource Name (ARN) that grants Voice ID permissions
-- to access customer\'s buckets to read the input manifest file and write
-- the Job output file. Refer to the
-- <https://docs.aws.amazon.com/connect/latest/adminguide/voiceid-fraudster-watchlist.html Create and edit a fraudster watchlist>
-- documentation for the permissions needed in this role.
--
-- 'domainId', 'startFraudsterRegistrationJob_domainId' - The identifier of the domain containing the fraudster registration job
-- and in which the fraudsters are registered.
--
-- 'inputDataConfig', 'startFraudsterRegistrationJob_inputDataConfig' - The input data config containing an S3 URI for the input manifest file
-- that contains the list of fraudster registration requests.
--
-- 'outputDataConfig', 'startFraudsterRegistrationJob_outputDataConfig' - The output data config containing the S3 location where Voice ID writes
-- the job output file; you must also include a KMS Key ID to encrypt the
-- file.
newStartFraudsterRegistrationJob ::
  -- | 'dataAccessRoleArn'
  Prelude.Text ->
  -- | 'domainId'
  Prelude.Text ->
  -- | 'inputDataConfig'
  InputDataConfig ->
  -- | 'outputDataConfig'
  OutputDataConfig ->
  StartFraudsterRegistrationJob
newStartFraudsterRegistrationJob
  pDataAccessRoleArn_
  pDomainId_
  pInputDataConfig_
  pOutputDataConfig_ =
    StartFraudsterRegistrationJob'
      { clientToken =
          Prelude.Nothing,
        jobName = Prelude.Nothing,
        registrationConfig = Prelude.Nothing,
        dataAccessRoleArn = pDataAccessRoleArn_,
        domainId = pDomainId_,
        inputDataConfig = pInputDataConfig_,
        outputDataConfig = pOutputDataConfig_
      }

-- | The idempotency token for starting a new fraudster registration job. If
-- not provided, Amazon Web Services SDK populates this field.
startFraudsterRegistrationJob_clientToken :: Lens.Lens' StartFraudsterRegistrationJob (Prelude.Maybe Prelude.Text)
startFraudsterRegistrationJob_clientToken = Lens.lens (\StartFraudsterRegistrationJob' {clientToken} -> clientToken) (\s@StartFraudsterRegistrationJob' {} a -> s {clientToken = a} :: StartFraudsterRegistrationJob)

-- | The name of the new fraudster registration job.
startFraudsterRegistrationJob_jobName :: Lens.Lens' StartFraudsterRegistrationJob (Prelude.Maybe Prelude.Text)
startFraudsterRegistrationJob_jobName = Lens.lens (\StartFraudsterRegistrationJob' {jobName} -> jobName) (\s@StartFraudsterRegistrationJob' {} a -> s {jobName = a} :: StartFraudsterRegistrationJob) Prelude.. Lens.mapping Core._Sensitive

-- | The registration config containing details such as the action to take
-- when a duplicate fraudster is detected, and the similarity threshold to
-- use for detecting a duplicate fraudster.
startFraudsterRegistrationJob_registrationConfig :: Lens.Lens' StartFraudsterRegistrationJob (Prelude.Maybe RegistrationConfig)
startFraudsterRegistrationJob_registrationConfig = Lens.lens (\StartFraudsterRegistrationJob' {registrationConfig} -> registrationConfig) (\s@StartFraudsterRegistrationJob' {} a -> s {registrationConfig = a} :: StartFraudsterRegistrationJob)

-- | The IAM role Amazon Resource Name (ARN) that grants Voice ID permissions
-- to access customer\'s buckets to read the input manifest file and write
-- the Job output file. Refer to the
-- <https://docs.aws.amazon.com/connect/latest/adminguide/voiceid-fraudster-watchlist.html Create and edit a fraudster watchlist>
-- documentation for the permissions needed in this role.
startFraudsterRegistrationJob_dataAccessRoleArn :: Lens.Lens' StartFraudsterRegistrationJob Prelude.Text
startFraudsterRegistrationJob_dataAccessRoleArn = Lens.lens (\StartFraudsterRegistrationJob' {dataAccessRoleArn} -> dataAccessRoleArn) (\s@StartFraudsterRegistrationJob' {} a -> s {dataAccessRoleArn = a} :: StartFraudsterRegistrationJob)

-- | The identifier of the domain containing the fraudster registration job
-- and in which the fraudsters are registered.
startFraudsterRegistrationJob_domainId :: Lens.Lens' StartFraudsterRegistrationJob Prelude.Text
startFraudsterRegistrationJob_domainId = Lens.lens (\StartFraudsterRegistrationJob' {domainId} -> domainId) (\s@StartFraudsterRegistrationJob' {} a -> s {domainId = a} :: StartFraudsterRegistrationJob)

-- | The input data config containing an S3 URI for the input manifest file
-- that contains the list of fraudster registration requests.
startFraudsterRegistrationJob_inputDataConfig :: Lens.Lens' StartFraudsterRegistrationJob InputDataConfig
startFraudsterRegistrationJob_inputDataConfig = Lens.lens (\StartFraudsterRegistrationJob' {inputDataConfig} -> inputDataConfig) (\s@StartFraudsterRegistrationJob' {} a -> s {inputDataConfig = a} :: StartFraudsterRegistrationJob)

-- | The output data config containing the S3 location where Voice ID writes
-- the job output file; you must also include a KMS Key ID to encrypt the
-- file.
startFraudsterRegistrationJob_outputDataConfig :: Lens.Lens' StartFraudsterRegistrationJob OutputDataConfig
startFraudsterRegistrationJob_outputDataConfig = Lens.lens (\StartFraudsterRegistrationJob' {outputDataConfig} -> outputDataConfig) (\s@StartFraudsterRegistrationJob' {} a -> s {outputDataConfig = a} :: StartFraudsterRegistrationJob)

instance
  Core.AWSRequest
    StartFraudsterRegistrationJob
  where
  type
    AWSResponse StartFraudsterRegistrationJob =
      StartFraudsterRegistrationJobResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          StartFraudsterRegistrationJobResponse'
            Prelude.<$> (x Core..?> "Job")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance
  Prelude.Hashable
    StartFraudsterRegistrationJob

instance Prelude.NFData StartFraudsterRegistrationJob

instance Core.ToHeaders StartFraudsterRegistrationJob where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "X-Amz-Target"
              Core.=# ( "VoiceID.StartFraudsterRegistrationJob" ::
                          Prelude.ByteString
                      ),
            "Content-Type"
              Core.=# ( "application/x-amz-json-1.0" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToJSON StartFraudsterRegistrationJob where
  toJSON StartFraudsterRegistrationJob' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("ClientToken" Core..=) Prelude.<$> clientToken,
            ("JobName" Core..=) Prelude.<$> jobName,
            ("RegistrationConfig" Core..=)
              Prelude.<$> registrationConfig,
            Prelude.Just
              ("DataAccessRoleArn" Core..= dataAccessRoleArn),
            Prelude.Just ("DomainId" Core..= domainId),
            Prelude.Just
              ("InputDataConfig" Core..= inputDataConfig),
            Prelude.Just
              ("OutputDataConfig" Core..= outputDataConfig)
          ]
      )

instance Core.ToPath StartFraudsterRegistrationJob where
  toPath = Prelude.const "/"

instance Core.ToQuery StartFraudsterRegistrationJob where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newStartFraudsterRegistrationJobResponse' smart constructor.
data StartFraudsterRegistrationJobResponse = StartFraudsterRegistrationJobResponse'
  { -- | Details about the started fraudster registration job.
    job :: Prelude.Maybe FraudsterRegistrationJob,
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'StartFraudsterRegistrationJobResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'job', 'startFraudsterRegistrationJobResponse_job' - Details about the started fraudster registration job.
--
-- 'httpStatus', 'startFraudsterRegistrationJobResponse_httpStatus' - The response's http status code.
newStartFraudsterRegistrationJobResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  StartFraudsterRegistrationJobResponse
newStartFraudsterRegistrationJobResponse pHttpStatus_ =
  StartFraudsterRegistrationJobResponse'
    { job =
        Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | Details about the started fraudster registration job.
startFraudsterRegistrationJobResponse_job :: Lens.Lens' StartFraudsterRegistrationJobResponse (Prelude.Maybe FraudsterRegistrationJob)
startFraudsterRegistrationJobResponse_job = Lens.lens (\StartFraudsterRegistrationJobResponse' {job} -> job) (\s@StartFraudsterRegistrationJobResponse' {} a -> s {job = a} :: StartFraudsterRegistrationJobResponse)

-- | The response's http status code.
startFraudsterRegistrationJobResponse_httpStatus :: Lens.Lens' StartFraudsterRegistrationJobResponse Prelude.Int
startFraudsterRegistrationJobResponse_httpStatus = Lens.lens (\StartFraudsterRegistrationJobResponse' {httpStatus} -> httpStatus) (\s@StartFraudsterRegistrationJobResponse' {} a -> s {httpStatus = a} :: StartFraudsterRegistrationJobResponse)

instance
  Prelude.NFData
    StartFraudsterRegistrationJobResponse
