
//khornite cult structures

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
	if(mind.god != KHORNE)
		adjustFireLoss(5)
		to_chat(src, "<span='notice'>Your skin starts to itch.</span>")
		sleep(150)
		adjustFireLoss(10)
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
					mind.god = KHORNE
				if("NO")
					to_chat(src, "<span='warning'>You are ignorant. But He had mercy upon you, continue your futile struggles.</span>")

/obj/structure/chaos/skull_totem
	name = "Skull Totem"
	desc = "A totem with a skull attached on top, you feel some bizarre presence emanating from it."
	icon = 'icons/obj/blood_cult.dmi'
	icon_state = "totem"
	density = 1
	anchored = 1
	var/mob/player
	var/active = FALSE

	attack_hand(mob/user)
		if(user.mind.god == KHORNE)
			if(!active)
				if(!player)
					to_chat(user, "You throw a drop of blood inside the skull totem, imprinting it with your own soul.")
					player = user
				else
					to_chat(player, "You feel uncomfortable for a second.")
					to_chat(user, "You remove the blood inside the skull totem, erasing the soul mark it had imprinted.")
					player = null
			else
				to_chat(user, "You cant imprint your soul in the totem if it is active.")
		else
			to_chat(user, "<span='warning'> YOU AREN'T A SERVANT OF KHORNE! DONT TOUCH IT!")

	proc/activate()
		var/mob/living/carbon/human/M = player
		active = TRUE
		icon_state = "[icon_state]-active"
		light_power = 10
		light_range = 3
		light_color = LIGHT_COLOR_FLARE
		sleep(100)
		M.mind.god.give_gifts(M)
		deactivate()

	proc/deactivate()
		explosion(loc,0,0,0,0)
		qdel(src)

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
	var/active = FALSE

	attack_hand(mob/living/carbon/human/user)
		if(user.mind.god == KHORNE)
			if(active != TRUE)
				start_ritual(user)
				active = TRUE
				to_chat(user, "<span='warning'>You start the blood ritual.</span>")

	proc/start_ritual(mob/living/carbon/human/user)
		icon_state = "[icon_state]-active"
		var/list/totems
		for(var/obj/structure/chaos/skull_totem/S in orange(3, src))
			totems += S																	//FOR SOME FUCKING REASON IT GETS STUCK HERE
			if(totems.len >= 4) //minimum totems = 4
				for(S in totems)
					S.activate()
					var/obj/item/projectile/beam/blood_effect/effect = new(get_turf(src))
					effect.pixel_x = 0
					effect.pixel_y = 0
					effect.launch_projectile(totems)
					spawn(100)
						icon_state = "blood_altar"
						active = FALSE
						for(var/mob/living/carbon/human/players in range(7))
							to_chat(players, "<span='warning'>The ritual is complete! He was satisfied!</span>")
			else
				to_chat(user, "<span='warning'>This isn't enough to continue the ritual.2</span>")
				icon_state = "blood_altar"
				active = FALSE

/obj/item/projectile/beam/blood_effect/no_beam
	icon_state = "blood_nobeam"
	muzzle_type = /obj/effect/projectile/blood/no_beam
	tracer_type = /obj/effect/projectile/blood/no_beam
	impact_type = /obj/effect/projectile/blood/no_beam

/obj/effect/projectile/blood/no_beam
	icon_state = "blood_nobeam"
