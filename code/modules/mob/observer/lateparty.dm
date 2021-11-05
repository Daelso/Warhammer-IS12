// Wel Ard's whacky late party system, look to admin verbs for tools that play around with this namely generate party and another party
//This is the current slightly improved version of the observer file variant, much mo flexible. It is a clown world system but it just works.
/mob/observer/ghost/verb/latepartynew()
	set category = "Ghost"
	set name = "Late Party"
	set desc= "Join a randomized late party picked from a list!"

	var/partydelay = 24000 //in deciseconds (40 min or 24000 deciseconds)

	if(world.time < partydelay) //all this does is cause a delay so people can't suicide or observer and rush the base
		to_chat(src, "It is too early for a late party! This will open when round duration reaches 0:40!")
		return

	if(GLOB.deployed == 1) //checks if a party has already been sent, can make this value higher if you wish to send more than one!
		to_chat(src, "The late party has already deployed!")
		return

	if(src.isreadied == 1) //not really used rn but could be useful if you ever wanna make people spawn in batches so they can opt out
		to_chat(src,"<span class='warning'><b><font size=3>You leave the queue for the late party!</b></font size=3>")
		src.isreadied = 0 //unreadies player
		GLOB.partygang-- //subtracts from amount readied up
		return
	else
		to_chat(src,"<span class='warning'><b><font size=3>You join the late party!</b></font size=3>")
		src.isreadied = 1 //readies player up
		GLOB.partygang++ //adds to amount readied up


	switch(GLOB.partygang)
		if(1)
			src.say("I'm joining the late party 1/3 deployed!") //just speaks to deadchat quickly so 1. people know its open and 2. lets them know the amount of slots left.
		if(2)
			src.say("I'm joining the late party 2/3 deployed!")
		
		if(3)
			src.say("I'm joining the late party 3/3 deployed! All slots are now filled!")
			GLOB.deployed++ //ensures that only 1 party can be sent
		if(4)
			src.say("I'm joining the late party 4/8 deployed! Admemes have opened another party!")
		if(5)
			src.say("I'm joining the late party 5/8 deployed!")
		if(6)
			src.say("I'm joining the late party 6/8 deployed!")
		if(7)
			src.say("I'm joining the late party 7/8 deployed!")
		if(8)
			src.say("I'm joining the late party 8/8 deployed! All slots are now filled!")
			GLOB.deployed++ //ensures that only 1 party can be sent


	var/partyteam = input("Spawn as late party", "Randomly selected party!") as anything in GLOB.latepartyoptions //automagically puts them into whatever the pick proc chooses

	switch(partyteam)

		//if("Kroot")
			//message_admins("[usr.key] has joined the late party: Kroot.", 0) //msgs jannies
			//to_chat(usr, "<span class='warning'><b><font size=3>It's been a long flight, go to your Kroot tab and be sure to stretch!</b></font size=3>") //tells mob to do thing
			//usr.loc = get_turf(locate("landmark*krootstart")) //where they spawning
			//var/mob/living/carbon/human/kroot/new_character = new(usr.loc) // da mob
			//new_character.key = usr.key //puts ghost in body with new key
		if("Orkz")
			message_admins("[usr.key] has joined the late party: Orkz.", 0) //msgs jannies
			to_chat(usr, "<span class='warning'><b><font size=3>Go to your Ork tab and be sure to stretch! You are a fearless killer, your kind are the terror and envy of the greatest warriors within the sector - you are the devourer of worlds and slayer of men - no blade nor bullet dare pierce your skin.</b></font size=3>") //tells mob to do thing
			usr.loc = get_turf(locate("landmark*orkstart")) //where they spawning
			var/mob/living/carbon/human/ork/new_character = new(usr.loc) // da mob
			new_character.key = usr.key //puts ghost in body with new key
		if("Tau")
			message_admins("[usr.key] has joined the late party: Tau.", 0) //msgs jannies
			to_chat(usr, "<span class='warning'><b><font size=3>Check the Tau tab and remember your caste! It is up to you and your Squad to determine your mission here - remain loyal to eachother and remember the Doctrine Tactica. Plan and prepare for every possibility, and you will never act. It is nobler to have courage as we stumble into half the things we fear than to analyze every possible obstacle and begin nothing.</b></font size=3>") //tells mob to do thing
			usr.loc = get_turf(locate("landmark*taustart")) //where they spawning
			var/mob/living/carbon/human/tau/new_character = new(usr.loc)// da mob
			new_character.key = usr.key //puts ghost in body with new key
		if("Genestealers")
			message_admins("[usr.key] has joined the late party: Genestealer.", 0) //msgs jannies
			to_chat(usr, "<span class='warning'><b><font size=3>You are the point of the spear of the Great Devourer. Grow your following and undermine this planets defenses.</b></font size=3>") //tells mob to do thing
			usr.loc = get_turf(locate("landmark*genestart")) //where they spawning
			var/mob/living/carbon/human/genestealer/new_character = new(usr.loc)// da mob
			new_character.key = usr.key //puts ghost in body with new key


/hook/startup/proc/chooseparty() //chooses one party on startup
	Get_Party()
	return

/proc/Get_Party() //dis is the proc that actually selects the party
	GLOB.latepartyoptions += pick("Orkz", "Tau",)

	//note for myself, make procs to spawn as group if you ever wanna switch to that.
	//Something like the new_character key that uses an if isreadied to pull them all at once. You could make like beKroot() that contains everything under if("kroot")
