require("scripts/Globals")
require("scripts/enemies/Enemy")

Enemy10 = {}

local enemyImage = lg.newImage(ENEMIES_IMG_DIR .. "enemy10.png")

function Enemy10:new(_x, _y)
  o = Enemy:new(_x, _y)
  o.sprite = enemyImage
  o.hp = 15
  o.speed = 150
  return o
end
