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
-- Module      : Amazonka.Config.PutConfigRule
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Adds or updates an Config rule for evaluating whether your Amazon Web
-- Services resources comply with your desired configurations.
--
-- You can use this action for custom Config rules and Config managed
-- rules. A custom Config rule is a rule that you develop and maintain. An
-- Config managed rule is a customizable, predefined rule that Config
-- provides.
--
-- If you are adding a new custom Config rule, you must first create the
-- Lambda function that the rule invokes to evaluate your resources. When
-- you use the @PutConfigRule@ action to add the rule to Config, you must
-- specify the Amazon Resource Name (ARN) that Lambda assigns to the
-- function. Specify the ARN for the @SourceIdentifier@ key. This key is
-- part of the @Source@ object, which is part of the @ConfigRule@ object.
--
-- If you are adding an Config managed rule, specify the rule\'s identifier
-- for the @SourceIdentifier@ key. To reference Config managed rule
-- identifiers, see
-- <https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html About Config managed rules>.
--
-- For any new rule that you add, specify the @ConfigRuleName@ in the
-- @ConfigRule@ object. Do not specify the @ConfigRuleArn@ or the
-- @ConfigRuleId@. These values are generated by Config for new rules.
--
-- If you are updating a rule that you added previously, you can specify
-- the rule by @ConfigRuleName@, @ConfigRuleId@, or @ConfigRuleArn@ in the
-- @ConfigRule@ data type that you use in this request.
--
-- The maximum number of rules that Config supports is 150.
--
-- For information about requesting a rule limit increase, see
-- <http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_config Config Limits>
-- in the /Amazon Web Services General Reference Guide/.
--
-- For more information about developing and using Config rules, see
-- <https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html Evaluating Amazon Web Services resource Configurations with Config>
-- in the /Config Developer Guide/.
module Amazonka.Config.PutConfigRule
  ( -- * Creating a Request
    PutConfigRule (..),
    newPutConfigRule,

    -- * Request Lenses
    putConfigRule_tags,
    putConfigRule_configRule,

    -- * Destructuring the Response
    PutConfigRuleResponse (..),
    newPutConfigRuleResponse,
  )
where

import Amazonka.Config.Types
import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Request as Request
import qualified Amazonka.Response as Response

-- | /See:/ 'newPutConfigRule' smart constructor.
data PutConfigRule = PutConfigRule'
  { -- | An array of tag object.
    tags :: Prelude.Maybe [Tag],
    -- | The rule that you want to add to your account.
    configRule :: ConfigRule
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'PutConfigRule' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'tags', 'putConfigRule_tags' - An array of tag object.
--
-- 'configRule', 'putConfigRule_configRule' - The rule that you want to add to your account.
newPutConfigRule ::
  -- | 'configRule'
  ConfigRule ->
  PutConfigRule
newPutConfigRule pConfigRule_ =
  PutConfigRule'
    { tags = Prelude.Nothing,
      configRule = pConfigRule_
    }

-- | An array of tag object.
putConfigRule_tags :: Lens.Lens' PutConfigRule (Prelude.Maybe [Tag])
putConfigRule_tags = Lens.lens (\PutConfigRule' {tags} -> tags) (\s@PutConfigRule' {} a -> s {tags = a} :: PutConfigRule) Prelude.. Lens.mapping Lens.coerced

-- | The rule that you want to add to your account.
putConfigRule_configRule :: Lens.Lens' PutConfigRule ConfigRule
putConfigRule_configRule = Lens.lens (\PutConfigRule' {configRule} -> configRule) (\s@PutConfigRule' {} a -> s {configRule = a} :: PutConfigRule)

instance Core.AWSRequest PutConfigRule where
  type
    AWSResponse PutConfigRule =
      PutConfigRuleResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveNull PutConfigRuleResponse'

instance Prelude.Hashable PutConfigRule where
  hashWithSalt salt' PutConfigRule' {..} =
    salt' `Prelude.hashWithSalt` configRule
      `Prelude.hashWithSalt` tags

instance Prelude.NFData PutConfigRule where
  rnf PutConfigRule' {..} =
    Prelude.rnf tags
      `Prelude.seq` Prelude.rnf configRule

instance Core.ToHeaders PutConfigRule where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "X-Amz-Target"
              Core.=# ( "StarlingDoveService.PutConfigRule" ::
                          Prelude.ByteString
                      ),
            "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToJSON PutConfigRule where
  toJSON PutConfigRule' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("Tags" Core..=) Prelude.<$> tags,
            Prelude.Just ("ConfigRule" Core..= configRule)
          ]
      )

instance Core.ToPath PutConfigRule where
  toPath = Prelude.const "/"

instance Core.ToQuery PutConfigRule where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newPutConfigRuleResponse' smart constructor.
data PutConfigRuleResponse = PutConfigRuleResponse'
  {
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'PutConfigRuleResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
newPutConfigRuleResponse ::
  PutConfigRuleResponse
newPutConfigRuleResponse = PutConfigRuleResponse'

instance Prelude.NFData PutConfigRuleResponse where
  rnf _ = ()
