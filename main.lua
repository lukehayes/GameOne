local Game = require("F.Game")
local Util = require("F.Util")

local Point = require("F.ds.Point")
require("F.ds.Quadtree")

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
local pressed = false


-- for _, point in pairs(points) do
--   QuadTreeInsert(qt, point)
-- end

Game.events:emit("preload")

function love.load()
  Game.events:emit("load")
  love.graphics.getLineWidth(10)
end

function love.update(dt)
  Game.events:emit("preupdate")

  local scrW, scrH = love.graphics.getDimensions()

  local mx, my = love.mouse.getPosition()

  if love.keyboard.isDown("space") then
    if not pressed then
      local p = Point:new(mx, my)
      QuadTreeInsert(qt, p)
      table.insert(points, p)
      pressed = true
    end
  else
    pressed = false
  end

  if love.keyboard.isDown('x') then
    QuadtreeClear(qt)
    --points = {}
  end

  Game.events:emit("postupdate")
end

function love.draw()
  Game.events:emit("prerender")

  QuadTreeDraw(qt)

  for _, point in pairs(points) do
    point:draw()
  end

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
