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
-- Module      : Network.AWS.Panorama.DescribePackageImportJob
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns information about a package import job.
module Network.AWS.Panorama.DescribePackageImportJob
  ( -- * Creating a Request
    DescribePackageImportJob (..),
    newDescribePackageImportJob,

    -- * Request Lenses
    describePackageImportJob_jobId,

    -- * Destructuring the Response
    DescribePackageImportJobResponse (..),
    newDescribePackageImportJobResponse,

    -- * Response Lenses
    describePackageImportJobResponse_clientToken,
    describePackageImportJobResponse_jobTags,
    describePackageImportJobResponse_httpStatus,
    describePackageImportJobResponse_jobId,
    describePackageImportJobResponse_jobType,
    describePackageImportJobResponse_inputConfig,
    describePackageImportJobResponse_outputConfig,
    describePackageImportJobResponse_output,
    describePackageImportJobResponse_createdTime,
    describePackageImportJobResponse_lastUpdatedTime,
    describePackageImportJobResponse_status,
    describePackageImportJobResponse_statusMessage,
  )
where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import Network.AWS.Panorama.Types
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newDescribePackageImportJob' smart constructor.
data DescribePackageImportJob = DescribePackageImportJob'
  { -- | The job\'s ID.
    jobId :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'DescribePackageImportJob' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'jobId', 'describePackageImportJob_jobId' - The job\'s ID.
newDescribePackageImportJob ::
  -- | 'jobId'
  Prelude.Text ->
  DescribePackageImportJob
newDescribePackageImportJob pJobId_ =
  DescribePackageImportJob' {jobId = pJobId_}

-- | The job\'s ID.
describePackageImportJob_jobId :: Lens.Lens' DescribePackageImportJob Prelude.Text
describePackageImportJob_jobId = Lens.lens (\DescribePackageImportJob' {jobId} -> jobId) (\s@DescribePackageImportJob' {} a -> s {jobId = a} :: DescribePackageImportJob)

instance Core.AWSRequest DescribePackageImportJob where
  type
    AWSResponse DescribePackageImportJob =
      DescribePackageImportJobResponse
  request = Request.get defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          DescribePackageImportJobResponse'
            Prelude.<$> (x Core..?> "ClientToken")
            Prelude.<*> (x Core..?> "JobTags" Core..!@ Prelude.mempty)
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
            Prelude.<*> (x Core..:> "JobId")
            Prelude.<*> (x Core..:> "JobType")
            Prelude.<*> (x Core..:> "InputConfig")
            Prelude.<*> (x Core..:> "OutputConfig")
            Prelude.<*> (x Core..:> "Output")
            Prelude.<*> (x Core..:> "CreatedTime")
            Prelude.<*> (x Core..:> "LastUpdatedTime")
            Prelude.<*> (x Core..:> "Status")
            Prelude.<*> (x Core..:> "StatusMessage")
      )

instance Prelude.Hashable DescribePackageImportJob

instance Prelude.NFData DescribePackageImportJob

instance Core.ToHeaders DescribePackageImportJob where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToPath DescribePackageImportJob where
  toPath DescribePackageImportJob' {..} =
    Prelude.mconcat
      ["/packages/import-jobs/", Core.toBS jobId]

instance Core.ToQuery DescribePackageImportJob where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newDescribePackageImportJobResponse' smart constructor.
data DescribePackageImportJobResponse = DescribePackageImportJobResponse'
  { -- | The job\'s client token.
    clientToken :: Prelude.Maybe Prelude.Text,
    -- | The job\'s tags.
    jobTags :: Prelude.Maybe [JobResourceTags],
    -- | The response's http status code.
    httpStatus :: Prelude.Int,
    -- | The job\'s ID.
    jobId :: Prelude.Text,
    -- | The job\'s type.
    jobType :: PackageImportJobType,
    -- | The job\'s input config.
    inputConfig :: PackageImportJobInputConfig,
    -- | The job\'s output config.
    outputConfig :: PackageImportJobOutputConfig,
    -- | The job\'s output.
    output :: PackageImportJobOutput,
    -- | When the job was created.
    createdTime :: Core.POSIX,
    -- | When the job was updated.
    lastUpdatedTime :: Core.POSIX,
    -- | The job\'s status.
    status :: PackageImportJobStatus,
    -- | The job\'s status message.
    statusMessage :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'DescribePackageImportJobResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'clientToken', 'describePackageImportJobResponse_clientToken' - The job\'s client token.
--
-- 'jobTags', 'describePackageImportJobResponse_jobTags' - The job\'s tags.
--
-- 'httpStatus', 'describePackageImportJobResponse_httpStatus' - The response's http status code.
--
-- 'jobId', 'describePackageImportJobResponse_jobId' - The job\'s ID.
--
-- 'jobType', 'describePackageImportJobResponse_jobType' - The job\'s type.
--
-- 'inputConfig', 'describePackageImportJobResponse_inputConfig' - The job\'s input config.
--
-- 'outputConfig', 'describePackageImportJobResponse_outputConfig' - The job\'s output config.
--
-- 'output', 'describePackageImportJobResponse_output' - The job\'s output.
--
-- 'createdTime', 'describePackageImportJobResponse_createdTime' - When the job was created.
--
-- 'lastUpdatedTime', 'describePackageImportJobResponse_lastUpdatedTime' - When the job was updated.
--
-- 'status', 'describePackageImportJobResponse_status' - The job\'s status.
--
-- 'statusMessage', 'describePackageImportJobResponse_statusMessage' - The job\'s status message.
newDescribePackageImportJobResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  -- | 'jobId'
  Prelude.Text ->
  -- | 'jobType'
  PackageImportJobType ->
  -- | 'inputConfig'
  PackageImportJobInputConfig ->
  -- | 'outputConfig'
  PackageImportJobOutputConfig ->
  -- | 'output'
  PackageImportJobOutput ->
  -- | 'createdTime'
  Prelude.UTCTime ->
  -- | 'lastUpdatedTime'
  Prelude.UTCTime ->
  -- | 'status'
  PackageImportJobStatus ->
  -- | 'statusMessage'
  Prelude.Text ->
  DescribePackageImportJobResponse
newDescribePackageImportJobResponse
  pHttpStatus_
  pJobId_
  pJobType_
  pInputConfig_
  pOutputConfig_
  pOutput_
  pCreatedTime_
  pLastUpdatedTime_
  pStatus_
  pStatusMessage_ =
    DescribePackageImportJobResponse'
      { clientToken =
          Prelude.Nothing,
        jobTags = Prelude.Nothing,
        httpStatus = pHttpStatus_,
        jobId = pJobId_,
        jobType = pJobType_,
        inputConfig = pInputConfig_,
        outputConfig = pOutputConfig_,
        output = pOutput_,
        createdTime =
          Core._Time Lens.# pCreatedTime_,
        lastUpdatedTime =
          Core._Time Lens.# pLastUpdatedTime_,
        status = pStatus_,
        statusMessage = pStatusMessage_
      }

-- | The job\'s client token.
describePackageImportJobResponse_clientToken :: Lens.Lens' DescribePackageImportJobResponse (Prelude.Maybe Prelude.Text)
describePackageImportJobResponse_clientToken = Lens.lens (\DescribePackageImportJobResponse' {clientToken} -> clientToken) (\s@DescribePackageImportJobResponse' {} a -> s {clientToken = a} :: DescribePackageImportJobResponse)

-- | The job\'s tags.
describePackageImportJobResponse_jobTags :: Lens.Lens' DescribePackageImportJobResponse (Prelude.Maybe [JobResourceTags])
describePackageImportJobResponse_jobTags = Lens.lens (\DescribePackageImportJobResponse' {jobTags} -> jobTags) (\s@DescribePackageImportJobResponse' {} a -> s {jobTags = a} :: DescribePackageImportJobResponse) Prelude.. Lens.mapping Lens.coerced

-- | The response's http status code.
describePackageImportJobResponse_httpStatus :: Lens.Lens' DescribePackageImportJobResponse Prelude.Int
describePackageImportJobResponse_httpStatus = Lens.lens (\DescribePackageImportJobResponse' {httpStatus} -> httpStatus) (\s@DescribePackageImportJobResponse' {} a -> s {httpStatus = a} :: DescribePackageImportJobResponse)

-- | The job\'s ID.
describePackageImportJobResponse_jobId :: Lens.Lens' DescribePackageImportJobResponse Prelude.Text
describePackageImportJobResponse_jobId = Lens.lens (\DescribePackageImportJobResponse' {jobId} -> jobId) (\s@DescribePackageImportJobResponse' {} a -> s {jobId = a} :: DescribePackageImportJobResponse)

-- | The job\'s type.
describePackageImportJobResponse_jobType :: Lens.Lens' DescribePackageImportJobResponse PackageImportJobType
describePackageImportJobResponse_jobType = Lens.lens (\DescribePackageImportJobResponse' {jobType} -> jobType) (\s@DescribePackageImportJobResponse' {} a -> s {jobType = a} :: DescribePackageImportJobResponse)

-- | The job\'s input config.
describePackageImportJobResponse_inputConfig :: Lens.Lens' DescribePackageImportJobResponse PackageImportJobInputConfig
describePackageImportJobResponse_inputConfig = Lens.lens (\DescribePackageImportJobResponse' {inputConfig} -> inputConfig) (\s@DescribePackageImportJobResponse' {} a -> s {inputConfig = a} :: DescribePackageImportJobResponse)

-- | The job\'s output config.
describePackageImportJobResponse_outputConfig :: Lens.Lens' DescribePackageImportJobResponse PackageImportJobOutputConfig
describePackageImportJobResponse_outputConfig = Lens.lens (\DescribePackageImportJobResponse' {outputConfig} -> outputConfig) (\s@DescribePackageImportJobResponse' {} a -> s {outputConfig = a} :: DescribePackageImportJobResponse)

-- | The job\'s output.
describePackageImportJobResponse_output :: Lens.Lens' DescribePackageImportJobResponse PackageImportJobOutput
describePackageImportJobResponse_output = Lens.lens (\DescribePackageImportJobResponse' {output} -> output) (\s@DescribePackageImportJobResponse' {} a -> s {output = a} :: DescribePackageImportJobResponse)

-- | When the job was created.
describePackageImportJobResponse_createdTime :: Lens.Lens' DescribePackageImportJobResponse Prelude.UTCTime
describePackageImportJobResponse_createdTime = Lens.lens (\DescribePackageImportJobResponse' {createdTime} -> createdTime) (\s@DescribePackageImportJobResponse' {} a -> s {createdTime = a} :: DescribePackageImportJobResponse) Prelude.. Core._Time

-- | When the job was updated.
describePackageImportJobResponse_lastUpdatedTime :: Lens.Lens' DescribePackageImportJobResponse Prelude.UTCTime
describePackageImportJobResponse_lastUpdatedTime = Lens.lens (\DescribePackageImportJobResponse' {lastUpdatedTime} -> lastUpdatedTime) (\s@DescribePackageImportJobResponse' {} a -> s {lastUpdatedTime = a} :: DescribePackageImportJobResponse) Prelude.. Core._Time

-- | The job\'s status.
describePackageImportJobResponse_status :: Lens.Lens' DescribePackageImportJobResponse PackageImportJobStatus
describePackageImportJobResponse_status = Lens.lens (\DescribePackageImportJobResponse' {status} -> status) (\s@DescribePackageImportJobResponse' {} a -> s {status = a} :: DescribePackageImportJobResponse)

-- | The job\'s status message.
describePackageImportJobResponse_statusMessage :: Lens.Lens' DescribePackageImportJobResponse Prelude.Text
describePackageImportJobResponse_statusMessage = Lens.lens (\DescribePackageImportJobResponse' {statusMessage} -> statusMessage) (\s@DescribePackageImportJobResponse' {} a -> s {statusMessage = a} :: DescribePackageImportJobResponse)

instance
  Prelude.NFData
    DescribePackageImportJobResponse
