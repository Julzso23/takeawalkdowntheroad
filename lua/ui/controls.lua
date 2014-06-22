controls = {}

controls.joysticks = {}

controls.axis = {}
controls.axis.__index = controls.axis

controls.axes = {}
controls.keybinds = {}
controls.controllerbinds = {}

function controls.axis.create(name, positive, negative, joystick, axis, deadzone, controllerPos, controllerNeg)
	local a = {}

	a.positive = positive
	a.negative = negative
	a.joystick = joystick
	a.axis = axis
	a.deadzone = deadzone
	a.controllerPos = controllerPos
	a.controllerNeg = controllerNeg

	setmetatable(a, controls.axis)

	controls.axes[ name ] = a
end

function controls.axis:value()
	if self.positive and self.negative then
		if love.keyboard.isDown(self.positive) and love.keyboard.isDown(self.negative) then
			return 0
		end
	end

	if self.positive then
		if love.keyboard.isDown(self.positive) then
			return 1
		end
	end

	if self.negative then
		if love.keyboard.isDown(self.negative) then
			return -1
		end
	end

	if controls.joysticks[self.joystick] then
		local js = controls.joysticks[self.joystick]
		if self.controllerPos and self.controllerNeg then
			if js:isGamepadDown(self.controllerPos) and js:isGamepadDown(self.controllerNeg) then
				return 0
			end
		end

		if self.controllerPos then
			if js:isGamepadDown(self.controllerPos) then
				return 1
			end
		end

		if self.controllerNeg then
			if js:isGamepadDown(self.controllerNeg) then
				return -1
			end
		end

		if self.axis then
			if math.abs(js:getGamepadAxis(self.axis)) > self.deadzone then
				return js:getGamepadAxis(self.axis)
			end
		end
	end

	return 0
end


function controls.newKeyBind(name, default)
	controls.keybinds[ name ] = default
end
function controls.newControllerBind(name, default)
	controls.controllerbinds[ name ] = default
end

function controls.isDown(bind)
	return love.keyboard.isDown(controls.keybinds[ bind ])
end

function controls.vibrate(joystick, intensity)
	if controls.joysticks[joystick] then
		if controls.joysticks[joystick]:isVibrationSupported() then
			controls.joysticks[joystick]:setVibration(intensity, intensity)
			timer.temp(intensity, 0, function()
				controls.joysticks[joystick]:setVibration(0, 0)
			end)
		end
	end
end

hook.add("load", "loadJoysticks", function()
	controls.joysticks = love.joystick.getJoysticks()
end)

hook.add("joystickadded", "updateJoysticks", function()
	controls.joysticks = love.joystick.getJoysticks()
end)

hook.add("joystickremoved", "updateJoysticks", function()
	controls.joysticks = love.joystick.getJoysticks()
end)