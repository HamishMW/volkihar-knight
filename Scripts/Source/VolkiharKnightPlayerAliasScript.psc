ScriptName VolkiharKnightPlayerAliasScript extends ReferenceAlias
{Perform maintenance on first load}

VolkiharKnightUpdateScript Property QuestScript Auto

Event OnPlayerLoadGame()
  Debug.Notification("alias onload")
	QuestScript.Maintenance()
EndEvent
