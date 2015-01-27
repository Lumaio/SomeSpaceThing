load = {}

function load:enter(prev)

end

function load:init()
	local t = 0
	local j = 0
end

function load:update(dt)
	t = t + dt
	if t > 2 then
		for i = 1,50 do
			local x = math.random(-500000, 500000)
			local y = math.random(-500000, 500000)
			CreatePlanet(x,y)
			j = i
		end
		Gamestate.switch(play)
	end
end

function load:draw()
	love.graphics.setColor(200, 200, 200)
	love.graphics.printf("... loading ...", 0, 25, 800, "center")

end
