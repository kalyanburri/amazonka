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
-- Module      : Network.AWS.ImageBuilder.ListImageBuildVersions
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns a list of image build versions.
module Network.AWS.ImageBuilder.ListImageBuildVersions
  ( -- * Creating a Request
    ListImageBuildVersions (..),
    newListImageBuildVersions,

    -- * Request Lenses
    listImageBuildVersions_filters,
    listImageBuildVersions_nextToken,
    listImageBuildVersions_maxResults,
    listImageBuildVersions_imageVersionArn,

    -- * Destructuring the Response
    ListImageBuildVersionsResponse (..),
    newListImageBuildVersionsResponse,

    -- * Response Lenses
    listImageBuildVersionsResponse_requestId,
    listImageBuildVersionsResponse_nextToken,
    listImageBuildVersionsResponse_imageSummaryList,
    listImageBuildVersionsResponse_httpStatus,
  )
where

import qualified Network.AWS.Core as Core
import Network.AWS.ImageBuilder.Types
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newListImageBuildVersions' smart constructor.
data ListImageBuildVersions = ListImageBuildVersions'
  { -- | Use the following filters to streamline results:
    --
    -- -   @name@
    --
    -- -   @osVersion@
    --
    -- -   @platform@
    --
    -- -   @type@
    --
    -- -   @version@
    filters :: Prelude.Maybe (Prelude.NonEmpty Filter),
    -- | A token to specify where to start paginating. This is the NextToken from
    -- a previously truncated response.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The maximum items to return in a request.
    maxResults :: Prelude.Maybe Prelude.Natural,
    -- | The Amazon Resource Name (ARN) of the image whose build versions you
    -- want to retrieve.
    imageVersionArn :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListImageBuildVersions' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'filters', 'listImageBuildVersions_filters' - Use the following filters to streamline results:
--
-- -   @name@
--
-- -   @osVersion@
--
-- -   @platform@
--
-- -   @type@
--
-- -   @version@
--
-- 'nextToken', 'listImageBuildVersions_nextToken' - A token to specify where to start paginating. This is the NextToken from
-- a previously truncated response.
--
-- 'maxResults', 'listImageBuildVersions_maxResults' - The maximum items to return in a request.
--
-- 'imageVersionArn', 'listImageBuildVersions_imageVersionArn' - The Amazon Resource Name (ARN) of the image whose build versions you
-- want to retrieve.
newListImageBuildVersions ::
  -- | 'imageVersionArn'
  Prelude.Text ->
  ListImageBuildVersions
newListImageBuildVersions pImageVersionArn_ =
  ListImageBuildVersions'
    { filters = Prelude.Nothing,
      nextToken = Prelude.Nothing,
      maxResults = Prelude.Nothing,
      imageVersionArn = pImageVersionArn_
    }

-- | Use the following filters to streamline results:
--
-- -   @name@
--
-- -   @osVersion@
--
-- -   @platform@
--
-- -   @type@
--
-- -   @version@
listImageBuildVersions_filters :: Lens.Lens' ListImageBuildVersions (Prelude.Maybe (Prelude.NonEmpty Filter))
listImageBuildVersions_filters = Lens.lens (\ListImageBuildVersions' {filters} -> filters) (\s@ListImageBuildVersions' {} a -> s {filters = a} :: ListImageBuildVersions) Prelude.. Lens.mapping Lens.coerced

-- | A token to specify where to start paginating. This is the NextToken from
-- a previously truncated response.
listImageBuildVersions_nextToken :: Lens.Lens' ListImageBuildVersions (Prelude.Maybe Prelude.Text)
listImageBuildVersions_nextToken = Lens.lens (\ListImageBuildVersions' {nextToken} -> nextToken) (\s@ListImageBuildVersions' {} a -> s {nextToken = a} :: ListImageBuildVersions)

-- | The maximum items to return in a request.
listImageBuildVersions_maxResults :: Lens.Lens' ListImageBuildVersions (Prelude.Maybe Prelude.Natural)
listImageBuildVersions_maxResults = Lens.lens (\ListImageBuildVersions' {maxResults} -> maxResults) (\s@ListImageBuildVersions' {} a -> s {maxResults = a} :: ListImageBuildVersions)

-- | The Amazon Resource Name (ARN) of the image whose build versions you
-- want to retrieve.
listImageBuildVersions_imageVersionArn :: Lens.Lens' ListImageBuildVersions Prelude.Text
listImageBuildVersions_imageVersionArn = Lens.lens (\ListImageBuildVersions' {imageVersionArn} -> imageVersionArn) (\s@ListImageBuildVersions' {} a -> s {imageVersionArn = a} :: ListImageBuildVersions)

instance Core.AWSRequest ListImageBuildVersions where
  type
    AWSResponse ListImageBuildVersions =
      ListImageBuildVersionsResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          ListImageBuildVersionsResponse'
            Prelude.<$> (x Core..?> "requestId")
            Prelude.<*> (x Core..?> "nextToken")
            Prelude.<*> ( x Core..?> "imageSummaryList"
                            Core..!@ Prelude.mempty
                        )
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable ListImageBuildVersions

instance Prelude.NFData ListImageBuildVersions

instance Core.ToHeaders ListImageBuildVersions where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToJSON ListImageBuildVersions where
  toJSON ListImageBuildVersions' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("filters" Core..=) Prelude.<$> filters,
            ("nextToken" Core..=) Prelude.<$> nextToken,
            ("maxResults" Core..=) Prelude.<$> maxResults,
            Prelude.Just
              ("imageVersionArn" Core..= imageVersionArn)
          ]
      )

instance Core.ToPath ListImageBuildVersions where
  toPath = Prelude.const "/ListImageBuildVersions"

instance Core.ToQuery ListImageBuildVersions where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newListImageBuildVersionsResponse' smart constructor.
data ListImageBuildVersionsResponse = ListImageBuildVersionsResponse'
  { -- | The request ID that uniquely identifies this request.
    requestId :: Prelude.Maybe Prelude.Text,
    -- | The next token used for paginated responses. When this is not empty,
    -- there are additional elements that the service has not included in this
    -- request. Use this token with the next request to retrieve additional
    -- objects.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The list of image build versions.
    imageSummaryList :: Prelude.Maybe [ImageSummary],
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListImageBuildVersionsResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'requestId', 'listImageBuildVersionsResponse_requestId' - The request ID that uniquely identifies this request.
--
-- 'nextToken', 'listImageBuildVersionsResponse_nextToken' - The next token used for paginated responses. When this is not empty,
-- there are additional elements that the service has not included in this
-- request. Use this token with the next request to retrieve additional
-- objects.
--
-- 'imageSummaryList', 'listImageBuildVersionsResponse_imageSummaryList' - The list of image build versions.
--
-- 'httpStatus', 'listImageBuildVersionsResponse_httpStatus' - The response's http status code.
newListImageBuildVersionsResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  ListImageBuildVersionsResponse
newListImageBuildVersionsResponse pHttpStatus_ =
  ListImageBuildVersionsResponse'
    { requestId =
        Prelude.Nothing,
      nextToken = Prelude.Nothing,
      imageSummaryList = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | The request ID that uniquely identifies this request.
listImageBuildVersionsResponse_requestId :: Lens.Lens' ListImageBuildVersionsResponse (Prelude.Maybe Prelude.Text)
listImageBuildVersionsResponse_requestId = Lens.lens (\ListImageBuildVersionsResponse' {requestId} -> requestId) (\s@ListImageBuildVersionsResponse' {} a -> s {requestId = a} :: ListImageBuildVersionsResponse)

-- | The next token used for paginated responses. When this is not empty,
-- there are additional elements that the service has not included in this
-- request. Use this token with the next request to retrieve additional
-- objects.
listImageBuildVersionsResponse_nextToken :: Lens.Lens' ListImageBuildVersionsResponse (Prelude.Maybe Prelude.Text)
listImageBuildVersionsResponse_nextToken = Lens.lens (\ListImageBuildVersionsResponse' {nextToken} -> nextToken) (\s@ListImageBuildVersionsResponse' {} a -> s {nextToken = a} :: ListImageBuildVersionsResponse)

-- | The list of image build versions.
listImageBuildVersionsResponse_imageSummaryList :: Lens.Lens' ListImageBuildVersionsResponse (Prelude.Maybe [ImageSummary])
listImageBuildVersionsResponse_imageSummaryList = Lens.lens (\ListImageBuildVersionsResponse' {imageSummaryList} -> imageSummaryList) (\s@ListImageBuildVersionsResponse' {} a -> s {imageSummaryList = a} :: ListImageBuildVersionsResponse) Prelude.. Lens.mapping Lens.coerced

-- | The response's http status code.
listImageBuildVersionsResponse_httpStatus :: Lens.Lens' ListImageBuildVersionsResponse Prelude.Int
listImageBuildVersionsResponse_httpStatus = Lens.lens (\ListImageBuildVersionsResponse' {httpStatus} -> httpStatus) (\s@ListImageBuildVersionsResponse' {} a -> s {httpStatus = a} :: ListImageBuildVersionsResponse)

instance
  Prelude.NFData
    ListImageBuildVersionsResponse
