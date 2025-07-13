--[[
/************************************************* Point  ***************/
/*                                                                      */
/*              /\_/\           ___                                     */
/*             = o_o =_______    \ \  -LDH-                             */
/*              __^      __(  \.__) )                                   */
/*          (@)<_____>__(_____)____/                                    */
/*                                                                      */
/*                                                                      */
/*  Description:                                                        */
/*                                                                      */
/*  Point class                                                         */
/*  -------------------------------------------------------------       */
/*  https://www.github.com/                                             */
/*                                                                      */
/*                                                                      */
/************************************************************************/
]]

local Color = require 'F.Color'

local Point = {}
Point.__index = Point

---Create a new instance of Point.
---@param x number The x position.
---@param y number The y position.
---@return table
function Point:new(x,y)
  local obj = {
    x = x,
    y = y,
    w = 1,
    h = 1,
    color = Color.WHITE
  }
  return setmetatable(obj, Point)
end

---Render the point point to the screen
---@param x number The x position.
---@param y number The y position.
---@return table
function Point:draw()

  love.graphics.setColor(
    self.color.r,
    self.color.g,
    self.color.b,
    self.color.a
  )

  love.graphics.rectangle(
    'fill',
      self.x,
      self.y,
      1,
      1
  )

  love.graphics.setColor(1,1,1,1)
end

return Point
