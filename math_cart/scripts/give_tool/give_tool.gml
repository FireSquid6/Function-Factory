function sh_give_tool(args)
{
	if global.in_level
	{
		var tool
		switch args[0]
		{
			case "rail":
				tool = new tool_rail(c_white)
				break
			case "dispenser":
				tool = new tool_dispenser()
				break
			case "ejector":
				tool = new tool_ejector()
				break
		}
		with obj_player
		{
			array_push(toolbox, tool)
			toolbox_canvas = get_toolbox_canvas(toolbox)
		}
	}
	else
	{
		return "cannot execute command when not in a level"
	}
}

function meta_give_tool()
{
	return 
	{
		description: "add a tool to the toolbox",
		arguments: ["id"],
		suggestions:
		[
			["rail", "dispenser", "ejector"]
		],
		argumentDescriptions:
		[
			"the id of the tool"
		]
	}
}