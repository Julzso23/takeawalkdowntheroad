function love.conf(t)
	t.identity = "TAWDTR"
	t.version = "0.9.0"
	t.console = true

	t.window.title = "Take a Walk Down the Road"
	t.window.icon = nil
	t.window.width = 1280
	t.window.height = 720
	t.window.borderless = false
	t.window.resizable = false
	t.window.minwidth = 1
	t.window.minheight = 1
	t.window.fullscreen = false
	t.window.fullscreentype = "normal"
	t.window.vsync = false
	t.window.fsaa = 0
	t.window.display = 1

	t.modules.audio = true
	t.modules.event = true
	t.modules.graphics = true
	t.modules.image = true
	t.modules.joystick = true
	t.modules.keyboard = true
	t.modules.math = true
	t.modules.mouse = true
	t.modules.physics = false
	t.modules.sound = true
	t.modules.system = true
	t.modules.timer = true
	t.modules.window = true
end