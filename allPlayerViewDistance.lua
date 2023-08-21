function HandleAllPlayerViewDistanceCommand(Split, Player)
	if Split[2] == nil then
		Player:SendMessageFailure("Usage: /allPlayerViewDistance <1-32> ")
		return true
	end
	local ViewDistance = tonumber(Split[2])
	if not ViewDistance then
		Player:SendMessageFailure("Invalid view distance value \"" .. Split[2] .. "\"")
	end

	local ForEachPlayer = function(_Player)
		_Player:GetClientHandle():SetViewDistance(ViewDistance)
		return true
	end

	cRoot:Get():ForEachPlayer(ForEachPlayer)

	Player:SendMessageSuccess("&eSet all player View distance to &a"..ViewDistance)
	return true
end