require("scripts/Globals")
require("scripts/Background")
require("scripts/Numerobis")
require("scripts/Train")
require("scripts/EnemyManager")
require("scripts/LifeBar")
require("scripts/MenuTurret")
require("scripts/turrets/Turret")

local CScreen = require("dependencies/CScreen")

-- Global variables :
-- enemyManager
-- lifeBar
local background
local arrow
local bgUI

local backgroundMenu
local isMenu = true
local isTransitionPlay = false
local time = 0
local colorTransition = 255

function love.load()
  lw.setTitle("Super Numerobis Broccoli Defender - Babylon Edition X")
  lw.setMode(WINDOW_W, WINDOW_H, {resizable=true, vsync=false, minwidth=400, minheight=300})
  CScreen.init(WINDOW_W, WINDOW_H, true)

  lg.setFont(MYTH_FONT)
  bgUI = lg.newImage(IMG_DIR .. "bgUIingame.png")

  backgroundMenu = lg.newImage(IMG_DIR .. "menu.png")

  background = Background:new()
  numerobis = Numerobis:new(WINDOW_W / 2, WINDOW_H / 2, 300)
  train = Train:new()
  enemyManager = EnemyManager:new()
  menuTurret = MenuTurret:new()

  Turret:new(550, 400)
  Turret:new(700, 400)

  lifeBar = LifeBar:new(100, 300, 50, WINDOW_W / 2 - 300/2, 30)

  bgm = la.newSource(AUDIO_DIR .. "maintheme.ogg", "stream")
  bgm:setVolume(0.1)
  bgm:setLooping(true)
end

function love.draw()
  CScreen.apply()

  if(isMenu) then
    lg.draw(backgroundMenu, 0, 0)
    if love.keyboard.isDown('space') then
       if(not isTransitionPlay) then
         local menuSound = la.newSource(AUDIO_DIR .. "TitleScreen.mp3", "stream")
         menuSound:play()
       end
       isTransitionPlay = true
   end
  else
    background:draw()
    train:draw()
    enemyManager:draw()
    for i, obj in ipairs(objectsToDraw) do
      obj:draw()
    end
    numerobis:draw()

    lg.draw(bgUI, WINDOW_W/2, 0, 0, 1, 1, bgUI:getWidth()/2, 0)
    lifeBar:draw()
    lg.print({{0,0,0,255}, "Score : " .. score},  50, 15)
    lg.print({{0,0,0,255}, "Money : " .. money}, 900, 15)
  end

  CScreen.cease()
end

function love.resize(width, height)
    CScreen.update(width, height)
end


function love.update(dt)
  if(isTransitionPlay) then
    time = time + dt
    colorTransition = colorTransition - 50 * dt
    lg.setColor(colorTransition,colorTransition,colorTransition)
    if(time > 7) then
      isMenu = false
      lg.setColor(255,255,255)
      la.play(bgm)
      isTransitionPlay = false
    end
  end
  if(isMenu) then return end

  background:update(dt)
  numerobis:update(dt)
  enemyManager:update(dt)
  train:update(dt)
  for i, obj in ipairs(objectsToUpdate) do
    obj:update(dt)
  end
end
