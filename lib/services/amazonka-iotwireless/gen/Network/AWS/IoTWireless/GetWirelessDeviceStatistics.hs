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
-- Module      : Network.AWS.IoTWireless.GetWirelessDeviceStatistics
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Gets operating information about a wireless device.
module Network.AWS.IoTWireless.GetWirelessDeviceStatistics
  ( -- * Creating a Request
    GetWirelessDeviceStatistics (..),
    newGetWirelessDeviceStatistics,

    -- * Request Lenses
    getWirelessDeviceStatistics_wirelessDeviceId,

    -- * Destructuring the Response
    GetWirelessDeviceStatisticsResponse (..),
    newGetWirelessDeviceStatisticsResponse,

    -- * Response Lenses
    getWirelessDeviceStatisticsResponse_sidewalk,
    getWirelessDeviceStatisticsResponse_loRaWAN,
    getWirelessDeviceStatisticsResponse_lastUplinkReceivedAt,
    getWirelessDeviceStatisticsResponse_wirelessDeviceId,
    getWirelessDeviceStatisticsResponse_httpStatus,
  )
where

import qualified Network.AWS.Core as Core
import Network.AWS.IoTWireless.Types
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newGetWirelessDeviceStatistics' smart constructor.
data GetWirelessDeviceStatistics = GetWirelessDeviceStatistics'
  { -- | The ID of the wireless device for which to get the data.
    wirelessDeviceId :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetWirelessDeviceStatistics' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'wirelessDeviceId', 'getWirelessDeviceStatistics_wirelessDeviceId' - The ID of the wireless device for which to get the data.
newGetWirelessDeviceStatistics ::
  -- | 'wirelessDeviceId'
  Prelude.Text ->
  GetWirelessDeviceStatistics
newGetWirelessDeviceStatistics pWirelessDeviceId_ =
  GetWirelessDeviceStatistics'
    { wirelessDeviceId =
        pWirelessDeviceId_
    }

-- | The ID of the wireless device for which to get the data.
getWirelessDeviceStatistics_wirelessDeviceId :: Lens.Lens' GetWirelessDeviceStatistics Prelude.Text
getWirelessDeviceStatistics_wirelessDeviceId = Lens.lens (\GetWirelessDeviceStatistics' {wirelessDeviceId} -> wirelessDeviceId) (\s@GetWirelessDeviceStatistics' {} a -> s {wirelessDeviceId = a} :: GetWirelessDeviceStatistics)

instance Core.AWSRequest GetWirelessDeviceStatistics where
  type
    AWSResponse GetWirelessDeviceStatistics =
      GetWirelessDeviceStatisticsResponse
  request = Request.get defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          GetWirelessDeviceStatisticsResponse'
            Prelude.<$> (x Core..?> "Sidewalk")
            Prelude.<*> (x Core..?> "LoRaWAN")
            Prelude.<*> (x Core..?> "LastUplinkReceivedAt")
            Prelude.<*> (x Core..?> "WirelessDeviceId")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable GetWirelessDeviceStatistics

instance Prelude.NFData GetWirelessDeviceStatistics

instance Core.ToHeaders GetWirelessDeviceStatistics where
  toHeaders = Prelude.const Prelude.mempty

instance Core.ToPath GetWirelessDeviceStatistics where
  toPath GetWirelessDeviceStatistics' {..} =
    Prelude.mconcat
      [ "/wireless-devices/",
        Core.toBS wirelessDeviceId,
        "/statistics"
      ]

instance Core.ToQuery GetWirelessDeviceStatistics where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newGetWirelessDeviceStatisticsResponse' smart constructor.
data GetWirelessDeviceStatisticsResponse = GetWirelessDeviceStatisticsResponse'
  { -- | MetaData for Sidewalk device.
    sidewalk :: Prelude.Maybe SidewalkDeviceMetadata,
    -- | Information about the wireless device\'s operations.
    loRaWAN :: Prelude.Maybe LoRaWANDeviceMetadata,
    -- | The date and time when the most recent uplink was received.
    lastUplinkReceivedAt :: Prelude.Maybe Prelude.Text,
    -- | The ID of the wireless device.
    wirelessDeviceId :: Prelude.Maybe Prelude.Text,
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetWirelessDeviceStatisticsResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'sidewalk', 'getWirelessDeviceStatisticsResponse_sidewalk' - MetaData for Sidewalk device.
--
-- 'loRaWAN', 'getWirelessDeviceStatisticsResponse_loRaWAN' - Information about the wireless device\'s operations.
--
-- 'lastUplinkReceivedAt', 'getWirelessDeviceStatisticsResponse_lastUplinkReceivedAt' - The date and time when the most recent uplink was received.
--
-- 'wirelessDeviceId', 'getWirelessDeviceStatisticsResponse_wirelessDeviceId' - The ID of the wireless device.
--
-- 'httpStatus', 'getWirelessDeviceStatisticsResponse_httpStatus' - The response's http status code.
newGetWirelessDeviceStatisticsResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  GetWirelessDeviceStatisticsResponse
newGetWirelessDeviceStatisticsResponse pHttpStatus_ =
  GetWirelessDeviceStatisticsResponse'
    { sidewalk =
        Prelude.Nothing,
      loRaWAN = Prelude.Nothing,
      lastUplinkReceivedAt = Prelude.Nothing,
      wirelessDeviceId = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | MetaData for Sidewalk device.
getWirelessDeviceStatisticsResponse_sidewalk :: Lens.Lens' GetWirelessDeviceStatisticsResponse (Prelude.Maybe SidewalkDeviceMetadata)
getWirelessDeviceStatisticsResponse_sidewalk = Lens.lens (\GetWirelessDeviceStatisticsResponse' {sidewalk} -> sidewalk) (\s@GetWirelessDeviceStatisticsResponse' {} a -> s {sidewalk = a} :: GetWirelessDeviceStatisticsResponse)

-- | Information about the wireless device\'s operations.
getWirelessDeviceStatisticsResponse_loRaWAN :: Lens.Lens' GetWirelessDeviceStatisticsResponse (Prelude.Maybe LoRaWANDeviceMetadata)
getWirelessDeviceStatisticsResponse_loRaWAN = Lens.lens (\GetWirelessDeviceStatisticsResponse' {loRaWAN} -> loRaWAN) (\s@GetWirelessDeviceStatisticsResponse' {} a -> s {loRaWAN = a} :: GetWirelessDeviceStatisticsResponse)

-- | The date and time when the most recent uplink was received.
getWirelessDeviceStatisticsResponse_lastUplinkReceivedAt :: Lens.Lens' GetWirelessDeviceStatisticsResponse (Prelude.Maybe Prelude.Text)
getWirelessDeviceStatisticsResponse_lastUplinkReceivedAt = Lens.lens (\GetWirelessDeviceStatisticsResponse' {lastUplinkReceivedAt} -> lastUplinkReceivedAt) (\s@GetWirelessDeviceStatisticsResponse' {} a -> s {lastUplinkReceivedAt = a} :: GetWirelessDeviceStatisticsResponse)

-- | The ID of the wireless device.
getWirelessDeviceStatisticsResponse_wirelessDeviceId :: Lens.Lens' GetWirelessDeviceStatisticsResponse (Prelude.Maybe Prelude.Text)
getWirelessDeviceStatisticsResponse_wirelessDeviceId = Lens.lens (\GetWirelessDeviceStatisticsResponse' {wirelessDeviceId} -> wirelessDeviceId) (\s@GetWirelessDeviceStatisticsResponse' {} a -> s {wirelessDeviceId = a} :: GetWirelessDeviceStatisticsResponse)

-- | The response's http status code.
getWirelessDeviceStatisticsResponse_httpStatus :: Lens.Lens' GetWirelessDeviceStatisticsResponse Prelude.Int
getWirelessDeviceStatisticsResponse_httpStatus = Lens.lens (\GetWirelessDeviceStatisticsResponse' {httpStatus} -> httpStatus) (\s@GetWirelessDeviceStatisticsResponse' {} a -> s {httpStatus = a} :: GetWirelessDeviceStatisticsResponse)

instance
  Prelude.NFData
    GetWirelessDeviceStatisticsResponse
