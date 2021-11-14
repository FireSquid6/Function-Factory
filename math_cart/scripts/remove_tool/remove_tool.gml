function sh_remove_tool(args)
{
	var index = args[0]
	if instance_exists(obj_player)
	{
		with obj_player
		{
			array_delete(toolbox, index, 1)
			toolbox_canvas = get_toolbox_canvas(toolbox)
		}
	}
}

function meta_remove_tool()
{
	return
	{
		description: "remove a tool"
		arguments: ["index"]
	}
}