require("scripts/Globals")

ShowMessage = {}

function ShowMessage:new(_text)

  print("ok")
  local o = {
    text = _text,
    time = 0,
    timeToLive = 0.5
   }
  setmetatable(o, self)
  self.__index = self

  table.insert(objectsToDraw, o)
  table.insert(objectsToUpdate, o)

  return o
end

function ShowMessage:update(dt)
  self.time = self.time + dt
  if(self.time > self.timeToLive) then
    removeFromList(objectsToUpdate, self)
    removeFromList(objectsToDraw, self)
  end
end

function ShowMessage:draw()
  lg.setFont(MYTH_FONT_20)
  lg.print({{0,0,0,255}, self.text} , WINDOW_W / 1.5, WINDOW_H / 4)
  lg.setFont(MYTH_FONT)

end
