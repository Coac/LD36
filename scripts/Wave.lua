require("scripts/Globals")

Wave = {}

function Wave:new(_possibleEnemies, _nbToPick, _rate)
  local o = {
    possibleEnemies = _possibleEnemies,
    nbToPick = _nbToPick,
    spawningRate = _rate
   }
  setmetatable(o, self)
  self.__index = self
  return o
end
