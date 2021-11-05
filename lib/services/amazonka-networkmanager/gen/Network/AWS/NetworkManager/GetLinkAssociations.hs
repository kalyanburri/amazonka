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
-- Module      : Network.AWS.NetworkManager.GetLinkAssociations
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Gets the link associations for a device or a link. Either the device ID
-- or the link ID must be specified.
--
-- This operation returns paginated results.
module Network.AWS.NetworkManager.GetLinkAssociations
  ( -- * Creating a Request
    GetLinkAssociations (..),
    newGetLinkAssociations,

    -- * Request Lenses
    getLinkAssociations_nextToken,
    getLinkAssociations_linkId,
    getLinkAssociations_deviceId,
    getLinkAssociations_maxResults,
    getLinkAssociations_globalNetworkId,

    -- * Destructuring the Response
    GetLinkAssociationsResponse (..),
    newGetLinkAssociationsResponse,

    -- * Response Lenses
    getLinkAssociationsResponse_nextToken,
    getLinkAssociationsResponse_linkAssociations,
    getLinkAssociationsResponse_httpStatus,
  )
where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import Network.AWS.NetworkManager.Types
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newGetLinkAssociations' smart constructor.
data GetLinkAssociations = GetLinkAssociations'
  { -- | The token for the next page of results.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The ID of the link.
    linkId :: Prelude.Maybe Prelude.Text,
    -- | The ID of the device.
    deviceId :: Prelude.Maybe Prelude.Text,
    -- | The maximum number of results to return.
    maxResults :: Prelude.Maybe Prelude.Natural,
    -- | The ID of the global network.
    globalNetworkId :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetLinkAssociations' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'nextToken', 'getLinkAssociations_nextToken' - The token for the next page of results.
--
-- 'linkId', 'getLinkAssociations_linkId' - The ID of the link.
--
-- 'deviceId', 'getLinkAssociations_deviceId' - The ID of the device.
--
-- 'maxResults', 'getLinkAssociations_maxResults' - The maximum number of results to return.
--
-- 'globalNetworkId', 'getLinkAssociations_globalNetworkId' - The ID of the global network.
newGetLinkAssociations ::
  -- | 'globalNetworkId'
  Prelude.Text ->
  GetLinkAssociations
newGetLinkAssociations pGlobalNetworkId_ =
  GetLinkAssociations'
    { nextToken = Prelude.Nothing,
      linkId = Prelude.Nothing,
      deviceId = Prelude.Nothing,
      maxResults = Prelude.Nothing,
      globalNetworkId = pGlobalNetworkId_
    }

-- | The token for the next page of results.
getLinkAssociations_nextToken :: Lens.Lens' GetLinkAssociations (Prelude.Maybe Prelude.Text)
getLinkAssociations_nextToken = Lens.lens (\GetLinkAssociations' {nextToken} -> nextToken) (\s@GetLinkAssociations' {} a -> s {nextToken = a} :: GetLinkAssociations)

-- | The ID of the link.
getLinkAssociations_linkId :: Lens.Lens' GetLinkAssociations (Prelude.Maybe Prelude.Text)
getLinkAssociations_linkId = Lens.lens (\GetLinkAssociations' {linkId} -> linkId) (\s@GetLinkAssociations' {} a -> s {linkId = a} :: GetLinkAssociations)

-- | The ID of the device.
getLinkAssociations_deviceId :: Lens.Lens' GetLinkAssociations (Prelude.Maybe Prelude.Text)
getLinkAssociations_deviceId = Lens.lens (\GetLinkAssociations' {deviceId} -> deviceId) (\s@GetLinkAssociations' {} a -> s {deviceId = a} :: GetLinkAssociations)

-- | The maximum number of results to return.
getLinkAssociations_maxResults :: Lens.Lens' GetLinkAssociations (Prelude.Maybe Prelude.Natural)
getLinkAssociations_maxResults = Lens.lens (\GetLinkAssociations' {maxResults} -> maxResults) (\s@GetLinkAssociations' {} a -> s {maxResults = a} :: GetLinkAssociations)

-- | The ID of the global network.
getLinkAssociations_globalNetworkId :: Lens.Lens' GetLinkAssociations Prelude.Text
getLinkAssociations_globalNetworkId = Lens.lens (\GetLinkAssociations' {globalNetworkId} -> globalNetworkId) (\s@GetLinkAssociations' {} a -> s {globalNetworkId = a} :: GetLinkAssociations)

instance Core.AWSPager GetLinkAssociations where
  page rq rs
    | Core.stop
        ( rs
            Lens.^? getLinkAssociationsResponse_nextToken
              Prelude.. Lens._Just
        ) =
      Prelude.Nothing
    | Core.stop
        ( rs
            Lens.^? getLinkAssociationsResponse_linkAssociations
              Prelude.. Lens._Just
        ) =
      Prelude.Nothing
    | Prelude.otherwise =
      Prelude.Just Prelude.$
        rq
          Prelude.& getLinkAssociations_nextToken
          Lens..~ rs
          Lens.^? getLinkAssociationsResponse_nextToken
            Prelude.. Lens._Just

instance Core.AWSRequest GetLinkAssociations where
  type
    AWSResponse GetLinkAssociations =
      GetLinkAssociationsResponse
  request = Request.get defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          GetLinkAssociationsResponse'
            Prelude.<$> (x Core..?> "NextToken")
            Prelude.<*> ( x Core..?> "LinkAssociations"
                            Core..!@ Prelude.mempty
                        )
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable GetLinkAssociations

instance Prelude.NFData GetLinkAssociations

instance Core.ToHeaders GetLinkAssociations where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToPath GetLinkAssociations where
  toPath GetLinkAssociations' {..} =
    Prelude.mconcat
      [ "/global-networks/",
        Core.toBS globalNetworkId,
        "/link-associations"
      ]

instance Core.ToQuery GetLinkAssociations where
  toQuery GetLinkAssociations' {..} =
    Prelude.mconcat
      [ "nextToken" Core.=: nextToken,
        "linkId" Core.=: linkId,
        "deviceId" Core.=: deviceId,
        "maxResults" Core.=: maxResults
      ]

-- | /See:/ 'newGetLinkAssociationsResponse' smart constructor.
data GetLinkAssociationsResponse = GetLinkAssociationsResponse'
  { -- | The token for the next page of results.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The link associations.
    linkAssociations :: Prelude.Maybe [LinkAssociation],
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetLinkAssociationsResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'nextToken', 'getLinkAssociationsResponse_nextToken' - The token for the next page of results.
--
-- 'linkAssociations', 'getLinkAssociationsResponse_linkAssociations' - The link associations.
--
-- 'httpStatus', 'getLinkAssociationsResponse_httpStatus' - The response's http status code.
newGetLinkAssociationsResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  GetLinkAssociationsResponse
newGetLinkAssociationsResponse pHttpStatus_ =
  GetLinkAssociationsResponse'
    { nextToken =
        Prelude.Nothing,
      linkAssociations = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | The token for the next page of results.
getLinkAssociationsResponse_nextToken :: Lens.Lens' GetLinkAssociationsResponse (Prelude.Maybe Prelude.Text)
getLinkAssociationsResponse_nextToken = Lens.lens (\GetLinkAssociationsResponse' {nextToken} -> nextToken) (\s@GetLinkAssociationsResponse' {} a -> s {nextToken = a} :: GetLinkAssociationsResponse)

-- | The link associations.
getLinkAssociationsResponse_linkAssociations :: Lens.Lens' GetLinkAssociationsResponse (Prelude.Maybe [LinkAssociation])
getLinkAssociationsResponse_linkAssociations = Lens.lens (\GetLinkAssociationsResponse' {linkAssociations} -> linkAssociations) (\s@GetLinkAssociationsResponse' {} a -> s {linkAssociations = a} :: GetLinkAssociationsResponse) Prelude.. Lens.mapping Lens.coerced

-- | The response's http status code.
getLinkAssociationsResponse_httpStatus :: Lens.Lens' GetLinkAssociationsResponse Prelude.Int
getLinkAssociationsResponse_httpStatus = Lens.lens (\GetLinkAssociationsResponse' {httpStatus} -> httpStatus) (\s@GetLinkAssociationsResponse' {} a -> s {httpStatus = a} :: GetLinkAssociationsResponse)

instance Prelude.NFData GetLinkAssociationsResponse
