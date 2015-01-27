Planets = {}
local b = false

function CreatePlanet(x, y)
	if not b then
		i1 = love.graphics.newImage("Assets/Planets/planet1.png")
		i2 = love.graphics.newImage("Assets/Planets/planet2.png")
		i3 = love.graphics.newImage("Assets/Planets/planet3.png")
		i4 = love.graphics.newImage("Assets/Planets/planet4.png")
		i5 = love.graphics.newImage("Assets/Planets/planet5.png")
		b = true
	end
	p = {}
	p.x = x
	p.y = y
	r = math.random(5)
	if r == 1 then
		p.image = i1
	elseif r == 2 then
		p.image = i2
	elseif r == 3 then
		p.image = i3
	elseif r == 4 then
		p.image = i4
	elseif r == 5 then
		p.image = i5
	else
		p.image = i1
	end
	table.insert(Planets, p)
end

function DrawPlanets()
	for i,v in ipairs(Planets) do
		love.graphics.draw(v.image, v.x, v.y, 0, .5, .5, v.image:getWidth()/2, v.image:getHeight()/2)
	end
end
