Scriptname VolkiharKnightEnableChestScript extends ObjectReference
{Enables the chest in Volkihar Cathedral after Touching the Sky is completed}

Quest property DLC1VQ07 auto
ObjectReference property VolkiharKnightLootChest auto

event OnCellAttach()
  if (DLC1VQ07.GetStageDone(200))
    VolkiharKnightLootChest.Enable(true)
  endIf
endEvent
