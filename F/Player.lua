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
local Object = require 'F.Object'
local Util   = require 'F.Util'

local Player = {
  __tostring = function() return "Player" end
}
Player.__index = Player

function Player:new(x,y)

  setmetatable(Player, {__index = Object})

  local obj = Object:new(x,y)
  setmetatable(obj, Player)

  obj.name = "Player"
  obj.color = {r=1, g=1, b=1,a=1}
  obj.speed = 50

  return obj

end


return Player
