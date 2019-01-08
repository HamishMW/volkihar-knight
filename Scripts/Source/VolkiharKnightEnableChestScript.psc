Scriptname VolkiharKnightEnableChestScript extends ObjectReference
{Enables the chest in Volkihar Cathedral after Touching the Sky is completed}

Quest property DLC1VQ07 auto
ObjectReference property VolkiharKnightLootChest auto

event OnCellAttach()
  Debug.Notification("Chest attached to cell")
  if (DLC1VQ07.GetStageDone(200))
		Debug.Notification("Chest enabled")
    VolkiharKnightLootChest.Enable(true)
	else
		Debug.Notification("Nope to chest")
  endIf
endEvent
