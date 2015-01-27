
function DrawHud()
	vx, vy = Player.body:getLinearVelocity()
	love.graphics.setColor(100, 100, 100, 100)
	love.graphics.rectangle("fill", 1, 1, 78, 58)
	love.graphics.setColor(255,255,255,255)
	love.graphics.print("X = " .. math.floor(Player.x), 10, 10)
	love.graphics.print("Y = " .. math.floor(Player.y), 10, 20)
	love.graphics.print("VX = " .. math.floor(vx), 10, 30)
	love.graphics.print("VY = " .. math.floor(vy), 10, 40)
end
