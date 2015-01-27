require("Objects.player")
require("Objects.hud")
require("Objects.bullet")

play = {}

local cam = 0
local font = love.graphics.newFont("Assets/visitor2.ttf", 16)

function play:enter(prev)

end

function play:init()
	Player:Init()
	Player.body:setX(Planets[5].x)
	Player.body:setY(Planets[5].y)
	cam = Camera(Player.x, Player.y, 1, 0)
end

function play:update(dt)
	Player:Update(dt)
	UpdateBullets(dt)
	cam:lookAt(Player.x, Player.y)
end

function play:draw()
	cam:attach()
	DrawPlanets()
	Player:Draw()
	DrawBullets()
	cam:detach()

	love.graphics.setBackgroundColor(5, 5, 5)
	love.graphics.setFont(font)
	DrawHud()
end

function play:keypressed(key, isrepeat)
end

function play:keyreleased(key)
	if key == "escape" then
		Gamestate.switch(menu)
	end
end
