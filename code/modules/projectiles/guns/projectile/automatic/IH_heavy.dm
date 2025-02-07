//Primary AR of IH. Has supreme AP to deal with those pesky Serbs (guildsmans actually) in armored hardsuits.
/obj/item/weapon/gun/projectile/automatic/IH_heavyrifle
	name = "FS AR .20 \"Wintermute\""
	desc = "A high end military grade assault rifle, designed as a modern ballistic infantry weapon. Primarily used by and produced for IH troops. Uses IH .20 Rifle magazines."
	icon = 'icons/obj/guns/projectile/IH_heavyrifle.dmi'
	icon_state = "IH_heavyrifle"
	item_state = "IH_heavyrifle"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	caliber = "srifle"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_IH
	magazine_type = /obj/item/ammo_magazine/ihsrifle
	auto_eject = 1
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 3500
	fire_sound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	zoom_factor = 0.4
	recoil_buildup = 7

	firemodes = list(
		FULL_AUTO_400,
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)

/obj/item/weapon/gun/projectile/automatic/IH_heavyrifle/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"
		itemstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/automatic/IH_heavyrifle/Initialize()
	. = ..()
	update_icon()