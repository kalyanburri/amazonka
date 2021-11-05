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
-- Module      : Network.AWS.AppFlow.Types.VeevaSourceProperties
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.AppFlow.Types.VeevaSourceProperties where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude

-- | The properties that are applied when using Veeva as a flow source.
--
-- /See:/ 'newVeevaSourceProperties' smart constructor.
data VeevaSourceProperties = VeevaSourceProperties'
  { -- | Boolean value to include All Versions of files in Veeva document extract
    -- flow.
    includeAllVersions :: Prelude.Maybe Prelude.Bool,
    -- | The document type specified in the Veeva document extract flow.
    documentType :: Prelude.Maybe Prelude.Text,
    -- | Boolean value to include file renditions in Veeva document extract flow.
    includeRenditions :: Prelude.Maybe Prelude.Bool,
    -- | Boolean value to include source files in Veeva document extract flow.
    includeSourceFiles :: Prelude.Maybe Prelude.Bool,
    -- | The object specified in the Veeva flow source.
    object' :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'VeevaSourceProperties' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'includeAllVersions', 'veevaSourceProperties_includeAllVersions' - Boolean value to include All Versions of files in Veeva document extract
-- flow.
--
-- 'documentType', 'veevaSourceProperties_documentType' - The document type specified in the Veeva document extract flow.
--
-- 'includeRenditions', 'veevaSourceProperties_includeRenditions' - Boolean value to include file renditions in Veeva document extract flow.
--
-- 'includeSourceFiles', 'veevaSourceProperties_includeSourceFiles' - Boolean value to include source files in Veeva document extract flow.
--
-- 'object'', 'veevaSourceProperties_object' - The object specified in the Veeva flow source.
newVeevaSourceProperties ::
  -- | 'object''
  Prelude.Text ->
  VeevaSourceProperties
newVeevaSourceProperties pObject_ =
  VeevaSourceProperties'
    { includeAllVersions =
        Prelude.Nothing,
      documentType = Prelude.Nothing,
      includeRenditions = Prelude.Nothing,
      includeSourceFiles = Prelude.Nothing,
      object' = pObject_
    }

-- | Boolean value to include All Versions of files in Veeva document extract
-- flow.
veevaSourceProperties_includeAllVersions :: Lens.Lens' VeevaSourceProperties (Prelude.Maybe Prelude.Bool)
veevaSourceProperties_includeAllVersions = Lens.lens (\VeevaSourceProperties' {includeAllVersions} -> includeAllVersions) (\s@VeevaSourceProperties' {} a -> s {includeAllVersions = a} :: VeevaSourceProperties)

-- | The document type specified in the Veeva document extract flow.
veevaSourceProperties_documentType :: Lens.Lens' VeevaSourceProperties (Prelude.Maybe Prelude.Text)
veevaSourceProperties_documentType = Lens.lens (\VeevaSourceProperties' {documentType} -> documentType) (\s@VeevaSourceProperties' {} a -> s {documentType = a} :: VeevaSourceProperties)

-- | Boolean value to include file renditions in Veeva document extract flow.
veevaSourceProperties_includeRenditions :: Lens.Lens' VeevaSourceProperties (Prelude.Maybe Prelude.Bool)
veevaSourceProperties_includeRenditions = Lens.lens (\VeevaSourceProperties' {includeRenditions} -> includeRenditions) (\s@VeevaSourceProperties' {} a -> s {includeRenditions = a} :: VeevaSourceProperties)

-- | Boolean value to include source files in Veeva document extract flow.
veevaSourceProperties_includeSourceFiles :: Lens.Lens' VeevaSourceProperties (Prelude.Maybe Prelude.Bool)
veevaSourceProperties_includeSourceFiles = Lens.lens (\VeevaSourceProperties' {includeSourceFiles} -> includeSourceFiles) (\s@VeevaSourceProperties' {} a -> s {includeSourceFiles = a} :: VeevaSourceProperties)

-- | The object specified in the Veeva flow source.
veevaSourceProperties_object :: Lens.Lens' VeevaSourceProperties Prelude.Text
veevaSourceProperties_object = Lens.lens (\VeevaSourceProperties' {object'} -> object') (\s@VeevaSourceProperties' {} a -> s {object' = a} :: VeevaSourceProperties)

instance Core.FromJSON VeevaSourceProperties where
  parseJSON =
    Core.withObject
      "VeevaSourceProperties"
      ( \x ->
          VeevaSourceProperties'
            Prelude.<$> (x Core..:? "includeAllVersions")
            Prelude.<*> (x Core..:? "documentType")
            Prelude.<*> (x Core..:? "includeRenditions")
            Prelude.<*> (x Core..:? "includeSourceFiles")
            Prelude.<*> (x Core..: "object")
      )

instance Prelude.Hashable VeevaSourceProperties

instance Prelude.NFData VeevaSourceProperties

instance Core.ToJSON VeevaSourceProperties where
  toJSON VeevaSourceProperties' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("includeAllVersions" Core..=)
              Prelude.<$> includeAllVersions,
            ("documentType" Core..=) Prelude.<$> documentType,
            ("includeRenditions" Core..=)
              Prelude.<$> includeRenditions,
            ("includeSourceFiles" Core..=)
              Prelude.<$> includeSourceFiles,
            Prelude.Just ("object" Core..= object')
          ]
      )
