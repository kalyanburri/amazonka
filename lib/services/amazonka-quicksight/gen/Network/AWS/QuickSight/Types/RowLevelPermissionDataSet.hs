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
-- Module      : Network.AWS.QuickSight.Types.RowLevelPermissionDataSet
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.QuickSight.Types.RowLevelPermissionDataSet where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import Network.AWS.QuickSight.Types.RowLevelPermissionFormatVersion
import Network.AWS.QuickSight.Types.RowLevelPermissionPolicy
import Network.AWS.QuickSight.Types.Status

-- | Information about a dataset that contains permissions for row-level
-- security (RLS). The permissions dataset maps fields to users or groups.
-- For more information, see
-- <https://docs.aws.amazon.com/quicksight/latest/user/restrict-access-to-a-data-set-using-row-level-security.html Using Row-Level Security (RLS) to Restrict Access to a Dataset>
-- in the /Amazon QuickSight User Guide/.
--
-- The option to deny permissions by setting @PermissionPolicy@ to
-- @DENY_ACCESS@ is not supported for new RLS datasets.
--
-- /See:/ 'newRowLevelPermissionDataSet' smart constructor.
data RowLevelPermissionDataSet = RowLevelPermissionDataSet'
  { -- | The status of the row-level security permission dataset. If enabled, the
    -- status is @ENABLED@. If disabled, the status is @DISABLED@.
    status :: Prelude.Maybe Status,
    -- | The namespace associated with the dataset that contains permissions for
    -- RLS.
    namespace :: Prelude.Maybe Prelude.Text,
    -- | The user or group rules associated with the dataset that contains
    -- permissions for RLS.
    --
    -- By default, @FormatVersion@ is @VERSION_1@. When @FormatVersion@ is
    -- @VERSION_1@, @UserName@ and @GroupName@ are required. When
    -- @FormatVersion@ is @VERSION_2@, @UserARN@ and @GroupARN@ are required,
    -- and @Namespace@ must not exist.
    formatVersion :: Prelude.Maybe RowLevelPermissionFormatVersion,
    -- | The Amazon Resource Name (ARN) of the dataset that contains permissions
    -- for RLS.
    arn :: Prelude.Text,
    -- | The type of permissions to use when interpreting the permissions for
    -- RLS. @DENY_ACCESS@ is included for backward compatibility only.
    permissionPolicy :: RowLevelPermissionPolicy
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'RowLevelPermissionDataSet' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'status', 'rowLevelPermissionDataSet_status' - The status of the row-level security permission dataset. If enabled, the
-- status is @ENABLED@. If disabled, the status is @DISABLED@.
--
-- 'namespace', 'rowLevelPermissionDataSet_namespace' - The namespace associated with the dataset that contains permissions for
-- RLS.
--
-- 'formatVersion', 'rowLevelPermissionDataSet_formatVersion' - The user or group rules associated with the dataset that contains
-- permissions for RLS.
--
-- By default, @FormatVersion@ is @VERSION_1@. When @FormatVersion@ is
-- @VERSION_1@, @UserName@ and @GroupName@ are required. When
-- @FormatVersion@ is @VERSION_2@, @UserARN@ and @GroupARN@ are required,
-- and @Namespace@ must not exist.
--
-- 'arn', 'rowLevelPermissionDataSet_arn' - The Amazon Resource Name (ARN) of the dataset that contains permissions
-- for RLS.
--
-- 'permissionPolicy', 'rowLevelPermissionDataSet_permissionPolicy' - The type of permissions to use when interpreting the permissions for
-- RLS. @DENY_ACCESS@ is included for backward compatibility only.
newRowLevelPermissionDataSet ::
  -- | 'arn'
  Prelude.Text ->
  -- | 'permissionPolicy'
  RowLevelPermissionPolicy ->
  RowLevelPermissionDataSet
newRowLevelPermissionDataSet pArn_ pPermissionPolicy_ =
  RowLevelPermissionDataSet'
    { status =
        Prelude.Nothing,
      namespace = Prelude.Nothing,
      formatVersion = Prelude.Nothing,
      arn = pArn_,
      permissionPolicy = pPermissionPolicy_
    }

-- | The status of the row-level security permission dataset. If enabled, the
-- status is @ENABLED@. If disabled, the status is @DISABLED@.
rowLevelPermissionDataSet_status :: Lens.Lens' RowLevelPermissionDataSet (Prelude.Maybe Status)
rowLevelPermissionDataSet_status = Lens.lens (\RowLevelPermissionDataSet' {status} -> status) (\s@RowLevelPermissionDataSet' {} a -> s {status = a} :: RowLevelPermissionDataSet)

-- | The namespace associated with the dataset that contains permissions for
-- RLS.
rowLevelPermissionDataSet_namespace :: Lens.Lens' RowLevelPermissionDataSet (Prelude.Maybe Prelude.Text)
rowLevelPermissionDataSet_namespace = Lens.lens (\RowLevelPermissionDataSet' {namespace} -> namespace) (\s@RowLevelPermissionDataSet' {} a -> s {namespace = a} :: RowLevelPermissionDataSet)

-- | The user or group rules associated with the dataset that contains
-- permissions for RLS.
--
-- By default, @FormatVersion@ is @VERSION_1@. When @FormatVersion@ is
-- @VERSION_1@, @UserName@ and @GroupName@ are required. When
-- @FormatVersion@ is @VERSION_2@, @UserARN@ and @GroupARN@ are required,
-- and @Namespace@ must not exist.
rowLevelPermissionDataSet_formatVersion :: Lens.Lens' RowLevelPermissionDataSet (Prelude.Maybe RowLevelPermissionFormatVersion)
rowLevelPermissionDataSet_formatVersion = Lens.lens (\RowLevelPermissionDataSet' {formatVersion} -> formatVersion) (\s@RowLevelPermissionDataSet' {} a -> s {formatVersion = a} :: RowLevelPermissionDataSet)

-- | The Amazon Resource Name (ARN) of the dataset that contains permissions
-- for RLS.
rowLevelPermissionDataSet_arn :: Lens.Lens' RowLevelPermissionDataSet Prelude.Text
rowLevelPermissionDataSet_arn = Lens.lens (\RowLevelPermissionDataSet' {arn} -> arn) (\s@RowLevelPermissionDataSet' {} a -> s {arn = a} :: RowLevelPermissionDataSet)

-- | The type of permissions to use when interpreting the permissions for
-- RLS. @DENY_ACCESS@ is included for backward compatibility only.
rowLevelPermissionDataSet_permissionPolicy :: Lens.Lens' RowLevelPermissionDataSet RowLevelPermissionPolicy
rowLevelPermissionDataSet_permissionPolicy = Lens.lens (\RowLevelPermissionDataSet' {permissionPolicy} -> permissionPolicy) (\s@RowLevelPermissionDataSet' {} a -> s {permissionPolicy = a} :: RowLevelPermissionDataSet)

instance Core.FromJSON RowLevelPermissionDataSet where
  parseJSON =
    Core.withObject
      "RowLevelPermissionDataSet"
      ( \x ->
          RowLevelPermissionDataSet'
            Prelude.<$> (x Core..:? "Status")
            Prelude.<*> (x Core..:? "Namespace")
            Prelude.<*> (x Core..:? "FormatVersion")
            Prelude.<*> (x Core..: "Arn")
            Prelude.<*> (x Core..: "PermissionPolicy")
      )

instance Prelude.Hashable RowLevelPermissionDataSet

instance Prelude.NFData RowLevelPermissionDataSet

instance Core.ToJSON RowLevelPermissionDataSet where
  toJSON RowLevelPermissionDataSet' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("Status" Core..=) Prelude.<$> status,
            ("Namespace" Core..=) Prelude.<$> namespace,
            ("FormatVersion" Core..=) Prelude.<$> formatVersion,
            Prelude.Just ("Arn" Core..= arn),
            Prelude.Just
              ("PermissionPolicy" Core..= permissionPolicy)
          ]
      )
