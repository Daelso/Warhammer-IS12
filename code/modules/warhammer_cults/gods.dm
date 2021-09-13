
//basic framework for the god system

/mob/living/carbon/human
	var/god = EMPEROR_N

	proc/give_gifts()						//THIS THING ALSO GETS STUCK FOR SOME FUCKING REASON BRO
		var/gift = rand(1, 100)
		switch(god)
			if(KHORNE)
				switch(gift)
					if(1 to 50)
						var/obj/item/I = new /obj/item/melee/pcsword/eviscerator/chainaxe(loc)
						equip_to_slot_if_possible(I, slot_r_hand)
						return "item"
					if(51 to 80)
						gift_mutation()
						return "mutation"
					if(81 to 100)
						verbs += /mob/living/carbon/human/proc/pool_summoning
						return "spell bloodletter"
				return "IT DOESNT WORK WHAT THE FUCK"
			if(TZEENTCH)
				return
			if(SLAANESH)									//these three will be added in the future i guess
				return
			if(NURGLE)
				return

	proc/gift_mutation()
		switch(god)
			if(KHORNE)
				change_skin_color(133, 96, 10)
				species.brute_mod =  0.80
				species.burn_mod =   0.95
				species.slowdown =   0.70
				to_chat(src, "<span='notice'>You start to feel heavier and your skin becomes metallic and rough.</span>)")
			if(TZEENTCH)
				return
			if(SLAANESH)
				return
			if(NURGLE)
				return
