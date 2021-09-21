
////////////////////////////////
///Khorne Gifts and Benefits///
////////////////////////////////

//BLOODLETTER SUMMONING

/mob/living/carbon/human/proc/pool_summoning()
	set name = "Create Pool of Blood"
	set desc = "Create a pool of blood so you can do blood summonings."
	set category = "Object"

	var/obj/item/melee/M
	if(M in get_both_hands())
		if(!M.was_bloodied)
			return
		for(var/obj/item/melee/S in get_both_hands())
			new /obj/blood_pool(loc)
			S.clean_blood()
			playsound(loc, 'sound/effects/gore/severed.ogg', 75)

/obj/blood_pool
	name = "Pool of blood"
	desc = "Ew"
	icon = 'icons/obj/blood_cult.dmi'
	icon_state = "blood_pool"
	anchored = TRUE
	density = 0

	attackby(obj/item/O, mob/living/carbon/human/user)
		if(istype(O, /obj/item/stack/teeth))
			var/obj/item/stack/teeth/T = O
			if(T.amount == 32)
				to_chat(user, "You drop the [T] into the [src].")
				user.say("Khak'akamshy'y")
				new /mob/living/simple_animal/daemon/bloodletter(loc)
				qdel(T)
				qdel_self()

/mob/living/simple_animal/daemon/bloodletter
	name = "Warp Rift"
	desc = "A gate that directly connects with the immaterium."
	icon = 'icons/mob/daemon.dmi'
	icon_state = "daemonic_rift"
	health = 999999
	maxHealth = 999999
	melee_damage_lower = 35
	melee_damage_upper = 60
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

	death(gibbed, deathmessage, show_dead_message)
		new /obj/blood_pool(loc)
		qdel_self()

