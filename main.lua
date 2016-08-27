local lg = love.graphics

function love.load()
  testImg = lg.newImage("assets/images/test.png")
end

function love.draw()
  lg.print("Hello World", 400, 300)
  lg.setNewFont(20)
  canvas = lg.newCanvas()
  lg.setLineWidth(50)
  lg.rectangle('fill', 0, 0, 40, 40)
  lg.draw(canvas, 0, 0, 0)
  lg.draw(testImg, 50, 50)

end
