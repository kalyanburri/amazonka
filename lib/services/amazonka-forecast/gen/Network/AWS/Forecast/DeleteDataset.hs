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
-- Module      : Network.AWS.Forecast.DeleteDataset
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes an Amazon Forecast dataset that was created using the
-- CreateDataset operation. You can only delete datasets that have a status
-- of @ACTIVE@ or @CREATE_FAILED@. To get the status use the
-- DescribeDataset operation.
--
-- Forecast does not automatically update any dataset groups that contain
-- the deleted dataset. In order to update the dataset group, use the
-- operation, omitting the deleted dataset\'s ARN.
module Network.AWS.Forecast.DeleteDataset
  ( -- * Creating a Request
    DeleteDataset (..),
    newDeleteDataset,

    -- * Request Lenses
    deleteDataset_datasetArn,

    -- * Destructuring the Response
    DeleteDatasetResponse (..),
    newDeleteDatasetResponse,
  )
where

import qualified Network.AWS.Core as Core
import Network.AWS.Forecast.Types
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newDeleteDataset' smart constructor.
data DeleteDataset = DeleteDataset'
  { -- | The Amazon Resource Name (ARN) of the dataset to delete.
    datasetArn :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'DeleteDataset' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'datasetArn', 'deleteDataset_datasetArn' - The Amazon Resource Name (ARN) of the dataset to delete.
newDeleteDataset ::
  -- | 'datasetArn'
  Prelude.Text ->
  DeleteDataset
newDeleteDataset pDatasetArn_ =
  DeleteDataset' {datasetArn = pDatasetArn_}

-- | The Amazon Resource Name (ARN) of the dataset to delete.
deleteDataset_datasetArn :: Lens.Lens' DeleteDataset Prelude.Text
deleteDataset_datasetArn = Lens.lens (\DeleteDataset' {datasetArn} -> datasetArn) (\s@DeleteDataset' {} a -> s {datasetArn = a} :: DeleteDataset)

instance Core.AWSRequest DeleteDataset where
  type
    AWSResponse DeleteDataset =
      DeleteDatasetResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveNull DeleteDatasetResponse'

instance Prelude.Hashable DeleteDataset

instance Prelude.NFData DeleteDataset

instance Core.ToHeaders DeleteDataset where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "X-Amz-Target"
              Core.=# ( "AmazonForecast.DeleteDataset" ::
                          Prelude.ByteString
                      ),
            "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToJSON DeleteDataset where
  toJSON DeleteDataset' {..} =
    Core.object
      ( Prelude.catMaybes
          [Prelude.Just ("DatasetArn" Core..= datasetArn)]
      )

instance Core.ToPath DeleteDataset where
  toPath = Prelude.const "/"

instance Core.ToQuery DeleteDataset where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newDeleteDatasetResponse' smart constructor.
data DeleteDatasetResponse = DeleteDatasetResponse'
  {
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'DeleteDatasetResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
newDeleteDatasetResponse ::
  DeleteDatasetResponse
newDeleteDatasetResponse = DeleteDatasetResponse'

instance Prelude.NFData DeleteDatasetResponse
