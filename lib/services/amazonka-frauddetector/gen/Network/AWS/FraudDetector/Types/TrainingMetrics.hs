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
-- Module      : Network.AWS.FraudDetector.Types.TrainingMetrics
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.FraudDetector.Types.TrainingMetrics where

import qualified Network.AWS.Core as Core
import Network.AWS.FraudDetector.Types.MetricDataPoint
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude

-- | The training metric details.
--
-- /See:/ 'newTrainingMetrics' smart constructor.
data TrainingMetrics = TrainingMetrics'
  { -- | The area under the curve. This summarizes true positive rate (TPR) and
    -- false positive rate (FPR) across all possible model score thresholds. A
    -- model with no predictive power has an AUC of 0.5, whereas a perfect
    -- model has a score of 1.0.
    auc :: Prelude.Maybe Prelude.Double,
    -- | The data points details.
    metricDataPoints :: Prelude.Maybe [MetricDataPoint]
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'TrainingMetrics' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'auc', 'trainingMetrics_auc' - The area under the curve. This summarizes true positive rate (TPR) and
-- false positive rate (FPR) across all possible model score thresholds. A
-- model with no predictive power has an AUC of 0.5, whereas a perfect
-- model has a score of 1.0.
--
-- 'metricDataPoints', 'trainingMetrics_metricDataPoints' - The data points details.
newTrainingMetrics ::
  TrainingMetrics
newTrainingMetrics =
  TrainingMetrics'
    { auc = Prelude.Nothing,
      metricDataPoints = Prelude.Nothing
    }

-- | The area under the curve. This summarizes true positive rate (TPR) and
-- false positive rate (FPR) across all possible model score thresholds. A
-- model with no predictive power has an AUC of 0.5, whereas a perfect
-- model has a score of 1.0.
trainingMetrics_auc :: Lens.Lens' TrainingMetrics (Prelude.Maybe Prelude.Double)
trainingMetrics_auc = Lens.lens (\TrainingMetrics' {auc} -> auc) (\s@TrainingMetrics' {} a -> s {auc = a} :: TrainingMetrics)

-- | The data points details.
trainingMetrics_metricDataPoints :: Lens.Lens' TrainingMetrics (Prelude.Maybe [MetricDataPoint])
trainingMetrics_metricDataPoints = Lens.lens (\TrainingMetrics' {metricDataPoints} -> metricDataPoints) (\s@TrainingMetrics' {} a -> s {metricDataPoints = a} :: TrainingMetrics) Prelude.. Lens.mapping Lens.coerced

instance Core.FromJSON TrainingMetrics where
  parseJSON =
    Core.withObject
      "TrainingMetrics"
      ( \x ->
          TrainingMetrics'
            Prelude.<$> (x Core..:? "auc")
            Prelude.<*> ( x Core..:? "metricDataPoints"
                            Core..!= Prelude.mempty
                        )
      )

instance Prelude.Hashable TrainingMetrics

instance Prelude.NFData TrainingMetrics
