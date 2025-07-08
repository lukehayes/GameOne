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

--- Create a new Timer.
---@param duration number Time timer should run for.
---@param oneshot boolean
---@param callback function Callback to run when timer finishes.
---@return table
function TimerCreate(duration, oneshot, callback)
  local obj = {}
  obj.duration = duration or 3
  obj.elapsed = 0
  obj.oneshot = oneshot or nil
  obj.finished = false
  obj.callback = callback
  obj.fired = nil

  return obj
end

--- Update a Timer instance.
---@param timer table Instance of Timer.
---@param dt number Delta time.
function TimerUpdate(timer,dt)

  if timer.finished then return end

  if timer.elapsed >= timer.duration and not timer.finished then
    timer.callback()
    timer.elapsed = 0

    if timer.oneshot then
      timer.finished = true
    end
  else
    timer.elapsed = timer.elapsed + dt
  end
end
