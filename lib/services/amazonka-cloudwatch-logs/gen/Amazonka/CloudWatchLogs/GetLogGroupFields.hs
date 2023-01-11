{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Amazonka.CloudWatchLogs.GetLogGroupFields
-- Copyright   : (c) 2013-2023 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns a list of the fields that are included in log events in the
-- specified log group. Includes the percentage of log events that contain
-- each field. The search is limited to a time period that you specify.
--
-- In the results, fields that start with @\@@ are fields generated by
-- CloudWatch Logs. For example, @\@timestamp@ is the timestamp of each log
-- event. For more information about the fields that are generated by
-- CloudWatch logs, see
-- <https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData-discoverable-fields.html Supported Logs and Discovered Fields>.
--
-- The response results are sorted by the frequency percentage, starting
-- with the highest percentage.
--
-- If you are using CloudWatch cross-account observability, you can use
-- this operation in a monitoring account and view data from the linked
-- source accounts. For more information, see
-- <https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html CloudWatch cross-account observability>.
module Amazonka.CloudWatchLogs.GetLogGroupFields
  ( -- * Creating a Request
    GetLogGroupFields (..),
    newGetLogGroupFields,

    -- * Request Lenses
    getLogGroupFields_logGroupIdentifier,
    getLogGroupFields_time,
    getLogGroupFields_logGroupName,

    -- * Destructuring the Response
    GetLogGroupFieldsResponse (..),
    newGetLogGroupFieldsResponse,

    -- * Response Lenses
    getLogGroupFieldsResponse_logGroupFields,
    getLogGroupFieldsResponse_httpStatus,
  )
where

import Amazonka.CloudWatchLogs.Types
import qualified Amazonka.Core as Core
import qualified Amazonka.Core.Lens.Internal as Lens
import qualified Amazonka.Data as Data
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Request as Request
import qualified Amazonka.Response as Response

-- | /See:/ 'newGetLogGroupFields' smart constructor.
data GetLogGroupFields = GetLogGroupFields'
  { -- | Specify either the name or ARN of the log group to view. If the log
    -- group is in a source account and you are using a monitoring account, you
    -- must specify the ARN.
    --
    -- If you specify values for both @logGroupName@ and @logGroupIdentifier@,
    -- the action returns an @InvalidParameterException@ error.
    logGroupIdentifier :: Prelude.Maybe Prelude.Text,
    -- | The time to set as the center of the query. If you specify @time@, the
    -- 15 minutes before this time are queries. If you omit @time@, the 8
    -- minutes before and 8 minutes after this time are searched.
    --
    -- The @time@ value is specified as epoch time, which is the number of
    -- seconds since @January 1, 1970, 00:00:00 UTC@.
    time :: Prelude.Maybe Prelude.Natural,
    -- | The name of the log group to search.
    --
    -- If you specify values for both @logGroupName@ and @logGroupIdentifier@,
    -- the action returns an @InvalidParameterException@ error.
    logGroupName :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetLogGroupFields' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'logGroupIdentifier', 'getLogGroupFields_logGroupIdentifier' - Specify either the name or ARN of the log group to view. If the log
-- group is in a source account and you are using a monitoring account, you
-- must specify the ARN.
--
-- If you specify values for both @logGroupName@ and @logGroupIdentifier@,
-- the action returns an @InvalidParameterException@ error.
--
-- 'time', 'getLogGroupFields_time' - The time to set as the center of the query. If you specify @time@, the
-- 15 minutes before this time are queries. If you omit @time@, the 8
-- minutes before and 8 minutes after this time are searched.
--
-- The @time@ value is specified as epoch time, which is the number of
-- seconds since @January 1, 1970, 00:00:00 UTC@.
--
-- 'logGroupName', 'getLogGroupFields_logGroupName' - The name of the log group to search.
--
-- If you specify values for both @logGroupName@ and @logGroupIdentifier@,
-- the action returns an @InvalidParameterException@ error.
newGetLogGroupFields ::
  -- | 'logGroupName'
  Prelude.Text ->
  GetLogGroupFields
newGetLogGroupFields pLogGroupName_ =
  GetLogGroupFields'
    { logGroupIdentifier =
        Prelude.Nothing,
      time = Prelude.Nothing,
      logGroupName = pLogGroupName_
    }

-- | Specify either the name or ARN of the log group to view. If the log
-- group is in a source account and you are using a monitoring account, you
-- must specify the ARN.
--
-- If you specify values for both @logGroupName@ and @logGroupIdentifier@,
-- the action returns an @InvalidParameterException@ error.
getLogGroupFields_logGroupIdentifier :: Lens.Lens' GetLogGroupFields (Prelude.Maybe Prelude.Text)
getLogGroupFields_logGroupIdentifier = Lens.lens (\GetLogGroupFields' {logGroupIdentifier} -> logGroupIdentifier) (\s@GetLogGroupFields' {} a -> s {logGroupIdentifier = a} :: GetLogGroupFields)

-- | The time to set as the center of the query. If you specify @time@, the
-- 15 minutes before this time are queries. If you omit @time@, the 8
-- minutes before and 8 minutes after this time are searched.
--
-- The @time@ value is specified as epoch time, which is the number of
-- seconds since @January 1, 1970, 00:00:00 UTC@.
getLogGroupFields_time :: Lens.Lens' GetLogGroupFields (Prelude.Maybe Prelude.Natural)
getLogGroupFields_time = Lens.lens (\GetLogGroupFields' {time} -> time) (\s@GetLogGroupFields' {} a -> s {time = a} :: GetLogGroupFields)

-- | The name of the log group to search.
--
-- If you specify values for both @logGroupName@ and @logGroupIdentifier@,
-- the action returns an @InvalidParameterException@ error.
getLogGroupFields_logGroupName :: Lens.Lens' GetLogGroupFields Prelude.Text
getLogGroupFields_logGroupName = Lens.lens (\GetLogGroupFields' {logGroupName} -> logGroupName) (\s@GetLogGroupFields' {} a -> s {logGroupName = a} :: GetLogGroupFields)

instance Core.AWSRequest GetLogGroupFields where
  type
    AWSResponse GetLogGroupFields =
      GetLogGroupFieldsResponse
  request overrides =
    Request.postJSON (overrides defaultService)
  response =
    Response.receiveJSON
      ( \s h x ->
          GetLogGroupFieldsResponse'
            Prelude.<$> (x Data..?> "logGroupFields" Core..!@ Prelude.mempty)
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable GetLogGroupFields where
  hashWithSalt _salt GetLogGroupFields' {..} =
    _salt `Prelude.hashWithSalt` logGroupIdentifier
      `Prelude.hashWithSalt` time
      `Prelude.hashWithSalt` logGroupName

instance Prelude.NFData GetLogGroupFields where
  rnf GetLogGroupFields' {..} =
    Prelude.rnf logGroupIdentifier
      `Prelude.seq` Prelude.rnf time
      `Prelude.seq` Prelude.rnf logGroupName

instance Data.ToHeaders GetLogGroupFields where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "X-Amz-Target"
              Data.=# ( "Logs_20140328.GetLogGroupFields" ::
                          Prelude.ByteString
                      ),
            "Content-Type"
              Data.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Data.ToJSON GetLogGroupFields where
  toJSON GetLogGroupFields' {..} =
    Data.object
      ( Prelude.catMaybes
          [ ("logGroupIdentifier" Data..=)
              Prelude.<$> logGroupIdentifier,
            ("time" Data..=) Prelude.<$> time,
            Prelude.Just ("logGroupName" Data..= logGroupName)
          ]
      )

instance Data.ToPath GetLogGroupFields where
  toPath = Prelude.const "/"

instance Data.ToQuery GetLogGroupFields where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newGetLogGroupFieldsResponse' smart constructor.
data GetLogGroupFieldsResponse = GetLogGroupFieldsResponse'
  { -- | The array of fields found in the query. Each object in the array
    -- contains the name of the field, along with the percentage of time it
    -- appeared in the log events that were queried.
    logGroupFields :: Prelude.Maybe [LogGroupField],
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetLogGroupFieldsResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'logGroupFields', 'getLogGroupFieldsResponse_logGroupFields' - The array of fields found in the query. Each object in the array
-- contains the name of the field, along with the percentage of time it
-- appeared in the log events that were queried.
--
-- 'httpStatus', 'getLogGroupFieldsResponse_httpStatus' - The response's http status code.
newGetLogGroupFieldsResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  GetLogGroupFieldsResponse
newGetLogGroupFieldsResponse pHttpStatus_ =
  GetLogGroupFieldsResponse'
    { logGroupFields =
        Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | The array of fields found in the query. Each object in the array
-- contains the name of the field, along with the percentage of time it
-- appeared in the log events that were queried.
getLogGroupFieldsResponse_logGroupFields :: Lens.Lens' GetLogGroupFieldsResponse (Prelude.Maybe [LogGroupField])
getLogGroupFieldsResponse_logGroupFields = Lens.lens (\GetLogGroupFieldsResponse' {logGroupFields} -> logGroupFields) (\s@GetLogGroupFieldsResponse' {} a -> s {logGroupFields = a} :: GetLogGroupFieldsResponse) Prelude.. Lens.mapping Lens.coerced

-- | The response's http status code.
getLogGroupFieldsResponse_httpStatus :: Lens.Lens' GetLogGroupFieldsResponse Prelude.Int
getLogGroupFieldsResponse_httpStatus = Lens.lens (\GetLogGroupFieldsResponse' {httpStatus} -> httpStatus) (\s@GetLogGroupFieldsResponse' {} a -> s {httpStatus = a} :: GetLogGroupFieldsResponse)

instance Prelude.NFData GetLogGroupFieldsResponse where
  rnf GetLogGroupFieldsResponse' {..} =
    Prelude.rnf logGroupFields
      `Prelude.seq` Prelude.rnf httpStatus
