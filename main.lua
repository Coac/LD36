local lg = love.graphics
require("scripts/Background")
require("scripts/Numerobis")


function love.load()
  love.window.setTitle("LD36")

  testImg = lg.newImage("assets/images/test.png")
  background = Background:new()
  numerobis = Numerobis:new(100, 100, 300)

end

function love.draw()
  lg.print("Hello World", 400, 300)
  lg.setNewFont(20)
  canvas = lg.newCanvas()
  lg.setLineWidth(50)
  lg.rectangle('fill', 0, 0, 40, 40)
  lg.draw(canvas, 0, 0, 0)
  lg.draw(testImg, 50, 50)

  background:draw()
  numerobis:draw()

end


function love.update(dt)
  background:update(dt)
  numerobis:update(dt)

end
