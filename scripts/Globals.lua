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
ENEMIES_IMG_DIR = IMG_DIR .. 'enemies/'
FONTS_DIR = ASSETS_DIR .. '/fonts/'
AUDIO_DIR = ASSETS_DIR .. '/audio/'

WINDOW_W = 1280
WINDOW_H = 720

score = 0
money = 0

objectsToDraw = {}
objectsToUpdate = {}

MYTH_FONT = lg.newFont(FONTS_DIR .."Myth.ttf", 40)
MYTH_FONT_20 = lg.newFont(FONTS_DIR .."Myth.ttf", 20)


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
