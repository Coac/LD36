require("scripts/globals")

Train = {}

function Train:new ()
  sprite = lg.newImage(IMG_DIR .. "charriot.png");
  o = {
    sprite = sprite,
    x = WINDOW_W / 2,
    y = WINDOW_H / 2,
    width = sprite:getWidth(),
    height = sprite:getHeight(),
  }
  o.coll = HC.rectangle(o.x - o.width/2, o.y - o.height/2, o.width, o.height)
  o.coll.name = "Train"

  setmetatable(o, self)
  self.__index = self

  table.insert(objectsToUpdate, o)

  return o
end

function Train:update(dt)
  for shape, delta in pairs(HC.collisions(self.coll)) do
    if(shape.name == "Enemy") then
        lifeBar:takeDamage(10)
    end
  end
end

function Train:draw()
  lg.draw(self.sprite, self.x, self.y, 0, 1, 1, self.width/2, self.height/2);
  -- self.coll:draw("line")
end
