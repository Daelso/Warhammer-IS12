//trees
/obj/structure/flora/tree
	name = "tree"
	anchored = 1
	density = 1
	pixel_x = -16
	alpha = 200
	density = FALSE
	layer = 1
	plane = ABOVE_HUMAN_PLANE
	layer = ABOVE_HUMAN_LAYER
	var/log_type //type of log
	var/log_amount //amount of logs when cut down
	var/cutdown = FALSE //is it already cut down?
	var/delete_after_harvest = TRUE //deletes tree after cutting down
	log_type = /obj/item/stack/logs //basic bitch logs

/obj/structure/flora/tree/pine
	name = "pine tree"
	icon = 'icons/obj/flora/pinetrees.dmi'
	icon_state = "pine_1"

/obj/structure/flora/tree/pine/New()
	..()
	icon_state = "pine_[rand(1, 3)]"

/obj/structure/flora/tree/pine/xmas
	name = "xmas tree"
	icon = 'icons/obj/flora/pinetrees.dmi'
	icon_state = "pine_c"

/obj/structure/flora/tree/pine/xmas/New()
	..()
	icon_state = "pine_c"

/obj/structure/flora/tree/dead
	icon = 'icons/obj/flora/164tree.dmi'
	icon_state = "vhdtree152"

/obj/structure/flora/tree/dead/New()
	..()
	icon_state = pick("vhdtree152", "hdtree96")

/obj/structure/flora/tree/snowy
	name = "pine tree"
	icon = 'icons/obj/flora/treeees.dmi'
	icon_state = "snowy"
	density = 1
	anchored = 1


/obj/structure/flora/tree/snowy/New()
	..()
	icon_state = pick("snowy","snowy2","snowy3",)

	if("snowy")
		name ="dead agra tree"
		desc = "The mightest trees found in the forest all lie dead now, a haunting monument to what lies in store for us all."
		density = 1
		anchored = 1
	if("snowy2")
		name = "snowy spindle"
		desc = "A snow covered spindle tree"
		density = 1
		anchored = 1
	if("snowy3")
		name = "snowy tree"
		desc = "A tall tree covered in the snow of this strange planet."
		density = 1
		anchored = 1





//wel ards forestry simulator


/obj/structure/flora/tree/attackby(var/obj/item/O, var/mob/user)

	if(log_type)	//if the tree has logs
		if((O.sharp) || istype(O, /obj/item/material/knife/butch) || istype(O, /obj/item/material/sword))//what items can cut down trees
			if(!cutdown)
				to_chat(user, "<span='bnotice'[user] begins to cut down \the [src]!</span>" )
				playsound(src, 'sound/weapons/pierce.ogg', 100, FALSE)
				if(do_after(user, 200, src))
					harvest(user)
	else
		if(!O.force)
			visible_message("<span class='notice'>[user] gently taps [src] with \the [O].</span>")
		else
			O.attack(src, user, user.zone_sel.selecting)

/obj/structure/flora/tree/proc/harvest(var/mob/user)
	if(cutdown)
		to_chat(user, "<span='bnotice'This tree has already been cut down.</span>")
	var/actual_log_amount = max(1,(log_amount/2)) //currently 1 log per tree
	if(log_type && actual_log_amount>0)
		for(var/i=0;i<actual_log_amount;i++)
			new log_type(get_turf(src)) //pulls the log type from whatever is specified in the tree

		user.visible_message("<span class='danger'>[user] cuts down \the [src]!</span>")
		if(delete_after_harvest)
			qdel(src)
		else
			cutdown = TRUE
	else
		user.visible_message("<span class='danger'>[user] butchers \the [src] messily!</span>")



//grass
/obj/structure/flora/grass
	name = "grass"
	icon = 'icons/obj/flora/snowflora.dmi'
	anchored = 1

/obj/structure/flora/attackby(obj/item/O, mob/user)
	if(istype(O))
		if(O.sharp || O.edge)
			playsound(src, 'sound/effects/ash_chop.ogg', 50, TRUE)
			user.visible_message("<span class='info'>[user] begins to cut away [src].</span>")
			if(do_after(user,20))
				if(src)
					playsound(src, 'sound/effects/ash_cut.ogg', 50, TRUE)
					user.visible_message("<span class='info'>[user] finishes cutting away [src].</span>")
					qdel(src)

			else
				user.visible_message("<span class='info'>[user] stops cutting away [src].</span>")

/obj/structure/flora/grass/Crossed(AM as mob)
	..()
	if(istype(AM, /mob/living/carbon) && prob(75))
		playsound(src, "foliage", 60, 1)

/obj/structure/flora/grass/brown
	icon_state = "snowgrass1bb"

/obj/structure/flora/grass/brown/New()
	..()
	icon_state = "snowgrass[rand(1, 3)]bb"


/obj/structure/flora/grass/green
	icon_state = "snowgrass1gb"

/obj/structure/flora/grass/green/New()
	..()
	icon_state = "snowgrass[rand(1, 3)]gb"

/obj/structure/flora/grass/both
	icon_state = "snowgrassall1"

/obj/structure/flora/grass/both/New()
	..()
	icon_state = "snowgrassall[rand(1, 3)]"


//bushes
/obj/structure/flora/bush
	name = "bush"
	icon = 'icons/obj/flora/snowflora.dmi'
	icon_state = "snowbush1"
	anchored = 1

/obj/structure/flora/bush/New()
	..()
	icon_state = "snowbush[rand(1, 6)]"

/obj/structure/flora/pottedplant
	name = "potted plant"
	icon = 'icons/obj/plants.dmi'
	icon_state = "plant-26"
	plane = ABOVE_HUMAN_PLANE
	layer = ABOVE_HUMAN_LAYER

//newbushes

/obj/structure/flora/ausbushes
	name = "bush"
	icon = 'icons/obj/flora/ausflora.dmi'
	icon_state = "firstbush_1"
	anchored = 1

/obj/structure/flora/ausbushes/New()
	..()
	icon_state = "firstbush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/reedbush
	icon_state = "reedbush_1"

/obj/structure/flora/ausbushes/reedbush/New()
	..()
	icon_state = "reedbush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/leafybush
	icon_state = "leafybush_1"

/obj/structure/flora/ausbushes/leafybush/New()
	..()
	icon_state = "leafybush_[rand(1, 3)]"

/obj/structure/flora/ausbushes/palebush
	icon_state = "palebush_1"

/obj/structure/flora/ausbushes/palebush/New()
	..()
	icon_state = "palebush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/stalkybush
	icon_state = "stalkybush_1"

/obj/structure/flora/ausbushes/stalkybush/New()
	..()
	icon_state = "stalkybush_[rand(1, 3)]"

/obj/structure/flora/ausbushes/grassybush
	icon_state = "grassybush_1"

/obj/structure/flora/ausbushes/grassybush/New()
	..()
	icon_state = "grassybush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/fernybush
	icon_state = "fernybush_1"

/obj/structure/flora/ausbushes/fernybush/New()
	..()
	icon_state = "fernybush_[rand(1, 3)]"

/obj/structure/flora/ausbushes/sunnybush
	icon_state = "sunnybush_1"

/obj/structure/flora/ausbushes/sunnybush/New()
	..()
	icon_state = "sunnybush_[rand(1, 3)]"

/obj/structure/flora/ausbushes/genericbush
	icon_state = "genericbush_1"

/obj/structure/flora/ausbushes/genericbush/New()
	..()
	icon_state = "genericbush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/pointybush
	icon_state = "pointybush_1"

/obj/structure/flora/ausbushes/pointybush/New()
	..()
	icon_state = "pointybush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/lavendergrass
	icon_state = "lavendergrass_1"

/obj/structure/flora/ausbushes/lavendergrass/New()
	..()
	icon_state = "lavendergrass_[rand(1, 4)]"

/obj/structure/flora/ausbushes/ywflowers
	icon_state = "ywflowers_1"

/obj/structure/flora/ausbushes/ywflowers/New()
	..()
	icon_state = "ywflowers_[rand(1, 3)]"

/obj/structure/flora/ausbushes/brflowers
	icon_state = "brflowers_1"

/obj/structure/flora/ausbushes/brflowers/New()
	..()
	icon_state = "brflowers_[rand(1, 3)]"

/obj/structure/flora/ausbushes/ppflowers
	icon_state = "ppflowers_1"

/obj/structure/flora/ausbushes/ppflowers/New()
	..()
	icon_state = "ppflowers_[rand(1, 4)]"

/obj/structure/flora/ausbushes/sparsegrass
	icon_state = "sparsegrass_1"

/obj/structure/flora/ausbushes/sparsegrass/New()
	..()
	icon_state = "sparsegrass_[rand(1, 3)]"

/obj/structure/flora/ausbushes/fullgrass
	icon_state = "fullgrass_1"

/obj/structure/flora/ausbushes/fullgrass/New()
	..()
	icon_state = "fullgrass_[rand(1, 3)]"

/obj/structure/flora/ash
	name = "ashroom"
	icon = 'icons/obj/flora/ash_flora.dmi'
	anchored = TRUE

/obj/structure/flora/ash/New()
	..()
	icon_state = "[pick("l", "s", "t")]_mushroom[rand(1, 4)]"

/obj/structure/flora/ash/attackby(obj/item/O, mob/user)
	. = ..()
	if(istype(O))
		if(O.sharp || O.edge)
			playsound(src, 'sound/effects/ash_chop.ogg', 50, TRUE)
			user.visible_message("<span class='info'>[user] begins to cut away [src].</span>")
			if(do_after(user,20))
				if(src)
					playsound(src, 'sound/effects/ash_cut.ogg', 50, TRUE)
					user.visible_message("<span class='info'>[user] finishes cutting away [src].</span>")
					qdel(src)

			else
				user.visible_message("<span class='info'>[user] stops cutting away [src].</span>")


/obj/structure/flora/ash/mushrooms
	name = "mushroom"
	icon = 'icons/obj/flora/plants.dmi'
	desc = "It's unlikely these would taste good."

/obj/structure/flora/ash/mushrooms/New()
	..()
	icon_state = pick("chanterelle", "dark_root", "greencap_01", "greencap_02", "greencap_03", "redonion", "bluespike", "lungshroom", "venus")

/obj/structure/flora/jungle
	anchored = TRUE
	plane = EFFECTS_BELOW_LIGHTING_PLANE
	mouse_opacity = 0

	New()
		..()
		set_light(3, 3, "#28284f")

/obj/structure/flora/jungle/trees
	name = "jungle tree"
	icon = 'icons/obj/flora/jungletrees.dmi'
	icon_state = "tree1"
	desc = "A big hunk of wood that gets in the way of you, and who you're trying to shoot."

/obj/structure/flora/jungle/trees/New()
	..()
	icon_state = "tree[rand(1,7)]"


/obj/structure/flora/jungle/bushes
	name = "flora"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "tree1"
	desc = "Pretty scenary. Soothes the mind of the bloodshed."

/obj/structure/flora/jungle/bushes/New()
	..()
	icon_state = "bush[rand(1,4)]"


/obj/structure/flora/rocks
	name = "rocks"
	icon = 'icons/obj/flora/rocks.dmi'
	anchored = TRUE

/obj/structure/flora/rocks/New()
	..()
	icon_state = "rubble[pick(1,10)]"


//potted plants credit: Flashkirby
/obj/structure/flora/pottedplant
	name = "potted plant"
	desc = "Really brings the room together."
	icon = 'icons/obj/plants.dmi'
	icon_state = "plant-01"
	plane = ABOVE_HUMAN_PLANE
	layer = ABOVE_HUMAN_LAYER

/obj/structure/flora/pottedplant/large
	name = "large potted plant"
	desc = "This is a large plant. Three branches support pairs of waxy leaves."
	icon_state = "plant-26"

/obj/structure/flora/pottedplant/fern
	name = "potted fern"
	desc = "This is an ordinary looking fern. It looks like it could do with some water."
	icon_state = "plant-02"

/obj/structure/flora/pottedplant/overgrown
	name = "overgrown potted plants"
	desc = "This is an assortment of colourful plants. Some parts are overgrown."
	icon_state = "plant-03"

/obj/structure/flora/pottedplant/bamboo
	name = "potted bamboo"
	desc = "These are bamboo shoots. The tops looks like they've been cut short."
	icon_state = "plant-04"

/obj/structure/flora/pottedplant/largebush
	name = "large potted bush"
	desc = "This is a large bush. The leaves stick upwards in an odd fashion."
	icon_state = "plant-05"

/obj/structure/flora/pottedplant/thinbush
	name = "thin potted bush"
	desc = "This is a thin bush. It appears to be flowering."
	icon_state = "plant-06"

/obj/structure/flora/pottedplant/mysterious
	name = "mysterious potted bulbs"
	desc = "This is a mysterious looking plant. Touching the bulbs cause them to shrink."
	icon_state = "plant-07"

/obj/structure/flora/pottedplant/smalltree
	name = "small potted tree"
	desc = "This is a small tree. It is rather pleasant."
	icon_state = "plant-08"

/obj/structure/flora/pottedplant/unusual
	name = "unusual potted plant"
	desc = "This is an unusual plant. It's bulbous ends emit a soft blue light."
	icon_state = "plant-09"
	set_light(l_range = 2, l_power = 2, l_color = "#007fff")

/obj/structure/flora/pottedplant/orientaltree
	name = "potted oriental tree"
	desc = "This is a rather oriental style tree. It's flowers are bright pink."
	icon_state = "plant-10"

/obj/structure/flora/pottedplant/smallcactus
	name = "small potted cactus"
	desc = "This is a small cactus. Its needles are sharp."
	icon_state = "plant-11"

/obj/structure/flora/pottedplant/tall
	name = "tall potted plant"
	desc = "This is a tall plant. Tiny pores line its surface."
	icon_state = "plant-12"

/obj/structure/flora/pottedplant/sticky
	name = "sticky potted plant"
	desc = "This is an odd plant. Its sticky leaves trap insects."
	icon_state = "plant-13"

/obj/structure/flora/pottedplant/smelly
	name = "smelly potted plant"
	desc = "This is some kind of tropical plant. It reeks of rotten eggs."
	icon_state = "plant-14"

/obj/structure/flora/pottedplant/small
	name = "small potted plant"
	desc = "This is a pot of assorted small flora. Some look familiar."
	icon_state = "plant-15"

/obj/structure/flora/pottedplant/aquatic
	name = "aquatic potted plant"
	desc = "This is apparently an aquatic plant. It's probably fake."
	icon_state = "plant-16"

/obj/structure/flora/pottedplant/shoot
	name = "small potted shoot"
	desc = "This is a small shoot. It still needs time to grow."
	icon_state = "plant-17"

/obj/structure/flora/pottedplant/flower
	name = "potted flower"
	desc = "This is a slim plant. Sweet smelling flowers are supported by spindly stems."
	icon_state = "plant-18"

/obj/structure/flora/pottedplant/crystal
	name = "crystalline potted plant"
	desc = "These are rather cubic plants. Odd crystal formations grow on the end."
	icon_state = "plant-19"

/obj/structure/flora/pottedplant/subterranean
	name = "subterranean potted plant"
	desc = "This is a subterranean plant. It's bulbous ends glow faintly."
	icon_state = "plant-20"
	set_light(l_range = 1, l_power = 0.5, l_color = "#ff6633")

/obj/structure/flora/pottedplant/minitree
	name = "potted tree"
	desc = "This is a miniature tree. Apparently it was grown to 1/5 scale."
	icon_state = "plant-21"

/obj/structure/flora/pottedplant/stoutbush
	name = "stout potted bush"
	desc = "This is a stout bush. Its leaves point up and outwards."
	icon_state = "plant-22"

/obj/structure/flora/pottedplant/drooping
	name = "drooping potted plant"
	desc = "This is a small plant. The drooping leaves make it look like its wilted."
	icon_state = "plant-23"

/obj/structure/flora/pottedplant/tropical
	name = "tropical potted plant"
	desc = "This is some kind of tropical plant. It hasn't begun to flower yet."
	icon_state = "plant-24"

/obj/structure/flora/pottedplant/dead
	name = "dead potted plant"
	desc = "This is the dried up remains of a dead plant. Someone should replace it."
	icon_state = "plant-25"

/obj/structure/flora/pottedplant/decorative
	name = "decorative potted plant"
	desc = "This is a decorative shrub. It's been trimmed into the shape of an apple."
	icon_state = "applebush"

