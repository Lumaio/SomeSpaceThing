menu = {}

local font = love.graphics.newFont("Assets/visitor2.ttf", 64)

function menu:init()
	x = 400
	t = 0

	local playbutton = loveframes.Create("button")
	playbutton:SetWidth(200)
	playbutton:SetText("Play!"):CenterX()
	playbutton:SetY(100)
	playbutton.OnClick = function (object, x, y) Gamestate.switch(load) end

	local quitbutton = loveframes.Create("button")
	quitbutton:SetWidth(200)
	quitbutton:SetText("Quit!"):CenterX()
	quitbutton:SetY(130)
	quitbutton.OnClick = function (object, x, y) love.event.quit() end

end

function menu:enter(prev)

end

function menu:update(dt)
	loveframes.update(dt)
	t = t + dt
end

function menu:draw()
	love.graphics.setBackgroundColor(30,30,40)
	loveframes.draw()
	love.graphics.setFont(font)
	love.graphics.setColor(225, 225, 225, 255)
	love.graphics.printf("space Stuff", 0, 25, 800, "center")
end

function menu:mousepressed(x, y, button)
	loveframes.mousepressed(x, y, button)
end

function menu:mousereleased(x, y, button)
	loveframes.mousereleased(x, y, button)
end

function menu:keypressed(key, isrepeat)
	loveframes.keypressed(key)

	if key == " " then
		Gamestate.switch(play)
	end
end

function menu:keyreleased(key)
	loveframes.keyreleased(key)
end
