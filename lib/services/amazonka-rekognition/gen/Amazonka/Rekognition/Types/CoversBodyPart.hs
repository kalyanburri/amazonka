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
-- Module      : Amazonka.Rekognition.Types.CoversBodyPart
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.Rekognition.Types.CoversBodyPart where

import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude

-- | Information about an item of Personal Protective Equipment covering a
-- corresponding body part. For more information, see
-- DetectProtectiveEquipment.
--
-- /See:/ 'newCoversBodyPart' smart constructor.
data CoversBodyPart = CoversBodyPart'
  { -- | True if the PPE covers the corresponding body part, otherwise false.
    value :: Prelude.Maybe Prelude.Bool,
    -- | The confidence that Amazon Rekognition has in the value of @Value@.
    confidence :: Prelude.Maybe Prelude.Double
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'CoversBodyPart' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'value', 'coversBodyPart_value' - True if the PPE covers the corresponding body part, otherwise false.
--
-- 'confidence', 'coversBodyPart_confidence' - The confidence that Amazon Rekognition has in the value of @Value@.
newCoversBodyPart ::
  CoversBodyPart
newCoversBodyPart =
  CoversBodyPart'
    { value = Prelude.Nothing,
      confidence = Prelude.Nothing
    }

-- | True if the PPE covers the corresponding body part, otherwise false.
coversBodyPart_value :: Lens.Lens' CoversBodyPart (Prelude.Maybe Prelude.Bool)
coversBodyPart_value = Lens.lens (\CoversBodyPart' {value} -> value) (\s@CoversBodyPart' {} a -> s {value = a} :: CoversBodyPart)

-- | The confidence that Amazon Rekognition has in the value of @Value@.
coversBodyPart_confidence :: Lens.Lens' CoversBodyPart (Prelude.Maybe Prelude.Double)
coversBodyPart_confidence = Lens.lens (\CoversBodyPart' {confidence} -> confidence) (\s@CoversBodyPart' {} a -> s {confidence = a} :: CoversBodyPart)

instance Core.FromJSON CoversBodyPart where
  parseJSON =
    Core.withObject
      "CoversBodyPart"
      ( \x ->
          CoversBodyPart'
            Prelude.<$> (x Core..:? "Value")
            Prelude.<*> (x Core..:? "Confidence")
      )

instance Prelude.Hashable CoversBodyPart where
  hashWithSalt salt' CoversBodyPart' {..} =
    salt' `Prelude.hashWithSalt` confidence
      `Prelude.hashWithSalt` value

instance Prelude.NFData CoversBodyPart where
  rnf CoversBodyPart' {..} =
    Prelude.rnf value
      `Prelude.seq` Prelude.rnf confidence
