
function HandleListEntityCommand(Split, Player)
	local outText = ""
	local ForEachWorld = function(World)
		local count = 0
		local ForEachEntity = function(Entity)
			if not Entity:IsPlayer() then
				count = count + 1
			end
		end
		-- local World = Player:GetWorld()
		World:ForEachEntity(ForEachEntity)
		outText = outText.."\n&b"..World:GetName().."&e: &a"..count
	end
	cRoot:Get():ForEachWorld(ForEachWorld)
	Player:SendMessageSuccess("&eTotal number of entities"..outText)
	return true;
end
