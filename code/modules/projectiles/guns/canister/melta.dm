obj/item/gun/canister/melta
	name = "melta"
	desc = "Short-range Imperial thermal weaponry usually used to melt through anything the user is pointing at."
	icon = 'icons/obj/weapons/gun/other.dmi'
	icon_state = "melta"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 3
	one_hand_penalty = 2
	accuracy = 0
	origin_tech = list(TECH_COMBAT = 5, TECH_MAGNET = 4)
	projectile_type = /obj/item/projectile/beam/melta
	fire_cost = 1
	canister_type = /obj/item/fuel_canister/melta
	ammoType = /obj/item/fuel_canister/melta
	wielded_item_state = "lasgun-wielded"

	firemodes = list(
		list(mode_name="burst", burst=4, burst_delay=0.01, fire_delay=10, move_delay=3, one_hand_penalty=3, burst_accuracy=list(0,-1,-1,-2), dispersion=list(0, 1, 1, 2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=1, move_delay=null, one_hand_penalty=2, burst_accuracy=null, dispersion=list(0.2), automatic = 0.1),
		)