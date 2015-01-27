Gamestate = require("hump.gamestate")
Camera = require("hump.camera")
loveframes = require("LoveFrames")
require("States.menustate")
require("States.playstate")
require("States.loadstate")
require("Objects.planet")

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest", 0)
	love.physics.setMeter(32)
	World = love.physics.newWorld(0, 0, true)
	Gamestate.switch(menu)
end

function love.keypressed(key, isrepeat)
	Gamestate.keypressed(key, isrepeat)
end

function love.keyreleased(key, isrepeat)
	Gamestate.keyreleased(key, isrepeat)
end

function love.mousepressed(x, y, button)
	Gamestate.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	Gamestate.mousereleased(x, y, button)
end

function love.update(dt)
	Gamestate.update(dt)
	World:update(dt)
end

function love.draw()
	Gamestate.draw()
end
