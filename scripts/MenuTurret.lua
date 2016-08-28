require('scripts/globals')

MenuTurret = {}

function MenuTurret:new()
  local o = {
    turrets =  {1, 2},
    x = WINDOW_W - WINDOW_W / 4,
    y = WINDOW_H - WINDOW_H / 3,
    width = WINDOW_W / 6,
    height = WINDOW_H / 4,
    drawn = false
  }

  table.insert(objectsToUpdate, o)
  table.insert(objectsToDraw, o)

  return o
end

function MenuTurret:update()
  if lk.isDown('b') then
   self.drawn = true
  else
   self.drawn = false
  end
end


function MenuTurret:draw()
  if not self.drawn then end
  for i, turret in ipairs(self.turrets) do
    lg.rectangle("line",
     self.x,
      self.y - ((table.getn(self.turrets) - i) * self.height),
      self.width,
       self.height)
 end
end
