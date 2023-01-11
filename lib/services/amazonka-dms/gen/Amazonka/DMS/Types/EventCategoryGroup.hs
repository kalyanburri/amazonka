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
-- Module      : Amazonka.DMS.Types.EventCategoryGroup
-- Copyright   : (c) 2013-2023 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.DMS.Types.EventCategoryGroup where

import qualified Amazonka.Core as Core
import qualified Amazonka.Core.Lens.Internal as Lens
import qualified Amazonka.Data as Data
import qualified Amazonka.Prelude as Prelude

-- | Lists categories of events subscribed to, and generated by, the
-- applicable DMS resource type. This data type appears in response to the
-- <https://docs.aws.amazon.com/dms/latest/APIReference/API_EventCategoryGroup.html DescribeEventCategories>
-- action.
--
-- /See:/ 'newEventCategoryGroup' smart constructor.
data EventCategoryGroup = EventCategoryGroup'
  { -- | A list of event categories from a source type that you\'ve chosen.
    eventCategories :: Prelude.Maybe [Prelude.Text],
    -- | The type of DMS resource that generates events.
    --
    -- Valid values: replication-instance | replication-server | security-group
    -- | replication-task
    sourceType :: Prelude.Maybe Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'EventCategoryGroup' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'eventCategories', 'eventCategoryGroup_eventCategories' - A list of event categories from a source type that you\'ve chosen.
--
-- 'sourceType', 'eventCategoryGroup_sourceType' - The type of DMS resource that generates events.
--
-- Valid values: replication-instance | replication-server | security-group
-- | replication-task
newEventCategoryGroup ::
  EventCategoryGroup
newEventCategoryGroup =
  EventCategoryGroup'
    { eventCategories =
        Prelude.Nothing,
      sourceType = Prelude.Nothing
    }

-- | A list of event categories from a source type that you\'ve chosen.
eventCategoryGroup_eventCategories :: Lens.Lens' EventCategoryGroup (Prelude.Maybe [Prelude.Text])
eventCategoryGroup_eventCategories = Lens.lens (\EventCategoryGroup' {eventCategories} -> eventCategories) (\s@EventCategoryGroup' {} a -> s {eventCategories = a} :: EventCategoryGroup) Prelude.. Lens.mapping Lens.coerced

-- | The type of DMS resource that generates events.
--
-- Valid values: replication-instance | replication-server | security-group
-- | replication-task
eventCategoryGroup_sourceType :: Lens.Lens' EventCategoryGroup (Prelude.Maybe Prelude.Text)
eventCategoryGroup_sourceType = Lens.lens (\EventCategoryGroup' {sourceType} -> sourceType) (\s@EventCategoryGroup' {} a -> s {sourceType = a} :: EventCategoryGroup)

instance Data.FromJSON EventCategoryGroup where
  parseJSON =
    Data.withObject
      "EventCategoryGroup"
      ( \x ->
          EventCategoryGroup'
            Prelude.<$> ( x Data..:? "EventCategories"
                            Data..!= Prelude.mempty
                        )
            Prelude.<*> (x Data..:? "SourceType")
      )

instance Prelude.Hashable EventCategoryGroup where
  hashWithSalt _salt EventCategoryGroup' {..} =
    _salt `Prelude.hashWithSalt` eventCategories
      `Prelude.hashWithSalt` sourceType

instance Prelude.NFData EventCategoryGroup where
  rnf EventCategoryGroup' {..} =
    Prelude.rnf eventCategories
      `Prelude.seq` Prelude.rnf sourceType
