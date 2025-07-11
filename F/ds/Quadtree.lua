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

local Quadtree = {}
Quadtree.__index = Quadtree

---Create a new Quadtree instance.
---@return table
function QuadTreeCreate()
  local obj = {}

  obj.max_children = 4
  obj.children = {}

  return obj

end

---Insert a Node into the Quadtree
---@param qt table The Quadtree
---@param node table The Node to be inserted
function QuadTreeInsert(qt, node)

  if #qt.children < qt.max_children then
    print("Inserting Node")
    table.insert(qt.children)
  else
    print("Quadtree Full, subdividing")
  end
end


return Quadtree
