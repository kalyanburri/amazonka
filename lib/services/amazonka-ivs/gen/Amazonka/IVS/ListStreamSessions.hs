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
-- Module      : Amazonka.IVS.ListStreamSessions
-- Copyright   : (c) 2013-2022 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Gets a summary of current and previous streams for a specified channel
-- in your account, in the AWS region where the API request is processed.
module Amazonka.IVS.ListStreamSessions
  ( -- * Creating a Request
    ListStreamSessions (..),
    newListStreamSessions,

    -- * Request Lenses
    listStreamSessions_nextToken,
    listStreamSessions_maxResults,
    listStreamSessions_channelArn,

    -- * Destructuring the Response
    ListStreamSessionsResponse (..),
    newListStreamSessionsResponse,

    -- * Response Lenses
    listStreamSessionsResponse_nextToken,
    listStreamSessionsResponse_httpStatus,
    listStreamSessionsResponse_streamSessions,
  )
where

import qualified Amazonka.Core as Core
import Amazonka.IVS.Types
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Request as Request
import qualified Amazonka.Response as Response

-- | /See:/ 'newListStreamSessions' smart constructor.
data ListStreamSessions = ListStreamSessions'
  { -- | The first stream to retrieve. This is used for pagination; see the
    -- @nextToken@ response field.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | Maximum number of streams to return. Default: 100.
    maxResults :: Prelude.Maybe Prelude.Natural,
    -- | Channel ARN used to filter the list.
    channelArn :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListStreamSessions' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'nextToken', 'listStreamSessions_nextToken' - The first stream to retrieve. This is used for pagination; see the
-- @nextToken@ response field.
--
-- 'maxResults', 'listStreamSessions_maxResults' - Maximum number of streams to return. Default: 100.
--
-- 'channelArn', 'listStreamSessions_channelArn' - Channel ARN used to filter the list.
newListStreamSessions ::
  -- | 'channelArn'
  Prelude.Text ->
  ListStreamSessions
newListStreamSessions pChannelArn_ =
  ListStreamSessions'
    { nextToken = Prelude.Nothing,
      maxResults = Prelude.Nothing,
      channelArn = pChannelArn_
    }

-- | The first stream to retrieve. This is used for pagination; see the
-- @nextToken@ response field.
listStreamSessions_nextToken :: Lens.Lens' ListStreamSessions (Prelude.Maybe Prelude.Text)
listStreamSessions_nextToken = Lens.lens (\ListStreamSessions' {nextToken} -> nextToken) (\s@ListStreamSessions' {} a -> s {nextToken = a} :: ListStreamSessions)

-- | Maximum number of streams to return. Default: 100.
listStreamSessions_maxResults :: Lens.Lens' ListStreamSessions (Prelude.Maybe Prelude.Natural)
listStreamSessions_maxResults = Lens.lens (\ListStreamSessions' {maxResults} -> maxResults) (\s@ListStreamSessions' {} a -> s {maxResults = a} :: ListStreamSessions)

-- | Channel ARN used to filter the list.
listStreamSessions_channelArn :: Lens.Lens' ListStreamSessions Prelude.Text
listStreamSessions_channelArn = Lens.lens (\ListStreamSessions' {channelArn} -> channelArn) (\s@ListStreamSessions' {} a -> s {channelArn = a} :: ListStreamSessions)

instance Core.AWSRequest ListStreamSessions where
  type
    AWSResponse ListStreamSessions =
      ListStreamSessionsResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          ListStreamSessionsResponse'
            Prelude.<$> (x Core..?> "nextToken")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
            Prelude.<*> ( x Core..?> "streamSessions"
                            Core..!@ Prelude.mempty
                        )
      )

instance Prelude.Hashable ListStreamSessions where
  hashWithSalt _salt ListStreamSessions' {..} =
    _salt `Prelude.hashWithSalt` nextToken
      `Prelude.hashWithSalt` maxResults
      `Prelude.hashWithSalt` channelArn

instance Prelude.NFData ListStreamSessions where
  rnf ListStreamSessions' {..} =
    Prelude.rnf nextToken
      `Prelude.seq` Prelude.rnf maxResults
      `Prelude.seq` Prelude.rnf channelArn

instance Core.ToHeaders ListStreamSessions where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToJSON ListStreamSessions where
  toJSON ListStreamSessions' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("nextToken" Core..=) Prelude.<$> nextToken,
            ("maxResults" Core..=) Prelude.<$> maxResults,
            Prelude.Just ("channelArn" Core..= channelArn)
          ]
      )

instance Core.ToPath ListStreamSessions where
  toPath = Prelude.const "/ListStreamSessions"

instance Core.ToQuery ListStreamSessions where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newListStreamSessionsResponse' smart constructor.
data ListStreamSessionsResponse = ListStreamSessionsResponse'
  { -- | If there are more streams than @maxResults@, use @nextToken@ in the
    -- request to get the next set.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The response's http status code.
    httpStatus :: Prelude.Int,
    -- | List of stream sessions.
    streamSessions :: [StreamSessionSummary]
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListStreamSessionsResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'nextToken', 'listStreamSessionsResponse_nextToken' - If there are more streams than @maxResults@, use @nextToken@ in the
-- request to get the next set.
--
-- 'httpStatus', 'listStreamSessionsResponse_httpStatus' - The response's http status code.
--
-- 'streamSessions', 'listStreamSessionsResponse_streamSessions' - List of stream sessions.
newListStreamSessionsResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  ListStreamSessionsResponse
newListStreamSessionsResponse pHttpStatus_ =
  ListStreamSessionsResponse'
    { nextToken =
        Prelude.Nothing,
      httpStatus = pHttpStatus_,
      streamSessions = Prelude.mempty
    }

-- | If there are more streams than @maxResults@, use @nextToken@ in the
-- request to get the next set.
listStreamSessionsResponse_nextToken :: Lens.Lens' ListStreamSessionsResponse (Prelude.Maybe Prelude.Text)
listStreamSessionsResponse_nextToken = Lens.lens (\ListStreamSessionsResponse' {nextToken} -> nextToken) (\s@ListStreamSessionsResponse' {} a -> s {nextToken = a} :: ListStreamSessionsResponse)

-- | The response's http status code.
listStreamSessionsResponse_httpStatus :: Lens.Lens' ListStreamSessionsResponse Prelude.Int
listStreamSessionsResponse_httpStatus = Lens.lens (\ListStreamSessionsResponse' {httpStatus} -> httpStatus) (\s@ListStreamSessionsResponse' {} a -> s {httpStatus = a} :: ListStreamSessionsResponse)

-- | List of stream sessions.
listStreamSessionsResponse_streamSessions :: Lens.Lens' ListStreamSessionsResponse [StreamSessionSummary]
listStreamSessionsResponse_streamSessions = Lens.lens (\ListStreamSessionsResponse' {streamSessions} -> streamSessions) (\s@ListStreamSessionsResponse' {} a -> s {streamSessions = a} :: ListStreamSessionsResponse) Prelude.. Lens.coerced

instance Prelude.NFData ListStreamSessionsResponse where
  rnf ListStreamSessionsResponse' {..} =
    Prelude.rnf nextToken
      `Prelude.seq` Prelude.rnf httpStatus
      `Prelude.seq` Prelude.rnf streamSessions
