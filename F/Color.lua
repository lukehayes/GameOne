--[[
/************************************************* Color  ***************/
/*                                                                      */
/*              /\_/\           ___                                     */
/*             = o_o =_______    \ \  -LDH-                             */
/*              __^      __(  \.__) )                                   */
/*          (@)<_____>__(_____)____/                                    */
/*                                                                      */
/*                                                                      */
/*  Description:                                                        */
/*                                                                      */
/*  Color helpers are defined here                                      */
/*  -------------------------------------------------------------       */
/*  https://www.github.com/                                             */
/*                                                                      */
/*                                                                      */
/************************************************************************/
]]


local Color = {}
Color.__index = Color

Color.BLACK    = { r = 0, g = 0, b = 0, a = 1 }
Color.WHITE    = { r = 1, g = 1, b = 1, a = 1 }
Color.GREY     = { r = 0.3, g = 0.3, b = 0.3, a = 1 }
Color.RED      = { r = 1, g = 0, b = 0, a = 1 }
Color.GREEN    = { r = 0, g = 1, b = 0, a = 1 }
Color.BLUE     = { r = 0, g = 0, b = 1, a = 1 }
Color.YELLOW   = { r = 1, g = 1, b = 0, a = 1 }

return Color
