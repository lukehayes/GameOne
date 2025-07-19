--[[
/************************************************* Renderer  ************/
/*                                                                      */
/*              /\_/\           ___                                     */
/*             = o_o =_______    \ \  -LDH-                             */
/*              __^      __(  \.__) )                                   */
/*          (@)<_____>__(_____)____/                                    */
/*                                                                      */
/*                                                                      */
/*  Description:                                                        */
/*                                                                      */
/*  Renderer class                                                      */
/*  -------------------------------------------------------------       */
/*  https://www.github.com/                                             */
/*                                                                      */
/*                                                                      */
/************************************************************************/
]]

local Renderer = {}
Renderer.__index = Renderer

---Reset the draw color back to white.
function Renderer.reset()
  love.graphics.setColor(1,1,1,1)
end

---Set the color the renderer will draw with
---@param color any
function Renderer.setColor(color)
  love.graphics.setColor(
    color.r,
    color.g,
    color.b,
    color.a
  )
end

function Renderer.draw(object)

  love.graphics.setColor(
    object.color.r,
    object.color.g,
    object.color.b,
    object.color.a
  )

  love.graphics.rectangle(
    object.style,
    object.x,
    object.y,
    object.w,
    object.h
  )

  love.graphics.setColor(1,1,1,1)
end


return Renderer
