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
-- Module      : Amazonka.Redshift.Types.ReservedNodeExchangeStatus
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.Redshift.Types.ReservedNodeExchangeStatus where

import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude
import Amazonka.Redshift.Internal
import Amazonka.Redshift.Types.ReservedNodeExchangeStatusType

-- | Reserved-node status details, such as the source reserved-node
-- identifier, the target reserved-node identifier, the node type, the node
-- count, and other details.
--
-- /See:/ 'newReservedNodeExchangeStatus' smart constructor.
data ReservedNodeExchangeStatus = ReservedNodeExchangeStatus'
  { -- | The count of target reserved nodes in the cluster.
    targetReservedNodeCount :: Prelude.Maybe Prelude.Int,
    -- | The node type of the target reserved node, for example ra3.4xlarge.
    targetReservedNodeType :: Prelude.Maybe Prelude.Text,
    -- | The identifier of the reserved-node exchange request.
    reservedNodeExchangeRequestId :: Prelude.Maybe Prelude.Text,
    -- | A date and time that indicate when the reserved-node exchange was
    -- requested.
    requestTime :: Prelude.Maybe Core.ISO8601,
    -- | The status of the reserved-node exchange request. Statuses include
    -- in-progress and requested.
    status :: Prelude.Maybe ReservedNodeExchangeStatusType,
    -- | The identifier of the source reserved node.
    sourceReservedNodeId :: Prelude.Maybe Prelude.Text,
    -- | The identifier of the target reserved node offering.
    targetReservedNodeOfferingId :: Prelude.Maybe Prelude.Text,
    -- | The source reserved-node count in the cluster.
    sourceReservedNodeCount :: Prelude.Maybe Prelude.Int,
    -- | The source reserved-node type, for example ds2.xlarge.
    sourceReservedNodeType :: Prelude.Maybe Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ReservedNodeExchangeStatus' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'targetReservedNodeCount', 'reservedNodeExchangeStatus_targetReservedNodeCount' - The count of target reserved nodes in the cluster.
--
-- 'targetReservedNodeType', 'reservedNodeExchangeStatus_targetReservedNodeType' - The node type of the target reserved node, for example ra3.4xlarge.
--
-- 'reservedNodeExchangeRequestId', 'reservedNodeExchangeStatus_reservedNodeExchangeRequestId' - The identifier of the reserved-node exchange request.
--
-- 'requestTime', 'reservedNodeExchangeStatus_requestTime' - A date and time that indicate when the reserved-node exchange was
-- requested.
--
-- 'status', 'reservedNodeExchangeStatus_status' - The status of the reserved-node exchange request. Statuses include
-- in-progress and requested.
--
-- 'sourceReservedNodeId', 'reservedNodeExchangeStatus_sourceReservedNodeId' - The identifier of the source reserved node.
--
-- 'targetReservedNodeOfferingId', 'reservedNodeExchangeStatus_targetReservedNodeOfferingId' - The identifier of the target reserved node offering.
--
-- 'sourceReservedNodeCount', 'reservedNodeExchangeStatus_sourceReservedNodeCount' - The source reserved-node count in the cluster.
--
-- 'sourceReservedNodeType', 'reservedNodeExchangeStatus_sourceReservedNodeType' - The source reserved-node type, for example ds2.xlarge.
newReservedNodeExchangeStatus ::
  ReservedNodeExchangeStatus
newReservedNodeExchangeStatus =
  ReservedNodeExchangeStatus'
    { targetReservedNodeCount =
        Prelude.Nothing,
      targetReservedNodeType = Prelude.Nothing,
      reservedNodeExchangeRequestId = Prelude.Nothing,
      requestTime = Prelude.Nothing,
      status = Prelude.Nothing,
      sourceReservedNodeId = Prelude.Nothing,
      targetReservedNodeOfferingId = Prelude.Nothing,
      sourceReservedNodeCount = Prelude.Nothing,
      sourceReservedNodeType = Prelude.Nothing
    }

-- | The count of target reserved nodes in the cluster.
reservedNodeExchangeStatus_targetReservedNodeCount :: Lens.Lens' ReservedNodeExchangeStatus (Prelude.Maybe Prelude.Int)
reservedNodeExchangeStatus_targetReservedNodeCount = Lens.lens (\ReservedNodeExchangeStatus' {targetReservedNodeCount} -> targetReservedNodeCount) (\s@ReservedNodeExchangeStatus' {} a -> s {targetReservedNodeCount = a} :: ReservedNodeExchangeStatus)

-- | The node type of the target reserved node, for example ra3.4xlarge.
reservedNodeExchangeStatus_targetReservedNodeType :: Lens.Lens' ReservedNodeExchangeStatus (Prelude.Maybe Prelude.Text)
reservedNodeExchangeStatus_targetReservedNodeType = Lens.lens (\ReservedNodeExchangeStatus' {targetReservedNodeType} -> targetReservedNodeType) (\s@ReservedNodeExchangeStatus' {} a -> s {targetReservedNodeType = a} :: ReservedNodeExchangeStatus)

-- | The identifier of the reserved-node exchange request.
reservedNodeExchangeStatus_reservedNodeExchangeRequestId :: Lens.Lens' ReservedNodeExchangeStatus (Prelude.Maybe Prelude.Text)
reservedNodeExchangeStatus_reservedNodeExchangeRequestId = Lens.lens (\ReservedNodeExchangeStatus' {reservedNodeExchangeRequestId} -> reservedNodeExchangeRequestId) (\s@ReservedNodeExchangeStatus' {} a -> s {reservedNodeExchangeRequestId = a} :: ReservedNodeExchangeStatus)

-- | A date and time that indicate when the reserved-node exchange was
-- requested.
reservedNodeExchangeStatus_requestTime :: Lens.Lens' ReservedNodeExchangeStatus (Prelude.Maybe Prelude.UTCTime)
reservedNodeExchangeStatus_requestTime = Lens.lens (\ReservedNodeExchangeStatus' {requestTime} -> requestTime) (\s@ReservedNodeExchangeStatus' {} a -> s {requestTime = a} :: ReservedNodeExchangeStatus) Prelude.. Lens.mapping Core._Time

-- | The status of the reserved-node exchange request. Statuses include
-- in-progress and requested.
reservedNodeExchangeStatus_status :: Lens.Lens' ReservedNodeExchangeStatus (Prelude.Maybe ReservedNodeExchangeStatusType)
reservedNodeExchangeStatus_status = Lens.lens (\ReservedNodeExchangeStatus' {status} -> status) (\s@ReservedNodeExchangeStatus' {} a -> s {status = a} :: ReservedNodeExchangeStatus)

-- | The identifier of the source reserved node.
reservedNodeExchangeStatus_sourceReservedNodeId :: Lens.Lens' ReservedNodeExchangeStatus (Prelude.Maybe Prelude.Text)
reservedNodeExchangeStatus_sourceReservedNodeId = Lens.lens (\ReservedNodeExchangeStatus' {sourceReservedNodeId} -> sourceReservedNodeId) (\s@ReservedNodeExchangeStatus' {} a -> s {sourceReservedNodeId = a} :: ReservedNodeExchangeStatus)

-- | The identifier of the target reserved node offering.
reservedNodeExchangeStatus_targetReservedNodeOfferingId :: Lens.Lens' ReservedNodeExchangeStatus (Prelude.Maybe Prelude.Text)
reservedNodeExchangeStatus_targetReservedNodeOfferingId = Lens.lens (\ReservedNodeExchangeStatus' {targetReservedNodeOfferingId} -> targetReservedNodeOfferingId) (\s@ReservedNodeExchangeStatus' {} a -> s {targetReservedNodeOfferingId = a} :: ReservedNodeExchangeStatus)

-- | The source reserved-node count in the cluster.
reservedNodeExchangeStatus_sourceReservedNodeCount :: Lens.Lens' ReservedNodeExchangeStatus (Prelude.Maybe Prelude.Int)
reservedNodeExchangeStatus_sourceReservedNodeCount = Lens.lens (\ReservedNodeExchangeStatus' {sourceReservedNodeCount} -> sourceReservedNodeCount) (\s@ReservedNodeExchangeStatus' {} a -> s {sourceReservedNodeCount = a} :: ReservedNodeExchangeStatus)

-- | The source reserved-node type, for example ds2.xlarge.
reservedNodeExchangeStatus_sourceReservedNodeType :: Lens.Lens' ReservedNodeExchangeStatus (Prelude.Maybe Prelude.Text)
reservedNodeExchangeStatus_sourceReservedNodeType = Lens.lens (\ReservedNodeExchangeStatus' {sourceReservedNodeType} -> sourceReservedNodeType) (\s@ReservedNodeExchangeStatus' {} a -> s {sourceReservedNodeType = a} :: ReservedNodeExchangeStatus)

instance Core.FromXML ReservedNodeExchangeStatus where
  parseXML x =
    ReservedNodeExchangeStatus'
      Prelude.<$> (x Core..@? "TargetReservedNodeCount")
      Prelude.<*> (x Core..@? "TargetReservedNodeType")
      Prelude.<*> (x Core..@? "ReservedNodeExchangeRequestId")
      Prelude.<*> (x Core..@? "RequestTime")
      Prelude.<*> (x Core..@? "Status")
      Prelude.<*> (x Core..@? "SourceReservedNodeId")
      Prelude.<*> (x Core..@? "TargetReservedNodeOfferingId")
      Prelude.<*> (x Core..@? "SourceReservedNodeCount")
      Prelude.<*> (x Core..@? "SourceReservedNodeType")

instance Prelude.Hashable ReservedNodeExchangeStatus where
  hashWithSalt _salt ReservedNodeExchangeStatus' {..} =
    _salt
      `Prelude.hashWithSalt` targetReservedNodeCount
      `Prelude.hashWithSalt` targetReservedNodeType
      `Prelude.hashWithSalt` reservedNodeExchangeRequestId
      `Prelude.hashWithSalt` requestTime
      `Prelude.hashWithSalt` status
      `Prelude.hashWithSalt` sourceReservedNodeId
      `Prelude.hashWithSalt` targetReservedNodeOfferingId
      `Prelude.hashWithSalt` sourceReservedNodeCount
      `Prelude.hashWithSalt` sourceReservedNodeType

instance Prelude.NFData ReservedNodeExchangeStatus where
  rnf ReservedNodeExchangeStatus' {..} =
    Prelude.rnf targetReservedNodeCount
      `Prelude.seq` Prelude.rnf targetReservedNodeType
      `Prelude.seq` Prelude.rnf reservedNodeExchangeRequestId
      `Prelude.seq` Prelude.rnf requestTime
      `Prelude.seq` Prelude.rnf status
      `Prelude.seq` Prelude.rnf sourceReservedNodeId
      `Prelude.seq` Prelude.rnf targetReservedNodeOfferingId
      `Prelude.seq` Prelude.rnf sourceReservedNodeCount
      `Prelude.seq` Prelude.rnf sourceReservedNodeType
