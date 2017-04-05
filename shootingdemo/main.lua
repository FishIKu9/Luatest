--shooting game demo

function love.load()
	character = {
		x = 0,
		y = 0,
		w = 0,
		h = 0,
		cdspace = 10,
		cdspell = 10,
		l = 0,
		r = 0,
		t = 0,
		b = 0,
		hp = 100,
		vx = 0,
		vy = 0,
		ax = 0,
		ay = 0
	} 

	bullet = {
		x = 0,
		y = 0

	}

	spellcard = {
		x = 0,
		y = 0,
	}

	Player1 = {
		x = 400,
		y = 300
	}

	Player2 = {
		x = 0,
		y = 0

	}

	setmetatable(Player1,character)
	setmetatable(Player2,character)

end 

function keytest()
	local down = love.keyboard.isDown
	if down("w") then
		Player1.y = Player1.y - 8
	elseif down("s") then
	    Player1.y = Player1.y + 8
	elseif down("a") then
	    Player1.x = Player1.x - 8
	elseif down("d") then
	    Player1.x = Player1.x + 8
	--elseif down("w") and down("d") then
	    --Player1.x = Player1.x + 8
	    --Player1.y = Player1.y - 8

	end
end

function love.update()
	keytest()
end

function love.draw(...)
	love.graphics.setColor(255, 0, 0)
	love.graphics.circle("fill", Player1.x, Player1.y, 10)
end