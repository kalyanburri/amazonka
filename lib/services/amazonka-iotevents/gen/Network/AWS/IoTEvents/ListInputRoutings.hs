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
-- Module      : Network.AWS.IoTEvents.ListInputRoutings
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Lists one or more input routings.
module Network.AWS.IoTEvents.ListInputRoutings
  ( -- * Creating a Request
    ListInputRoutings (..),
    newListInputRoutings,

    -- * Request Lenses
    listInputRoutings_nextToken,
    listInputRoutings_maxResults,
    listInputRoutings_inputIdentifier,

    -- * Destructuring the Response
    ListInputRoutingsResponse (..),
    newListInputRoutingsResponse,

    -- * Response Lenses
    listInputRoutingsResponse_routedResources,
    listInputRoutingsResponse_nextToken,
    listInputRoutingsResponse_httpStatus,
  )
where

import qualified Network.AWS.Core as Core
import Network.AWS.IoTEvents.Types
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newListInputRoutings' smart constructor.
data ListInputRoutings = ListInputRoutings'
  { -- | The token that you can use to return the next set of results.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The maximum number of results to be returned per request.
    maxResults :: Prelude.Maybe Prelude.Natural,
    -- | The identifer of the routed input.
    inputIdentifier :: InputIdentifier
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListInputRoutings' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'nextToken', 'listInputRoutings_nextToken' - The token that you can use to return the next set of results.
--
-- 'maxResults', 'listInputRoutings_maxResults' - The maximum number of results to be returned per request.
--
-- 'inputIdentifier', 'listInputRoutings_inputIdentifier' - The identifer of the routed input.
newListInputRoutings ::
  -- | 'inputIdentifier'
  InputIdentifier ->
  ListInputRoutings
newListInputRoutings pInputIdentifier_ =
  ListInputRoutings'
    { nextToken = Prelude.Nothing,
      maxResults = Prelude.Nothing,
      inputIdentifier = pInputIdentifier_
    }

-- | The token that you can use to return the next set of results.
listInputRoutings_nextToken :: Lens.Lens' ListInputRoutings (Prelude.Maybe Prelude.Text)
listInputRoutings_nextToken = Lens.lens (\ListInputRoutings' {nextToken} -> nextToken) (\s@ListInputRoutings' {} a -> s {nextToken = a} :: ListInputRoutings)

-- | The maximum number of results to be returned per request.
listInputRoutings_maxResults :: Lens.Lens' ListInputRoutings (Prelude.Maybe Prelude.Natural)
listInputRoutings_maxResults = Lens.lens (\ListInputRoutings' {maxResults} -> maxResults) (\s@ListInputRoutings' {} a -> s {maxResults = a} :: ListInputRoutings)

-- | The identifer of the routed input.
listInputRoutings_inputIdentifier :: Lens.Lens' ListInputRoutings InputIdentifier
listInputRoutings_inputIdentifier = Lens.lens (\ListInputRoutings' {inputIdentifier} -> inputIdentifier) (\s@ListInputRoutings' {} a -> s {inputIdentifier = a} :: ListInputRoutings)

instance Core.AWSRequest ListInputRoutings where
  type
    AWSResponse ListInputRoutings =
      ListInputRoutingsResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          ListInputRoutingsResponse'
            Prelude.<$> ( x Core..?> "routedResources"
                            Core..!@ Prelude.mempty
                        )
            Prelude.<*> (x Core..?> "nextToken")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable ListInputRoutings

instance Prelude.NFData ListInputRoutings

instance Core.ToHeaders ListInputRoutings where
  toHeaders = Prelude.const Prelude.mempty

instance Core.ToJSON ListInputRoutings where
  toJSON ListInputRoutings' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("nextToken" Core..=) Prelude.<$> nextToken,
            ("maxResults" Core..=) Prelude.<$> maxResults,
            Prelude.Just
              ("inputIdentifier" Core..= inputIdentifier)
          ]
      )

instance Core.ToPath ListInputRoutings where
  toPath = Prelude.const "/input-routings"

instance Core.ToQuery ListInputRoutings where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newListInputRoutingsResponse' smart constructor.
data ListInputRoutingsResponse = ListInputRoutingsResponse'
  { -- | Summary information about the routed resources.
    routedResources :: Prelude.Maybe [RoutedResource],
    -- | The token that you can use to return the next set of results, or @null@
    -- if there are no more results.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListInputRoutingsResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'routedResources', 'listInputRoutingsResponse_routedResources' - Summary information about the routed resources.
--
-- 'nextToken', 'listInputRoutingsResponse_nextToken' - The token that you can use to return the next set of results, or @null@
-- if there are no more results.
--
-- 'httpStatus', 'listInputRoutingsResponse_httpStatus' - The response's http status code.
newListInputRoutingsResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  ListInputRoutingsResponse
newListInputRoutingsResponse pHttpStatus_ =
  ListInputRoutingsResponse'
    { routedResources =
        Prelude.Nothing,
      nextToken = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | Summary information about the routed resources.
listInputRoutingsResponse_routedResources :: Lens.Lens' ListInputRoutingsResponse (Prelude.Maybe [RoutedResource])
listInputRoutingsResponse_routedResources = Lens.lens (\ListInputRoutingsResponse' {routedResources} -> routedResources) (\s@ListInputRoutingsResponse' {} a -> s {routedResources = a} :: ListInputRoutingsResponse) Prelude.. Lens.mapping Lens.coerced

-- | The token that you can use to return the next set of results, or @null@
-- if there are no more results.
listInputRoutingsResponse_nextToken :: Lens.Lens' ListInputRoutingsResponse (Prelude.Maybe Prelude.Text)
listInputRoutingsResponse_nextToken = Lens.lens (\ListInputRoutingsResponse' {nextToken} -> nextToken) (\s@ListInputRoutingsResponse' {} a -> s {nextToken = a} :: ListInputRoutingsResponse)

-- | The response's http status code.
listInputRoutingsResponse_httpStatus :: Lens.Lens' ListInputRoutingsResponse Prelude.Int
listInputRoutingsResponse_httpStatus = Lens.lens (\ListInputRoutingsResponse' {httpStatus} -> httpStatus) (\s@ListInputRoutingsResponse' {} a -> s {httpStatus = a} :: ListInputRoutingsResponse)

instance Prelude.NFData ListInputRoutingsResponse
