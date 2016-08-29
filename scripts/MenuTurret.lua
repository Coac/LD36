require('scripts/globals')

MenuTurret = {}

local turretFont = lg.newFont(20)

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
  lg.setFont(turretFont)
  lg.setColor(75, 69, 1)
  for i, turret in ipairs(self.turrets) do
    lg.rectangle("line",
      self.x,
      self.y - ((i - 1) * self.height),
      self.width,
      self.height)
    lg.print(i .. ". " .. turret.name .. "\nPrice : " .. turret.price , self.x, self.y - ((i - 1) * self.height))
  end
  lg.setFont(MYTH_FONT)
  lg.setColor(255, 255, 255)
end

function love.keypressed(key)
  if key == "b" then
    menuTurret.drawn = not menuTurret.drawn
  end
  if not menuTurret.drawn then return end
  if numerobis.turretSelectedShape then return end
  if key == "kp1" and money > menuTurret.turrets[1].price then
    menuTurret.turrets[1]:new(numerobis.x, numerobis.y)
    money = money - menuTurret.turrets[1].price
  elseif key == "kp2" and money > menuTurret.turrets[2].price then
    menuTurret.turrets[2]:new(numerobis.x, numerobis.y)
    money = money - menuTurret.turrets[2].price
  end
end
