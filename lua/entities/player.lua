player = {}
player.__index = player

function player.create(world)
	local p = {}
	p.world = world
	p.speed = 200
	p.vY = 0
	p.standing = false

	setmetatable(p, player)
	world.world:add(p, 0, 0, 64, 64)
	return p
end

function player:move(dt, x)
	local world = self.world.world

	world:move(self, world:getRect(self).l + (x*self.speed*dt), world:getRect(self).t + self.vY*dt)

	local collisions = world:check(self)
	if #collisions == 0 then
		self.vY = self.vY + 450 * dt
		self.standing = false
	end
	while #collisions >= 1 do
		local dx, dy = collisions[1]:getTouch()

		if dy == 0 then
			self.vY = self.vY + 450 * dt
			self.standing = false
		else
			self.vY = 0
			self.standing = true
		end

		world:move(self, dx, dy)
		collisions = world:check(self)
	end
end

function player:jump()
	if self.standing then
		self.vY = -350
	end
end