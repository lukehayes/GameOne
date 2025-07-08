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

  return obj

end

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

end
