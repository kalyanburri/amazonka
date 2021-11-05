{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.AuditManager.Types.AccountStatus
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.AuditManager.Types.AccountStatus
  ( AccountStatus
      ( ..,
        AccountStatus_ACTIVE,
        AccountStatus_INACTIVE,
        AccountStatus_PENDING_ACTIVATION
      ),
  )
where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Prelude as Prelude

newtype AccountStatus = AccountStatus'
  { fromAccountStatus ::
      Core.Text
  }
  deriving stock
    ( Prelude.Show,
      Prelude.Read,
      Prelude.Eq,
      Prelude.Ord,
      Prelude.Generic
    )
  deriving newtype
    ( Prelude.Hashable,
      Prelude.NFData,
      Core.FromText,
      Core.ToText,
      Core.ToByteString,
      Core.ToLog,
      Core.ToHeader,
      Core.ToQuery,
      Core.FromJSON,
      Core.FromJSONKey,
      Core.ToJSON,
      Core.ToJSONKey,
      Core.FromXML,
      Core.ToXML
    )

pattern AccountStatus_ACTIVE :: AccountStatus
pattern AccountStatus_ACTIVE = AccountStatus' "ACTIVE"

pattern AccountStatus_INACTIVE :: AccountStatus
pattern AccountStatus_INACTIVE = AccountStatus' "INACTIVE"

pattern AccountStatus_PENDING_ACTIVATION :: AccountStatus
pattern AccountStatus_PENDING_ACTIVATION = AccountStatus' "PENDING_ACTIVATION"

{-# COMPLETE
  AccountStatus_ACTIVE,
  AccountStatus_INACTIVE,
  AccountStatus_PENDING_ACTIVATION,
  AccountStatus'
  #-}
