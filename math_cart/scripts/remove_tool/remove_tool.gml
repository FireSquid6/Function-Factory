function sh_remove_tools(args)
{
	var index = args[1]
	var amount = args[2]
	if instance_exists(obj_player)
	{
		with obj_player
		{
			for (var i = 0; i < amount; i++)
			{
				array_delete(toolbox, index + i, 1)
			}
			toolbox_canvas = get_toolbox_canvas(toolbox)
		}
	}
}

function meta_remove_tools()
{
	return
	{
		description: "remove a tool",
		arguments: ["index", "amount"],
		argumentDescriptions: ["Starting index to start removing", "Amount from that index to remove"]
	}
}