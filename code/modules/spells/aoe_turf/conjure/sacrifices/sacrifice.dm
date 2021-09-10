/*
Sacrificial spells, conjure objects or mobs in exchange of a sacrifice
very obvious
*/

/spell/aoe_turf/conjure/sacrifice
	name = "Sacrifice"
	desc = "This spell conjures objs of the specified types in range, in exchange of something."

	var/list/sacrifices = list()						//items that are supposed to be used to summon the thing

/spell/aoe_turf/conjure/sacrifice/cast(list/targets, mob/living/carbon/human/user)

	for(var/i=1,i <= summon_amt,i++)
		if(!targets.len)
			break
		var/summoned_object_type
		if(summon_exclusive)
			if(!summon_type.len)
				break
			summoned_object_type = summon_type[1]
			summon_type -= summoned_object_type
		else
			summoned_object_type = pick(summon_type)
		var/turf/spawn_place = pick(targets)
		if(spell_flags & IGNOREPREV)
			targets -= spawn_place

		var/atom/summoned_object
		if(sacrifices in range(2, user))
			if(ispath(summoned_object_type,/turf))
				if(istype(get_turf(user),/turf/simulated/shuttle) || istype(spawn_place, /turf/simulated/shuttle))
					to_chat(user, "<span class='warning'>You can't build things on shuttles!</span>")
					continue
				spawn_place.ChangeTurf(summoned_object_type)
				qdel(sacrifices)
				summoned_object = spawn_place
			else
				summoned_object = new summoned_object_type(spawn_place)
				qdel(sacrifices)
		else
			to_chat(user, "<span='warning'>You don't have the required sacrifices to conjure this spell.</span>")
			return
		var/atom/movable/overlay/animation = new /atom/movable/overlay(spawn_place)
		animation.SetName("conjure")
		animation.set_density(0)
		animation.anchored = 1
		animation.icon = 'icons/effects/effects.dmi'
		animation.plane = HUMAN_PLANE
		animation.layer = BASE_MOB_LAYER
		animation.master = summoned_object
		if(istype(summoned_object,/mob)) //we want them to NOT attack us.
			var/mob/M = summoned_object
			M.faction = user.faction

		for(var/varName in newVars)
			if(varName in summoned_object.vars)
				summoned_object.vars[varName] = newVars[varName]

		if(duration)
			spawn(duration)
				if(summoned_object && !istype(summoned_object, /turf))
					qdel(summoned_object)
		conjure_animation(animation, spawn_place)
	return