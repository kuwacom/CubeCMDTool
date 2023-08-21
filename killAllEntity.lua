function HandleKillAllEntityCommand(Split, Player)
	local count = 0
	local ForEachEntity = function(Entity)
		if not Entity:IsPlayer() then
			-- dtAdmin Damage
			-- Entity:TakeDamage(17, Player, 10000, 0)
			
			-- 消してるっぽい (ダメージとかじゃなくて消してるっぽい)
			Entity:Destroy()
			count = count + 1
		end
	end
	Player:GetWorld():ForEachEntity(ForEachEntity)
	Player:SendMessageSuccess("&eKill All &a"..count.." &eentities")
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
	Player:SendMessageSuccess("&eKill All Player")
	return true;
end