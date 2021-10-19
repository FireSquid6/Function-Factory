if DEV_MODE
{
	if keyboard_check_pressed(vk_enter) global.debug_mode = !global.debug_mode
}