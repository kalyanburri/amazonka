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
-- Module      : Network.AWS.QuickSight.ListThemeAliases
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Lists all the aliases of a theme.
module Network.AWS.QuickSight.ListThemeAliases
  ( -- * Creating a Request
    ListThemeAliases (..),
    newListThemeAliases,

    -- * Request Lenses
    listThemeAliases_nextToken,
    listThemeAliases_maxResults,
    listThemeAliases_awsAccountId,
    listThemeAliases_themeId,

    -- * Destructuring the Response
    ListThemeAliasesResponse (..),
    newListThemeAliasesResponse,

    -- * Response Lenses
    listThemeAliasesResponse_requestId,
    listThemeAliasesResponse_nextToken,
    listThemeAliasesResponse_themeAliasList,
    listThemeAliasesResponse_status,
  )
where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import Network.AWS.QuickSight.Types
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newListThemeAliases' smart constructor.
data ListThemeAliases = ListThemeAliases'
  { -- | The token for the next set of results, or null if there are no more
    -- results.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The maximum number of results to be returned per request.
    maxResults :: Prelude.Maybe Prelude.Natural,
    -- | The ID of the Amazon Web Services account that contains the theme
    -- aliases that you\'re listing.
    awsAccountId :: Prelude.Text,
    -- | The ID for the theme.
    themeId :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListThemeAliases' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'nextToken', 'listThemeAliases_nextToken' - The token for the next set of results, or null if there are no more
-- results.
--
-- 'maxResults', 'listThemeAliases_maxResults' - The maximum number of results to be returned per request.
--
-- 'awsAccountId', 'listThemeAliases_awsAccountId' - The ID of the Amazon Web Services account that contains the theme
-- aliases that you\'re listing.
--
-- 'themeId', 'listThemeAliases_themeId' - The ID for the theme.
newListThemeAliases ::
  -- | 'awsAccountId'
  Prelude.Text ->
  -- | 'themeId'
  Prelude.Text ->
  ListThemeAliases
newListThemeAliases pAwsAccountId_ pThemeId_ =
  ListThemeAliases'
    { nextToken = Prelude.Nothing,
      maxResults = Prelude.Nothing,
      awsAccountId = pAwsAccountId_,
      themeId = pThemeId_
    }

-- | The token for the next set of results, or null if there are no more
-- results.
listThemeAliases_nextToken :: Lens.Lens' ListThemeAliases (Prelude.Maybe Prelude.Text)
listThemeAliases_nextToken = Lens.lens (\ListThemeAliases' {nextToken} -> nextToken) (\s@ListThemeAliases' {} a -> s {nextToken = a} :: ListThemeAliases)

-- | The maximum number of results to be returned per request.
listThemeAliases_maxResults :: Lens.Lens' ListThemeAliases (Prelude.Maybe Prelude.Natural)
listThemeAliases_maxResults = Lens.lens (\ListThemeAliases' {maxResults} -> maxResults) (\s@ListThemeAliases' {} a -> s {maxResults = a} :: ListThemeAliases)

-- | The ID of the Amazon Web Services account that contains the theme
-- aliases that you\'re listing.
listThemeAliases_awsAccountId :: Lens.Lens' ListThemeAliases Prelude.Text
listThemeAliases_awsAccountId = Lens.lens (\ListThemeAliases' {awsAccountId} -> awsAccountId) (\s@ListThemeAliases' {} a -> s {awsAccountId = a} :: ListThemeAliases)

-- | The ID for the theme.
listThemeAliases_themeId :: Lens.Lens' ListThemeAliases Prelude.Text
listThemeAliases_themeId = Lens.lens (\ListThemeAliases' {themeId} -> themeId) (\s@ListThemeAliases' {} a -> s {themeId = a} :: ListThemeAliases)

instance Core.AWSRequest ListThemeAliases where
  type
    AWSResponse ListThemeAliases =
      ListThemeAliasesResponse
  request = Request.get defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          ListThemeAliasesResponse'
            Prelude.<$> (x Core..?> "RequestId")
            Prelude.<*> (x Core..?> "NextToken")
            Prelude.<*> (x Core..?> "ThemeAliasList" Core..!@ Prelude.mempty)
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable ListThemeAliases

instance Prelude.NFData ListThemeAliases

instance Core.ToHeaders ListThemeAliases where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "Content-Type"
              Core.=# ( "application/x-amz-json-1.0" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToPath ListThemeAliases where
  toPath ListThemeAliases' {..} =
    Prelude.mconcat
      [ "/accounts/",
        Core.toBS awsAccountId,
        "/themes/",
        Core.toBS themeId,
        "/aliases"
      ]

instance Core.ToQuery ListThemeAliases where
  toQuery ListThemeAliases' {..} =
    Prelude.mconcat
      [ "next-token" Core.=: nextToken,
        "max-result" Core.=: maxResults
      ]

-- | /See:/ 'newListThemeAliasesResponse' smart constructor.
data ListThemeAliasesResponse = ListThemeAliasesResponse'
  { -- | The Amazon Web Services request ID for this operation.
    requestId :: Prelude.Maybe Prelude.Text,
    -- | The token for the next set of results, or null if there are no more
    -- results.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | A structure containing the list of the theme\'s aliases.
    themeAliasList :: Prelude.Maybe [ThemeAlias],
    -- | The HTTP status of the request.
    status :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListThemeAliasesResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'requestId', 'listThemeAliasesResponse_requestId' - The Amazon Web Services request ID for this operation.
--
-- 'nextToken', 'listThemeAliasesResponse_nextToken' - The token for the next set of results, or null if there are no more
-- results.
--
-- 'themeAliasList', 'listThemeAliasesResponse_themeAliasList' - A structure containing the list of the theme\'s aliases.
--
-- 'status', 'listThemeAliasesResponse_status' - The HTTP status of the request.
newListThemeAliasesResponse ::
  -- | 'status'
  Prelude.Int ->
  ListThemeAliasesResponse
newListThemeAliasesResponse pStatus_ =
  ListThemeAliasesResponse'
    { requestId =
        Prelude.Nothing,
      nextToken = Prelude.Nothing,
      themeAliasList = Prelude.Nothing,
      status = pStatus_
    }

-- | The Amazon Web Services request ID for this operation.
listThemeAliasesResponse_requestId :: Lens.Lens' ListThemeAliasesResponse (Prelude.Maybe Prelude.Text)
listThemeAliasesResponse_requestId = Lens.lens (\ListThemeAliasesResponse' {requestId} -> requestId) (\s@ListThemeAliasesResponse' {} a -> s {requestId = a} :: ListThemeAliasesResponse)

-- | The token for the next set of results, or null if there are no more
-- results.
listThemeAliasesResponse_nextToken :: Lens.Lens' ListThemeAliasesResponse (Prelude.Maybe Prelude.Text)
listThemeAliasesResponse_nextToken = Lens.lens (\ListThemeAliasesResponse' {nextToken} -> nextToken) (\s@ListThemeAliasesResponse' {} a -> s {nextToken = a} :: ListThemeAliasesResponse)

-- | A structure containing the list of the theme\'s aliases.
listThemeAliasesResponse_themeAliasList :: Lens.Lens' ListThemeAliasesResponse (Prelude.Maybe [ThemeAlias])
listThemeAliasesResponse_themeAliasList = Lens.lens (\ListThemeAliasesResponse' {themeAliasList} -> themeAliasList) (\s@ListThemeAliasesResponse' {} a -> s {themeAliasList = a} :: ListThemeAliasesResponse) Prelude.. Lens.mapping Lens.coerced

-- | The HTTP status of the request.
listThemeAliasesResponse_status :: Lens.Lens' ListThemeAliasesResponse Prelude.Int
listThemeAliasesResponse_status = Lens.lens (\ListThemeAliasesResponse' {status} -> status) (\s@ListThemeAliasesResponse' {} a -> s {status = a} :: ListThemeAliasesResponse)

instance Prelude.NFData ListThemeAliasesResponse
