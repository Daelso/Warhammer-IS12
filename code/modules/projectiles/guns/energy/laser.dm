/obj/item/gun/energy/laser
	name = "energy gun"
	desc = "Another bestseller of Lawson Arms and the FTU, the LAEP90 Perun is a versatile energy based sidearm, capable of switching between low, medium and high power projectile settings. In other words: stun, shock or kill."
	icon_state = "energystun100"
	item_state = null	//so the human update icon uses the icon_state instead.
	max_shots = 10
	fire_delay = 10 // To balance for the fact that it is a pistol and can be used one-handed without penalty

	projectile_type = /obj/item/projectile/beam/stun
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	modifystate = "energystun"

	projectile_type = /obj/item/projectile/beam/stun/shock
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	modifystate = "energyshock"

	projectile_type = /obj/item/projectile/beam
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	modifystate = "energykill"


	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun, modifystate="energystun"),
		list(mode_name="shock", projectile_type=/obj/item/projectile/beam/stun/shock, modifystate="energyshock"),
		list(mode_name="lethal", projectile_type=/obj/item/projectile/beam, modifystate="energykill"),
		)

/obj/item/gun/energy/laser/small
	name = "small energy gun"
	desc = "A smaller model of the versatile LAEP90 Perun, packing considerable utility in a smaller package. Best used in situations where full-sized sidearms are inappropriate."
	icon_state = "smallgunstun"
	max_shots = 5
	w_class = ITEM_SIZE_SMALL
	force = 2 //it's the size of a car key, what did you expect?
	modifystate = "smallgunstun"

	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun, modifystate="smallgunstun"),
		list(mode_name="shock", projectile_type=/obj/item/projectile/beam/stun/shock, modifystate="smallgunshock"),
		list(mode_name="lethal", projectile_type=/obj/item/projectile/beam/smalllaser, modifystate="smallgunkill"),
		)

/obj/item/gun/energy/gun/mounted
	name = "mounted energy gun"
	self_recharge = 1
	use_external_power = 1

/obj/item/gun/energy/laser/carbine
	name = "laser carbine"
	desc = "A Hephaestus Industries G40E carbine, designed to kill with concentrated energy blasts."
	icon_state = "laser"
	item_state = "laser"
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_LARGE
	force = 10
	one_hand_penalty = 2
	accuracy = 2
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/beam/midlaser
	wielded_item_state = "laser-wielded"

/obj/item/gun/energy/h4
	name = "H4 laser pistol"
	icon_state = "h4"
	item_state = "ionpistol"
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_NORMAL
	force = 10
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/beam/midlaser

/obj/item/gun/energy/laser/mounted
	self_recharge = 1
	use_external_power = 1
	one_hand_penalty = 0 //just in case

/obj/item/gun/energy/laser/practice
	name = "practice laser carbine"
	desc = "A modified version of the HI G40E, this one fires less concentrated energy bolts designed for target practice."
	icon_state = "laserp"
	projectile_type = /obj/item/projectile/beam/practice
	charge_cost = 10 //How much energy is needed to fire.

/obj/item/gun/energy/laser/practice/proc/hacked()
	return projectile_type != /obj/item/projectile/beam/practice

/obj/item/gun/energy/laser/practice/emag_act(var/remaining_charges, var/mob/user, var/emag_source)
	if(hacked())
		return NO_EMAG_ACT
	to_chat(user, "<span class='warning'>You disable the safeties on [src] and crank the output to the lethal levels.</span>")
	desc += " Its safeties are disabled and output is set to dangerous levels."
	projectile_type = /obj/item/projectile/beam/midlaser
	charge_cost = 20
	max_shots = rand(3,6) //will melt down after those
	return 1

/obj/item/gun/energy/laser/practice/handle_post_fire(mob/user, atom/target, var/pointblank=0, var/reflex=0)
	..()
	if(hacked())
		max_shots--
		if(!max_shots) //uh hoh gig is up
			to_chat(user, "<span class='danger'>\The [src] sizzles in your hands, acrid smoke rising from the firing end!</span>")
			desc += " The optical pathway is melted and useless."
			projectile_type = null

obj/item/gun/energy/retro
	name = "retro laser"
	icon_state = "retro"
	item_state = "retro"
	desc = "An older model of the basic lasergun. Nevertheless, it is still quite deadly and easy to maintain, making it a favorite amongst pirates and other outlaws."
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	w_class = ITEM_SIZE_NORMAL
	projectile_type = /obj/item/projectile/beam
	fire_delay = 15 //old technology, and a pistol

/obj/item/gun/energy/captain
	name = "antique laser gun"
	icon_state = "caplaser"
	item_state = "caplaser"
	desc = "A rare weapon, handcrafted by a now defunct specialty manufacturer on Luna for a small fortune. It's certainly aged well."
	force = 5
	slot_flags = SLOT_BELT //too unusually shaped to fit in a holster
	w_class = ITEM_SIZE_NORMAL
	projectile_type = /obj/item/projectile/beam
	origin_tech = null
	max_shots = 5 //to compensate a bit for self-recharging
	one_hand_penalty = 1 //a little bulky
	self_recharge = 1

/obj/item/gun/energy/lasercannon
	name = "laser cannon"
	desc = "With the laser cannon, the lasing medium is enclosed in a tube lined with uranium-235 and subjected to high neutron flux in a nuclear reactor core. This incredible technology may help YOU achieve high excitation rates with small laser volumes!"
	icon_state = "lasercannon"
	item_state = null
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_POWER = 3)
	slot_flags = SLOT_BELT|SLOT_BACK
	one_hand_penalty = 6 //large and heavy
	w_class = ITEM_SIZE_HUGE
	projectile_type = /obj/item/projectile/beam/heavylaser
	charge_cost = 40
	max_shots = 6
	accuracy = 2
	fire_delay = 20
	wielded_item_state = "gun_wielded"

/obj/item/gun/energy/lasercannon/mounted
	name = "mounted laser cannon"
	self_recharge = 1
	use_external_power = 1
	recharge_time = 10
	accuracy = 0 //mounted laser cannons don't need any help, thanks
	one_hand_penalty = 0

/obj/item/gun/energy/sniperrifle
	name = "marksman energy rifle"
	desc = "The HI DMR 9E is an older design of Hephaestus Industries. A designated marksman rifle capable of shooting powerful ionized beams, this is a weapon to kill from a distance."
	icon_state = "sniper"
	item_state = "laser"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 5, TECH_POWER = 4)
	projectile_type = /obj/item/projectile/beam/sniper
	one_hand_penalty = 5 // The weapon itself is heavy, and the long barrel makes it hard to hold steady with just one hand.
	slot_flags = SLOT_BACK
	charge_cost = 40
	max_shots = 4
	fire_delay = 35
	force = 10
	w_class = ITEM_SIZE_HUGE
	accuracy = -2 //shooting at the hip
	scoped_accuracy = 0
	wielded_item_state = "gun_wielded"

/obj/item/gun/energy/sniperrifle/update_icon()
	..()
	item_state_slots[slot_back_str] = icon_state //so that the on-back overlay uses the different charged states

/obj/item/gun/energy/sniperrifle/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(usr, 2.0)

////////Laser Tag////////////////////

/obj/item/gun/energy/lasertag
	name = "laser tag gun"
	item_state = "laser"
	desc = "Standard issue weapon of the Imperial Guard."
	origin_tech = list(TECH_COMBAT = 1, TECH_MAGNET = 2)
	self_recharge = 1
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/beam/lastertag/blue
	var/required_vest

/obj/item/gun/energy/lasertag/special_check(var/mob/living/carbon/human/M)
	if(ishuman(M))
		if(!istype(M.wear_suit, required_vest))
			to_chat(M, "<span class='warning'>You need to be wearing your laser tag vest!</span>")
			return 0
	return ..()

/obj/item/gun/energy/lasertag/blue
	icon_state = "bluetag"
	item_state = "bluetag"
	projectile_type = /obj/item/projectile/beam/lastertag/blue
	required_vest = /obj/item/clothing/suit/bluetag

/obj/item/gun/energy/lasertag/red
	icon_state = "redtag"
	item_state = "redtag"
	projectile_type = /obj/item/projectile/beam/lastertag/red
	required_vest = /obj/item/clothing/suit/redtag


//Las weapons

/obj/item/gun/energy/las/lasgun
	name = "lasgun"
	desc = "The standard-issue rifle of the Astra Militarum as well as one of the most common weapons found in the Imperium of Man."
	icon_state = "lasgun"
	item_state = "lasgun"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 10
	one_hand_penalty = 2
	accuracy = 2
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "lasgun-wielded"

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=2, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    one_hand_penalty=3, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0), automatic = 0),
		)