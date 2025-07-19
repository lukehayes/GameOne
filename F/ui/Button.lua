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
local Col  = require 'F.col.Collision'
local R      = require 'F.gfx.Renderer'

local Button = {}
Button.__index = Button

---Create a button
---@param x number
---@param y number
---@param w number
---@param h number
---@return table
function ButtonCreate(x,y,w,h, text)
  local obj = {}

  obj.x = x
  obj.y = y
  obj.w = w or 200
  obj.h = h or 50
  obj.text  = text or "Text not set"
  obj.style = 'line'
  obj.hover = false
  obj.color = Color.WHITE
  obj.hover_color = Color.GREEN
  obj.callback = function()
    print("Callback not set...")
  end

  return obj
end

---Draw a single button
---@param btn table
function ButtonDraw(btn)

  if btn.hover then
    R.setColor(btn.hover_color)
  end

  love.graphics.print(
    btn.text,
    btn.x + btn.w / 2,
    btn.y + btn.h / 2)

  love.graphics.rectangle(
    btn.style,
    btn.x,
    btn.y,
    btn.w,
    btn.h
  )

  R.reset()
end

function ButtonHover(btn)
  local mx,my = love.mouse.getPosition()
  local pointer = {x=mx,y=my,w=4,h=4}

  if Col.inside(pointer, btn) then
    btn.hover = true
  else
    btn.hover = false
  end

end

return Button
