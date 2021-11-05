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
-- Module      : Network.AWS.Panorama.DescribePackage
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns information about a package.
module Network.AWS.Panorama.DescribePackage
  ( -- * Creating a Request
    DescribePackage (..),
    newDescribePackage,

    -- * Request Lenses
    describePackage_packageId,

    -- * Destructuring the Response
    DescribePackageResponse (..),
    newDescribePackageResponse,

    -- * Response Lenses
    describePackageResponse_writeAccessPrincipalArns,
    describePackageResponse_readAccessPrincipalArns,
    describePackageResponse_httpStatus,
    describePackageResponse_packageId,
    describePackageResponse_packageName,
    describePackageResponse_arn,
    describePackageResponse_storageLocation,
    describePackageResponse_createdTime,
    describePackageResponse_tags,
  )
where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import Network.AWS.Panorama.Types
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newDescribePackage' smart constructor.
data DescribePackage = DescribePackage'
  { -- | The package\'s ID.
    packageId :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'DescribePackage' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'packageId', 'describePackage_packageId' - The package\'s ID.
newDescribePackage ::
  -- | 'packageId'
  Prelude.Text ->
  DescribePackage
newDescribePackage pPackageId_ =
  DescribePackage' {packageId = pPackageId_}

-- | The package\'s ID.
describePackage_packageId :: Lens.Lens' DescribePackage Prelude.Text
describePackage_packageId = Lens.lens (\DescribePackage' {packageId} -> packageId) (\s@DescribePackage' {} a -> s {packageId = a} :: DescribePackage)

instance Core.AWSRequest DescribePackage where
  type
    AWSResponse DescribePackage =
      DescribePackageResponse
  request = Request.get defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          DescribePackageResponse'
            Prelude.<$> ( x Core..?> "WriteAccessPrincipalArns"
                            Core..!@ Prelude.mempty
                        )
            Prelude.<*> ( x Core..?> "ReadAccessPrincipalArns"
                            Core..!@ Prelude.mempty
                        )
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
            Prelude.<*> (x Core..:> "PackageId")
            Prelude.<*> (x Core..:> "PackageName")
            Prelude.<*> (x Core..:> "Arn")
            Prelude.<*> (x Core..:> "StorageLocation")
            Prelude.<*> (x Core..:> "CreatedTime")
            Prelude.<*> (x Core..?> "Tags" Core..!@ Prelude.mempty)
      )

instance Prelude.Hashable DescribePackage

instance Prelude.NFData DescribePackage

instance Core.ToHeaders DescribePackage where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToPath DescribePackage where
  toPath DescribePackage' {..} =
    Prelude.mconcat
      ["/packages/metadata/", Core.toBS packageId]

instance Core.ToQuery DescribePackage where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newDescribePackageResponse' smart constructor.
data DescribePackageResponse = DescribePackageResponse'
  { -- | ARNs of accounts that have write access to the package.
    writeAccessPrincipalArns :: Prelude.Maybe [Prelude.Text],
    -- | ARNs of accounts that have read access to the package.
    readAccessPrincipalArns :: Prelude.Maybe [Prelude.Text],
    -- | The response's http status code.
    httpStatus :: Prelude.Int,
    -- | The package\'s ID.
    packageId :: Prelude.Text,
    -- | The package\'s name.
    packageName :: Prelude.Text,
    -- | The package\'s ARN.
    arn :: Prelude.Text,
    -- | The package\'s storage location.
    storageLocation :: StorageLocation,
    -- | When the package was created.
    createdTime :: Core.POSIX,
    -- | The package\'s tags.
    tags :: Prelude.HashMap Prelude.Text Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'DescribePackageResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'writeAccessPrincipalArns', 'describePackageResponse_writeAccessPrincipalArns' - ARNs of accounts that have write access to the package.
--
-- 'readAccessPrincipalArns', 'describePackageResponse_readAccessPrincipalArns' - ARNs of accounts that have read access to the package.
--
-- 'httpStatus', 'describePackageResponse_httpStatus' - The response's http status code.
--
-- 'packageId', 'describePackageResponse_packageId' - The package\'s ID.
--
-- 'packageName', 'describePackageResponse_packageName' - The package\'s name.
--
-- 'arn', 'describePackageResponse_arn' - The package\'s ARN.
--
-- 'storageLocation', 'describePackageResponse_storageLocation' - The package\'s storage location.
--
-- 'createdTime', 'describePackageResponse_createdTime' - When the package was created.
--
-- 'tags', 'describePackageResponse_tags' - The package\'s tags.
newDescribePackageResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  -- | 'packageId'
  Prelude.Text ->
  -- | 'packageName'
  Prelude.Text ->
  -- | 'arn'
  Prelude.Text ->
  -- | 'storageLocation'
  StorageLocation ->
  -- | 'createdTime'
  Prelude.UTCTime ->
  DescribePackageResponse
newDescribePackageResponse
  pHttpStatus_
  pPackageId_
  pPackageName_
  pArn_
  pStorageLocation_
  pCreatedTime_ =
    DescribePackageResponse'
      { writeAccessPrincipalArns =
          Prelude.Nothing,
        readAccessPrincipalArns = Prelude.Nothing,
        httpStatus = pHttpStatus_,
        packageId = pPackageId_,
        packageName = pPackageName_,
        arn = pArn_,
        storageLocation = pStorageLocation_,
        createdTime = Core._Time Lens.# pCreatedTime_,
        tags = Prelude.mempty
      }

-- | ARNs of accounts that have write access to the package.
describePackageResponse_writeAccessPrincipalArns :: Lens.Lens' DescribePackageResponse (Prelude.Maybe [Prelude.Text])
describePackageResponse_writeAccessPrincipalArns = Lens.lens (\DescribePackageResponse' {writeAccessPrincipalArns} -> writeAccessPrincipalArns) (\s@DescribePackageResponse' {} a -> s {writeAccessPrincipalArns = a} :: DescribePackageResponse) Prelude.. Lens.mapping Lens.coerced

-- | ARNs of accounts that have read access to the package.
describePackageResponse_readAccessPrincipalArns :: Lens.Lens' DescribePackageResponse (Prelude.Maybe [Prelude.Text])
describePackageResponse_readAccessPrincipalArns = Lens.lens (\DescribePackageResponse' {readAccessPrincipalArns} -> readAccessPrincipalArns) (\s@DescribePackageResponse' {} a -> s {readAccessPrincipalArns = a} :: DescribePackageResponse) Prelude.. Lens.mapping Lens.coerced

-- | The response's http status code.
describePackageResponse_httpStatus :: Lens.Lens' DescribePackageResponse Prelude.Int
describePackageResponse_httpStatus = Lens.lens (\DescribePackageResponse' {httpStatus} -> httpStatus) (\s@DescribePackageResponse' {} a -> s {httpStatus = a} :: DescribePackageResponse)

-- | The package\'s ID.
describePackageResponse_packageId :: Lens.Lens' DescribePackageResponse Prelude.Text
describePackageResponse_packageId = Lens.lens (\DescribePackageResponse' {packageId} -> packageId) (\s@DescribePackageResponse' {} a -> s {packageId = a} :: DescribePackageResponse)

-- | The package\'s name.
describePackageResponse_packageName :: Lens.Lens' DescribePackageResponse Prelude.Text
describePackageResponse_packageName = Lens.lens (\DescribePackageResponse' {packageName} -> packageName) (\s@DescribePackageResponse' {} a -> s {packageName = a} :: DescribePackageResponse)

-- | The package\'s ARN.
describePackageResponse_arn :: Lens.Lens' DescribePackageResponse Prelude.Text
describePackageResponse_arn = Lens.lens (\DescribePackageResponse' {arn} -> arn) (\s@DescribePackageResponse' {} a -> s {arn = a} :: DescribePackageResponse)

-- | The package\'s storage location.
describePackageResponse_storageLocation :: Lens.Lens' DescribePackageResponse StorageLocation
describePackageResponse_storageLocation = Lens.lens (\DescribePackageResponse' {storageLocation} -> storageLocation) (\s@DescribePackageResponse' {} a -> s {storageLocation = a} :: DescribePackageResponse)

-- | When the package was created.
describePackageResponse_createdTime :: Lens.Lens' DescribePackageResponse Prelude.UTCTime
describePackageResponse_createdTime = Lens.lens (\DescribePackageResponse' {createdTime} -> createdTime) (\s@DescribePackageResponse' {} a -> s {createdTime = a} :: DescribePackageResponse) Prelude.. Core._Time

-- | The package\'s tags.
describePackageResponse_tags :: Lens.Lens' DescribePackageResponse (Prelude.HashMap Prelude.Text Prelude.Text)
describePackageResponse_tags = Lens.lens (\DescribePackageResponse' {tags} -> tags) (\s@DescribePackageResponse' {} a -> s {tags = a} :: DescribePackageResponse) Prelude.. Lens.coerced

instance Prelude.NFData DescribePackageResponse
