local Game = require("F.Game")
local Util = require("F.Util")
local R   = require("F.gfx.Renderer")

require 'F.Player'
require 'F.Area'

local p  = PlayerCreate(300,300)
local a1 = AreaCreate(100,100,100,120)
local pa = AreaCreate(p.x,p.y,40,70)

-- Move to global class
local scrW, scrH = love.graphics.getDimensions()

Game.events:emit("preload")

function love.load()
  Game.events:emit("load")
end

function love.update(dt)
  Game.events:emit("preupdate")

  PlayerInput(p)

  Game.events:emit("postupdate")
end

function love.draw()
  Game.events:emit("prerender")

  PlayerDraw(p,true)

  R.draw(a1)

  Game.events:emit("postrender")
end

function love.keypressed(key, scancode, isrepeat)
  if key == "space" then
    Game.events:emit("space_pressed")
  end

  if key == "escape" then
    love.event.quit()
  end
end
