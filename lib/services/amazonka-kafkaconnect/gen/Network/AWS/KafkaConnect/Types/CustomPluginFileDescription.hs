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
-- Module      : Network.AWS.KafkaConnect.Types.CustomPluginFileDescription
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.KafkaConnect.Types.CustomPluginFileDescription where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude

-- | Details about a custom plugin file.
--
-- /See:/ 'newCustomPluginFileDescription' smart constructor.
data CustomPluginFileDescription = CustomPluginFileDescription'
  { -- | The hex-encoded MD5 checksum of the custom plugin file. You can use it
    -- to validate the file.
    fileMd5 :: Prelude.Maybe Prelude.Text,
    -- | The size in bytes of the custom plugin file. You can use it to validate
    -- the file.
    fileSize :: Prelude.Maybe Prelude.Integer
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'CustomPluginFileDescription' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'fileMd5', 'customPluginFileDescription_fileMd5' - The hex-encoded MD5 checksum of the custom plugin file. You can use it
-- to validate the file.
--
-- 'fileSize', 'customPluginFileDescription_fileSize' - The size in bytes of the custom plugin file. You can use it to validate
-- the file.
newCustomPluginFileDescription ::
  CustomPluginFileDescription
newCustomPluginFileDescription =
  CustomPluginFileDescription'
    { fileMd5 =
        Prelude.Nothing,
      fileSize = Prelude.Nothing
    }

-- | The hex-encoded MD5 checksum of the custom plugin file. You can use it
-- to validate the file.
customPluginFileDescription_fileMd5 :: Lens.Lens' CustomPluginFileDescription (Prelude.Maybe Prelude.Text)
customPluginFileDescription_fileMd5 = Lens.lens (\CustomPluginFileDescription' {fileMd5} -> fileMd5) (\s@CustomPluginFileDescription' {} a -> s {fileMd5 = a} :: CustomPluginFileDescription)

-- | The size in bytes of the custom plugin file. You can use it to validate
-- the file.
customPluginFileDescription_fileSize :: Lens.Lens' CustomPluginFileDescription (Prelude.Maybe Prelude.Integer)
customPluginFileDescription_fileSize = Lens.lens (\CustomPluginFileDescription' {fileSize} -> fileSize) (\s@CustomPluginFileDescription' {} a -> s {fileSize = a} :: CustomPluginFileDescription)

instance Core.FromJSON CustomPluginFileDescription where
  parseJSON =
    Core.withObject
      "CustomPluginFileDescription"
      ( \x ->
          CustomPluginFileDescription'
            Prelude.<$> (x Core..:? "fileMd5")
            Prelude.<*> (x Core..:? "fileSize")
      )

instance Prelude.Hashable CustomPluginFileDescription

instance Prelude.NFData CustomPluginFileDescription
