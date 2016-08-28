require("scripts/Globals")

Wave = {}

function Wave:new(_possibleEnemies, _nbToPick)
  local o = {
    possibleEnemies = _possibleEnemies,
    nbToPick = _nbToPick
   }
  setmetatable(o, self)
  self.__index = self
  return o
end
