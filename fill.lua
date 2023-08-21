local function getSmallerNumber(table)
    if table[1] < table[2] then
        return table[1]
    else
        return table[2]
    end
end
local function getLargerNumber(table)
    if table[1] > table[2] then
        return table[1]
    else
        return table[2]
    end
end

local function tildeCheck(text, playerValue)
	if string.find(text, "~") then
		if tonumber((string.gsub(text, "~", "", 1))) then
			return tonumber((string.gsub(text, "~", "", 1)) + math.floor(playerValue))
		end
		return math.floor(playerValue)
	end
	return tonumber(text)
end

function HandleFillCommand(Split, Player)
	-- Split[2]
	if #Split < 8 then
		Player:SendMessageFailure("Usage: /fill <blockId> <metaId> <x> <y> <z> <x> <y> <z>")
		return true
	end
	
	local x = {tildeCheck(Split[4], Player:GetPosX()), tildeCheck(Split[7], Player:GetPosX())}
	local y = {tildeCheck(Split[5], Player:GetPosY()), tildeCheck(Split[8], Player:GetPosY())}
	local z = {tildeCheck(Split[6], Player:GetPosZ()), tildeCheck(Split[9], Player:GetPosZ())}

	for _x = getSmallerNumber(x), getLargerNumber(x), 1 do
		for _y = getSmallerNumber(y), getLargerNumber(y), 1 do
			for _z = getSmallerNumber(z), getLargerNumber(z), 1 do
				Player:GetWorld():FastSetBlock(Vector3i(_x, _y, _z), Split[2], Split[3])
			end
		end
	end

	Player:SendMessageSuccess("&efill the blocks &a"..Split[4].." "..Split[5].." "..Split[6].." to "..Split[7].." "..Split[8].." "..Split[9])
	return true;
end