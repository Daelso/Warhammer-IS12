//redone from power/cell.dm as needed by guns/canister.dm
/obj/item/fuel_canister
	name = "fuel canister"
	desc = "A canister containing fuel for Imperial chemical guns."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "flamer"
	w_class = ITEM_SIZE_SMALL
	matter = list(DEFAULT_WALL_MATERIAL = 1800)
	origin_tech = list(TECH_COMBAT = 2)
	force = 5.0
	throwforce = 5.0
	throw_speed = 3
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	var/c_uid
	var/charge = 0 // Current charge
	var/maxcharge = 100 // Capacity

/obj/item/fuel_canister/New()
	if(!charge)
		charge = maxcharge
	c_uid = sequential_id(/obj/item/fuel_canister)
	..()

/obj/item/fuel_canister/Initialize()
	. = ..()
	update_icon()

/obj/item/fuel_canister/examine(mob/user)
	. = ..()
	to_chat(user, "There [(charge == 1)? "is" : "are"] [charge] unit\s left!")

/obj/item/fuel_canister/proc/percent() // return % charge of cell
	return maxcharge && (100.0*charge/maxcharge)

/obj/item/fuel_canister/proc/fully_charged()
	return (charge == maxcharge)

// Checks if the specified amount can be provided. If it can, it removes the amount
// from the canister and returns 1. Otherwise does nothing and returns 0.
/obj/item/fuel_canister/proc/checked_use(var/amount)
	if(!check_charge(amount))
		return 0
	use(amount)
	return 1

/obj/item/fuel_canister/proc/give(var/amount)
	if(maxcharge < amount)	return 0
	var/amount_used = min(maxcharge-charge,amount)
	charge += amount_used
//	update_icon()
	return amount_used

// checks if the canister is able to provide the specified amount of charge
/obj/item/fuel_canister/proc/check_charge(var/amount)
	return (charge >= amount)

// use charge from a canister, returns the amount actually used
/obj/item/fuel_canister/proc/use(var/amount)
	var/used = min(charge, amount)
	charge -= used
	update_icon()
	return used

/obj/item/fuel_canister/variable/New(newloc, charge_amount)
	maxcharge = charge_amount
	..(newloc)

/obj/item/fuel_canister/melta
	name = "melta canister"
	desc = "A canister containing fusion fuel for Imperial melta guns."