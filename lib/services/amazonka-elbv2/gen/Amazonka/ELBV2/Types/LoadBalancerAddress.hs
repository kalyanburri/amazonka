{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Amazonka.ELBV2.Types.LoadBalancerAddress
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.ELBV2.Types.LoadBalancerAddress where

import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude

-- | Information about a static IP address for a load balancer.
--
-- /See:/ 'newLoadBalancerAddress' smart constructor.
data LoadBalancerAddress = LoadBalancerAddress'
  { -- | [Network Load Balancers] The IPv6 address.
    iPv6Address :: Prelude.Maybe Prelude.Text,
    -- | The static IP address.
    ipAddress :: Prelude.Maybe Prelude.Text,
    -- | [Network Load Balancers] The allocation ID of the Elastic IP address for
    -- an internal-facing load balancer.
    allocationId :: Prelude.Maybe Prelude.Text,
    -- | [Network Load Balancers] The private IPv4 address for an internal load
    -- balancer.
    privateIPv4Address :: Prelude.Maybe Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'LoadBalancerAddress' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'iPv6Address', 'loadBalancerAddress_iPv6Address' - [Network Load Balancers] The IPv6 address.
--
-- 'ipAddress', 'loadBalancerAddress_ipAddress' - The static IP address.
--
-- 'allocationId', 'loadBalancerAddress_allocationId' - [Network Load Balancers] The allocation ID of the Elastic IP address for
-- an internal-facing load balancer.
--
-- 'privateIPv4Address', 'loadBalancerAddress_privateIPv4Address' - [Network Load Balancers] The private IPv4 address for an internal load
-- balancer.
newLoadBalancerAddress ::
  LoadBalancerAddress
newLoadBalancerAddress =
  LoadBalancerAddress'
    { iPv6Address = Prelude.Nothing,
      ipAddress = Prelude.Nothing,
      allocationId = Prelude.Nothing,
      privateIPv4Address = Prelude.Nothing
    }

-- | [Network Load Balancers] The IPv6 address.
loadBalancerAddress_iPv6Address :: Lens.Lens' LoadBalancerAddress (Prelude.Maybe Prelude.Text)
loadBalancerAddress_iPv6Address = Lens.lens (\LoadBalancerAddress' {iPv6Address} -> iPv6Address) (\s@LoadBalancerAddress' {} a -> s {iPv6Address = a} :: LoadBalancerAddress)

-- | The static IP address.
loadBalancerAddress_ipAddress :: Lens.Lens' LoadBalancerAddress (Prelude.Maybe Prelude.Text)
loadBalancerAddress_ipAddress = Lens.lens (\LoadBalancerAddress' {ipAddress} -> ipAddress) (\s@LoadBalancerAddress' {} a -> s {ipAddress = a} :: LoadBalancerAddress)

-- | [Network Load Balancers] The allocation ID of the Elastic IP address for
-- an internal-facing load balancer.
loadBalancerAddress_allocationId :: Lens.Lens' LoadBalancerAddress (Prelude.Maybe Prelude.Text)
loadBalancerAddress_allocationId = Lens.lens (\LoadBalancerAddress' {allocationId} -> allocationId) (\s@LoadBalancerAddress' {} a -> s {allocationId = a} :: LoadBalancerAddress)

-- | [Network Load Balancers] The private IPv4 address for an internal load
-- balancer.
loadBalancerAddress_privateIPv4Address :: Lens.Lens' LoadBalancerAddress (Prelude.Maybe Prelude.Text)
loadBalancerAddress_privateIPv4Address = Lens.lens (\LoadBalancerAddress' {privateIPv4Address} -> privateIPv4Address) (\s@LoadBalancerAddress' {} a -> s {privateIPv4Address = a} :: LoadBalancerAddress)

instance Core.FromXML LoadBalancerAddress where
  parseXML x =
    LoadBalancerAddress'
      Prelude.<$> (x Core..@? "IPv6Address")
      Prelude.<*> (x Core..@? "IpAddress")
      Prelude.<*> (x Core..@? "AllocationId")
      Prelude.<*> (x Core..@? "PrivateIPv4Address")

instance Prelude.Hashable LoadBalancerAddress where
  hashWithSalt salt' LoadBalancerAddress' {..} =
    salt' `Prelude.hashWithSalt` privateIPv4Address
      `Prelude.hashWithSalt` allocationId
      `Prelude.hashWithSalt` ipAddress
      `Prelude.hashWithSalt` iPv6Address

instance Prelude.NFData LoadBalancerAddress where
  rnf LoadBalancerAddress' {..} =
    Prelude.rnf iPv6Address
      `Prelude.seq` Prelude.rnf privateIPv4Address
      `Prelude.seq` Prelude.rnf allocationId
      `Prelude.seq` Prelude.rnf ipAddress
