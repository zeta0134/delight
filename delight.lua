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
  local png, error = delight.getPngData(object)
  if error then return error end
  local file, error = io.open(filename, 'wb')
  if error then return error end
  file:write(png)
  file:close()
end

function delight.getPngData(object)
  if object:typeOf('Image') then object = object:getData() end
  if object:typeOf('ImageData') then object = object:encode('png') end
  if object:typeOf('FileData') then return object:getString() end
  return nil, 'Invalid type'
end

return delight