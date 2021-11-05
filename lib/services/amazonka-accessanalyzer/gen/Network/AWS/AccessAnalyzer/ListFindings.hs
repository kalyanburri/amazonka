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
-- Module      : Network.AWS.AccessAnalyzer.ListFindings
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Retrieves a list of findings generated by the specified analyzer.
--
-- To learn about filter keys that you can use to retrieve a list of
-- findings, see
-- <https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-reference-filter-keys.html IAM Access Analyzer filter keys>
-- in the __IAM User Guide__.
--
-- This operation returns paginated results.
module Network.AWS.AccessAnalyzer.ListFindings
  ( -- * Creating a Request
    ListFindings (..),
    newListFindings,

    -- * Request Lenses
    listFindings_nextToken,
    listFindings_sort,
    listFindings_filter,
    listFindings_maxResults,
    listFindings_analyzerArn,

    -- * Destructuring the Response
    ListFindingsResponse (..),
    newListFindingsResponse,

    -- * Response Lenses
    listFindingsResponse_nextToken,
    listFindingsResponse_httpStatus,
    listFindingsResponse_findings,
  )
where

import Network.AWS.AccessAnalyzer.Types
import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | Retrieves a list of findings generated by the specified analyzer.
--
-- /See:/ 'newListFindings' smart constructor.
data ListFindings = ListFindings'
  { -- | A token used for pagination of results returned.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The sort order for the findings returned.
    sort :: Prelude.Maybe SortCriteria,
    -- | A filter to match for the findings to return.
    filter' :: Prelude.Maybe (Prelude.HashMap Prelude.Text Criterion),
    -- | The maximum number of results to return in the response.
    maxResults :: Prelude.Maybe Prelude.Int,
    -- | The
    -- <https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-getting-started.html#permission-resources ARN of the analyzer>
    -- to retrieve findings from.
    analyzerArn :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListFindings' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'nextToken', 'listFindings_nextToken' - A token used for pagination of results returned.
--
-- 'sort', 'listFindings_sort' - The sort order for the findings returned.
--
-- 'filter'', 'listFindings_filter' - A filter to match for the findings to return.
--
-- 'maxResults', 'listFindings_maxResults' - The maximum number of results to return in the response.
--
-- 'analyzerArn', 'listFindings_analyzerArn' - The
-- <https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-getting-started.html#permission-resources ARN of the analyzer>
-- to retrieve findings from.
newListFindings ::
  -- | 'analyzerArn'
  Prelude.Text ->
  ListFindings
newListFindings pAnalyzerArn_ =
  ListFindings'
    { nextToken = Prelude.Nothing,
      sort = Prelude.Nothing,
      filter' = Prelude.Nothing,
      maxResults = Prelude.Nothing,
      analyzerArn = pAnalyzerArn_
    }

-- | A token used for pagination of results returned.
listFindings_nextToken :: Lens.Lens' ListFindings (Prelude.Maybe Prelude.Text)
listFindings_nextToken = Lens.lens (\ListFindings' {nextToken} -> nextToken) (\s@ListFindings' {} a -> s {nextToken = a} :: ListFindings)

-- | The sort order for the findings returned.
listFindings_sort :: Lens.Lens' ListFindings (Prelude.Maybe SortCriteria)
listFindings_sort = Lens.lens (\ListFindings' {sort} -> sort) (\s@ListFindings' {} a -> s {sort = a} :: ListFindings)

-- | A filter to match for the findings to return.
listFindings_filter :: Lens.Lens' ListFindings (Prelude.Maybe (Prelude.HashMap Prelude.Text Criterion))
listFindings_filter = Lens.lens (\ListFindings' {filter'} -> filter') (\s@ListFindings' {} a -> s {filter' = a} :: ListFindings) Prelude.. Lens.mapping Lens.coerced

-- | The maximum number of results to return in the response.
listFindings_maxResults :: Lens.Lens' ListFindings (Prelude.Maybe Prelude.Int)
listFindings_maxResults = Lens.lens (\ListFindings' {maxResults} -> maxResults) (\s@ListFindings' {} a -> s {maxResults = a} :: ListFindings)

-- | The
-- <https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-getting-started.html#permission-resources ARN of the analyzer>
-- to retrieve findings from.
listFindings_analyzerArn :: Lens.Lens' ListFindings Prelude.Text
listFindings_analyzerArn = Lens.lens (\ListFindings' {analyzerArn} -> analyzerArn) (\s@ListFindings' {} a -> s {analyzerArn = a} :: ListFindings)

instance Core.AWSPager ListFindings where
  page rq rs
    | Core.stop
        ( rs
            Lens.^? listFindingsResponse_nextToken Prelude.. Lens._Just
        ) =
      Prelude.Nothing
    | Core.stop
        (rs Lens.^. listFindingsResponse_findings) =
      Prelude.Nothing
    | Prelude.otherwise =
      Prelude.Just Prelude.$
        rq
          Prelude.& listFindings_nextToken
          Lens..~ rs
          Lens.^? listFindingsResponse_nextToken Prelude.. Lens._Just

instance Core.AWSRequest ListFindings where
  type AWSResponse ListFindings = ListFindingsResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          ListFindingsResponse'
            Prelude.<$> (x Core..?> "nextToken")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
            Prelude.<*> (x Core..?> "findings" Core..!@ Prelude.mempty)
      )

instance Prelude.Hashable ListFindings

instance Prelude.NFData ListFindings

instance Core.ToHeaders ListFindings where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToJSON ListFindings where
  toJSON ListFindings' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("nextToken" Core..=) Prelude.<$> nextToken,
            ("sort" Core..=) Prelude.<$> sort,
            ("filter" Core..=) Prelude.<$> filter',
            ("maxResults" Core..=) Prelude.<$> maxResults,
            Prelude.Just ("analyzerArn" Core..= analyzerArn)
          ]
      )

instance Core.ToPath ListFindings where
  toPath = Prelude.const "/finding"

instance Core.ToQuery ListFindings where
  toQuery = Prelude.const Prelude.mempty

-- | The response to the request.
--
-- /See:/ 'newListFindingsResponse' smart constructor.
data ListFindingsResponse = ListFindingsResponse'
  { -- | A token used for pagination of results returned.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The response's http status code.
    httpStatus :: Prelude.Int,
    -- | A list of findings retrieved from the analyzer that match the filter
    -- criteria specified, if any.
    findings :: [FindingSummary]
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListFindingsResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'nextToken', 'listFindingsResponse_nextToken' - A token used for pagination of results returned.
--
-- 'httpStatus', 'listFindingsResponse_httpStatus' - The response's http status code.
--
-- 'findings', 'listFindingsResponse_findings' - A list of findings retrieved from the analyzer that match the filter
-- criteria specified, if any.
newListFindingsResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  ListFindingsResponse
newListFindingsResponse pHttpStatus_ =
  ListFindingsResponse'
    { nextToken = Prelude.Nothing,
      httpStatus = pHttpStatus_,
      findings = Prelude.mempty
    }

-- | A token used for pagination of results returned.
listFindingsResponse_nextToken :: Lens.Lens' ListFindingsResponse (Prelude.Maybe Prelude.Text)
listFindingsResponse_nextToken = Lens.lens (\ListFindingsResponse' {nextToken} -> nextToken) (\s@ListFindingsResponse' {} a -> s {nextToken = a} :: ListFindingsResponse)

-- | The response's http status code.
listFindingsResponse_httpStatus :: Lens.Lens' ListFindingsResponse Prelude.Int
listFindingsResponse_httpStatus = Lens.lens (\ListFindingsResponse' {httpStatus} -> httpStatus) (\s@ListFindingsResponse' {} a -> s {httpStatus = a} :: ListFindingsResponse)

-- | A list of findings retrieved from the analyzer that match the filter
-- criteria specified, if any.
listFindingsResponse_findings :: Lens.Lens' ListFindingsResponse [FindingSummary]
listFindingsResponse_findings = Lens.lens (\ListFindingsResponse' {findings} -> findings) (\s@ListFindingsResponse' {} a -> s {findings = a} :: ListFindingsResponse) Prelude.. Lens.coerced

instance Prelude.NFData ListFindingsResponse
