data:extend(
{
  	{
		type = "item",
		name = "ancient-drill",
		icon = "__AncientDrill__/graphics/icons/ancient-drill.png",
		icon_size = 64, icon_mipmaps = 4,
		--flags = {"goes-to-quickbar"},
		subgroup = "extraction-machine",
		order = "a[items]-b[ancient-drill]",
		place_result = "ancient-drill",
		stack_size = 10,
		default_import_location = mods["space-age"] and "fulgora" or nil,
		weight = 200*kg
	},
})