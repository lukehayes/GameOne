--[[
/************************************************* Node  ****************/
/*                                                                      */
/*              /\_/\           ___                                     */
/*             = o_o =_______    \ \  -LDH-                             */
/*              __^      __(  \.__) )                                   */
/*          (@)<_____>__(_____)____/                                    */
/*                                                                      */
/*                                                                      */
/*  Description:                                                        */
/*                                                                      */
/*  Node for a Quadtree                                                 */
/*  -------------------------------------------------------------       */
/*  https://www.github.com/                                             */
/*                                                                      */
/*                                                                      */
/************************************************************************/
]]

local col = require 'F.col.Collision'
local Color = require 'F.Color'

local Node = {}
Node.__index = Node

---Create a new Node instance
---@param x number The x position
---@param y number The y position
---@param w number The width
---@param h number The height
---@return table
function NodeCreate(x,y,w,h)
  local obj = {}

  obj.x = x
  obj.y = y
  obj.w = w
  obj.h = h

  obj.NW = nil
  obj.NE = nil
  obj.SE = nil
  obj.SW = nil

  obj.color = Color.WHITE
  obj.style = 'line'

  return obj
end

---Check if another Node is completely inside this one.
---@param node table
---@param other table
---@return boolean
function NodeContains(node, other)
  if col.inside(other, node) then
    return true
  else
    return nil
  end
end

return Node
