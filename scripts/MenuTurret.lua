require('scripts/globals')

MenuTurret = {}

function MenuTurret:new()
  local o = {
    turrets = { Turret, ShotgunTurret },
    x = WINDOW_W - WINDOW_W / 4,
    y = WINDOW_H - WINDOW_H / 3,
    width = WINDOW_W / 8,
    height = WINDOW_H / 7,
    drawn = false
  }

  setmetatable(o, self)
  self.__index = self

  table.insert(objectsToDraw, o)

  return o
end

function MenuTurret:draw()
  if not self.drawn then return end
  for i, turret in ipairs(self.turrets) do
    lg.rectangle("line",
      self.x,
      self.y - ((table.getn(self.turrets) - i) * self.height),
      self.width,
      self.height)
    lg.print(turret, self.x, self.y)
  end
end

function love.keypressed(key)
  if key == "b" then
    menuTurret.drawn = not menuTurret.drawn
  end
  if not menuTurret.drawn then return end
  if key == "kp1" then
    menuTurret.turrets[1].class:new(numerobis.x, numerobis.y)
  elseif key == "kp2" then
    menuTurret.turrets[2].class:new(numerobis.x, numerobis.y)
  end
end
