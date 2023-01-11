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
-- Module      : Amazonka.SageMaker.Types.JobType
-- Copyright   : (c) 2013-2023 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.SageMaker.Types.JobType
  ( JobType
      ( ..,
        JobType_INFERENCE,
        JobType_NOTEBOOK_KERNEL,
        JobType_TRAINING
      ),
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Data as Data
import qualified Amazonka.Prelude as Prelude

newtype JobType = JobType' {fromJobType :: Data.Text}
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

pattern JobType_INFERENCE :: JobType
pattern JobType_INFERENCE = JobType' "INFERENCE"

pattern JobType_NOTEBOOK_KERNEL :: JobType
pattern JobType_NOTEBOOK_KERNEL = JobType' "NOTEBOOK_KERNEL"

pattern JobType_TRAINING :: JobType
pattern JobType_TRAINING = JobType' "TRAINING"

{-# COMPLETE
  JobType_INFERENCE,
  JobType_NOTEBOOK_KERNEL,
  JobType_TRAINING,
  JobType'
  #-}
