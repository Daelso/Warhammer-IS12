/mob/living/carbon/human/Stat()
	..()
	if(psyker == 1)
		stat(null, "Focus: [focus]/[max_focus]")
		stat(null, "Warp Heat: [WarpHeat/[max_WarpHeat]")

/mob/living/carbon/human/Life()
	..()
	var/regen = 0.5
	if(max_focus > 0)
		focus = max(0, min(focus + regen, max_focus))
		
/mob/living/carbon/human/WarpHeat()
	..()
	var/WarpHeat = 0
	if(WarpHeat > 0)
		WarpHeat = max(0, min(WarpHeat + 0.1, max_WarpHeat))
	if(WarpHeat >= 100)
		usr.visible_message("<span class='notice'>[usr] is positively radiating with foul Warp energy! A foul sickness washes over you!</span>",\
		"You're burning out on Warp energy! You feel the Eye of Terror gazing at you directly!")
