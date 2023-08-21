
function BindCommands()
	cPluginManager:BindCommand("/tpall","CubeCMDTool.tpall",HandleTpallCommand,"tp all player")

	cPluginManager:BindCommand("/killAllEntity","CubeCMDTool.killAllEntity",HandleKillAllEntityCommand,"kill all entity")
	cPluginManager:BindCommand("/killAll","CubeCMDTool.killAll",HandleKillAllCommand,"kill all player")

	cPluginManager:BindCommand("/listEntity","CubeCMDTool.killEntity",HandleListEntityCommand,"list all dimension entity")
	
	cPluginManager:BindCommand("/playerViewDistance","CubeCMDTool.playerViewDistance",HandlePlayerViewDistanceCommand,"change player view distance")
	cPluginManager:BindCommand("/allPlayerViewDistance","CubeCMDTool.allPlayerViewDistance",HandleAllPlayerViewDistanceCommand,"change all player view distance")
	
	cPluginManager:BindCommand("/kickAll","CubeCMDTool.kickAll",HandleKiclAllCommand,"kick all player")
end


function Initialize(Plugin)
	Plugin:SetName("CubeCMDTool")
	Plugin:SetVersion(1.0)
	
	BindCommands()
	-- PluginManager = cRoot:Get():GetPluginManager()
	-- cPluginManager:AddHook(cPluginManager.HOOK_CHAT, Chat)
	LOG("Initialised "..Plugin:GetName().." version: " .. Plugin:GetVersion())
	return true
end