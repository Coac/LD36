require("scripts/globals")

Train = {}

function Train:new ()
  self.trainImage = lg.newImage(imagesFolder .. "/train.png");
  self.x = width_window / 2
  self.y = 0
  self.width = 32
  self.height = 32
end

function Train:draw()
  for i = 0,5,+1
    lg.draw(self.trainImage, self.x + i * self.width, self.y + i * self.height);
  end  
end
