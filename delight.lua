local delight = {}

function delight.newImage(filename)
  local image_data, error = delight.newImageData(filename)
  if image_data then return love.graphics.newImage(image_data) end
  return nil, error
end

function delight.newImageData(filename)
  local file_data, error = delight.newFileData(filename)
  if file_data then return love.image.newImageData(file_data) end
  return nil, error
end

function delight.newFileData(filename)
  local file, error = io.open(filename, 'rb')
  if file then
    local file_data = love.filesystem.newFileData(file:read('*a'), filename)
    file:close()
    return file_data
  end
  return nil, error
end

function delight.writeImage(object, filename)
  if object:typeOf('Image') then object = object:getData() end
  if object:typeOf('ImageData') then object = object:encode('png') end
  if object:typeOf('FileData') then object = object:getString() end
  local file, error = io.open(filename, 'wb')
  if file then
    file:write(object)
    file:close()
  end
  return error
end

return delight