local Game = require 'F.Game'
local Util = require 'F.Util'

local Point = require 'F.ds.Point'
require 'F.ds.Quadtree'

local points = {}

for _ = 1, 10, 1 do
  local rx = love.math.random(10,800)
  local ry = love.math.random(10,600)

  local p = Point:new(rx,ry)

  table.insert(points, p)
end

local qt = QuadTreeCreate(0,0,800,600)

for _, point in pairs(points) do
  QuadTreeInsert(qt, point)
end


Game.events:emit('preload')

function love.load()
  Game.events:emit('load')
end

function love.update(dt)
  Game.events:emit('preupdate')

  Game.events:emit('postupdate')
end

function love.draw()
  Game.events:emit('prerender')

  for _, point in pairs(points) do
    point:draw()
  end

  Game.events:emit('postrender')
end

function love.keypressed(key, scancode, isrepeat)

   if key == "space" then
    Game.events:emit('space_pressed')
  end

   if key == "escape" then
      love.event.quit()
   end
end
