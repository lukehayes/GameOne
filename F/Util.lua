--[[
/************************************************* Util *****************/
/*                                                                      */
/*              /\_/\           ___                                     */
/*             = o_o =_______    \ \  -LDH-                             */
/*              __^      __(  \.__) )                                   */
/*          (@)<_____>__(_____)____/                                    */
/*                                                                      */
/*                                                                      */
/*  Description:                                                        */
/*                                                                      */
/*  Utility helper functions
/*  -------------------------------------------------------------       */
/*  https://www.github.com/                                             */
/*                                                                      */
/*                                                                      */
/************************************************************************/
]]

local Game = require 'F.Game'

local Util = {}


---Check if table is the global Game table.
---@param table table The table to check.
---@param show_result boolean Prints the result to the screen (for debugging).
---@return boolean
function Util.isGameTable(table,show_result)

  show_result = show_result or false

  if show_result then
    print("Is Game Table? Result:", table, Game, Game == table)
  end

  return Game == table
end

---Check if a table is the global Game.events table.
---@param table table The table to check.
---@param show_result boolean Prints the result to the screen (for debugging).
---@return boolean
function Util.isEventTable(table, show_result)
  show_result = show_result or false

  if show_result then
    print("Is Game.events Table? Result:", table, Game.events, Game.events == table)
  end

  return Game.events == table
end

---Is the value falsy.
---@param n any
---@return boolean
function Util.isFalsy(n)
  if n == 0 or n == nil or n == false then
    return true
  end
end

--- Filter elements from a table.
---@param t any The table to filter from
---@param fn any Function to perform filter
---@return table
function Util.filter(t, fn)

  local results = {}

  for index, value in ipairs(t) do

    local res = fn(value)

    if res then
      table.insert(results, value)
    end
  end

  return results
end

--- Create a range of integers
---@param from number
---@param to number
---@return table The range of numbers
function Util.range(from, to)

  local range = {}

  for i = from, to do
    table.insert(range, i)
  end

  return range
end

return Util



