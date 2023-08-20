PLUGIN = nil

function Chat(player, message)
    LOG(player:GetName())
end

function Initialize(Plugin)
	Plugin:SetName("CubeCMDTool")
	Plugin:SetVersion(1.0)

	-- PluginManager = cRoot:Get():GetPluginManager()
	cPluginManager:BindCommand("/tpall","CubeCMDTool.tpall",HandleTpallCommand,"tp all player")

	cPluginManager:BindCommand("/killAllEntity","CubeCMDTool.killAllEntity",HandleKillAllEntityCommand,"tp all player")
	cPluginManager:BindCommand("/killAll","CubeCMDTool.killAll",HandleKillAllCommand,"tp all player")

	cPluginManager:BindCommand("/listEntity","CubeCMDTool.killEntity",HandleListEntityCommand,"tp all player")
	-- cPluginManager:AddHook(cPluginManager.HOOK_CHAT, Chat)

	PLUGIN = Plugin -- NOTE: only needed if you want OnDisable() to use GetName() or something like that

	-- Command Bindings

	LOG("Initialised "..Plugin:GetName().." version: " .. Plugin:GetVersion())
	return true
end

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
			local pluginManager = cRoot:Get():GetPluginManager()
			-- pluginManager:ExecuteConsoleCommand("tp ".._Player:GetName().." "..tpTarget)
			cPluginManager:ExecuteConsoleCommand("tp ".._Player:GetName().." "..tpTarget)
			Player:SendMessageSuccess("tp ".._Player:GetName().." to "..tpTarget)
		end
	end
	cRoot:Get():ForEachPlayer(ForEachPlayer)
	LOG("tp All Player to "..Player:GetName())
	return true;
end


function HandleKillAllEntityCommand(Split, Player)
	local ForEachEntity = function(Entity)
		if not Entity:IsPlayer() then
			-- dtAdmin Damage
			-- Entity:TakeDamage(17, Player, 10000, 0)
			
			-- 消してるっぽい (ダメージとかじゃなくて消してるっぽい)
			Entity:Destroy()
		end
	end
	Player:GetWorld():ForEachEntity(ForEachEntity)
	return true;
end
function HandleKillAllCommand(Split, Player)
	local ForEachEntity = function(Entity)
		if Entity:IsPlayer() then
			-- dtAdmin Damage
			Entity:TakeDamage(17, Player, 10000, 0)
		end
	end
	Player:GetWorld():ForEachEntity(ForEachEntity)
	return true;
end


function HandleListEntityCommand(Split, Player)
	local count = 0
	local ForEachEntity = function(Entity)
		if not Entity:IsPlayer() then
			count = count + 1
		end
	end
	local World = Player:GetWorld()
	World:ForEachEntity(ForEachEntity)
	Player:SendMessageSuccess("&eTotal number of entities in &b"..World:GetName().."&e: &a"..count)
	return true;
end