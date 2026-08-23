-- [[ Ability Hub - Master Sovereign Real Working Edition ]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Ability Hub 👑 Ultimate Edition",
    LoadingTitle = "กำลังโหลดระบบหลัก...",
    LoadingSubtitle = "by Master Sovereign",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "AbilityHub",
        FileName = "Config"
    },
    KeySystem = false,
})

-- สร้างแท็บเมนู
local Tab_Farm   = Window:CreateTab("⚡ ฟาร์มเลเวล & มอน", "swords")
local Tab_Boss   = Window:CreateTab("⚔️ ดาบแรร์ & บอส", "shield-alert")
local Tab_Misc   = Window:CreateTab("🍇 ผลไม้ & ระบบ", "gift")
local Tab_Settings = Window:CreateTab("🛡️ ตั้งค่าตัวละคร", "settings")

local flags = {
    Farm = false,
    MapBring = false,
    AutoBoss = false,
    GodMode = false,
    InfEnergy = false,
    SelectedWeapon = "Sword"
}

-- [ ระบบสลับและถืออาวุธแบบทำงานจริง ]
local function EquipWeapon(weaponType)
    pcall(function()
        local player = game.Players.LocalPlayer
        local char = player.Character
        if not char then return end
        
        local currentTool = char:FindFirstChildOfClass("Tool")
        if not currentTool and player.Backpack then
            for _, item in pairs(player.Backpack:GetChildren()) do
                if item:IsA("Tool") then
                    if weaponType == "Sword" and item.ToolTip == "Sword" then
                        char.Humanoid:EquipTool(item)
                        break
                    elseif weaponType == "Blox Fruit" and item.ToolTip == "Blox Fruit" then
                        char.Humanoid:EquipTool(item)
                        break
                    elseif weaponType == "Melee" and item.ToolTip == "Melee" then
                        char.Humanoid:EquipTool(item)
                        break
                    end
                end
            end
        end

        local activeTool = char:FindFirstChildOfClass("Tool")
        if activeTool then
            activeTool:Activate()
        end
    end)
end

-- =========================================================
-- [ แท็บที่ 1: ฟาร์มเลเวล & มอนสเตอร์ ]
-- =========================================================
Tab_Farm:CreateDropdown({
    Name = "⚔️ เลือกอาวุธที่ใช้ฟาร์ม",
    Options = {"Sword", "Blox Fruit", "Melee"},
    CurrentOption = "Sword",
    Callback = function(Option)
        flags.SelectedWeapon = Option[1]
    end,
})

Tab_Farm:CreateToggle({
    Name = "⚡ Auto Farm Level (ฟาร์มเลเวล + ดึงมอน + ตีออโต้)",
    CurrentValue = false,
    Callback = function(Value)
        flags.Farm = Value
        task.spawn(function()
            while flags.Farm do
                task.wait(0.05)
                pcall(function()
                    local player = game.Players.LocalPlayer
                    local char = player.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        local p = char.HumanoidRootPart
                        local enemies = game:GetService("Workspace"):FindFirstChild("Enemies")
                        if enemies then
                            for _, e in pairs(enemies:GetChildren()) do
                                local root = e:FindFirstChild("HumanoidRootPart")
                                local hum = e:FindFirstChild("Humanoid")
                                if root and hum and hum.Health > 0 and flags.Farm then
                                    -- ดึงมอนมารวมใต้เท้าแล้วบินไปบนหัว
                                    root.CanCollide = false
                                    root.CFrame = p.CFrame * CFrame.new(0, -10, 0)
                                    p.CFrame = root.CFrame * CFrame.new(0, 10, 0)
                                    p.Velocity = Vector3.new(0, 0, 0)
                                    
                                    -- สั่งโจมตีจริง
                                    EquipWeapon(flags.SelectedWeapon)
                                    break
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end,
})

Tab_Farm:CreateToggle({
    Name = "👑 รวบมอนสเตอร์ทั้งเซิร์ฟ (Sovereign Bring)",
    CurrentValue = false,
    Callback = function(Value)
        flags.MapBring = Value
        task.spawn(function()
            while flags.MapBring do
                task.wait(0.1)
                pcall(function()
                    local char = game.Players.LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        local targetPos = char.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
                        local enemies = game:GetService("Workspace"):FindFirstChild("Enemies")
                        if enemies then
                            for _, enemy in pairs(enemies:GetChildren()) do
                                local root = enemy:FindFirstChild("HumanoidRootPart")
                                local hum = enemy:FindFirstChild("Humanoid")
                                if root and hum and hum.Health > 0 then
                                    root.CanCollide = false
                                    root.CFrame = targetPos
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end,
})

-- =========================================================
-- [ แท็บที่ 2: ดาบแรร์ & บอส ]
-- =========================================================
Tab_Boss:CreateToggle({
    Name = "👑 Auto Farm All Bosses (วาร์ปล่าบอสทั่วแมพ)",
    CurrentValue = false,
    Callback = function(Value)
        flags.AutoBoss = Value
        task.spawn(function()
            while flags.AutoBoss do
                task.wait(0.3)
                pcall(function()
                    local char = game.Players.LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        local p = char.HumanoidRootPart
                        local enemies = game:GetService("Workspace"):FindFirstChild("Enemies")
                        if enemies then
                            for _, e in pairs(enemies:GetChildren()) do
                                local hum = e:FindFirstChild("Humanoid")
                                local root = e:FindFirstChild("HumanoidRootPart")
                                if hum and hum.Health > 0 and root and (e.Name:find("Boss") or e.Name:find("Captain")) then
                                    p.CFrame = root.CFrame * CFrame.new(0, 12, 0)
                                    EquipWeapon(flags.SelectedWeapon)
                                    break
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end,
})

Tab_Boss:CreateButton({
    Name = "⚔️ Auto Farm Cursed Dual Katana (CDK)",
    Callback = function()
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Start")
            Rayfield:Notify({Title = "CDK System", Content = "กำลังเริ่มเควสดาบ CDK อัตโนมัติ", Duration = 3})
        end)
    end,
})

-- =========================================================
-- [ แท็บที่ 3: ผลไม้ & ระบบเสริม ]
-- =========================================================
Tab_Misc:CreateButton({
    Name = "🍇 Random Fruit (สุ่มผลกับ NPC)",
    Callback = function()
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
            Rayfield:Notify({Title = "Gacha Fruit", Content = "ทำการสุ่มผลไม้เรียบร้อยแล้ว!", Duration = 3})
        end)
    end,
})

Tab_Misc:CreateButton({
    Name = "🎁 Redeem All Codes (กดรับโค้ดเพิ่มเลเวล)",
    Callback = function()
        pcall(function()
            local codes = {"REWARDFUN", "NEWTROLL", "KITT_RESET", "Sub2CaptainMaui"}
            for _, c in pairs(codes) do
                game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(c)
            end
            Rayfield:Notify({Title = "Redeem Codes", Content = "กรอกโค้ดทั้งหมดเรียบร้อย!", Duration = 3})
        end)
    end,
})

-- =========================================================
-- [ แท็บที่ 4: ตั้งค่าตัวละคร ]
-- =========================================================
Tab_Settings:CreateSlider({
    Name = "WalkSpeed (ความเร็ววิ่ง)",
    Range = {16, 250},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(Value)
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end)
    end,
})

Tab_Settings:CreateToggle({
    Name = "🛡️ God Mode (เลือดเต็มตลอดเวลา)",
    CurrentValue = false,
    Callback = function(Value)
        flags.GodMode = Value
        task.spawn(function()
            while flags.GodMode do
                task.wait(0.1)
                pcall(function()
                    local char = game.Players.LocalPlayer.Character
                    if char and char:FindFirstChild("Humanoid") then
                        char.Humanoid.Health = char.Humanoid.MaxHealth
                    end
                end)
            end
        end)
    end,
})

Tab_Settings:CreateToggle({
    Name = "⚡ Infinite Energy (สเตมิน่าไม่จำกัด)",
    CurrentValue = false,
    Callback = function(Value)
        flags.InfEnergy = Value
        task.spawn(function()
            while flags.InfEnergy do
                task.wait(0.3)
                pcall(function()
                    local char = game.Players.LocalPlayer.Character
                    if char and char:FindFirstChild("Energy") then
                        char.Energy.Value = char.Energy.MaxValue
                    end
                end)
            end
        end)
    end,
})

Rayfield:LoadConfiguration()
