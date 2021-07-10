
//Bartender
/obj/item/clothing/head/chefhat
	name = "chef's hat"
	desc = "It's a hat used by chefs to keep hair out of your food. Judging by the food in the mess, they don't work."
	icon_state = "chefhat"
	item_state = "chefhat"


//Magistrate
/obj/item/clothing/head/crown
	name = "commandant's hat of authority"
	icon_state = "redoffcap"
	item_state = "redoffcap"
	desc = "It's good being Commandant."
	flags_inv = BLOCKHEADHAIR
	body_parts_covered = HEAD
	unacidable = TRUE //Do NOT want to lose this randomly.

//Captain
/obj/item/clothing/head/caphat
	name = "captain's hat"
	icon_state = "captain"
	desc = "It's good being the king."
	item_state_slots = list(
		slot_l_hand_str = "caphat",
		slot_r_hand_str = "caphat",
		)
	body_parts_covered = 0

/obj/item/clothing/head/rt
	name = "rogue trader's cap"
	desc = "A fanciful hat fitting a wealthy Rogue Trader."
	icon_state = "fancyhat"
	item_state = "fancyhat"

/obj/item/clothing/head/rtpimp
	name = "rogue trader's big cap"
	desc = "A fanciful hat fitting a wealthy Rogue Trader."
	icon_state = "rtpimp"
	item_state = "bighat"

/obj/item/clothing/head/caphat/formal
	name = "parade hat"
	desc = "No one in a commanding position should be without a perfect, white hat of ultimate authority."
	icon_state = "officercap"

/obj/item/clothing/head/caphat/cap
	name = "rogue trader's hat"
	desc = "The wonderfully fancy hat of a wealthy Rogue Trader."
	icon_state = "capcap"

//HOP
/obj/item/clothing/head/caphat/hop
	name = "crew resource's hat"
	desc = "A stylish hat that both protects you from enraged former-crewmembers and gives you a false sense of authority."
	icon_state = "hopcap"

/obj/item/clothing/head/seneschal
	name = "seneschal's cap"
	desc = "This hat is the mark of the right-hand of a Rogue Trader. He handles business while the Trader is otherwise occupied."
	icon_state = "chaperon"
	item_state = "chaperon"

//Chaplain
/obj/item/clothing/head/chaplain_hood
	name = "chaplain's hood"
	desc = "It's hood that covers the head. It keeps you warm during the space winters."
	icon_state = "chaplain_hood"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

//Chaplain
/obj/item/clothing/head/nun_hood
	name = "nun hood"
	desc = "Maximum piety in this star system."
	icon_state = "nun_hood"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

//Medical
/obj/item/clothing/head/surgery
	name = "surgical cap"
	desc = "A cap surgeons wear during operations. Keeps their hair from tickling your internal organs."
	icon_state = "surgcap"
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/head/surgery/purple
	name = "purple surgical cap"
	color = "#7a1b3f"

/obj/item/clothing/head/surgery/blue
	name = "blue surgical cap"
	color = "#4891e1"

/obj/item/clothing/head/surgery/green
	name = "green surgical cap"
	color = "#255a3e"

/obj/item/clothing/head/surgery/black
	name = "black surgical cap"
	color = "#242424"

/obj/item/clothing/head/surgery/navyblue
	name = "navy blue surgical cap"
	color = "#1f3a69"

/obj/item/clothing/head/surgery/lilac
	name = "lilac surgical cap"
	color = "#c8a2c8"

/obj/item/clothing/head/surgery/teal
	name = "teal surgical cap"
	color = "#008080"

/obj/item/clothing/head/surgery/heliodor
	name = "heliodor surgical cap"
	color = "#aad539"

//Inquisition
/obj/item/clothing/head/cerberus
	name = "hound helmet"
	desc = "A steel hound helmet marking one as a hound of the Inquisition"
	icon_state = "cerberus"
	item_state = "cerberus"

/obj/item/clothing/head/inqhelm
	name = "agent helmet"
	desc = "An armored helmet displaying the mark of the Inquisition."
	icon_state = "inq_helm"
	item_state = "inq_helm"
	armor = list(melee = 65, bullet = 55, laser = 35,energy = 20, bomb = 30, bio = 30, rad = 30)
	siemens_coefficient = 0.9



//Security

/obj/item/clothing/head/helmet/guardhelmet
	name = "Guard Helmet"
	desc = "Sometimes protects your head from bullets and blows."
	icon_state = "guard"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/head/helmet/guardhelmet/enforcer
	name = "Enforcer Helmet"
	desc = "Sometimes protects your head from bullets and blows."
	icon_state = "Jhelm2"
	item_state = "Jhelm2"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/krieghelmet
	name = "Krieg Helmet"
	desc = "Sometimes protects your head from bullets and blows."
	icon_state = "krieghelm"
	item_state = "krieghelm"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/guardhelmet/catachan
    name = "Catachan Headband"
    desc = "Sometimes protects your head from bullets and blows."
    icon_state = "Catachan_Headband"
    cold_protection = HEAD
    min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	
/obj/item/clothing/head/helmet/ValhallanUshanka
	name = "Valhallan Ushanka"
	desc = "Sometimes protects your head from bullets and blows."
	icon_state = "ValhallanUshanka"
	item_state = "ValhallanUshanka"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/medicae
	name = "medicae helmet"
	desc = "Sometimes protects your head from bullets and blows."
	icon_state = "medicae"
	item_state = "medicae"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/commissar
	name = "Commissar\'s Cap"
	desc = "This cap strikes fear into the rank and file."
	icon_state = "Commissar4Hat"
	item_state = "Commissar4Hat"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/commissar/adept
	name = "Adept\'s Cap"
	desc = "This cap belongs to a member of the Administratum."
	icon_state = "captain_hat"
	item_state = "captain_hat"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

//Berets
/obj/item/clothing/head/beret
	name = "beret"
	desc = "A beret, an artists favorite headwear."
	icon_state = "beret"
	body_parts_covered = 0

/obj/item/clothing/head/beret/sec
	name = "corporate security beret"
	desc = "A beret with the security insignia emblazoned on it. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_red"

/obj/item/clothing/head/beret/sec/navy/officer
	name = "corporate security officer beret"
	desc = "A navy blue beret with an officer's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_navy_officer"

/obj/item/clothing/head/beret/sec/navy/hos
	name = "corporate security commander beret"
	desc = "A navy blue beret with a commander's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_navy_hos"

/obj/item/clothing/head/beret/sec/navy/warden
	name = "corporate security warden beret"
	desc = "A navy blue beret with a warden's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_navy_warden"

/obj/item/clothing/head/beret/sec/corporate/officer
	name = "corporate security officer beret"
	desc = "A corporate black beret with an officer's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_officer"

/obj/item/clothing/head/beret/sec/corporate/hos
	name = "corporate security commander beret"
	desc = "A corporate black beret with a commander's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_hos"

/obj/item/clothing/head/beret/sec/corporate/warden
	name = "corporate security warden beret"
	desc = "A corporate black beret with a warden's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_warden"

/obj/item/clothing/head/beret/engineering
	name = "corporate engineering beret"
	desc = "A beret with the engineering insignia emblazoned on it. For engineers that are more inclined towards style than safety."
	icon_state = "beret_orange"

/obj/item/clothing/head/beret/purple
	name = "purple beret"
	desc = "A stylish, if purple, beret. For personnel that are more inclined towards style than safety."
	icon_state = "beret_purple"

/obj/item/clothing/head/beret/centcom/officer
	name = "asset protection beret"
	desc = "A navy blue beret adorned with the crest of corporate asset protection. For asset protection agents that are more inclined towards style than safety."
	icon_state = "beret_corporate_navy"

/obj/item/clothing/head/beret/centcom/captain
	name = "asset protection command beret"
	desc = "A white beret adorned with the crest of corporate asset protection. For asset protection leaders that are more inclined towards style than safety."
	icon_state = "beret_corporate_white"

/obj/item/clothing/head/beret/deathsquad
	name = "heavy asset protection beret"
	desc = "An armored red beret adorned with the crest of corporate asset protection. Doesn't sacrifice style or safety."
	icon_state = "beret_red"
	armor = list(melee = 65, bullet = 55, laser = 35,energy = 20, bomb = 30, bio = 30, rad = 30)
	siemens_coefficient = 0.9

/obj/item/clothing/head/beret/guard
	name = "corporate security beret"
	desc = "A white beret adorned with the crest of NanoTrasen. For security guards that are more inclined towards style than safety."
	icon_state = "beret_corporate_whitered"

/obj/item/clothing/head/beret/plaincolor
	name = "beret"
	desc = "A simple, solid color beret. This one has no emblems or insignia on it."
	icon_state = "beret_white"



//Pilgrim
/obj/item/clothing/head/plebhood
	name = "pleb hood"
	desc = "A disgusting hood covering a disgusting head"
	icon_state = "plebhood"
	item_state = "plebhood"

/obj/item/clothing/head/bardhat
	name = "bard's hat"
	desc = "A fairly nice leather hat with a feather tucked into it."
	icon_state = "bardhat"
	item_state = "bardhat"

/obj/item/clothing/head/admemehat
	name = "admin's hat"
	desc = "A fairly nice leather hat with a feather tucked into it."
	icon_state = "admeme"
	item_state = "admeme"

/obj/item/clothing/head/musichat
	name = "bard's hat"
	desc = "A fairly nice leather hat with a feather tucked into it."
	icon_state = "obard"
	item_state = "obard"

/obj/item/clothing/head/smokingcap
	name = "smoking cap"
	desc = "A fancy smoking cap with golden tassle."
	icon_state = "smokingc"
	item_state = "smokingc"

/obj/item/clothing/head/pillbox
	name = "pillbox hat"
	desc = "A proper smerd hat"
	icon_state = "pillbox"
	item_state = "pillbox"

/obj/item/clothing/head/servitorhead
	name = "a servitor skull"
	desc = "A bone white skull littered with wiring and augments."
	icon_state = "servitor_helmet"
	item_state = "servitor_helmet"
	canremove = 0

/obj/item/clothing/head/servitorhead/janitor
	icon_state = "servitor_helmet2"
	item_state = "servitor_helmet2"
/obj/item/clothing/head/bighat
	name = "a big hat"
	desc = "A large, imposing hat."
	icon_state = "bighat"
	item_state = "bighat"

/obj/item/clothing/head/spookyhood
	name = "a spooky hood"
	desc = "A menacing hood"
	icon_state = "keeper"
	item_state = "keeper"


/obj/item/clothing/head/prac_cap
	name = "practioner cap"
	desc = "Wouldn't want your hair to get messy now would we."
	icon_state = "prac_cap"
	item_state = "prac_cap"
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/head/ushanka2
	name = "ushanka"
	desc = "A proper hat for one willing to brave the tundra."
	icon_state = "ushanka"
	item_state = "ushanka"
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/head/scum
	name = "pimp hat"
	desc = "Pretty fly for a space guy."
	icon_state = "scum"
	item_state = "scum"

/obj/item/clothing/head/bountyhead
	name = "bounty hunter\'s helm"
	desc = "A well worn and dented helm."
	icon_state = "skullopen"
	item_state = "skullopen"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = BLOCKHAIR
