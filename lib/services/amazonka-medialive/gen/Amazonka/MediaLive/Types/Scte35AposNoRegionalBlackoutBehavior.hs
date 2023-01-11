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
-- Module      : Amazonka.MediaLive.Types.Scte35AposNoRegionalBlackoutBehavior
-- Copyright   : (c) 2013-2023 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.MediaLive.Types.Scte35AposNoRegionalBlackoutBehavior
  ( Scte35AposNoRegionalBlackoutBehavior
      ( ..,
        Scte35AposNoRegionalBlackoutBehavior_FOLLOW,
        Scte35AposNoRegionalBlackoutBehavior_IGNORE
      ),
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Data as Data
import qualified Amazonka.Prelude as Prelude

-- | Scte35 Apos No Regional Blackout Behavior
newtype Scte35AposNoRegionalBlackoutBehavior = Scte35AposNoRegionalBlackoutBehavior'
  { fromScte35AposNoRegionalBlackoutBehavior ::
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

pattern Scte35AposNoRegionalBlackoutBehavior_FOLLOW :: Scte35AposNoRegionalBlackoutBehavior
pattern Scte35AposNoRegionalBlackoutBehavior_FOLLOW = Scte35AposNoRegionalBlackoutBehavior' "FOLLOW"

pattern Scte35AposNoRegionalBlackoutBehavior_IGNORE :: Scte35AposNoRegionalBlackoutBehavior
pattern Scte35AposNoRegionalBlackoutBehavior_IGNORE = Scte35AposNoRegionalBlackoutBehavior' "IGNORE"

{-# COMPLETE
  Scte35AposNoRegionalBlackoutBehavior_FOLLOW,
  Scte35AposNoRegionalBlackoutBehavior_IGNORE,
  Scte35AposNoRegionalBlackoutBehavior'
  #-}
