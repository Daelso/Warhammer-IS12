
//basic framework for the god system

/datum/god                                  //the emperor without benefits and gifts
	var/god_name = "The Emperor of Mankind"
	var/god_flavor = "The Emperor of Mankind is the sovereign of the Imperium of Man, and Father, Guardian, and God of the human race. His will is omnipotent, extending across the million worlds that comprise His Imperium. For ten thousand years the Emperor has served humanity, and protected it from outside forces. He guides humanity with his powers and more important servants."


	proc/give_gifts(mob/living/carbon/human/M)
		return

	proc/gift_mutation(mob/living/carbon/human/user)
		return

/datum/god/emperor                          //the emperor with benefits, used for priests
	god_name = "The Emperor of Mankind"
	god_flavor = "The Emperor of Mankind is the sovereign of the Imperium of Man, and Father, Guardian, and God of the human race. His will is omnipotent, extending across the million worlds that comprise His Imperium. For ten thousand years the Emperor has served humanity, and protected it from outside forces. He guides humanity with his powers and more important servants."

/datum/god/chaos/khorne
	god_name = "Khorne, The Blood God"
	god_flavor = "Khorne is the Chaos God of anger, violence and hate. He was the first of the four Gods of Chaos. Every act of violence gives Him power, whether commited by his followers or by their enemies. He despises magic as a whole, and scheming even more. He also represents the values of martial honour, pride and bravery."

	give_gifts(mob/living/carbon/human/M)						//THIS THING ALSO GETS STUCK FOR SOME FUCKING REASON BRO
		var/gift = rand(1, 100)
		switch(gift)
			if(1 to 40)
				var/obj/item/I = new /obj/item/melee/pcsword/eviscerator/chainaxe(M.loc)
				M.equip_to_slot_if_possible(I, slot_r_hand)
				return "item"
			if(41 to 60)
				gift_mutation(M)
				return "mutation"
			if(61 to 80)
				M.add_spell(/spell/bloodlust)
				return "spell bloodlust"
			if(81 to 100)
				M.add_spell(/spell/aoe_turf/conjure/sacrifice/bloodletter)
				return "spell bloodletter"
		return "IT DOESNT WORK WHAT THE FUCK"

	gift_mutation(mob/living/carbon/human/user)
		user.change_skin_color(133, 96, 10)
		user.species.brute_mod =  0.80
		user.species.burn_mod =   0.95
		user.species.slowdown =   0.8
		to_chat(user, "<span='notice'>You start to feel heavier and your skin becomes metallic and rough.</span>)")

/datum/god/chaos/tzeentch
	god_name = "Tzeentch, The Architect of Fate"
	god_flavor = "Tzeentch is the Chaos God of vitality and change. He is associated with sorcery and magic, as well as dynamic mutation, and grand, convoluted scheming. The domains of history, destiny, intrigue and plots are his chief interests, and in pursuit of these aspects he listens to the dreams and hopes of all and watches their plans take form."

/datum/god/chaos/nurgle
	god_name = "Nurgle, The Plague Father"
	god_flavor = "Nurgle is the Chaos God of insecurity, denial, self-delusion and the living's fear of inevitable death and disease, as well as their unconscious response to that fear, which is the power of life, the motivating power of mankind and other races. He is the Lord of All because all things, no matter how solid and permanent they seem, are liable to physical corruption."

/datum/god/chaos/slaanesh
	god_name = "Slaanesh, The Prince of Excess"
	god_flavor = "Slaanesh is the youngest Chaos God, it represents lust, greed, excess, pain, pleasure, perfection and hedonism. It pursues the earthly gratification and the overthrow of all decent behaviour, as well as hedonism and pleasure for its own sake. Wherever mortals are ruled by their own unquenchable desires, the Dark Prince of Chaos is there in the shadows, whispering, tempting, and feasting on a banquet of souls. But this is true in all things, not just carnal pleasures. Those who desire to indulge in the finest culinary delights, the most beautiful artworks, even the most sensual clothing, could all be amongst Slaanesh's disciples."

/datum/god/malice
	god_name = "Malal, The Lost"
	god_flavor = "Not much is known about Malal, he is an outcast, a forgotten Chaos God that represents anarchy and terror. He represents the Chaos itself of the Warp, and is notable for his hatred of the major Gods of Chaos. Followers of Malice, are prone to acts of anarchy, waging war upon not only the servants of the Imperium but also those of the other Gods of Chaos."
