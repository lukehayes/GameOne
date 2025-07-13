--[[
/************************************************* Quadtree  ************/
/*                                                                      */
/*              /\_/\           ___                                     */
/*             = o_o =_______    \ \  -LDH-                             */
/*              __^      __(  \.__) )                                   */
/*          (@)<_____>__(_____)____/                                    */
/*                                                                      */
/*                                                                      */
/*  Description:                                                        */
/*                                                                      */
/*  Quadtree class                                                      */
/*  -------------------------------------------------------------       */
/*  https://www.github.com/                                             */
/*                                                                      */
/*                                                                      */
/************************************************************************/
]]

local Col = require("F.col.Collision")

local Quadtree = {}
Quadtree.__index = Quadtree

---Create a new Quadtree instance.
---@return table
function QuadTreeCreate(x, y, w, h)
  local obj = {}

  obj.x = x
  obj.y = y
  obj.w = w
  obj.h = h
  obj.max_children = 4
  obj.children = {}
  obj.divided = nil
  obj.level = 0

  obj.NW = nil
  obj.NE = nil
  obj.SE = nil
  obj.SW = nil

  return obj
end

---Insert a Node into the Quadtree
---@param qt table The Quadtree
---@param point table The point to be inserted
function QuadTreeInsert(qt, point)
  if not Col.inside(point, qt) then
    --print("Point " .. point.x .. " " .. point.y .. " not inside. Bailing.")
    return
  end

  if #qt.children < qt.max_children then
    print("Inserting Node. Count", #qt.children)
    table.insert(qt.children, point)
    return true
  else
    if not qt.divided then
      print("Subdividing...")
      qt.NW = QuadTreeCreate(qt.x, qt.y, qt.w / 2, qt.h / 2)

      qt.NE = QuadTreeCreate(qt.x + (qt.w / 2), qt.y, qt.w / 2, qt.h / 2)

      qt.SE = QuadTreeCreate(qt.x + (qt.w / 2), qt.y + (qt.h / 2), qt.w / 2, qt.h / 2)

      qt.SW = QuadTreeCreate(qt.x, qt.y + (qt.h / 2), qt.w / 2, qt.h / 2)

      qt.divided = true
    end

    QuadTreeInsert(qt.NE, point)
    QuadTreeInsert(qt.NW, point)
    QuadTreeInsert(qt.SE, point)
    QuadTreeInsert(qt.SW, point)
  end
end

function _subdivide(qt) end

---Helper for drawing the Quadtree
---@param quad table
function _DrawQuad(quad)
  if quad then
    love.graphics.rectangle("line", quad.x, quad.y, quad.w, quad.h)
    QuadTreeDraw(quad)
  end
end

function QuadTreeDraw(qt)
  local NE = qt.NE
  local NW = qt.NW
  local SE = qt.SE
  local SW = qt.SW

  if NW then
    _DrawQuad(NW)
  end

  if NE then
    _DrawQuad(NE)
  end

  if SE then
    _DrawQuad(SE)
  end

  if SW then
    _DrawQuad(SW)
  end
end

return Quadtree
