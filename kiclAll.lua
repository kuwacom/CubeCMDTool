function HandleKiclAllCommand(Split, Player)
	local reason = ""
	if not (Split[2] == nil) then
		reason = Split[2]
	end
	local ForEachPlayer = function(_Player)
		if not (_Player:GetName() == Player:GetName()) then
			local haveAll = false
			local permissions = _Player:GetPermissions()
			for i = 1, #permissions do
				if permissions[i] == "*" then
					haveAll = true
				end
			end
			if not haveAll then
				cPluginManager:ExecuteConsoleCommand("kick ".._Player:GetName().." "..reason)
			end
		end
	end
	cRoot:Get():ForEachPlayer(ForEachPlayer)
	Player:SendMessageSuccess("&eKick All Player")
	return true
end