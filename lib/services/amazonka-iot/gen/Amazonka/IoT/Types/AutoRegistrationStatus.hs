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
-- Module      : Amazonka.IoT.Types.AutoRegistrationStatus
-- Copyright   : (c) 2013-2023 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.IoT.Types.AutoRegistrationStatus
  ( AutoRegistrationStatus
      ( ..,
        AutoRegistrationStatus_DISABLE,
        AutoRegistrationStatus_ENABLE
      ),
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Data as Data
import qualified Amazonka.Prelude as Prelude

newtype AutoRegistrationStatus = AutoRegistrationStatus'
  { fromAutoRegistrationStatus ::
      Data.Text
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
      Data.FromText,
      Data.ToText,
      Data.ToByteString,
      Data.ToLog,
      Data.ToHeader,
      Data.ToQuery,
      Data.FromJSON,
      Data.FromJSONKey,
      Data.ToJSON,
      Data.ToJSONKey,
      Data.FromXML,
      Data.ToXML
    )

pattern AutoRegistrationStatus_DISABLE :: AutoRegistrationStatus
pattern AutoRegistrationStatus_DISABLE = AutoRegistrationStatus' "DISABLE"

pattern AutoRegistrationStatus_ENABLE :: AutoRegistrationStatus
pattern AutoRegistrationStatus_ENABLE = AutoRegistrationStatus' "ENABLE"

{-# COMPLETE
  AutoRegistrationStatus_DISABLE,
  AutoRegistrationStatus_ENABLE,
  AutoRegistrationStatus'
  #-}
