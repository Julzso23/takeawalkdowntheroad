hook.add("gameInit", "init", function()
	controls.newKeyBind("left", "a")
	controls.newKeyBind("right", "d")
	controls.newKeyBind("jump", " ")
	controls.newControllerBind("jump", "a")

	controls.axis.create("horizontal", controls.keybinds.right, controls.keybinds.left, 1, "leftx", 0.25)
	controls.axis.create("jump", controls.keybinds.jump, nil, 1, nil, nil, controls.controllerbinds.jump)
end)

hook.add("gameUpdate", "update", function(dt)
end)

hook.add("gameDraw", "draw", function()
end)