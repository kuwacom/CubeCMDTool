local function tildeCheck(text, playerValue)
	if string.find(text, "~") then
		if tonumber((string.gsub(text, "~", "", 1))) then
			return tonumber((string.gsub(text, "~", "", 1)) + math.floor(playerValue))
		end
		return math.floor(playerValue)
	end
	return tonumber(text)
end

function HandleSetBlockCommand(Split, Player)
	-- Split[2]
	if #Split < 5 then
		Player:SendMessageFailure("Usage: /setblock <blockId> <metaId> <x> <y> <z>")
		return true
	end

	Player:GetWorld():FastSetBlock(
		Vector3i(
			tildeCheck(Split[4], Player:GetPosX()),
			tildeCheck(Split[5], Player:GetPosY()),
			tildeCheck(Split[6], Player:GetPosZ())
		), Split[2], Split[3])
	Player:SendMessageSuccess("&eset block &a"..Split[4].." "..Split[5].." "..Split[6])
	return true;
end
