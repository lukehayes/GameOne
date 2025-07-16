local Game = require("F.Game")
local Util = require("F.Util")
local Col = require("F.col.Collision")
local R   = require("F.gfx.Renderer")

require 'F.Player'
require 'F.Area'

local Point = require("F.ds.Point")
require("F.ds.Quadtree")

local p  = PlayerCreate(300,300)
local a1 = AreaCreate(100,100,100,120)
local pa = AreaCreate(p.x,p.y,40,70)

local points = {}

-- for _ = 1, 1330 do
--   local rx = love.math.random(10, 800)
--   local ry = love.math.random(10, 600)
--
--   local p = Point:new(rx, ry)
--
--   table.insert(points, p)
-- end

-- local qt = nil
local scrW, scrH = love.graphics.getDimensions()
local qt = QuadTreeCreate(0, 0, scrW, scrH)

-- for _, point in pairs(points) do
--   QuadTreeInsert(qt, point)
-- end

Game.events:emit("preload")

function love.load()
  Game.events:emit("load")
end

function love.update(dt)
  Game.events:emit("preupdate")

  local scrW, scrH = love.graphics.getDimensions()

  local mx, my = love.mouse.getPosition()

  if love.mouse.isDown(1) then
    local p = Point:new(mx, my)
    QuadTreeInsert(qt, p)
    table.insert(points, p)
  end

  PlayerInput(p)
  
  if Col.collides(p, a1) then

    if love.keyboard.isDown('space') then
      a1.x = love.math.random(100,500)
      a1.y = love.math.random(100,500)
      a1.w = love.math.random(10,500)
      a1.h = love.math.random(10,500)
    end
  end
  
  pa.x = p.x - (pa.w / 2) + p.w / 2
  pa.y = p.y - (pa.h / 2) + p.h / 2

  Game.events:emit("postupdate")
end

function love.draw()
  Game.events:emit("prerender")

  for _, point in pairs(points) do
    point:draw()
  end
  
  R.draw(p)
  R.draw(pa)
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
