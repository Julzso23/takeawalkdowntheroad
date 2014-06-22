world = {}
world.__index = world

function world.create()
	local bump = require("lib/bump")

	local w = {}
	w.world = bump.newWorld()
	w.tiles = {}
	w.players = {}

	setmetatable(w, world)
	return w
end