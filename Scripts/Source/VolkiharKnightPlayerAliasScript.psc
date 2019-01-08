Scriptname VolkiharKnightPlayerAliasScript extends ReferenceAlias
{Perform maintenance on first load}

VolkiharKnightUpdateScript Property QuestScript Auto

Event OnPlayerLoadGame()
	QuestScript.Maintenance()
EndEvent
