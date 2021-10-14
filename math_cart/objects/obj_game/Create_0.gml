room = lv_level1
global.entity_move_speed = 4
global.in_level = false


global.first_launch = !file_exists(WELCOME_FILE_NAME)

//if it's the first time launching the game, add a fun note
if global.first_launch
{
	var file = file_text_open_write(WELCOME_FILE_NAME)
	var str = "IMPORTANT: THIS FILE IS HOW THE GAME KNOWS IF IT'S THE FIRST TIME OPENING THE GAME OR NOT. DON'T DELETE IT UNLESS YOU KNOW WHAT YOU'RE DOING!\n\n\n\n\nalso hello random player in this file. \nPlease create the file 'myballs.txt' in this directory and put whatever you want in it for an achievement."
	file_text_write_string(file, str)
	file_text_close(file)
}
//otherwise load the save file
else
{
	
}