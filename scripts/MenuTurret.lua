require('scripts/globals')

MenuTurret = {}

function MenuTurret:new()
  local o = {
    turrets =  {1, 2},
    x = WINDOW_W - WINDOW_W / 4,
    y = WINDOW_H - WINDOW_H / 3,
    width = WINDOW_W / 8,
    height = WINDOW_H / 7,
    drawn = false
  }

  setmetatable(o, self)
  self.__index = self

  table.insert(objectsToUpdate, o)
  table.insert(objectsToDraw, o)

  return o
end

function MenuTurret:update(dt)
  if lk.isDown("b") then
   self.drawn = true
  else
   self.drawn = false
  end
end


function MenuTurret:draw()
  if not self.drawn then return end
  for i, turret in ipairs(self.turrets) do
    lg.rectangle("line",
     self.x,
      self.y - ((table.getn(self.turrets) - i) * self.height),
      self.width,
       self.height)
  end
end
