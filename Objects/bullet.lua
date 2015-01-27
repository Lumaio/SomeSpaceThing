Bullets = {}

i6 = love.graphics.newImage("Assets/Ships/beam.png")

function CreateBullet(x, y, rot)
	table.insert(Bullets, {x = x, y = y, rot = rot, image = i6})
end

function UpdateBullets(dt)
	for i,v in ipairs(Bullets)do
		local angle = math.rad(v.rot-90)
		local dx = math.cos(angle) * 800 * dt
		local dy = math.sin(angle) * 800 * dt
		v.x = v.x + dx
		v.y = v.y + dy
	end
end

function DrawBullets()
	for i,v in ipairs(Bullets) do
		love.graphics.draw(v.image, v.x, v.y, math.rad(v.rot), 1, 1, v.image:getWidth()/2, v.image:getHeight()/2)
	end
end
