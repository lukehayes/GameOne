--[[
/************************************************* Player  **************/
/*                                                                      */
/*              /\_/\           ___                                     */
/*             = o_o =_______    \ \  -LDH-                             */
/*              __^      __(  \.__) )                                   */
/*          (@)<_____>__(_____)____/                                    */
/*                                                                      */
/*                                                                      */
/*  Description:                                                        */
/*                                                                      */
/*  Player class                                                        */
/*  -------------------------------------------------------------       */
/*  https://www.github.com/                                             */
/*                                                                      */
/*                                                                      */
/************************************************************************/
]]
local Util   = require 'F.Util'


---Create a new Player instance.
---@param x any
---@param y any
---@return table
function PlayerCreate(x,y)

  local obj = {}

  obj.x = x or 0
  obj.y = y or 0
  obj.w = 16
  obj.h = 16
  obj.color = {r=1, g=1, b=1,a=1}
  obj.speed = 50
  obj.frameMove = 10
  obj.name = "Player"
  obj.style = "fill"
  obj.area = AreaCreate(obj.x, obj.y, obj.w, obj.h)

  return obj

end

---Player movement input.
---@param p table Player instance.
function PlayerInput(p)

  if love.keyboard.isDown('w') then
    p.y = p.y - p.frameMove
  end

  if love.keyboard.isDown('s') then
    p.y = p.y + p.frameMove
  end

  if love.keyboard.isDown('a') then
    p.x = p.x - p.frameMove
  end

  if love.keyboard.isDown('d') then
    p.x = p.x + p.frameMove
  end

  -- Update the player collsion area position
  p.area.x = p.x - (p.area.w / 2) + p.w / 2
  p.area.y = p.y - (p.area.h / 2) + p.h / 2

end

---Draw the player
---@param p table player table
---@param drawCollision boolean if true, draws the collsion area.
function PlayerDraw(p, drawCollision)
  local collision = drawCollision or nil

  R.draw(p)

  if collision then
    R.draw(p.area)
  end
end
