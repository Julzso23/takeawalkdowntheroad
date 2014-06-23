maps = {}
maps.mapList = {}

function maps.loadFiles(folder)
	local msg = require("lib/MessagePack")

	if not love.filesystem.exists(path) then
		love.filesystem.createDirectory(path)
	end

	for k, v in pairs(love.filesystem.getDirectoryItems(path)) do
		if love.filesystem.isFile(path.."/"..v) then
			if string.find(path.."/"..v, ".jmf") then
				maps.mapList[v:gsub(".jmf", "")] = msg.unpack(love.filesystem.read(path.."/"..v))
			end
		elseif love.filesystem.isDirectory(path.."/"..v) then
			maps.loadFiles(path.."/"..v)
		end
	end
end

function maps.load(map, world)
	if maps.mapList[map] then
		for k, v in pairs(maps.mapList[map]) do
			if not v.x then
				print("Failed to load tile from map: " .. map .. ". Missing x position value")
			elseif not v.y then
				print("Failed to load tile from map: " .. map .. ". Missing y position value")
			elseif not v.w then
				print("Failed to load tile from map: " .. map .. ". Missing width value")
			elseif not v.h then
				print("Failed to load tile from map: " .. map .. ". Missing height value")
			end

			tile.create(world, v.x, v.y, v.w, v.h)
		end
	else
		print("Failed to load map: " .. map .. ". Missing file.")
	end
end

hook.add("load", "loadMaps", function()
	maps.loadFiles("maps")
end)