require("scripts/turrets/Turret")
require("scripts/Globals")

ShotgunTurret = Turret:new(-999,-999)

local turretSprite = lg.newImage(IMG_DIR .. "turret2.png")

function ShotgunTurret:new(_x, _y)
  o = Turret:new(_x, _y)
  o.sprite = turretSprite
  setmetatable(o, self)
  self.__index = self
end

function ShotgunTurret:fire ()
  Arrow:new(self.x, self.y, 1000, self.angle + math.degToRad(15))
  Arrow:new(self.x, self.y, 1000, self.angle)
  Arrow:new(self.x, self.y, 1000, self.angle - math.degToRad(15))
end
