json = require "Lib/json"

local Util = {}

function Util:LoadJson(name)
    local data = love.filesystem.read(name)
    return json.decode(data)
end

return Util