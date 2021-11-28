#region SCRIBBLE
scribble_font_add("fnt_default")
scribble_font_add("fnt_droid_sans_mono")

#endregion

#region DEV MODE MANAGEMENT

var dev_struct, buff, str
if file_exists(DEV_FILE_NAME)
{
	buff = buffer_load(DEV_FILE_NAME)
	str = buffer_read(buff, buffer_string)
	dev_struct = json_parse(str)
}
else
{
	dev_struct = 
	{
		on : false,
		note : "Only mess with this file if you know what you're doing"
	}
	str = json_stringify(dev_struct)
	buff = buffer_create(1, buffer_grow, 1)
	buffer_write(buff, buffer_string, str)
	
	buffer_save(buff, DEV_FILE_NAME)
}

global.dev_mode = dev_struct.on

#endregion

#region SAVE MANAGEMENT
global.first_launch = !file_exists(SETTINGS_FILE_NAME)

//if it's the first time launching the game
if global.first_launch
{	
	global.user_preferences = 
	{
		debug_on : false,
		developer : file_exists("devmode.funcpref"),
		master_volume : 1,
		effect_volume : 1,
		music_volume : 1,
		
		key_bindings :
		{
			
		},
		
		gamepad_bindings:
		{
			
		},
		
		graphics:
		{
			
		}
	}
	
}
//otherwise load the save file
else
{
	var buff = buffer_load(SETTINGS_FILE_NAME)
	var str = buffer_read(buff, buffer_string)
	global.user_preferences = json_parse(str)
}
#endregion

#region INITIATE GLOBALS
room = lv_level1
global.entity_move_speed = 4
global.in_level = false
global.debug_mode = global.user_preferences.debug_on

#endregion

#region GET THE CORRECT PLATFORM AND INPUT METHOD
enum CONTROLLERS
{
	KEYBOARD_AND_MOUSE,
	GAMEPAD,
	TOUCH
}
global.on_desktop = false
global.on_mobile = false
global.controller_type = CONTROLLERS.KEYBOARD_AND_MOUSE

switch os_type
{
	case os_windows:
		global.on_desktop = true
		global.on_mobile = false
		global.controller_type = CONTROLLERS.KEYBOARD_AND_MOUSE
		break
	case os_uwp:
		global.on_desktop = true
		global.on_mobile = false
		global.controller_type = CONTROLLERS.KEYBOARD_AND_MOUSE
		break
	case os_operagx:
		global.on_desktop = true
		global.on_mobile = false
		global.controller_type = CONTROLLERS.KEYBOARD_AND_MOUSE
		break
	case os_linux:
		global.on_desktop = true
		global.on_mobile = false
		global.controller_type = CONTROLLERS.KEYBOARD_AND_MOUSE
		break
	case os_macosx:
		global.on_desktop = true
		global.on_mobile = false
		global.controller_type = CONTROLLERS.KEYBOARD_AND_MOUSE
		break
	case os_ios:
		global.on_desktop = false
		global.on_mobile = true
		global.controller_type = CONTROLLERS.TOUCH
		break
	case os_tvos:
		global.on_desktop = false
		global.controller_type = CONTROLLERS.GAMEPAD
		break
	case os_android:
		global.on_desktop = false
		global.on_mobile = true
		global.controller_type = CONTROLLERS.TOUCH
		break
	case os_ps4:
		global.on_desktop = false
		global.on_mobile = false
		global.controller_type = CONTROLLERS.GAMEPAD
		break
	case os_ps5:
		global.on_desktop = false
		global.controller_type = CONTROLLERS.GAMEPAD
		break
	case os_xboxone:
		global.on_mobile = false
		global.on_desktop = false
		global.controller_type = CONTROLLERS.GAMEPAD
		break
	case os_switch:
		global.on_mobile = true
		global.on_desktop = false
		global.controller_type = CONTROLLERS.GAMEPAD
		break
	case os_unknown:
		global.on_mobile = true
		global.on_desktop = true
		global.controller_type = CONTROLLERS.GAMEPAD
		break
}

#endregion

