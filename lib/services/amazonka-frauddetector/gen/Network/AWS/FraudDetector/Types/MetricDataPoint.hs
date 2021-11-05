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
-- Module      : Network.AWS.FraudDetector.Types.MetricDataPoint
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.FraudDetector.Types.MetricDataPoint where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude

-- | Model performance metrics data points.
--
-- /See:/ 'newMetricDataPoint' smart constructor.
data MetricDataPoint = MetricDataPoint'
  { -- | The percentage of fraud events correctly predicted as fraudulent as
    -- compared to all events predicted as fraudulent.
    precision :: Prelude.Maybe Prelude.Double,
    -- | The false positive rate. This is the percentage of total legitimate
    -- events that are incorrectly predicted as fraud.
    fpr :: Prelude.Maybe Prelude.Double,
    -- | The model threshold that specifies an acceptable fraud capture rate. For
    -- example, a threshold of 500 means any model score 500 or above is
    -- labeled as fraud.
    threshold :: Prelude.Maybe Prelude.Double,
    -- | The true positive rate. This is the percentage of total fraud the model
    -- detects. Also known as capture rate.
    tpr :: Prelude.Maybe Prelude.Double
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'MetricDataPoint' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'precision', 'metricDataPoint_precision' - The percentage of fraud events correctly predicted as fraudulent as
-- compared to all events predicted as fraudulent.
--
-- 'fpr', 'metricDataPoint_fpr' - The false positive rate. This is the percentage of total legitimate
-- events that are incorrectly predicted as fraud.
--
-- 'threshold', 'metricDataPoint_threshold' - The model threshold that specifies an acceptable fraud capture rate. For
-- example, a threshold of 500 means any model score 500 or above is
-- labeled as fraud.
--
-- 'tpr', 'metricDataPoint_tpr' - The true positive rate. This is the percentage of total fraud the model
-- detects. Also known as capture rate.
newMetricDataPoint ::
  MetricDataPoint
newMetricDataPoint =
  MetricDataPoint'
    { precision = Prelude.Nothing,
      fpr = Prelude.Nothing,
      threshold = Prelude.Nothing,
      tpr = Prelude.Nothing
    }

-- | The percentage of fraud events correctly predicted as fraudulent as
-- compared to all events predicted as fraudulent.
metricDataPoint_precision :: Lens.Lens' MetricDataPoint (Prelude.Maybe Prelude.Double)
metricDataPoint_precision = Lens.lens (\MetricDataPoint' {precision} -> precision) (\s@MetricDataPoint' {} a -> s {precision = a} :: MetricDataPoint)

-- | The false positive rate. This is the percentage of total legitimate
-- events that are incorrectly predicted as fraud.
metricDataPoint_fpr :: Lens.Lens' MetricDataPoint (Prelude.Maybe Prelude.Double)
metricDataPoint_fpr = Lens.lens (\MetricDataPoint' {fpr} -> fpr) (\s@MetricDataPoint' {} a -> s {fpr = a} :: MetricDataPoint)

-- | The model threshold that specifies an acceptable fraud capture rate. For
-- example, a threshold of 500 means any model score 500 or above is
-- labeled as fraud.
metricDataPoint_threshold :: Lens.Lens' MetricDataPoint (Prelude.Maybe Prelude.Double)
metricDataPoint_threshold = Lens.lens (\MetricDataPoint' {threshold} -> threshold) (\s@MetricDataPoint' {} a -> s {threshold = a} :: MetricDataPoint)

-- | The true positive rate. This is the percentage of total fraud the model
-- detects. Also known as capture rate.
metricDataPoint_tpr :: Lens.Lens' MetricDataPoint (Prelude.Maybe Prelude.Double)
metricDataPoint_tpr = Lens.lens (\MetricDataPoint' {tpr} -> tpr) (\s@MetricDataPoint' {} a -> s {tpr = a} :: MetricDataPoint)

instance Core.FromJSON MetricDataPoint where
  parseJSON =
    Core.withObject
      "MetricDataPoint"
      ( \x ->
          MetricDataPoint'
            Prelude.<$> (x Core..:? "precision")
            Prelude.<*> (x Core..:? "fpr")
            Prelude.<*> (x Core..:? "threshold")
            Prelude.<*> (x Core..:? "tpr")
      )

instance Prelude.Hashable MetricDataPoint

instance Prelude.NFData MetricDataPoint
