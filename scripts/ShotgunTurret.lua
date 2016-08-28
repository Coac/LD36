require("scripts/Turret")
require("scripts/Globals")

ShotgunTurret = Turret:new(-999,-999)

function ShotgunTurret:fire ()
  Arrow:new(self.x, self.y, 1000, self.angle + math.degToRad(15))
  Arrow:new(self.x, self.y, 1000, self.angle)
  Arrow:new(self.x, self.y, 1000, self.angle - math.degToRad(15))
end
