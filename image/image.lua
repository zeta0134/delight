delight = require 'delight'
require 'fun' ()

love.load = function()
   id = love.image.newImageData(8, 8)
   range(0, 7):each(function(v) id:setPixel(v, 5, 255, 0, 0, 255) end)
   id:setPixel(5, 5, 255, 0, 0, 255)
   i = love.graphics.newImage(id)
end

love.draw = function()
  love.graphics.print("Hello World!", 100, 100)
  love.graphics.draw(i)
end
