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
-- Module      : Network.AWS.QLDBSession.Types.ExecuteStatementRequest
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.QLDBSession.Types.ExecuteStatementRequest where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import Network.AWS.QLDBSession.Types.ValueHolder

-- | Specifies a request to execute a statement.
--
-- /See:/ 'newExecuteStatementRequest' smart constructor.
data ExecuteStatementRequest = ExecuteStatementRequest'
  { -- | Specifies the parameters for the parameterized statement in the request.
    parameters :: Prelude.Maybe [ValueHolder],
    -- | Specifies the transaction ID of the request.
    transactionId :: Prelude.Text,
    -- | Specifies the statement of the request.
    statement :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ExecuteStatementRequest' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'parameters', 'executeStatementRequest_parameters' - Specifies the parameters for the parameterized statement in the request.
--
-- 'transactionId', 'executeStatementRequest_transactionId' - Specifies the transaction ID of the request.
--
-- 'statement', 'executeStatementRequest_statement' - Specifies the statement of the request.
newExecuteStatementRequest ::
  -- | 'transactionId'
  Prelude.Text ->
  -- | 'statement'
  Prelude.Text ->
  ExecuteStatementRequest
newExecuteStatementRequest
  pTransactionId_
  pStatement_ =
    ExecuteStatementRequest'
      { parameters =
          Prelude.Nothing,
        transactionId = pTransactionId_,
        statement = pStatement_
      }

-- | Specifies the parameters for the parameterized statement in the request.
executeStatementRequest_parameters :: Lens.Lens' ExecuteStatementRequest (Prelude.Maybe [ValueHolder])
executeStatementRequest_parameters = Lens.lens (\ExecuteStatementRequest' {parameters} -> parameters) (\s@ExecuteStatementRequest' {} a -> s {parameters = a} :: ExecuteStatementRequest) Prelude.. Lens.mapping Lens.coerced

-- | Specifies the transaction ID of the request.
executeStatementRequest_transactionId :: Lens.Lens' ExecuteStatementRequest Prelude.Text
executeStatementRequest_transactionId = Lens.lens (\ExecuteStatementRequest' {transactionId} -> transactionId) (\s@ExecuteStatementRequest' {} a -> s {transactionId = a} :: ExecuteStatementRequest)

-- | Specifies the statement of the request.
executeStatementRequest_statement :: Lens.Lens' ExecuteStatementRequest Prelude.Text
executeStatementRequest_statement = Lens.lens (\ExecuteStatementRequest' {statement} -> statement) (\s@ExecuteStatementRequest' {} a -> s {statement = a} :: ExecuteStatementRequest)

instance Prelude.Hashable ExecuteStatementRequest

instance Prelude.NFData ExecuteStatementRequest

instance Core.ToJSON ExecuteStatementRequest where
  toJSON ExecuteStatementRequest' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("Parameters" Core..=) Prelude.<$> parameters,
            Prelude.Just ("TransactionId" Core..= transactionId),
            Prelude.Just ("Statement" Core..= statement)
          ]
      )
