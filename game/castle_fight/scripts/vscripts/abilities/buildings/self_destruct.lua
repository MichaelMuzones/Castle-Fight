building_self_destruct = class({})

function building_self_destruct:OnChannelFinish(interrupted)
  if not IsServer() or interrupted then return end

  local caster = self:GetCaster()
  local ability = self

  local explosion_range = 100

  local particleName = "particles/units/heroes/hero_techies/techies_land_mine_explode.vpcf"
  local particle = ParticleManager:CreateParticle(particleName, PATTACH_WORLDORIGIN, caster)
  ParticleManager:SetParticleControl(particle, 0, caster:GetAbsOrigin())
  ParticleManager:SetParticleControl(particle, 1, caster:GetAbsOrigin())
  ParticleManager:SetParticleControl(particle, 2, Vector(explosion_range, 1, 1))
  ParticleManager:ReleaseParticleIndex(particle)

  caster:AddEffects(EF_NODRAW)
  caster:ForceKill(true)
end