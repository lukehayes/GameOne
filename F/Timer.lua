--[[
/************************************************* Timer  ***************/
/*                                                                      */
/*              /\_/\           ___                                     */
/*             = o_o =_______    \ \  -LDH-                             */
/*              __^      __(  \.__) )                                   */
/*          (@)<_____>__(_____)____/                                    */
/*                                                                      */
/*                                                                      */
/*  Description:                                                        */
/*                                                                      */
/*  Timer class                                                        */
/*  -------------------------------------------------------------       */
/*  https://www.github.com/                                             */
/*                                                                      */
/*                                                                      */
/************************************************************************/
]]

function TimerCreate(duration, callback)
  local obj = {}
  obj.duration = duration or 3
  obj.elapsed = 0
  obj.finished = false
  obj.callback = callback
  obj.fired = nil

  return obj
end

function TimerUpdate(timer,dt)

  if timer.finished then return end

  if timer.elapsed >= timer.duration then
    if not timer.fired then
      timer.callback()
      timer.fired = true
      timer.finished = true
      timer.elapsed = 0
    end
  else
    timer.elapsed = timer.elapsed + dt
  end
end
