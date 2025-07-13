--[[
/************************************************* Collision ************/
/*                                                                      */
/*              /\_/\           ___                                     */
/*             = o_o =_______    \ \  -LDH-                             */
/*              __^      __(  \.__) )                                   */
/*          (@)<_____>__(_____)____/                                    */
/*                                                                      */
/*                                                                      */
/*  Description:                                                        */
/*                                                                      */
/*  Basic collision helper functions                                    */
/*  -------------------------------------------------------------       */
/*  https://www.github.com/                                             */
/*                                                                      */
/*                                                                      */
/************************************************************************/
]]

local Collision = {}
Collision.__index = Collision

---Check for a collision on the X axis
---
---@param a table
---@param b table
---
---@return boolean
function Collision.collidesX(a,b)
  return a.x < b.x+b.w and
         a.x+a.w > b.x
end

---Check for a collision on the Y axis
---
---@param a table
---@param b table
---
---@return boolean
function Collision.collidesY(a,b)
  return a.y < b.y + b.h and
         a.y + a.h > b.y
end

---Check for a generic collision.
---
---@param a table
---@param b table
---
---@return boolean
function Collision.collides(a,b)
  return a.x < b.x+b.w and
         a.x+a.w > b.x and
         a.y < b.y+b.h and
         a.y+a.h > b.y
end


--- Check for collision completley inside the X axis.
---
---@param a table
---@param b table
---
---@return boolean
function Collision.insideX(a,b)
  return b.x > a.x and (b.w + b.x) < (a.w + a.x)
end

--- Check for collision completley inside the Y axis.
---
---@param a table
---@param b table
---
---@return boolean
function Collision.insideY(a,b)
  return b.y > a.y and (b.h + b.y) < (a.h + a.y)
end


--- Check if an entity is completley inside another.
---
---@param a table
---@param b table
---
---@return boolean
function Collision.inside(b,a)
    return b.x > a.x and
          (b.w + b.x) < (a.w + a.x) and
           b.y > a.y and
          (b.h + b.y) < (a.h + a.y)
end

return Collision
