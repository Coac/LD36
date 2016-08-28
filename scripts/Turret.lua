require("scripts/Arrow")
require("scripts/Globals")
Turret = {}

local turretSprite = lg.newImage(IMG_DIR .. "turret.png")
function Turret:new(_x, _y)
  local o = {
    sprite = turretSprite,
    x = _x,
    y = _y,
    angle = 0,
    width = turretSprite:getWidth(),
    height = turretSprite:getHeight(),
    coll = HC.rectangle(_x, _y, turretSprite:getWidth() * 0.5, turretSprite:getHeight() * 0.5),
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

function Turret:update(dt)
  local enemy = enemyManager:getNearestEnemy(self.x, self.y)
  if enemy ~= nil then
    self.angle = math.atan2(enemy.y-self.y, enemy.x-self.x)
  end

  self.time = self.time + dt
  if self.time > 0.2 then
    self.time = 0
    Arrow:new(self.x, self.y, 1000, self.angle)
  end

  self.isSelected = false
  for shape, delta in pairs(HC.collisions(self.coll)) do
    if(shape.name == "Numerobis") then
      print("Turret touching Numerobis")
      self.isSelected = true
    end
  end
end

function Turret:draw()
  lg.draw(self.sprite, self.x, self.y, self.angle, 1, 1, self.width/2, self.height/2)
  if(self.isSelected) then
    lg.rectangle("line", self.x - self.width/2, self.y - self.height/2, self.width, self.height)
  end
end
