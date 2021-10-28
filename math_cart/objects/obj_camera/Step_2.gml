var movex = 0, movey = 0
#macro CAMERA_SPEED 8

//get inputs
if global.controller_type = CONTROLLERS.KEYBOARD_AND_MOUSE
{
	movex = keyboard_check(ord("D")) - keyboard_check(ord("A"))
	movey = keyboard_check(ord("S")) - keyboard_check(ord("W"))
}

//move based on inputs
hspd = movex * CAMERA_SPEED
vspd = movey * CAMERA_SPEED

cameraX += hspd
cameraY += vspd

//stop the camera from showing stuff outside of the room
cameraX=clamp(cameraX,0,room_width-cameraWidth);
cameraY=clamp(cameraY,0,room_height-cameraHeight);

//set the cameras position to the new x and y position
camera_set_view_pos(view_camera[0],cameraX,cameraY);