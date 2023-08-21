function HandleTpallCommand(Split, Player)
	local tpTarget = ""
	if Split[2] == nil then
		-- Player:SendMessage(cChatColor.Rose .. "Usage: /tpall (player)")
		tpTarget = Player:GetName()
	else
		tpTarget = Split[2]
	end
	
	local ForEachPlayer = function(_Player)
		if not (_Player:GetName() == tpTarget) then
			-- local pluginManager = cRoot:Get():GetPluginManager()
			-- pluginManager:ExecuteConsoleCommand("tp ".._Player:GetName().." "..tpTarget)
			cPluginManager:ExecuteConsoleCommand("tp ".._Player:GetName().." "..tpTarget)
			Player:SendMessageSuccess("&7tp &2".._Player:GetName().." &7to &2"..tpTarget)
		end
	end
	cRoot:Get():ForEachPlayer(ForEachPlayer)
	Player:SendMessageSuccess("&etp All Player to &a"..Player:GetName())
	return true;
end
