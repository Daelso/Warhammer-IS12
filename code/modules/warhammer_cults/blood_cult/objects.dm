
//khornite cult structures and objects

/datum/reagent/daemonic_blood
	name = "Odd Blood"
	reagent_state = REAGENT_LIQUID
	metabolism = REM * 5
	color = "#c80000"
	taste_description = "rusty metal"
	taste_mult = 1.3
	glass_name = "tomato juice"
	glass_desc = "Are you sure this is tomato juice?"

	affect_ingest(mob/living/carbon/human/M, alien, removed)
		M.ConvertMob()
		. = ..()

/mob/living/carbon/human/proc/ConvertMob()
	if(god != KHORNE)
		adjustFireLoss(10)
		to_chat(src, "<span='notice'>Your skin starts to itch.</span>")
		sleep(150)
		adjustFireLoss(25)
		to_chat(src, "<span='warning'>Your skin starts to burn!</span>")
		sleep(80)
		adjustFireLoss(30)
		to_chat(src, "<span='warning'>Your skin burns like hell itself!</span>")
		sleep(50)
		if(stat != DEAD)
			var/choice = input(src, "Choose your destiny", "Are you willing to serve Him?") as null|anything in list("YES", "NO")
			spawn(100)
				if(choice != "YES" && choice != "NO")
					to_chat(src, "<span='warning'>CHOOSE OR DIE!</span>")
					spawn(50)
						if(choice != "YES" && choice != "NO")
							to_chat(src, "<span='warning'>Making him lose time was your worst mistake. Now perish like the dog you are.</span>")
							explosion(1, 1, 1, 1, 1)
							fire_stacks = max(300, fire_stacks)
							IgniteMob()
			switch(choice)
				if("YES")
					to_chat(src, "<span='notice'>You took the right choice. Welcome to the cult, the party is just starting!</span>")
					god = KHORNE
				if("NO")
					to_chat(src, "<span='warning'>You are ignorant. But He had mercy upon you, continue your futile struggles.</span>")

/obj/structure/reagent_dispensers/khorne_altar
	name = "Fountain of the Blood God"
	desc = "This altar works as a direct connection with the ruinous powers."
	icon = 'icons/obj/blood_cult.dmi'
	icon_state = "blood_altar"
	breakable = FALSE
	density = 1
	anchored = 1
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = "10;25;50;100"
	initial_capacity = INFINITY
	initial_reagent_types = list(/datum/reagent/daemonic_blood = 1)
	light_power = 10
	light_range = 3
	light_color = LIGHT_COLOR_FLARE

	var/sacrifices = 0
	var/active = FALSE

	attackby(obj/item/W, mob/user)
		if(istype(W, /obj/item/organ/external/head))
			if(sacrifices < 10)
				to_chat(user, "You throw [W] in the fountain.")
				sacrifices++
				qdel(W)

	attack_hand(mob/living/carbon/human/user)
		if(!user)
			return

		if(user.god == KHORNE)
			if(active != TRUE)
				for(var/mob/living/carbon/human/S in orange(7, src))
					sacrifices = 0
					if(S.god == KHORNE)
						Beam(S,"blood_nobeam",'icons/effects/projectiles.dmi', 100, 7)
						spawn(100)
							S.give_gifts()
							active = FALSE
				active = TRUE
				to_chat(user, "<span='warning'>You start the blood ritual.</span>")
			else
				to_chat(user, "<span='warning'>There is already a ritual in progress.</span>")

/obj/item/projectile/beam/blood_effect/no_beam
	icon_state = "blood_nobeam"
	muzzle_type = /obj/effect/projectile/blood/no_beam
	tracer_type = /obj/effect/projectile/blood/no_beam
	impact_type = /obj/effect/projectile/blood/no_beam

/obj/effect/projectile/blood/no_beam
	icon_state = "blood_nobeam"
