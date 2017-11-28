Scriptname VolkiharAssassinInvisibilityScript extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	; Make player turn invisible and throw away attached arrows.
	akCaster.SetSubGraphFloatVariable("fdampRate", 0.015) ;;speeds up fade rate (max 1 min .1
	akCaster.SetSubGraphFloatVariable("ftoggleBlend", 1.45) ;;blends between two anims default 0 (0 = there 1 = gone)
	akCaster.ClearExtraArrows()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akCaster.SetSubGraphFloatVariable("fdampRate", 0.02) ;;speeds up fade rate (max 1 min .1
	akCaster.SetSubGraphFloatVariable("ftoggleBlend", -0.05);;blends between two anims default 0 (0 = there 1 = gone)
EndEvent