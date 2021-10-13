//declare variables
cameraX = 0;
cameraY = 0;

setup_camera();

//move to the target instance
if instance_exists(global.target)
{
	cameraX = global.target.x - (cameraWidth * 0.5);
	cameraY = global.target.y - (cameraHeight * 0.5);
}

//move to player
alarm[0]=1;