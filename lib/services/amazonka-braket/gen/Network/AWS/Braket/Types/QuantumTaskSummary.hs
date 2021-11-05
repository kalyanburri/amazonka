{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Braket.Types.QuantumTaskSummary
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.Braket.Types.QuantumTaskSummary where

import Network.AWS.Braket.Types.QuantumTaskStatus
import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude

-- | Includes information about a quantum task.
--
-- /See:/ 'newQuantumTaskSummary' smart constructor.
data QuantumTaskSummary = QuantumTaskSummary'
  { -- | The time at which the task finished.
    endedAt :: Prelude.Maybe Core.POSIX,
    -- | Displays the key, value pairs of tags associated with this quantum task.
    tags :: Prelude.Maybe (Prelude.HashMap Prelude.Text Prelude.Text),
    -- | The time at which the task was created.
    createdAt :: Core.POSIX,
    -- | The ARN of the device the task ran on.
    deviceArn :: Prelude.Text,
    -- | The S3 bucket where the task result file is stored..
    outputS3Bucket :: Prelude.Text,
    -- | The folder in the S3 bucket where the task result file is stored.
    outputS3Directory :: Prelude.Text,
    -- | The ARN of the task.
    quantumTaskArn :: Prelude.Text,
    -- | The shots used for the task.
    shots :: Prelude.Integer,
    -- | The status of the task.
    status :: QuantumTaskStatus
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'QuantumTaskSummary' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'endedAt', 'quantumTaskSummary_endedAt' - The time at which the task finished.
--
-- 'tags', 'quantumTaskSummary_tags' - Displays the key, value pairs of tags associated with this quantum task.
--
-- 'createdAt', 'quantumTaskSummary_createdAt' - The time at which the task was created.
--
-- 'deviceArn', 'quantumTaskSummary_deviceArn' - The ARN of the device the task ran on.
--
-- 'outputS3Bucket', 'quantumTaskSummary_outputS3Bucket' - The S3 bucket where the task result file is stored..
--
-- 'outputS3Directory', 'quantumTaskSummary_outputS3Directory' - The folder in the S3 bucket where the task result file is stored.
--
-- 'quantumTaskArn', 'quantumTaskSummary_quantumTaskArn' - The ARN of the task.
--
-- 'shots', 'quantumTaskSummary_shots' - The shots used for the task.
--
-- 'status', 'quantumTaskSummary_status' - The status of the task.
newQuantumTaskSummary ::
  -- | 'createdAt'
  Prelude.UTCTime ->
  -- | 'deviceArn'
  Prelude.Text ->
  -- | 'outputS3Bucket'
  Prelude.Text ->
  -- | 'outputS3Directory'
  Prelude.Text ->
  -- | 'quantumTaskArn'
  Prelude.Text ->
  -- | 'shots'
  Prelude.Integer ->
  -- | 'status'
  QuantumTaskStatus ->
  QuantumTaskSummary
newQuantumTaskSummary
  pCreatedAt_
  pDeviceArn_
  pOutputS3Bucket_
  pOutputS3Directory_
  pQuantumTaskArn_
  pShots_
  pStatus_ =
    QuantumTaskSummary'
      { endedAt = Prelude.Nothing,
        tags = Prelude.Nothing,
        createdAt = Core._Time Lens.# pCreatedAt_,
        deviceArn = pDeviceArn_,
        outputS3Bucket = pOutputS3Bucket_,
        outputS3Directory = pOutputS3Directory_,
        quantumTaskArn = pQuantumTaskArn_,
        shots = pShots_,
        status = pStatus_
      }

-- | The time at which the task finished.
quantumTaskSummary_endedAt :: Lens.Lens' QuantumTaskSummary (Prelude.Maybe Prelude.UTCTime)
quantumTaskSummary_endedAt = Lens.lens (\QuantumTaskSummary' {endedAt} -> endedAt) (\s@QuantumTaskSummary' {} a -> s {endedAt = a} :: QuantumTaskSummary) Prelude.. Lens.mapping Core._Time

-- | Displays the key, value pairs of tags associated with this quantum task.
quantumTaskSummary_tags :: Lens.Lens' QuantumTaskSummary (Prelude.Maybe (Prelude.HashMap Prelude.Text Prelude.Text))
quantumTaskSummary_tags = Lens.lens (\QuantumTaskSummary' {tags} -> tags) (\s@QuantumTaskSummary' {} a -> s {tags = a} :: QuantumTaskSummary) Prelude.. Lens.mapping Lens.coerced

-- | The time at which the task was created.
quantumTaskSummary_createdAt :: Lens.Lens' QuantumTaskSummary Prelude.UTCTime
quantumTaskSummary_createdAt = Lens.lens (\QuantumTaskSummary' {createdAt} -> createdAt) (\s@QuantumTaskSummary' {} a -> s {createdAt = a} :: QuantumTaskSummary) Prelude.. Core._Time

-- | The ARN of the device the task ran on.
quantumTaskSummary_deviceArn :: Lens.Lens' QuantumTaskSummary Prelude.Text
quantumTaskSummary_deviceArn = Lens.lens (\QuantumTaskSummary' {deviceArn} -> deviceArn) (\s@QuantumTaskSummary' {} a -> s {deviceArn = a} :: QuantumTaskSummary)

-- | The S3 bucket where the task result file is stored..
quantumTaskSummary_outputS3Bucket :: Lens.Lens' QuantumTaskSummary Prelude.Text
quantumTaskSummary_outputS3Bucket = Lens.lens (\QuantumTaskSummary' {outputS3Bucket} -> outputS3Bucket) (\s@QuantumTaskSummary' {} a -> s {outputS3Bucket = a} :: QuantumTaskSummary)

-- | The folder in the S3 bucket where the task result file is stored.
quantumTaskSummary_outputS3Directory :: Lens.Lens' QuantumTaskSummary Prelude.Text
quantumTaskSummary_outputS3Directory = Lens.lens (\QuantumTaskSummary' {outputS3Directory} -> outputS3Directory) (\s@QuantumTaskSummary' {} a -> s {outputS3Directory = a} :: QuantumTaskSummary)

-- | The ARN of the task.
quantumTaskSummary_quantumTaskArn :: Lens.Lens' QuantumTaskSummary Prelude.Text
quantumTaskSummary_quantumTaskArn = Lens.lens (\QuantumTaskSummary' {quantumTaskArn} -> quantumTaskArn) (\s@QuantumTaskSummary' {} a -> s {quantumTaskArn = a} :: QuantumTaskSummary)

-- | The shots used for the task.
quantumTaskSummary_shots :: Lens.Lens' QuantumTaskSummary Prelude.Integer
quantumTaskSummary_shots = Lens.lens (\QuantumTaskSummary' {shots} -> shots) (\s@QuantumTaskSummary' {} a -> s {shots = a} :: QuantumTaskSummary)

-- | The status of the task.
quantumTaskSummary_status :: Lens.Lens' QuantumTaskSummary QuantumTaskStatus
quantumTaskSummary_status = Lens.lens (\QuantumTaskSummary' {status} -> status) (\s@QuantumTaskSummary' {} a -> s {status = a} :: QuantumTaskSummary)

instance Core.FromJSON QuantumTaskSummary where
  parseJSON =
    Core.withObject
      "QuantumTaskSummary"
      ( \x ->
          QuantumTaskSummary'
            Prelude.<$> (x Core..:? "endedAt")
            Prelude.<*> (x Core..:? "tags" Core..!= Prelude.mempty)
            Prelude.<*> (x Core..: "createdAt")
            Prelude.<*> (x Core..: "deviceArn")
            Prelude.<*> (x Core..: "outputS3Bucket")
            Prelude.<*> (x Core..: "outputS3Directory")
            Prelude.<*> (x Core..: "quantumTaskArn")
            Prelude.<*> (x Core..: "shots")
            Prelude.<*> (x Core..: "status")
      )

instance Prelude.Hashable QuantumTaskSummary

instance Prelude.NFData QuantumTaskSummary
