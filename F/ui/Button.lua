--[[
/************************************************* Button  **************/
/*                                                                      */
/*              /\_/\           ___                                     */
/*             = o_o =_______    \ \  -LDH-                             */
/*              __^      __(  \.__) )                                   */
/*          (@)<_____>__(_____)____/                                    */
/*                                                                      */
/*                                                                      */
/*  Description:                                                        */
/*                                                                      */
/*  Button class                                                        */
/*  -------------------------------------------------------------       */
/*  https://www.github.com/                                             */
/*                                                                      */
/*                                                                      */
/************************************************************************/
]]
local Color  = require 'F.Color'

local Button = {}
Button.__index = Button

---Create a button
---@param x number
---@param y number
---@param w number
---@param h number
---@return table
function ButtonCreate(x,y,w,h)
  local obj = {}

  obj.x = x
  obj.y = y
  obj.w = w or 200
  obj.h = h or 50
  obj.style = 'line'
  obj.color = Color.DEBUG
  obj.callback = function()
    print("Callback not set...")
  end

  return obj
end

return Button
