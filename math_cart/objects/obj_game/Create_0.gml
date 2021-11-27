#region SCRIBBLE
scribble_font_add("fnt_default")
scribble_font_add("fnt_droid_sans_mono")

#endregion

#region INITIATE GLOBALS
room = lv_level1
global.entity_move_speed = 4
global.in_level = false
global.debug_mode = false

#endregion

#region SAVE MANAGEMENT
global.first_launch = !file_exists(WELCOME_FILE_NAME)
file_text_open_write("devmode.funcpref") //init stuff in dev mode

//if it's the first time launching the game, add a fun note
if global.first_launch
{
	var file = file_text_open_write(WELCOME_FILE_NAME)
	var str = "IMPORTANT: THIS FILE IS HOW THE GAME KNOWS IF IT'S THE FIRST TIME OPENING THE GAME OR NOT. DON'T DELETE IT UNLESS YOU KNOW WHAT YOU'RE DOING!\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nalso hello random player in this file. \nPlease create the file 'myballs.txt' in this directory and put whatever you want in it for an achievement."
	file_text_write_string(file, str)
	file_text_close(file)
	
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
	global.user_preferences = buffer_load(SETTINGS_FILE_NAME)
}
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

