//redone from guns/energy.dm
/obj/item/gun/canister
	name = "cansiter gun"
	desc = "A basic canister-based gun."
	icon = 'icons/obj/weapons/gun/other.dmi'
	icon_state = "melta"
	fire_sound_text = "blast"

	var/obj/item/fuel_canister/fuel_supply //What type of power cell this uses
	var/fire_cost = 1 //How much units are needed to fire.
	var/max_shots = 10 //Determines the capacity of the weapon's canister. Specifying a canister_type overrides this value.
	var/canister_type = null
	var/projectile_type = /obj/item/projectile/energy/laser // /obj/item/projectile/beam/practice
	var/modifystate
	var/charge_meter = 0	//if set, the icon state will be chosen based on the current charge
	var/unload_sound = 'sound/weapons/guns/interact/pistol_magout.ogg'
	var/reload_sound = 'sound/weapons/guns/interact/pistol_magin.ogg'

	//self-recharging
	var/self_recharge = 0	//if set, the weapon will recharge itself
	var/use_external_tank = 0 //if set, the weapon will look for an external tank to draw from, otherwise it recharges magically
	var/recharge_time = 4
	var/charge_tick = 0
	var/icon_rounder = 25
	var/ammoType = null
	combustion = 1

/obj/item/gun/canister/switch_firemodes()
	. = ..()
	if(.)
		update_icon()

/obj/item/gun/canister/New()
	..()
	if(canister_type)
		fuel_supply = new canister_type(src)
	else
		fuel_supply = new /obj/item/fuel_canister/variable(src, max_shots*fire_cost)
	if(self_recharge)
		START_PROCESSING(SSobj, src)
	update_icon()

/obj/item/gun/canister/Destroy()
	if(self_recharge)
		STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/gun/canister/Process()
	if(self_recharge) //Every [recharge_time] ticks, recharge a shot
		charge_tick++
		if(charge_tick < recharge_time) return 0
		charge_tick = 0

		if(!fuel_supply || fuel_supply.charge >= fuel_supply.maxcharge)
			return 0 // check if we actually need to recharge
/*
		if(use_external_tank)
			var/obj/item/cell/external = get_external_fuel_supply()
			if(!external || !external.use(fire_cost)) //Take power from the borg...
				return 0
*/
		fuel_supply.give(fire_cost) //... to recharge the shot
		update_icon()
	return 1

/obj/item/gun/canister/consume_next_projectile()
	if(!fuel_supply) return null
	if(!ispath(projectile_type)) return null
	if(!fuel_supply.checked_use(fire_cost)) return null
	return new projectile_type(src)

/*
/obj/item/gun/energy/proc/get_external_fuel_supply()
	if(isrobot(src.loc))
		var/mob/living/silicon/robot/R = src.loc
		return R.cell
	return null
*/

/obj/item/gun/canister/examine(mob/user)
	. = ..(user)
	var/shots_remaining = 0
	if(fuel_supply)
		shots_remaining = round(fuel_supply.charge / fire_cost)
	to_chat(user, "Has [shots_remaining] shot\s remaining.")
	return

/obj/item/gun/canister/update_icon()
	..()
	if(charge_meter)
		var/ratio = 0
		if(fuel_supply)
			ratio = fuel_supply.percent()

			//make sure that rounding down will not give us the empty state even if we have charge for a shot left.
			if(fuel_supply.charge < fire_cost)
				ratio = 0
			else
				ratio = max(round(ratio, icon_rounder), icon_rounder)

		if(modifystate)
			icon_state = "[modifystate][ratio]"
		else
			icon_state = "[initial(icon_state)][ratio]"

/obj/item/gun/canister/attackby(var/obj/item/A as obj, mob/user as mob)
	load_ammo(A, user)

/obj/item/gun/canister/load_ammo(var/obj/item/A, mob/user)
	if(!istype(A, /obj/item/fuel_canister))
		return
	if(!istype(A, ammoType))
		to_chat(user, "<span class='warning'>[src] can't use that canister.</span>")//already a canister here
		return

	if(fuel_supply)
		to_chat(user, "<span class='warning'>[src] already has a canister loaded.</span>")//already a canister here
		return

	user.remove_from_mob(A)
	A.loc = src
	fuel_supply = A
	user.visible_message("[user] inserts [A] into [src].", "<span class='notice'>You insert [A] into [src].</span>")
	playsound(src, 'sound/weapons/guns/interact/mag_load.ogg', 100)
	update_icon()


/obj/item/gun/canister/unload_ammo(mob/user, var/allow_dump=1)
	if(fuel_supply)
		playsound(src, 'sound/weapons/guns/interact/mag_unload.ogg', 100)
		user.visible_message("[user] removes the canister from [src].", "<span class='notice'>You remove the canister from [src].</span>")
		user.put_in_hands(fuel_supply)
		fuel_supply.update_icon()
		fuel_supply = null
		update_icon()

/obj/item/gun/canister/MouseDrop(var/obj/over_object)
	if (!over_object || !(ishuman(usr) || issmall(usr)))
		return

	if (!(src.loc == usr))
		return
	var/mob/living/carbon/human/H = usr
	if(H.incapacitated(INCAPACITATION_STUNNED|INCAPACITATION_KNOCKOUT))
		return

	switch(over_object.name)
		if("r_hand")
			unload_ammo(usr, allow_dump=0)
		if("l_hand")
			unload_ammo(usr, allow_dump=0)