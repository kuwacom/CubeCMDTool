function HandlePlayerViewDistanceCommand(Split, Player)
	if Split[2] == nil or Split[3] == nil then
		Player:SendMessageFailure("Usage: /playerViewDistance [playerName] <1-32> ")
		return true
	end
	local ViewDistance = tonumber(Split[3])
	if not ViewDistance then
		Player:SendMessageFailure("Invalid view distance value \"" .. Split[2] .. "\"")
	end
	
	local FoundPlayerCallback = function(_Player)
		_Player:GetClientHandle():SetViewDistance(ViewDistance)
		Player:SendMessageSuccess("&eSet ".._Player:GetName().."'s View distance to &a"..Player:GetClientHandle():GetViewDistance())
		return true
	end

	if not cRoot:Get():FindAndDoWithPlayer( Split[2], FoundPlayerCallback ) then
		Player:SendMessageFailure("Could not find player")
		return true
	end

	return true
end