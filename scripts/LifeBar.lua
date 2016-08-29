require("scripts/Globals")

LifeBar = {}


local gameOverMusic = la.newSource(AUDIO_DIR .. "gameover.ogg", "static")
local hitSounds = {
  la.newSource(AUDIO_DIR .. "Hit1.mp3", "static"),
  la.newSource(AUDIO_DIR .. "Hit2.mp3", "static")
}

gameOverMusic:setLooping(true)

function LifeBar:new(_maxHealth, _sizeX, _sizeY, _posX, _posY)
  local o = {
    maxHealth = _maxHealth,
    health = _maxHealth,
    sizeX = _sizeX,
    sizeY = _sizeY,
    posX = _posX,
    posY = _posY
   }
  setmetatable(o, self)
  self.__index = self

  table.insert(objectsToUpdate, o)
  return o
end


function LifeBar:update()
  if self.health == 0 and gameOverMusic:isStopped() then
    bgm:setLooping(false)
    la.stop(bgm)
    gameOverMusic:setVolume(0.8)
    la.play(gameOverMusic)
  end
end

function LifeBar:takeDamage(damage)
  self.health = self.health - damage
  if(self.health < 0) then
    self.health = 0
  else
    la.play(hitSounds[math.random(1, table.getn(hitSounds))])
  end
end

function LifeBar:draw()
  if(self.health == 0) then
    lg.print({{0,0,0,255},"GAME OVER"} , WINDOW_W / 2 - 150 , WINDOW_H / 2 - 50)
  else
    lg.setColor(170, 122, 57)
    lg.rectangle("fill", self.posX, self.posY, self.sizeX * self.health/self.maxHealth, self.sizeY)
  end
  lg.setColor(0, 0, 0)
  lg.rectangle("line", self.posX, self.posY, self.sizeX, self.sizeY)
  lg.setColor(255,255,255)

end
