#****************************************************************************
#**
#**  File     :  /cdimage/units/UAL0401/UAL0401_script.lua
#**  Author(s):  John Comes, Gordon Duclos
#**
#**  Summary  :  Aeon Galactic Colossus Script
#**
#**  Copyright � 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local AWalkingLandUnit = import('/lua/aeonunits.lua').AWalkingLandUnit
local WeaponsFile = import ('/lua/aeonweapons.lua')
local ADFPhasonLaser = WeaponsFile.ADFPhasonLaser
local ADFTractorClaw = WeaponsFile.ADFTractorClaw
local utilities = import('/lua/utilities.lua')
local Util = import('/lua/utilities.lua')
local explosion = import('/lua/defaultexplosions.lua')
local sdexplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local RKEffectUtil = import('/mods/rks_explosions/lua/RKEffectUtilities.lua')
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local NEffectTemplate = import('/mods/rks_explosions/lua/NEffectTemplates.lua')
local RKExplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local toggle = import('/mods/rks_explosions/lua/Togglestuff.lua').toggle

function GetEffectTemplateFile(toggle)
	if toggle == 1 then
		return SDEffectTemplate
	else 
		return NEffectTemplate
	end
end


UAL0401 = Class(AWalkingLandUnit) {
    Weapons = {
        EyeWeapon = Class(ADFPhasonLaser) {},
        RightArmTractor = Class(ADFTractorClaw) {},
        LeftArmTractor = Class(ADFTractorClaw) {},
    },
    


    OnKilled = function(self, instigator, type, overkillRatio)
		local Army = self:GetArmy()
        AWalkingLandUnit.OnKilled(self, instigator, type, overkillRatio)
        local wep = self:GetWeaponByLabel('EyeWeapon')
        local bp = wep:GetBlueprint()
        if bp.Audio.BeamStop then
            wep:PlaySound(bp.Audio.BeamStop)
        end
        if bp.Audio.BeamLoop and wep.Beams[1].Beam then
            wep.Beams[1].Beam:SetAmbientSound(nil, nil)
        end
        for k, v in wep.Beams do
            v.Beam:Disable()
        end     
    end,
	
	DeathThreadWater = function( self, overkillratio, instigator)
		local Army = self:GetArmy()
		local army = self:GetArmy()
		local NumberForShake = (Util.GetRandomFloat( 1.5, 1.5 + 1 ) )/3.5
        
        self:PlayUnitSound('DestroyedStep2')
		
        sdexplosion.CreateGenericFlashExplosionAtBone( self, 'Torso', 5.0 )
        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()}) 
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end          
        WaitSeconds(1/0.8/0.8/0.8/0.9)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateGenericFlashExplosionAtBone( self, 'Right_Leg_B02', 0.5 )
		self:ShakeCamera( 30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathSmallBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        WaitSeconds(0.85/0.8/0.8*0.8)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateGenericFlashExplosionAtBone( self, 'Right_Leg_B01', 0.3 )
		self:ShakeCamera( 30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathSmallBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        WaitSeconds(0.95/0.8/0.8)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateGenericFlashExplosionAtBone( self, 'Left_Arm_B02', 0.3 )
		self:ShakeCamera( 30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathSmallBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        WaitSeconds(0.75/0.8/0.8*0.7)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateGenericFlashExplosionAtBone( self, 'Right_Arm_B01', 0.3 )
		self:ShakeCamera( 30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathSmallBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        ##sdexplosion.CreateGenericFlashExplosionAtBone( self, 'Right_Leg_B01', 0.5 )
		self:ShakeCamera( 30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathSmallBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        WaitSeconds(0.575105/0.8/0.8/0.7)
        self:PlayUnitSound('DestroyedStep3')
        sdexplosion.CreateGenericFlashExplosionAtBone( self, 'Torso', 4.5 )
		self:ShakeCamera( 30 * NumberForShake*1.5, NumberForShake*1.5, 0, NumberForShake*1.5 / 1.375)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        
        WaitSeconds(2.5/0.8/0.8/0.8*0.8)
        sdexplosion.CreateGenericFlashExplosionAtBone( self, 'Torso', 6.5 )
		self:ShakeCamera( 30*2.5 * NumberForShake*2.5, NumberForShake*2.5, 0, NumberForShake*3.5)    
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathBigBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
		
		if self.DeathAnimManip then
            WaitFor(self.DeathAnimManip)
        end
		
	end,
	
	DeathThreadLand = function( self, overkillratio, instigator)
		local Army = self:GetArmy()
		local army = self:GetArmy()
		local NumberForShake = (Util.GetRandomFloat( 1.5, 1.5 + 1 ) )/3.5
        
		self:ShakeCamera( 30 * NumberForShake*1.5, NumberForShake*1.5, 0, NumberForShake*1.5 / 1.375)
        self:PlayUnitSound('DestroyedStep2')
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Torso', Army, GetEffectTemplateFile(toggle).GC_Core_Breach02, 2.15, 'CoreBreach' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'B01', Army, GetEffectTemplateFile(toggle).GC_Body_Part_Damage, 0.15, 'SmokingDeath' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'B02', Army, GetEffectTemplateFile(toggle).GC_Body_Part_Damage, 0.15, 'SmokingDeath' )
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Right_Arm_B02', Army, GetEffectTemplateFile(toggle).GC_Body_Part_Damage, 0.15, 'SmokingDeath' )
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Left_Arm_B02', Army, GetEffectTemplateFile(toggle).GC_Body_Part_Damage, 0.15, 'SmokingDeath' )
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Torso', Army, GetEffectTemplateFile(toggle).GC_Body_Part_Damage, 0.15, 'SmokingDeath' )
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Right_Arm_Muzzle01', Army, GetEffectTemplateFile(toggle).GC_Body_Part_Damage, 0.15, 'SmokingDeath' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Left_Leg_B02', Army, GetEffectTemplateFile(toggle).GC_Body_Part_Damage, 0.15, 'SmokingDeath' )
		
        sdexplosion.CreateAeonLargeInitialHitExplosionAtBone( self, 'Torso', 5.0 )
        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()}) 
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end          
        WaitSeconds(1/0.8/0.8/0.8/0.9)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateAeonMediumHitExplosionAtBone( self, 'Right_Leg_B02', 0.5 )
		self:ShakeCamera( 30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathSmallBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        WaitSeconds(0.85/0.8/0.8*0.8)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateAeonSmallHitExplosionAtBone( self, 'Right_Leg_B01', 0.3 )
		self:ShakeCamera( 30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathSmallBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        WaitSeconds(0.95/0.8/0.8)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateAeonSmallHitExplosionAtBone( self, 'Left_Arm_B02', 0.3 )
		self:ShakeCamera( 30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathSmallBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        WaitSeconds(0.75/0.8/0.8*0.7)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateAeonSmallHitExplosionAtBone( self, 'Right_Arm_B01', 0.3 )
		self:ShakeCamera( 30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathSmallBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        ##sdexplosion.CreateAeonSmallHitExplosionAtBone( self, 'Right_Leg_B01', 0.5 )
		self:ShakeCamera( 30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathSmallBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        WaitSeconds(0.575105/0.8/0.8/0.7)
        self:PlayUnitSound('DestroyedStep3')
        sdexplosion.CreateAeonLargeHitExplosionAtBone( self, 'Torso', 4.5 )
		self:ShakeCamera( 30 * NumberForShake*1.5, NumberForShake*1.5, 0, NumberForShake*1.5 / 1.375)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        
        WaitSeconds(2.5/0.8/0.8/0.8*0.8)
        sdexplosion.CreateAeonFinalLargeHitExplosionAtBone( self, 'Torso', 6.5 )
		self:ShakeCamera( 30*2.5 * NumberForShake*2.5, NumberForShake*2.5, 0, NumberForShake*3.5)    
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathBigBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
		
		if self.DeathAnimManip then
            WaitFor(self.DeathAnimManip)
        end
		
	end,
		
    DeathThread = function( self, overkillRatio , instigator)
		local Army = self:GetArmy()
		local army = self:GetArmy()
		local NumberForShake = (Util.GetRandomFloat( 1.5, 1.5 + 1 ) )/3.5
		local layer = self:GetCurrentLayer() 
		
		if layer == ('Water') then
			self.DeathThreadWater(self,  overkillRatio , instigator)
		elseif layer == ('Seabed') then
			self.DeathThreadWater(self,  overkillRatio , instigator)
		else
			self.DeathThreadLand(self,  overkillRatio , instigator)
		end
		
		

        if self.DeathAnimManip then
            WaitFor(self.DeathAnimManip)
        end
    
        

        self:DestroyAllDamageEffects()
        self:CreateWreckage( overkillRatio )

        # CURRENTLY DISABLED UNTIL DESTRUCTION
        # Create destruction debris out of the mesh, currently these projectiles look like crap,
        # since projectile rotation and terrain collision doesn't work that great. These are left in
        # hopes that this will look better in the future.. =)
        if( self.ShowUnitDestructionDebris and overkillRatio ) then
            if overkillRatio <= 1 then
                self.CreateUnitDestructionDebris( self, true, true, false )
            elseif overkillRatio <= 2 then
                self.CreateUnitDestructionDebris( self, true, true, false )
            elseif overkillRatio <= 3 then
                self.CreateUnitDestructionDebris( self, true, true, true )
            else #VAPORIZED
                self.CreateUnitDestructionDebris( self, true, true, true )
            end
        end
		self:PlayUnitSound('DestroyedFinal')
        RKExplosion.CreateScorchMarkDecalRKSExpAeon(self, 20, army)
        self:Destroy()
    end,
    
}
TypeClass = UAL0401