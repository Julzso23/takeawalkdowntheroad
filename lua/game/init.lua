hook.add("gameInit", "init", function()
	controls.newKeyBind("left", "a")
	controls.newKeyBind("right", "d")
	controls.newKeyBind("jump", " ")
	controls.newControllerBind("jump", "a")

	controls.axis.create("horizontal", controls.keybinds.right, controls.keybinds.left, 1, "leftx", 0.25)
	controls.axis.create("jump", controls.keybinds.jump, nil, 1, nil, nil, controls.controllerbinds.jump)

	world = world.create()
	world.players[1] = player.create(world)

	tile.create(world, 0, 128, 128, 32)
	tile.create(world, 192, 256, 128, 64)
	tile.create(world, 256, 300, 128, 16)
end)

hook.add("gameUpdate", "update", function(dt)
	world.players[1]:move(dt, controls.axes.horizontal:value())

	if controls.axes.jump:value() == 1 then
		world.players[1]:jump()
	end
end)

hook.add("gameDraw", "draw", function()
	for k, v in pairs(world.tiles) do
		love.graphics.setColor(0, 0, 0)
		love.graphics.rectangle("fill", world.world:getRect(v).l, world.world:getRect(v).t, world.world:getRect(v).w, world.world:getRect(v).h)
	end
	for k, v in pairs(world.players) do
		love.graphics.setColor(64, 64, 64)
		love.graphics.rectangle("fill", world.world:getRect(v).l, world.world:getRect(v).t, world.world:getRect(v).w, world.world:getRect(v).h)
	end
end)