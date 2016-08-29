require('scripts/globals')
require('scripts/ShowMessage')

MenuTurret = {}

local turretFont = lg.newFont(20)

local turretSounds = {
  la.newSource(AUDIO_DIR .. "Build_Turret1.mp3", "static"),
  la.newSource(AUDIO_DIR .. "Build_Turret2.mp3", "static")
}

function MenuTurret:new()
  local o = {
    turrets = { Turret, ShotgunTurret },
    x = WINDOW_W - WINDOW_W / 4,
    y = WINDOW_H - WINDOW_H / 3,
    width = WINDOW_W / 8 + 30,
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
  for i, turret in ipairs(self.turrets) do
    lg.setColor(255, 184, 118)
    lg.rectangle("fill",
      self.x,
      self.y - ((i - 1) * self.height),
      self.width,
      self.height)
      lg.setColor(255, 100, 118)
      lg.rectangle("line",
        self.x,
        self.y - ((i - 1) * self.height),
        self.width,
        self.height)

    lg.setColor(0, 0, 0)
    lg.print(i .. ". " .. turret.name .. "\nPrice : " .. turret.price , self.x + 10, self.y - ((i - 1) * self.height) + 20)
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
  if key == "kp1" then
    if money > menuTurret.turrets[1].price then
      menuTurret.turrets[1]:new(numerobis.x, numerobis.y)
      money = money - menuTurret.turrets[1].price
      la.play(turretSounds[1])
    else
      ShowMessage:new("Not enough money")
    end
  elseif key == "kp2" then
    if money > menuTurret.turrets[2].price then
      menuTurret.turrets[2]:new(numerobis.x, numerobis.y)
      money = money - menuTurret.turrets[2].price
      la.play(turretSounds[2])
    else
      ShowMessage:new("Not enough money")
    end
  end
end
