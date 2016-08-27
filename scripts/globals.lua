lf = love.filesystem
ls = love.sound
la = love.audio
lp = love.physics
lt = love.thread
li = love.image
lg = love.graphics
lk = love.keyboard
lw = love.window

HC = require("dependencies/HardonCollider")
require("dependencies/generalMath")

assetsFolder = 'assets'
imagesFolder = assetsFolder .. '/images/'
width_window = 1280
height_window = 720
height_enemy = 100
width_enemy = 100

objectsToDraw = {}
objectsToUpdate = {}


function removeFromList(list, _obj)
  local index
  for i, obj in ipairs(list) do
    if obj == _obj then
      index = i
      break
    end
  end
  table.remove(list, index)
end
