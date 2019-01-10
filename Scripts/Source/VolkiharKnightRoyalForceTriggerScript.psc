Scriptname VolkiharKnightRoyalForceTriggerScript extends activemagiceffect
{Determines when to trigger the Royal Guard effect}

Spell property VolkiharKnightArmorEffectRoyalForceDrainSpell Auto
Keyword property WeapTypeBow Auto

event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if ((akSource as Weapon) != None && !akSource.HasKeyword(WeapTypeBow) && (akAggressor as Actor) != None)
		int roll = Utility.RandomInt(0, 99)

		;10% chance to proc the effect
		if (roll < 10)
			VolkiharKnightArmorEffectRoyalForceDrainSpell.Cast(akAggressor)
		endIf
	endIf
endEvent
