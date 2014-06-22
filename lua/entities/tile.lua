tile = {}
tile.__index = tile

function tile.create(world, x, y, w, h, tileType)
	local t = {}
	t.type = tileType or "grass"

	setmetatable(t, tile)
	world.world:add(t, x, y, w or 64, h or 64)
	table.insert(world.tiles, t)
end