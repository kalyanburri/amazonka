{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.CloudControl.Waiters
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.CloudControl.Waiters where

import Network.AWS.CloudControl.GetResourceRequestStatus
import Network.AWS.CloudControl.Lens
import Network.AWS.CloudControl.Types
import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude

-- | Polls 'Network.AWS.CloudControl.GetResourceRequestStatus' every 5 seconds until a successful state is reached. An error is returned after 720 failed checks.
newResourceRequestSuccess :: Core.Wait GetResourceRequestStatus
newResourceRequestSuccess =
  Core.Wait
    { Core._waitName =
        "ResourceRequestSuccess",
      Core._waitAttempts = 720,
      Core._waitDelay = 5,
      Core._waitAcceptors =
        [ Core.matchAll
            "SUCCESS"
            Core.AcceptSuccess
            ( getResourceRequestStatusResponse_progressEvent
                Prelude.. Lens._Just
                Prelude.. progressEvent_operationStatus
                Prelude.. Lens._Just
                Prelude.. Lens.to Core.toTextCI
            ),
          Core.matchAll
            "FAILED"
            Core.AcceptFailure
            ( getResourceRequestStatusResponse_progressEvent
                Prelude.. Lens._Just
                Prelude.. progressEvent_operationStatus
                Prelude.. Lens._Just
                Prelude.. Lens.to Core.toTextCI
            ),
          Core.matchAll
            "CANCEL_COMPLETE"
            Core.AcceptFailure
            ( getResourceRequestStatusResponse_progressEvent
                Prelude.. Lens._Just
                Prelude.. progressEvent_operationStatus
                Prelude.. Lens._Just
                Prelude.. Lens.to Core.toTextCI
            )
        ]
    }
