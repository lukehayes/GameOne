--[[
/************************************************* Area    **************/
/*                                                                      */
/*              /\_/\           ___                                     */
/*             = o_o =_______    \ \  -LDH-                             */
/*              __^      __(  \.__) )                                   */
/*          (@)<_____>__(_____)____/                                    */
/*                                                                      */
/*                                                                      */
/*  Description:                                                        */
/*                                                                      */
/*  Area class                                                          */
/*  -------------------------------------------------------------       */
/*  https://www.github.com/                                             */
/*                                                                      */
/*                                                                      */
/************************************************************************/
]]
local Util   = require 'F.Util'
local Color  = require 'F.Color'


function AreaCreate(x,y,w,h)
  local obj = {}

  obj.x = x
  obj.y = y
  obj.w = w or 50
  obj.h = h or 50
  obj.style = 'fill'
  obj.color = Color.DEBUG

  return obj
end
