Player = {}

local flying = false

function Player:Init()
	Player.name = "Lumaio"
	
	-- Positions
	Player.x = 0
	Player.y = 0
	Player.dx = 0
	Player.dy = 0
	Player.velx = 0
	Player.vely = 0
	Player.rot = 0

	-- Images
	Player.ship = love.graphics.newImage("Assets/Ships/p_s.png")
	Player.fire = love.graphics.newImage("Assets/Ships/p_f.png")

	-- Physics
	Player.body = love.physics.newBody(World, 400, 300, "dynamic")
	Player.body:setFixedRotation(true)
	Player.body:setLinearDamping(0)

	Player.shape = love.physics.newCircleShape(16)
	Player.fixture = love.physics.newFixture(Player.body, Player.shape, 1)

end

local function Move(dt)
	angle = math.rad(Player.rot-90)
	Player.dx = math.cos(angle) * 600 * dt
	Player.dy = math.sin(angle) * 600 * dt

	if love.keyboard.isDown("up") then
		Player.body:applyLinearImpulse(Player.dx, Player.dy, Player.x, Player.y)
		flying = true
	else
		flying = false
	end
	if love.keyboard.isDown("down") then
		Player.body:applyLinearImpulse(-Player.dx, -Player.dy, Player.x, Player.y)
	end
	if love.keyboard.isDown("left") then
		Player.body:setAngle(Player.rot-200 * dt)
	end
	if love.keyboard.isDown("right") then
		Player.body:setAngle(Player.rot+200 * dt)
	end
	if love.keyboard.isDown("z") then
		CreateBullet(Player.x, Player.y, Player.rot)
	end

	if love.keyboard.isDown(" ") and not damping then
		Player.body:setLinearDamping(1)
	else
		Player.body:setLinearDamping(0)
	end
end

function Player:Update(dt)
	Player.x = Player.body:getX()
	Player.y = Player.body:getY()
	Player.rot = Player.body:getAngle()
	Move(dt)
end

function Player:Draw()
	love.graphics.draw(Player.ship, Player.x, Player.y, math.rad(Player.rot), 1, 1, Player.ship:getWidth()/2, Player.ship:getHeight()/2)
	if flying then
		love.graphics.draw(Player.fire, Player.x, Player.y, math.rad(Player.rot), 1, 1, Player.ship:getWidth()/2, Player.ship:getHeight()/2)
	end
--	love.graphics.circle("line", Player.body:getX(), Player.body:getY(), Player.shape:getRadius())
end
