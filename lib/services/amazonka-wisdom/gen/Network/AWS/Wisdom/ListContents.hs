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
-- Module      : Network.AWS.Wisdom.ListContents
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Lists the content.
--
-- This operation returns paginated results.
module Network.AWS.Wisdom.ListContents
  ( -- * Creating a Request
    ListContents (..),
    newListContents,

    -- * Request Lenses
    listContents_nextToken,
    listContents_maxResults,
    listContents_knowledgeBaseId,

    -- * Destructuring the Response
    ListContentsResponse (..),
    newListContentsResponse,

    -- * Response Lenses
    listContentsResponse_nextToken,
    listContentsResponse_httpStatus,
    listContentsResponse_contentSummaries,
  )
where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response
import Network.AWS.Wisdom.Types

-- | /See:/ 'newListContents' smart constructor.
data ListContents = ListContents'
  { -- | The token for the next set of results. Use the value returned in the
    -- previous response in the next request to retrieve the next set of
    -- results.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The maximum number of results to return per page.
    maxResults :: Prelude.Maybe Prelude.Natural,
    -- | The the identifier of the knowledge base. Can be either the ID or the
    -- ARN. URLs cannot contain the ARN.
    knowledgeBaseId :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListContents' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'nextToken', 'listContents_nextToken' - The token for the next set of results. Use the value returned in the
-- previous response in the next request to retrieve the next set of
-- results.
--
-- 'maxResults', 'listContents_maxResults' - The maximum number of results to return per page.
--
-- 'knowledgeBaseId', 'listContents_knowledgeBaseId' - The the identifier of the knowledge base. Can be either the ID or the
-- ARN. URLs cannot contain the ARN.
newListContents ::
  -- | 'knowledgeBaseId'
  Prelude.Text ->
  ListContents
newListContents pKnowledgeBaseId_ =
  ListContents'
    { nextToken = Prelude.Nothing,
      maxResults = Prelude.Nothing,
      knowledgeBaseId = pKnowledgeBaseId_
    }

-- | The token for the next set of results. Use the value returned in the
-- previous response in the next request to retrieve the next set of
-- results.
listContents_nextToken :: Lens.Lens' ListContents (Prelude.Maybe Prelude.Text)
listContents_nextToken = Lens.lens (\ListContents' {nextToken} -> nextToken) (\s@ListContents' {} a -> s {nextToken = a} :: ListContents)

-- | The maximum number of results to return per page.
listContents_maxResults :: Lens.Lens' ListContents (Prelude.Maybe Prelude.Natural)
listContents_maxResults = Lens.lens (\ListContents' {maxResults} -> maxResults) (\s@ListContents' {} a -> s {maxResults = a} :: ListContents)

-- | The the identifier of the knowledge base. Can be either the ID or the
-- ARN. URLs cannot contain the ARN.
listContents_knowledgeBaseId :: Lens.Lens' ListContents Prelude.Text
listContents_knowledgeBaseId = Lens.lens (\ListContents' {knowledgeBaseId} -> knowledgeBaseId) (\s@ListContents' {} a -> s {knowledgeBaseId = a} :: ListContents)

instance Core.AWSPager ListContents where
  page rq rs
    | Core.stop
        ( rs
            Lens.^? listContentsResponse_nextToken Prelude.. Lens._Just
        ) =
      Prelude.Nothing
    | Core.stop
        (rs Lens.^. listContentsResponse_contentSummaries) =
      Prelude.Nothing
    | Prelude.otherwise =
      Prelude.Just Prelude.$
        rq
          Prelude.& listContents_nextToken
          Lens..~ rs
          Lens.^? listContentsResponse_nextToken Prelude.. Lens._Just

instance Core.AWSRequest ListContents where
  type AWSResponse ListContents = ListContentsResponse
  request = Request.get defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          ListContentsResponse'
            Prelude.<$> (x Core..?> "nextToken")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
            Prelude.<*> ( x Core..?> "contentSummaries"
                            Core..!@ Prelude.mempty
                        )
      )

instance Prelude.Hashable ListContents

instance Prelude.NFData ListContents

instance Core.ToHeaders ListContents where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToPath ListContents where
  toPath ListContents' {..} =
    Prelude.mconcat
      [ "/knowledgeBases/",
        Core.toBS knowledgeBaseId,
        "/contents"
      ]

instance Core.ToQuery ListContents where
  toQuery ListContents' {..} =
    Prelude.mconcat
      [ "nextToken" Core.=: nextToken,
        "maxResults" Core.=: maxResults
      ]

-- | /See:/ 'newListContentsResponse' smart constructor.
data ListContentsResponse = ListContentsResponse'
  { -- | If there are additional results, this is the token for the next set of
    -- results.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The response's http status code.
    httpStatus :: Prelude.Int,
    -- | Information about the content.
    contentSummaries :: [ContentSummary]
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListContentsResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'nextToken', 'listContentsResponse_nextToken' - If there are additional results, this is the token for the next set of
-- results.
--
-- 'httpStatus', 'listContentsResponse_httpStatus' - The response's http status code.
--
-- 'contentSummaries', 'listContentsResponse_contentSummaries' - Information about the content.
newListContentsResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  ListContentsResponse
newListContentsResponse pHttpStatus_ =
  ListContentsResponse'
    { nextToken = Prelude.Nothing,
      httpStatus = pHttpStatus_,
      contentSummaries = Prelude.mempty
    }

-- | If there are additional results, this is the token for the next set of
-- results.
listContentsResponse_nextToken :: Lens.Lens' ListContentsResponse (Prelude.Maybe Prelude.Text)
listContentsResponse_nextToken = Lens.lens (\ListContentsResponse' {nextToken} -> nextToken) (\s@ListContentsResponse' {} a -> s {nextToken = a} :: ListContentsResponse)

-- | The response's http status code.
listContentsResponse_httpStatus :: Lens.Lens' ListContentsResponse Prelude.Int
listContentsResponse_httpStatus = Lens.lens (\ListContentsResponse' {httpStatus} -> httpStatus) (\s@ListContentsResponse' {} a -> s {httpStatus = a} :: ListContentsResponse)

-- | Information about the content.
listContentsResponse_contentSummaries :: Lens.Lens' ListContentsResponse [ContentSummary]
listContentsResponse_contentSummaries = Lens.lens (\ListContentsResponse' {contentSummaries} -> contentSummaries) (\s@ListContentsResponse' {} a -> s {contentSummaries = a} :: ListContentsResponse) Prelude.. Lens.coerced

instance Prelude.NFData ListContentsResponse
