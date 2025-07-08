local Object = {
    __tostring = function(self)
        return "Object {" ..
        "x:" .. self.x ..
        ", y: " .. self.y ..
        "}"
    end,
}
Object.__index = Object

function Object:new(x,y)
    local o = {
        name = "Object",
        x = x or 0,
        y = y or 0,
        w = 16,
        h = 16,
        color = {r=1, g=0, b=1,a=1},
        style = 'fill',
        speed = 100
    }

    return setmetatable(o, Object)
end

function Object:update(dt)
  self.x = self.x + self.speed * dt
end



function Object:toString()
  return "" .. self.name .. " Class"
end

return Object
