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
-- Module      : Amazonka.Config.Types.FailedRemediationExceptionBatch
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.Config.Types.FailedRemediationExceptionBatch where

import Amazonka.Config.Types.RemediationException
import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude

-- | List of each of the failed remediation exceptions with specific reasons.
--
-- /See:/ 'newFailedRemediationExceptionBatch' smart constructor.
data FailedRemediationExceptionBatch = FailedRemediationExceptionBatch'
  { -- | Returns a failure message. For example, the auto-remediation has failed.
    failureMessage :: Prelude.Maybe Prelude.Text,
    -- | Returns remediation exception resource key object of the failed items.
    failedItems :: Prelude.Maybe [RemediationException]
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'FailedRemediationExceptionBatch' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'failureMessage', 'failedRemediationExceptionBatch_failureMessage' - Returns a failure message. For example, the auto-remediation has failed.
--
-- 'failedItems', 'failedRemediationExceptionBatch_failedItems' - Returns remediation exception resource key object of the failed items.
newFailedRemediationExceptionBatch ::
  FailedRemediationExceptionBatch
newFailedRemediationExceptionBatch =
  FailedRemediationExceptionBatch'
    { failureMessage =
        Prelude.Nothing,
      failedItems = Prelude.Nothing
    }

-- | Returns a failure message. For example, the auto-remediation has failed.
failedRemediationExceptionBatch_failureMessage :: Lens.Lens' FailedRemediationExceptionBatch (Prelude.Maybe Prelude.Text)
failedRemediationExceptionBatch_failureMessage = Lens.lens (\FailedRemediationExceptionBatch' {failureMessage} -> failureMessage) (\s@FailedRemediationExceptionBatch' {} a -> s {failureMessage = a} :: FailedRemediationExceptionBatch)

-- | Returns remediation exception resource key object of the failed items.
failedRemediationExceptionBatch_failedItems :: Lens.Lens' FailedRemediationExceptionBatch (Prelude.Maybe [RemediationException])
failedRemediationExceptionBatch_failedItems = Lens.lens (\FailedRemediationExceptionBatch' {failedItems} -> failedItems) (\s@FailedRemediationExceptionBatch' {} a -> s {failedItems = a} :: FailedRemediationExceptionBatch) Prelude.. Lens.mapping Lens.coerced

instance
  Core.FromJSON
    FailedRemediationExceptionBatch
  where
  parseJSON =
    Core.withObject
      "FailedRemediationExceptionBatch"
      ( \x ->
          FailedRemediationExceptionBatch'
            Prelude.<$> (x Core..:? "FailureMessage")
            Prelude.<*> (x Core..:? "FailedItems" Core..!= Prelude.mempty)
      )

instance
  Prelude.Hashable
    FailedRemediationExceptionBatch
  where
  hashWithSalt
    salt'
    FailedRemediationExceptionBatch' {..} =
      salt' `Prelude.hashWithSalt` failedItems
        `Prelude.hashWithSalt` failureMessage

instance
  Prelude.NFData
    FailedRemediationExceptionBatch
  where
  rnf FailedRemediationExceptionBatch' {..} =
    Prelude.rnf failureMessage
      `Prelude.seq` Prelude.rnf failedItems
