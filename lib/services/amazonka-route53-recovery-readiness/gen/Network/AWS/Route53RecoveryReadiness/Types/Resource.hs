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
-- Module      : Network.AWS.Route53RecoveryReadiness.Types.Resource
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.Route53RecoveryReadiness.Types.Resource where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import Network.AWS.Route53RecoveryReadiness.Types.DNSTargetResource

-- | The resource element of a ResourceSet
--
-- /See:/ 'newResource' smart constructor.
data Resource = Resource'
  { -- | A list of RecoveryGroup ARNs and\/or Cell ARNs that this resource is
    -- contained within.
    readinessScopes :: Prelude.Maybe [Prelude.Text],
    -- | The ARN of the AWS resource, can be skipped if dnsTargetResource is used
    resourceArn :: Prelude.Maybe Prelude.Text,
    -- | The component id of the resource, generated by the service when
    -- dnsTargetResource is used
    componentId :: Prelude.Maybe Prelude.Text,
    dnsTargetResource :: Prelude.Maybe DNSTargetResource
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'Resource' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'readinessScopes', 'resource_readinessScopes' - A list of RecoveryGroup ARNs and\/or Cell ARNs that this resource is
-- contained within.
--
-- 'resourceArn', 'resource_resourceArn' - The ARN of the AWS resource, can be skipped if dnsTargetResource is used
--
-- 'componentId', 'resource_componentId' - The component id of the resource, generated by the service when
-- dnsTargetResource is used
--
-- 'dnsTargetResource', 'resource_dnsTargetResource' - Undocumented member.
newResource ::
  Resource
newResource =
  Resource'
    { readinessScopes = Prelude.Nothing,
      resourceArn = Prelude.Nothing,
      componentId = Prelude.Nothing,
      dnsTargetResource = Prelude.Nothing
    }

-- | A list of RecoveryGroup ARNs and\/or Cell ARNs that this resource is
-- contained within.
resource_readinessScopes :: Lens.Lens' Resource (Prelude.Maybe [Prelude.Text])
resource_readinessScopes = Lens.lens (\Resource' {readinessScopes} -> readinessScopes) (\s@Resource' {} a -> s {readinessScopes = a} :: Resource) Prelude.. Lens.mapping Lens.coerced

-- | The ARN of the AWS resource, can be skipped if dnsTargetResource is used
resource_resourceArn :: Lens.Lens' Resource (Prelude.Maybe Prelude.Text)
resource_resourceArn = Lens.lens (\Resource' {resourceArn} -> resourceArn) (\s@Resource' {} a -> s {resourceArn = a} :: Resource)

-- | The component id of the resource, generated by the service when
-- dnsTargetResource is used
resource_componentId :: Lens.Lens' Resource (Prelude.Maybe Prelude.Text)
resource_componentId = Lens.lens (\Resource' {componentId} -> componentId) (\s@Resource' {} a -> s {componentId = a} :: Resource)

-- | Undocumented member.
resource_dnsTargetResource :: Lens.Lens' Resource (Prelude.Maybe DNSTargetResource)
resource_dnsTargetResource = Lens.lens (\Resource' {dnsTargetResource} -> dnsTargetResource) (\s@Resource' {} a -> s {dnsTargetResource = a} :: Resource)

instance Core.FromJSON Resource where
  parseJSON =
    Core.withObject
      "Resource"
      ( \x ->
          Resource'
            Prelude.<$> ( x Core..:? "readinessScopes"
                            Core..!= Prelude.mempty
                        )
            Prelude.<*> (x Core..:? "resourceArn")
            Prelude.<*> (x Core..:? "componentId")
            Prelude.<*> (x Core..:? "dnsTargetResource")
      )

instance Prelude.Hashable Resource

instance Prelude.NFData Resource

instance Core.ToJSON Resource where
  toJSON Resource' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("readinessScopes" Core..=)
              Prelude.<$> readinessScopes,
            ("resourceArn" Core..=) Prelude.<$> resourceArn,
            ("componentId" Core..=) Prelude.<$> componentId,
            ("dnsTargetResource" Core..=)
              Prelude.<$> dnsTargetResource
          ]
      )
