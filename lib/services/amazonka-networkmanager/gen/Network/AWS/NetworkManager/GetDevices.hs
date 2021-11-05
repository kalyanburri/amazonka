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
-- Module      : Network.AWS.NetworkManager.GetDevices
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Gets information about one or more of your devices in a global network.
--
-- This operation returns paginated results.
module Network.AWS.NetworkManager.GetDevices
  ( -- * Creating a Request
    GetDevices (..),
    newGetDevices,

    -- * Request Lenses
    getDevices_deviceIds,
    getDevices_nextToken,
    getDevices_siteId,
    getDevices_maxResults,
    getDevices_globalNetworkId,

    -- * Destructuring the Response
    GetDevicesResponse (..),
    newGetDevicesResponse,

    -- * Response Lenses
    getDevicesResponse_nextToken,
    getDevicesResponse_devices,
    getDevicesResponse_httpStatus,
  )
where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import Network.AWS.NetworkManager.Types
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newGetDevices' smart constructor.
data GetDevices = GetDevices'
  { -- | One or more device IDs. The maximum is 10.
    deviceIds :: Prelude.Maybe [Prelude.Text],
    -- | The token for the next page of results.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The ID of the site.
    siteId :: Prelude.Maybe Prelude.Text,
    -- | The maximum number of results to return.
    maxResults :: Prelude.Maybe Prelude.Natural,
    -- | The ID of the global network.
    globalNetworkId :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetDevices' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'deviceIds', 'getDevices_deviceIds' - One or more device IDs. The maximum is 10.
--
-- 'nextToken', 'getDevices_nextToken' - The token for the next page of results.
--
-- 'siteId', 'getDevices_siteId' - The ID of the site.
--
-- 'maxResults', 'getDevices_maxResults' - The maximum number of results to return.
--
-- 'globalNetworkId', 'getDevices_globalNetworkId' - The ID of the global network.
newGetDevices ::
  -- | 'globalNetworkId'
  Prelude.Text ->
  GetDevices
newGetDevices pGlobalNetworkId_ =
  GetDevices'
    { deviceIds = Prelude.Nothing,
      nextToken = Prelude.Nothing,
      siteId = Prelude.Nothing,
      maxResults = Prelude.Nothing,
      globalNetworkId = pGlobalNetworkId_
    }

-- | One or more device IDs. The maximum is 10.
getDevices_deviceIds :: Lens.Lens' GetDevices (Prelude.Maybe [Prelude.Text])
getDevices_deviceIds = Lens.lens (\GetDevices' {deviceIds} -> deviceIds) (\s@GetDevices' {} a -> s {deviceIds = a} :: GetDevices) Prelude.. Lens.mapping Lens.coerced

-- | The token for the next page of results.
getDevices_nextToken :: Lens.Lens' GetDevices (Prelude.Maybe Prelude.Text)
getDevices_nextToken = Lens.lens (\GetDevices' {nextToken} -> nextToken) (\s@GetDevices' {} a -> s {nextToken = a} :: GetDevices)

-- | The ID of the site.
getDevices_siteId :: Lens.Lens' GetDevices (Prelude.Maybe Prelude.Text)
getDevices_siteId = Lens.lens (\GetDevices' {siteId} -> siteId) (\s@GetDevices' {} a -> s {siteId = a} :: GetDevices)

-- | The maximum number of results to return.
getDevices_maxResults :: Lens.Lens' GetDevices (Prelude.Maybe Prelude.Natural)
getDevices_maxResults = Lens.lens (\GetDevices' {maxResults} -> maxResults) (\s@GetDevices' {} a -> s {maxResults = a} :: GetDevices)

-- | The ID of the global network.
getDevices_globalNetworkId :: Lens.Lens' GetDevices Prelude.Text
getDevices_globalNetworkId = Lens.lens (\GetDevices' {globalNetworkId} -> globalNetworkId) (\s@GetDevices' {} a -> s {globalNetworkId = a} :: GetDevices)

instance Core.AWSPager GetDevices where
  page rq rs
    | Core.stop
        ( rs
            Lens.^? getDevicesResponse_nextToken Prelude.. Lens._Just
        ) =
      Prelude.Nothing
    | Core.stop
        ( rs
            Lens.^? getDevicesResponse_devices Prelude.. Lens._Just
        ) =
      Prelude.Nothing
    | Prelude.otherwise =
      Prelude.Just Prelude.$
        rq
          Prelude.& getDevices_nextToken
          Lens..~ rs
          Lens.^? getDevicesResponse_nextToken Prelude.. Lens._Just

instance Core.AWSRequest GetDevices where
  type AWSResponse GetDevices = GetDevicesResponse
  request = Request.get defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          GetDevicesResponse'
            Prelude.<$> (x Core..?> "NextToken")
            Prelude.<*> (x Core..?> "Devices" Core..!@ Prelude.mempty)
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable GetDevices

instance Prelude.NFData GetDevices

instance Core.ToHeaders GetDevices where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToPath GetDevices where
  toPath GetDevices' {..} =
    Prelude.mconcat
      [ "/global-networks/",
        Core.toBS globalNetworkId,
        "/devices"
      ]

instance Core.ToQuery GetDevices where
  toQuery GetDevices' {..} =
    Prelude.mconcat
      [ "deviceIds"
          Core.=: Core.toQuery
            (Core.toQueryList "member" Prelude.<$> deviceIds),
        "nextToken" Core.=: nextToken,
        "siteId" Core.=: siteId,
        "maxResults" Core.=: maxResults
      ]

-- | /See:/ 'newGetDevicesResponse' smart constructor.
data GetDevicesResponse = GetDevicesResponse'
  { -- | The token for the next page of results.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The devices.
    devices :: Prelude.Maybe [Device],
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetDevicesResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'nextToken', 'getDevicesResponse_nextToken' - The token for the next page of results.
--
-- 'devices', 'getDevicesResponse_devices' - The devices.
--
-- 'httpStatus', 'getDevicesResponse_httpStatus' - The response's http status code.
newGetDevicesResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  GetDevicesResponse
newGetDevicesResponse pHttpStatus_ =
  GetDevicesResponse'
    { nextToken = Prelude.Nothing,
      devices = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | The token for the next page of results.
getDevicesResponse_nextToken :: Lens.Lens' GetDevicesResponse (Prelude.Maybe Prelude.Text)
getDevicesResponse_nextToken = Lens.lens (\GetDevicesResponse' {nextToken} -> nextToken) (\s@GetDevicesResponse' {} a -> s {nextToken = a} :: GetDevicesResponse)

-- | The devices.
getDevicesResponse_devices :: Lens.Lens' GetDevicesResponse (Prelude.Maybe [Device])
getDevicesResponse_devices = Lens.lens (\GetDevicesResponse' {devices} -> devices) (\s@GetDevicesResponse' {} a -> s {devices = a} :: GetDevicesResponse) Prelude.. Lens.mapping Lens.coerced

-- | The response's http status code.
getDevicesResponse_httpStatus :: Lens.Lens' GetDevicesResponse Prelude.Int
getDevicesResponse_httpStatus = Lens.lens (\GetDevicesResponse' {httpStatus} -> httpStatus) (\s@GetDevicesResponse' {} a -> s {httpStatus = a} :: GetDevicesResponse)

instance Prelude.NFData GetDevicesResponse
