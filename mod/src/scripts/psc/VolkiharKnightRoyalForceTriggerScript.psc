Scriptname VolkiharKnightRoyalForceTriggerScript extends activemagiceffect  

Spell property VolkiharKnightArmorEffectRoyalForceDrainSpell Auto
Keyword property WeapTypeBow Auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if ((akSource as Weapon) != None && !akSource.HasKeyword(WeapTypeBow) && (akAggressor as Actor) != None)
		int roll = Utility.RandomInt(0, 99)

		if (roll < 15)
			VolkiharKnightArmorEffectRoyalForceDrainSpell.Cast(akAggressor)
		EndIf
	EndIf
EndEvent