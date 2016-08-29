require("scripts/Arrow")
require("scripts/Globals")
Turret = { price = 200, name = "Turret" }

Turret.selectedTurret = nil

local turretSprite = lg.newImage(IMG_DIR .. "turret.png")
function Turret:new(_x, _y)
  local o = {
    sprite = turretSprite,
    x = _x,
    y = _y,
    angle = 0,
    width = turretSprite:getWidth(),
    height = turretSprite:getHeight(),
    coll = HC.rectangle(_x - turretSprite:getWidth()/4, _y - turretSprite:getHeight()/4, turretSprite:getWidth() * 0.5, turretSprite:getHeight() * 0.5),
    time = 0,
    isSelected = false
   }
   o.coll.name = "Turret"

  setmetatable(o, self)
  self.__index = self

  table.insert(objectsToDraw, o)
  table.insert(objectsToUpdate, o)

  return o
end

function Turret:fire()
  Arrow:new(self.x, self.y, 1000, self.angle)
end

function Turret:update(dt)
  local enemy = enemyManager:getNearestEnemy(self.x, self.y)
  if enemy ~= nil then
    self.angle = math.atan2(enemy.y-self.y, enemy.x-self.x)
  end

  self.time = self.time + dt
  if self.time > 0.5 then
    self.time = 0
    self:fire()
  end

  self.isSelected = numerobis.turretSelectedShape == self.coll

end

function Turret:draw()
  lg.draw(self.sprite, self.x, self.y, self.angle, 1, 1, self.width/2, self.height/2)
  --if(self.isSelected) then
  --  lg.rectangle("line", self.x - self.width/2, self.y - self.height/2, self.width, self.height)
  --end
  -- self.coll:draw("line")
end
