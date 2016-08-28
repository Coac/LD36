require("scripts/Globals")

LifeBar = {}

function LifeBar:new(_maxHealth, _sizeX, _sizeY, _posX, _posY)
  local o = {
    maxHealth = _maxHealth,
    health = _maxHealth,
    sizeX = _sizeX,
    sizeY = _sizeY,
    posX = _posX,
    posY = _posY
   }
  setmetatable(o, self)
  self.__index = self
  return o
end


function LifeBar:takeDamage(damage)
  self.health = self.health - damage
  if(self.health < 0) then
    self.health = 0
  end
end

function LifeBar:draw()
  if(self.health == 0) then
    lg.print({{0,0,0,255},"GAME OVER"} , WINDOW_W / 2, WINDOW_H / 2)
  else
    lg.rectangle("fill", self.posX, self.posY, self.sizeX * self.health/self.maxHealth, self.sizeY)
  end
end
