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

local Player = {
  __tostring = function() return "Player" end
}
Player.__index = Player

function Player:new(x,y)

  setmetatable(Player, {__index = Object})

  local obj = Object:new(x,y)
  setmetatable(obj, Player)

  obj.name = "Player"

  return obj

end


return Player
