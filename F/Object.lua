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
        y = y or 0
    }

    return setmetatable(o, Object)
end

return Object
