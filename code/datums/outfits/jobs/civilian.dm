/decl/hierarchy/outfit/job/assistant
	name = OUTFIT_JOB_NAME("Assistant")
	l_ear = /obj/item/device/radio/headset

/decl/hierarchy/outfit/job/service
	l_ear = /obj/item/device/radio/headset/headset_service
	hierarchy_type = /decl/hierarchy/outfit/job/service

/decl/hierarchy/outfit/job/service/bartender
	name = OUTFIT_JOB_NAME("Bar Servitor")
	uniform = /obj/item/clothing/under/rank/bartender
	id_type = /obj/item/card/id/civilian/bartender
	pda_type = null
	pda_slot = null
	head = /obj/item/clothing/head/servitorhead
	l_ear = /obj/item/device/radio/headset/red_team
	r_ear = null
	suit = /obj/item/clothing/suit/servitor
	back = /obj/item/storage/backpack/satchel/servitor

/decl/hierarchy/outfit/job/service/chef
	name = OUTFIT_JOB_NAME("Chef")
	uniform = /obj/item/clothing/under/color/brown
	suit = /obj/item/clothing/suit/guardchef
	head = /obj/item/clothing/head/chefhat
	id_type = /obj/item/card/id/civilian/chef
	pda_type = null
	pda_slot = null
	back = /obj/item/storage/backpack/satchel/warfare
	shoes = /obj/item/clothing/shoes/jackboots
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = null
	r_ear = null
	backpack_contents = list(
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
		)

/decl/hierarchy/outfit/job/service/gardener
	name = OUTFIT_JOB_NAME("Farmer")
	uniform = /obj/item/clothing/under/rank/hydroponics
	suit = /obj/item/clothing/suit/farmer
	gloves = /obj/item/clothing/gloves/thick/botany
	r_pocket = /obj/item/device/analyzer/plant_analyzer
	id_type = /obj/item/card/id/civilian/botanist
	pda_type = null
	pda_slot = null
	l_ear = null
	r_ear = null
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_hand = /obj/item/farmshovel
	belt = /obj/item/storage/plants
	backpack_contents = list(/obj/item/seeds/potatoseed = 1,
	/obj/item/seeds/wheatseed = 1,
	/obj/item/seeds/cornseed = 1,
	/obj/item/seeds/random = 1,
	/obj/item/seeds/tobaccoseed = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,

	)

/decl/hierarchy/outfit/job/service/gardener/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack]      = /obj/item/storage/backpack/hydroponics
	backpack_overrides[/decl/backpack_outfit/satchel]       = /obj/item/storage/backpack/satchel/satchel_hyd
	backpack_overrides[/decl/backpack_outfit/messenger_bag] = /obj/item/storage/backpack/messenger/hyd

/decl/hierarchy/outfit/job/service/janitor
	name = OUTFIT_JOB_NAME("Janitor Servitor")
	uniform = /obj/item/clothing/under/rank/janitor
	id_type = /obj/item/card/id/civilian/janitor
	pda_type = null
	pda_slot = null
	head = /obj/item/clothing/head/servitorhead/janitor
	l_ear = /obj/item/device/radio/headset/red_team
	r_ear = null
	suit = /obj/item/clothing/suit/servitor/janitor
	back = /obj/item/storage/backpack/satchel/servitor

/decl/hierarchy/outfit/job/librarian
	name = OUTFIT_JOB_NAME("Record Keeper")
	uniform = /obj/item/clothing/under/suit_jacket/red
	id_type = /obj/item/card/id/civilian/librarian
	pda_type = null
	pda_slot = null

/decl/hierarchy/outfit/job/internal_affairs_agent
	name = OUTFIT_JOB_NAME("principal agent")
	l_ear = /obj/item/device/radio/headset/inquisition
	uniform = /obj/item/clothing/under/rank/principalagent
	//suit = /obj/item/clothing/suit/armor/agent
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	//shoes = /obj/item/clothing/shoes/jackboots
	shoes = null
	glasses = /obj/item/clothing/glasses/sunglasses/big
	id_type = /obj/item/card/id/inquisition/principal_agent
	back = /obj/item/storage/backpack/satchel/warfare
	l_pocket = /obj/item/storage/box/ifak
	belt = /obj/item/device/flashlight/lantern
	pda_type = null
	pda_slot = null
	neck = /obj/item/reagent_containers/food/drinks/canteen
	//head = /obj/item/clothing/head/inqhelm
	//mask = /obj/item/clothing/mask/gas/security/agent
	backpack_contents = list(
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1)
/decl/hierarchy/outfit/job/chaplain
	name = OUTFIT_JOB_NAME("Ministorum Priest")
	uniform = /obj/item/clothing/under/rank/chaplain
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = /obj/item/card/id/civilian/chaplain
	pda_type = null
	pda_slot = null
	l_ear = /obj/item/device/radio/headset/red_team
	r_ear = null
	l_pocket = /obj/item/storage/box/ifak
	belt = /obj/item/device/flashlight/lantern
	back = /obj/item/storage/backpack/satchel/warfare
	suit = /obj/item/clothing/suit/ministorumrobes
	l_hand = /obj/item/staff/ministorumstaff
	r_hand = /obj/item/melee/whip/censer
	backpack_contents = list(
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
		)
/decl/hierarchy/outfit/job/inquisitor
	name = OUTFIT_JOB_NAME("Inquisitor")
	l_ear = /obj/item/device/radio/headset/inquisition
	uniform = /obj/item/clothing/under/rank/inquisitor
	suit = /obj/item/clothing/suit/storage/hooded/inquisitor
	glasses = null
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	shoes = /obj/item/clothing/shoes/jackboots
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/device/flashlight/lantern
	r_hand = /obj/item/gun/projectile/bolter_pistol
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/ammo_magazine/bolt_pistol_magazine
	id_type = /obj/item/card/id/inquisition/principal_agent
	pda_type = null
	pda_slot = null
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/ten = 1,
	/obj/item/stack/thrones3/twenty = 1
		)

/decl/hierarchy/outfit/job/service/undertaker
	name = OUTFIT_JOB_NAME("Undertaker")
	uniform = /obj/item/clothing/under/child_jumpsuit
	id_type = /obj/item/card/id/civilian/bartender
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = null
	r_ear = null
	suit = /obj/item/clothing/suit/child_coat/red
	back = /obj/item/storage/backpack/satchel/warfare
	l_hand = /obj/item/shovel
	shoes = /obj/item/clothing/shoes/child_shoes
	pda_type = null
	pda_slot = null
	backpack_contents = list(
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,)
