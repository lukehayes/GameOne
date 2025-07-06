--[[
/************************************************* Asset  ***************/
/*                                                                      */
/*              /\_/\           ___                                     */
/*             = o_o =_______    \ \  -LDH-                             */
/*              __^      __(  \.__) )                                   */
/*          (@)<_____>__(_____)____/                                    */
/*                                                                      */
/*                                                                      */
/*  Description:                                                        */
/*                                                                      */
/*  Asset helper functions are defined in this file.                    */
/*  -------------------------------------------------------------       */
/*  https://www.github.com/                                             */
/*                                                                      */
/*                                                                      */
/************************************************************************/
]]


local Asset = {}
Asset.__index = Asset


function Asset:loadFont()
  self.font_xs  = love.graphics.newFont("assets/fonts/DepartureMono-Regular.otf", 10)
  self.font_sm  = love.graphics.newFont("assets/fonts/DepartureMono-Regular.otf", 20)
  self.font_md  = love.graphics.newFont("assets/fonts/DepartureMono-Regular.otf", 30)
  self.font_lg  = love.graphics.newFont("assets/fonts/DepartureMono-Regular.otf", 40)
  self.font_xl  = love.graphics.newFont("assets/fonts/DepartureMono-Regular.otf", 50)
  self.font_2xl = love.graphics.newFont("assets/fonts/DepartureMono-Regular.otf", 60)
  self.font_3xl = love.graphics.newFont("assets/fonts/DepartureMono-Regular.otf", 70)
end

function Asset:getFont()
  return self.font
end

return Asset
