Scriptname VolkiharAssassinInvisibilityScript extends activemagiceffect  
{Handles visual, audio, and spell effects for the Assassin cuirass}

event OnEffectStart(Actor akTarget, Actor akCaster)
	;Make player turn invisible and throw away attached arrows.
	;speeds up fade rate (max 1 min .1
	akCaster.SetSubGraphFloatVariable("fdampRate", 0.015)
	;blends between two anims default 0 (0 = there 1 = gone)
	akCaster.SetSubGraphFloatVariable("ftoggleBlend", 1.45)
	akCaster.ClearExtraArrows()
endEvent

event OnEffectFinish(Actor akTarget, Actor akCaster)
	;speeds up fade rate (max 1 min .1
	akCaster.SetSubGraphFloatVariable("fdampRate", 0.02)
	;blends between two anims default 0 (0 = there 1 = gone)
	akCaster.SetSubGraphFloatVariable("ftoggleBlend", -0.05)
endEvent
