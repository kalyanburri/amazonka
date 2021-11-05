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
-- Module      : Network.AWS.ChimeSDKMessaging.GetChannelMessage
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Gets the full details of a channel message.
--
-- The x-amz-chime-bearer request header is mandatory. Use the
-- @AppInstanceUserArn@ of the user that makes the API call as the value in
-- the header.
module Network.AWS.ChimeSDKMessaging.GetChannelMessage
  ( -- * Creating a Request
    GetChannelMessage (..),
    newGetChannelMessage,

    -- * Request Lenses
    getChannelMessage_channelArn,
    getChannelMessage_messageId,
    getChannelMessage_chimeBearer,

    -- * Destructuring the Response
    GetChannelMessageResponse (..),
    newGetChannelMessageResponse,

    -- * Response Lenses
    getChannelMessageResponse_channelMessage,
    getChannelMessageResponse_httpStatus,
  )
where

import Network.AWS.ChimeSDKMessaging.Types
import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newGetChannelMessage' smart constructor.
data GetChannelMessage = GetChannelMessage'
  { -- | The ARN of the channel.
    channelArn :: Prelude.Text,
    -- | The ID of the message.
    messageId :: Prelude.Text,
    -- | The @AppInstanceUserArn@ of the user that makes the API call.
    chimeBearer :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetChannelMessage' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'channelArn', 'getChannelMessage_channelArn' - The ARN of the channel.
--
-- 'messageId', 'getChannelMessage_messageId' - The ID of the message.
--
-- 'chimeBearer', 'getChannelMessage_chimeBearer' - The @AppInstanceUserArn@ of the user that makes the API call.
newGetChannelMessage ::
  -- | 'channelArn'
  Prelude.Text ->
  -- | 'messageId'
  Prelude.Text ->
  -- | 'chimeBearer'
  Prelude.Text ->
  GetChannelMessage
newGetChannelMessage
  pChannelArn_
  pMessageId_
  pChimeBearer_ =
    GetChannelMessage'
      { channelArn = pChannelArn_,
        messageId = pMessageId_,
        chimeBearer = pChimeBearer_
      }

-- | The ARN of the channel.
getChannelMessage_channelArn :: Lens.Lens' GetChannelMessage Prelude.Text
getChannelMessage_channelArn = Lens.lens (\GetChannelMessage' {channelArn} -> channelArn) (\s@GetChannelMessage' {} a -> s {channelArn = a} :: GetChannelMessage)

-- | The ID of the message.
getChannelMessage_messageId :: Lens.Lens' GetChannelMessage Prelude.Text
getChannelMessage_messageId = Lens.lens (\GetChannelMessage' {messageId} -> messageId) (\s@GetChannelMessage' {} a -> s {messageId = a} :: GetChannelMessage)

-- | The @AppInstanceUserArn@ of the user that makes the API call.
getChannelMessage_chimeBearer :: Lens.Lens' GetChannelMessage Prelude.Text
getChannelMessage_chimeBearer = Lens.lens (\GetChannelMessage' {chimeBearer} -> chimeBearer) (\s@GetChannelMessage' {} a -> s {chimeBearer = a} :: GetChannelMessage)

instance Core.AWSRequest GetChannelMessage where
  type
    AWSResponse GetChannelMessage =
      GetChannelMessageResponse
  request = Request.get defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          GetChannelMessageResponse'
            Prelude.<$> (x Core..?> "ChannelMessage")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable GetChannelMessage

instance Prelude.NFData GetChannelMessage

instance Core.ToHeaders GetChannelMessage where
  toHeaders GetChannelMessage' {..} =
    Prelude.mconcat
      ["x-amz-chime-bearer" Core.=# chimeBearer]

instance Core.ToPath GetChannelMessage where
  toPath GetChannelMessage' {..} =
    Prelude.mconcat
      [ "/channels/",
        Core.toBS channelArn,
        "/messages/",
        Core.toBS messageId
      ]

instance Core.ToQuery GetChannelMessage where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newGetChannelMessageResponse' smart constructor.
data GetChannelMessageResponse = GetChannelMessageResponse'
  { -- | The details of and content in the message.
    channelMessage :: Prelude.Maybe ChannelMessage,
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetChannelMessageResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'channelMessage', 'getChannelMessageResponse_channelMessage' - The details of and content in the message.
--
-- 'httpStatus', 'getChannelMessageResponse_httpStatus' - The response's http status code.
newGetChannelMessageResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  GetChannelMessageResponse
newGetChannelMessageResponse pHttpStatus_ =
  GetChannelMessageResponse'
    { channelMessage =
        Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | The details of and content in the message.
getChannelMessageResponse_channelMessage :: Lens.Lens' GetChannelMessageResponse (Prelude.Maybe ChannelMessage)
getChannelMessageResponse_channelMessage = Lens.lens (\GetChannelMessageResponse' {channelMessage} -> channelMessage) (\s@GetChannelMessageResponse' {} a -> s {channelMessage = a} :: GetChannelMessageResponse)

-- | The response's http status code.
getChannelMessageResponse_httpStatus :: Lens.Lens' GetChannelMessageResponse Prelude.Int
getChannelMessageResponse_httpStatus = Lens.lens (\GetChannelMessageResponse' {httpStatus} -> httpStatus) (\s@GetChannelMessageResponse' {} a -> s {httpStatus = a} :: GetChannelMessageResponse)

instance Prelude.NFData GetChannelMessageResponse
