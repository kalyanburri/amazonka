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
-- Module      : Amazonka.Inspector2.Types.Severity
-- Copyright   : (c) 2013-2023 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.Inspector2.Types.Severity
  ( Severity
      ( ..,
        Severity_CRITICAL,
        Severity_HIGH,
        Severity_INFORMATIONAL,
        Severity_LOW,
        Severity_MEDIUM,
        Severity_UNTRIAGED
      ),
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Data as Data
import qualified Amazonka.Prelude as Prelude

newtype Severity = Severity'
  { fromSeverity ::
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

pattern Severity_CRITICAL :: Severity
pattern Severity_CRITICAL = Severity' "CRITICAL"

pattern Severity_HIGH :: Severity
pattern Severity_HIGH = Severity' "HIGH"

pattern Severity_INFORMATIONAL :: Severity
pattern Severity_INFORMATIONAL = Severity' "INFORMATIONAL"

pattern Severity_LOW :: Severity
pattern Severity_LOW = Severity' "LOW"

pattern Severity_MEDIUM :: Severity
pattern Severity_MEDIUM = Severity' "MEDIUM"

pattern Severity_UNTRIAGED :: Severity
pattern Severity_UNTRIAGED = Severity' "UNTRIAGED"

{-# COMPLETE
  Severity_CRITICAL,
  Severity_HIGH,
  Severity_INFORMATIONAL,
  Severity_LOW,
  Severity_MEDIUM,
  Severity_UNTRIAGED,
  Severity'
  #-}
