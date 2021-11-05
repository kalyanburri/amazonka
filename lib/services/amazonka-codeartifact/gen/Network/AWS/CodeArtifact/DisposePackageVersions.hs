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
-- Module      : Network.AWS.CodeArtifact.DisposePackageVersions
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes the assets in package versions and sets the package versions\'
-- status to @Disposed@. A disposed package version cannot be restored in
-- your repository because its assets are deleted.
--
-- To view all disposed package versions in a repository, use
-- <https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListPackageVersions.html ListPackageVersions>
-- and set the
-- <https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListPackageVersions.html#API_ListPackageVersions_RequestSyntax status>
-- parameter to @Disposed@.
--
-- To view information about a disposed package version, use
-- <https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_DescribePackageVersion.html DescribePackageVersion>.
module Network.AWS.CodeArtifact.DisposePackageVersions
  ( -- * Creating a Request
    DisposePackageVersions (..),
    newDisposePackageVersions,

    -- * Request Lenses
    disposePackageVersions_expectedStatus,
    disposePackageVersions_versionRevisions,
    disposePackageVersions_namespace,
    disposePackageVersions_domainOwner,
    disposePackageVersions_domain,
    disposePackageVersions_repository,
    disposePackageVersions_format,
    disposePackageVersions_package,
    disposePackageVersions_versions,

    -- * Destructuring the Response
    DisposePackageVersionsResponse (..),
    newDisposePackageVersionsResponse,

    -- * Response Lenses
    disposePackageVersionsResponse_failedVersions,
    disposePackageVersionsResponse_successfulVersions,
    disposePackageVersionsResponse_httpStatus,
  )
where

import Network.AWS.CodeArtifact.Types
import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newDisposePackageVersions' smart constructor.
data DisposePackageVersions = DisposePackageVersions'
  { -- | The expected status of the package version to dispose. Valid values are:
    --
    -- -   @Published@
    --
    -- -   @Unfinished@
    --
    -- -   @Unlisted@
    --
    -- -   @Archived@
    --
    -- -   @Disposed@
    expectedStatus :: Prelude.Maybe PackageVersionStatus,
    -- | The revisions of the package versions you want to dispose.
    versionRevisions :: Prelude.Maybe (Prelude.HashMap Prelude.Text Prelude.Text),
    -- | The namespace of the package. The package component that specifies its
    -- namespace depends on its type. For example:
    --
    -- -   The namespace of a Maven package is its @groupId@.
    --
    -- -   The namespace of an npm package is its @scope@.
    --
    -- -   A Python package does not contain a corresponding component, so
    --     Python packages do not have a namespace.
    namespace :: Prelude.Maybe Prelude.Text,
    -- | The 12-digit account number of the AWS account that owns the domain. It
    -- does not include dashes or spaces.
    domainOwner :: Prelude.Maybe Prelude.Text,
    -- | The name of the domain that contains the repository you want to dispose.
    domain :: Prelude.Text,
    -- | The name of the repository that contains the package versions you want
    -- to dispose.
    repository :: Prelude.Text,
    -- | A format that specifies the type of package versions you want to
    -- dispose. The valid values are:
    --
    -- -   @npm@
    --
    -- -   @pypi@
    --
    -- -   @maven@
    format :: PackageFormat,
    -- | The name of the package with the versions you want to dispose.
    package :: Prelude.Text,
    -- | The versions of the package you want to dispose.
    versions :: [Prelude.Text]
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'DisposePackageVersions' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'expectedStatus', 'disposePackageVersions_expectedStatus' - The expected status of the package version to dispose. Valid values are:
--
-- -   @Published@
--
-- -   @Unfinished@
--
-- -   @Unlisted@
--
-- -   @Archived@
--
-- -   @Disposed@
--
-- 'versionRevisions', 'disposePackageVersions_versionRevisions' - The revisions of the package versions you want to dispose.
--
-- 'namespace', 'disposePackageVersions_namespace' - The namespace of the package. The package component that specifies its
-- namespace depends on its type. For example:
--
-- -   The namespace of a Maven package is its @groupId@.
--
-- -   The namespace of an npm package is its @scope@.
--
-- -   A Python package does not contain a corresponding component, so
--     Python packages do not have a namespace.
--
-- 'domainOwner', 'disposePackageVersions_domainOwner' - The 12-digit account number of the AWS account that owns the domain. It
-- does not include dashes or spaces.
--
-- 'domain', 'disposePackageVersions_domain' - The name of the domain that contains the repository you want to dispose.
--
-- 'repository', 'disposePackageVersions_repository' - The name of the repository that contains the package versions you want
-- to dispose.
--
-- 'format', 'disposePackageVersions_format' - A format that specifies the type of package versions you want to
-- dispose. The valid values are:
--
-- -   @npm@
--
-- -   @pypi@
--
-- -   @maven@
--
-- 'package', 'disposePackageVersions_package' - The name of the package with the versions you want to dispose.
--
-- 'versions', 'disposePackageVersions_versions' - The versions of the package you want to dispose.
newDisposePackageVersions ::
  -- | 'domain'
  Prelude.Text ->
  -- | 'repository'
  Prelude.Text ->
  -- | 'format'
  PackageFormat ->
  -- | 'package'
  Prelude.Text ->
  DisposePackageVersions
newDisposePackageVersions
  pDomain_
  pRepository_
  pFormat_
  pPackage_ =
    DisposePackageVersions'
      { expectedStatus =
          Prelude.Nothing,
        versionRevisions = Prelude.Nothing,
        namespace = Prelude.Nothing,
        domainOwner = Prelude.Nothing,
        domain = pDomain_,
        repository = pRepository_,
        format = pFormat_,
        package = pPackage_,
        versions = Prelude.mempty
      }

-- | The expected status of the package version to dispose. Valid values are:
--
-- -   @Published@
--
-- -   @Unfinished@
--
-- -   @Unlisted@
--
-- -   @Archived@
--
-- -   @Disposed@
disposePackageVersions_expectedStatus :: Lens.Lens' DisposePackageVersions (Prelude.Maybe PackageVersionStatus)
disposePackageVersions_expectedStatus = Lens.lens (\DisposePackageVersions' {expectedStatus} -> expectedStatus) (\s@DisposePackageVersions' {} a -> s {expectedStatus = a} :: DisposePackageVersions)

-- | The revisions of the package versions you want to dispose.
disposePackageVersions_versionRevisions :: Lens.Lens' DisposePackageVersions (Prelude.Maybe (Prelude.HashMap Prelude.Text Prelude.Text))
disposePackageVersions_versionRevisions = Lens.lens (\DisposePackageVersions' {versionRevisions} -> versionRevisions) (\s@DisposePackageVersions' {} a -> s {versionRevisions = a} :: DisposePackageVersions) Prelude.. Lens.mapping Lens.coerced

-- | The namespace of the package. The package component that specifies its
-- namespace depends on its type. For example:
--
-- -   The namespace of a Maven package is its @groupId@.
--
-- -   The namespace of an npm package is its @scope@.
--
-- -   A Python package does not contain a corresponding component, so
--     Python packages do not have a namespace.
disposePackageVersions_namespace :: Lens.Lens' DisposePackageVersions (Prelude.Maybe Prelude.Text)
disposePackageVersions_namespace = Lens.lens (\DisposePackageVersions' {namespace} -> namespace) (\s@DisposePackageVersions' {} a -> s {namespace = a} :: DisposePackageVersions)

-- | The 12-digit account number of the AWS account that owns the domain. It
-- does not include dashes or spaces.
disposePackageVersions_domainOwner :: Lens.Lens' DisposePackageVersions (Prelude.Maybe Prelude.Text)
disposePackageVersions_domainOwner = Lens.lens (\DisposePackageVersions' {domainOwner} -> domainOwner) (\s@DisposePackageVersions' {} a -> s {domainOwner = a} :: DisposePackageVersions)

-- | The name of the domain that contains the repository you want to dispose.
disposePackageVersions_domain :: Lens.Lens' DisposePackageVersions Prelude.Text
disposePackageVersions_domain = Lens.lens (\DisposePackageVersions' {domain} -> domain) (\s@DisposePackageVersions' {} a -> s {domain = a} :: DisposePackageVersions)

-- | The name of the repository that contains the package versions you want
-- to dispose.
disposePackageVersions_repository :: Lens.Lens' DisposePackageVersions Prelude.Text
disposePackageVersions_repository = Lens.lens (\DisposePackageVersions' {repository} -> repository) (\s@DisposePackageVersions' {} a -> s {repository = a} :: DisposePackageVersions)

-- | A format that specifies the type of package versions you want to
-- dispose. The valid values are:
--
-- -   @npm@
--
-- -   @pypi@
--
-- -   @maven@
disposePackageVersions_format :: Lens.Lens' DisposePackageVersions PackageFormat
disposePackageVersions_format = Lens.lens (\DisposePackageVersions' {format} -> format) (\s@DisposePackageVersions' {} a -> s {format = a} :: DisposePackageVersions)

-- | The name of the package with the versions you want to dispose.
disposePackageVersions_package :: Lens.Lens' DisposePackageVersions Prelude.Text
disposePackageVersions_package = Lens.lens (\DisposePackageVersions' {package} -> package) (\s@DisposePackageVersions' {} a -> s {package = a} :: DisposePackageVersions)

-- | The versions of the package you want to dispose.
disposePackageVersions_versions :: Lens.Lens' DisposePackageVersions [Prelude.Text]
disposePackageVersions_versions = Lens.lens (\DisposePackageVersions' {versions} -> versions) (\s@DisposePackageVersions' {} a -> s {versions = a} :: DisposePackageVersions) Prelude.. Lens.coerced

instance Core.AWSRequest DisposePackageVersions where
  type
    AWSResponse DisposePackageVersions =
      DisposePackageVersionsResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          DisposePackageVersionsResponse'
            Prelude.<$> (x Core..?> "failedVersions" Core..!@ Prelude.mempty)
            Prelude.<*> ( x Core..?> "successfulVersions"
                            Core..!@ Prelude.mempty
                        )
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable DisposePackageVersions

instance Prelude.NFData DisposePackageVersions

instance Core.ToHeaders DisposePackageVersions where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToJSON DisposePackageVersions where
  toJSON DisposePackageVersions' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("expectedStatus" Core..=)
              Prelude.<$> expectedStatus,
            ("versionRevisions" Core..=)
              Prelude.<$> versionRevisions,
            Prelude.Just ("versions" Core..= versions)
          ]
      )

instance Core.ToPath DisposePackageVersions where
  toPath = Prelude.const "/v1/package/versions/dispose"

instance Core.ToQuery DisposePackageVersions where
  toQuery DisposePackageVersions' {..} =
    Prelude.mconcat
      [ "namespace" Core.=: namespace,
        "domain-owner" Core.=: domainOwner,
        "domain" Core.=: domain,
        "repository" Core.=: repository,
        "format" Core.=: format,
        "package" Core.=: package
      ]

-- | /See:/ 'newDisposePackageVersionsResponse' smart constructor.
data DisposePackageVersionsResponse = DisposePackageVersionsResponse'
  { -- | A @PackageVersionError@ object that contains a map of errors codes for
    -- the disposed package versions that failed. The possible error codes are:
    --
    -- -   @ALREADY_EXISTS@
    --
    -- -   @MISMATCHED_REVISION@
    --
    -- -   @MISMATCHED_STATUS@
    --
    -- -   @NOT_ALLOWED@
    --
    -- -   @NOT_FOUND@
    --
    -- -   @SKIPPED@
    failedVersions :: Prelude.Maybe (Prelude.HashMap Prelude.Text PackageVersionError),
    -- | A list of the package versions that were successfully disposed.
    successfulVersions :: Prelude.Maybe (Prelude.HashMap Prelude.Text SuccessfulPackageVersionInfo),
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'DisposePackageVersionsResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'failedVersions', 'disposePackageVersionsResponse_failedVersions' - A @PackageVersionError@ object that contains a map of errors codes for
-- the disposed package versions that failed. The possible error codes are:
--
-- -   @ALREADY_EXISTS@
--
-- -   @MISMATCHED_REVISION@
--
-- -   @MISMATCHED_STATUS@
--
-- -   @NOT_ALLOWED@
--
-- -   @NOT_FOUND@
--
-- -   @SKIPPED@
--
-- 'successfulVersions', 'disposePackageVersionsResponse_successfulVersions' - A list of the package versions that were successfully disposed.
--
-- 'httpStatus', 'disposePackageVersionsResponse_httpStatus' - The response's http status code.
newDisposePackageVersionsResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  DisposePackageVersionsResponse
newDisposePackageVersionsResponse pHttpStatus_ =
  DisposePackageVersionsResponse'
    { failedVersions =
        Prelude.Nothing,
      successfulVersions = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | A @PackageVersionError@ object that contains a map of errors codes for
-- the disposed package versions that failed. The possible error codes are:
--
-- -   @ALREADY_EXISTS@
--
-- -   @MISMATCHED_REVISION@
--
-- -   @MISMATCHED_STATUS@
--
-- -   @NOT_ALLOWED@
--
-- -   @NOT_FOUND@
--
-- -   @SKIPPED@
disposePackageVersionsResponse_failedVersions :: Lens.Lens' DisposePackageVersionsResponse (Prelude.Maybe (Prelude.HashMap Prelude.Text PackageVersionError))
disposePackageVersionsResponse_failedVersions = Lens.lens (\DisposePackageVersionsResponse' {failedVersions} -> failedVersions) (\s@DisposePackageVersionsResponse' {} a -> s {failedVersions = a} :: DisposePackageVersionsResponse) Prelude.. Lens.mapping Lens.coerced

-- | A list of the package versions that were successfully disposed.
disposePackageVersionsResponse_successfulVersions :: Lens.Lens' DisposePackageVersionsResponse (Prelude.Maybe (Prelude.HashMap Prelude.Text SuccessfulPackageVersionInfo))
disposePackageVersionsResponse_successfulVersions = Lens.lens (\DisposePackageVersionsResponse' {successfulVersions} -> successfulVersions) (\s@DisposePackageVersionsResponse' {} a -> s {successfulVersions = a} :: DisposePackageVersionsResponse) Prelude.. Lens.mapping Lens.coerced

-- | The response's http status code.
disposePackageVersionsResponse_httpStatus :: Lens.Lens' DisposePackageVersionsResponse Prelude.Int
disposePackageVersionsResponse_httpStatus = Lens.lens (\DisposePackageVersionsResponse' {httpStatus} -> httpStatus) (\s@DisposePackageVersionsResponse' {} a -> s {httpStatus = a} :: DisposePackageVersionsResponse)

instance
  Prelude.NFData
    DisposePackageVersionsResponse
