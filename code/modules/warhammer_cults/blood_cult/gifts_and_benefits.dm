
////////////////////////////////
///Khorne Gifts and Benefits///
////////////////////////////////

//Bloodlust

/spell/bloodlust
	name = "Bloodlust"
	desc = "Screech with the power of a thousand warriors."

	charge_type = Sp_RECHARGE
	charge_max = 900
	spell_flags = NEEDSHUMAN

	invocation = "BLOOD FOR THE BLOOD GOD!"
	invocation_type = SpI_SHOUT

/spell/bloodlust/cast(list/targets, mob/living/carbon/human/user)
	var/duration = 100
	while(duration > 0)
		if(user.staminaloss > 4)
			user.adjustStaminaLoss(-4)
		duration--


//BLOODLETTER SUMMONING

/spell/aoe_turf/conjure/sacrifice/bloodletter
	name = "Blood Summoning"
	desc = "Summon a daemonic warrior that will help you decimate your foes"
	feedback = "FH"

	invocation = "Khak'akamshy'y"
	invocation_type = SpI_SHOUT
	range = 1
	spell_flags = NEEDSHUMAN

	summon_amt = 1
	summon_type = list(/mob/living/simple_animal/daemon/bloodletter)
	sacrifices = list(/obj/effect/decal/cleanable/blood)

/mob/living/simple_animal/daemon/bloodletter
	name = "Warp Rift"
	desc = "A gate that directly connects with the immaterium."
	icon = 'icons/mob/daemon.dmi'
	icon_state = "daemonic_rift"
	blend_mode = BLEND_SUBTRACT
	health = 999999
	maxHealth = 999999
	melee_damage_lower = 0
	melee_damage_upper = 0
	attacktext = "mauls"
	attack_sound ='sound/weapons/crowbarhit2.ogg'
	faction = "chaos"
	density = 1
	anchored = TRUE

	Initialize()
		. = ..()
		offer_mob()
		AdjustSleeping(999)
		spawn(150)
			if(!ckey)
				for(var/mob/players in oview_or_orange(7))
					to_chat(players, "<span='warning'No one answered the call!</span>")
				qdel(src)
			else
				SetSleeping(0)
				icon_state = "bloodletter"
				name = "Bloodletter"
				desc = "A lesser daemon of the warp, with claws strong enough to rip metal apart."
				health = 400
				maxHealth = 400
				melee_damage_lower = 35
				melee_damage_upper = 60
