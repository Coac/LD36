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

ASSETS_DIR = 'assets'
IMG_DIR = ASSETS_DIR .. '/images/'
IMG_DIR = ASSETS_DIR .. '/images/'
ENEMIES_IMG_DIR = IMG_DIR .. 'enemies/'
FONTS_DIR = ASSETS_DIR .. '/fonts/'

WINDOW_W = 1280
WINDOW_H = 720

score = 0
money = 0

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