-- [[ Ability Hub - Master Sovereign x WindUI Fixed Edition ]]
if not game:IsLoaded() then 
    game.Loaded:Wait() 
end

-- โหลด WindUI ของจริงจากไฟล์หลัก (main.lua)
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/refs/heads/main/main.lua"))()

-- สร้างหน้าต่างหลักของ UI (Window)
local Window = WindUI:CreateWindow({
    Title = "Ability Hub 👑 Ultimate WindUI",
    Icon = "crown",
    Author = "Master Sovereign",
    Folder = "AbilityHubData",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
})

-- สร้างแท็บเมนูทั้งหมด
local Tab_Farm        = Window:Tab({ Title = "⚡ ฟาร์ม & อาวุธ", Icon = "swords" })
local Tab_Forbidden   = Window:Tab({ Title = "⚔️ ดาบแรร์ & ของลับ", Icon = "shield-alert" })
local Tab_Raid        = Window:Tab({ Title = "⚡ ดันเจี้ยน & บอส", Icon = "flame" })
local Tab_Sea         = Window:Tab({ Title = "🐙 ทะเล & ฟาร์มของ", Icon = "anchor" })
local Tab_Pro         = Window:Tab({ Title = "💀 กระดูก & กล่อง", Icon = "skull" })
local Tab_V4          = Window:Tab({ Title = "🔥 เผ่า V4 & เควส", Icon = "sparkles" })
local Tab_Fruit       = Window:Tab({ Title = "🍇 ผลไม้ & ร้านค้า", Icon = "gift" })
local Tab_God         = Window:Tab({ Title = "🌍 อมตะ & วาร์ป", Icon = "globe" })
local Tab_Settings    = Window:Tab({ Title = "🛡️ ตั้งค่า & ระบบ", Icon = "settings" })

local flags = {
    Farm = false,
    MapBring = false,
    SelectedWeapon = "Sword",
    AutoCDK = false,
    AutoSG = false,
    NoCD = false,
    AutoRaid = false,
    AutoBoss = false,
    AutoCakePrince = false,
    AutoTerror = false,
    AutoPiranha = false,
    AutoBones = false,
    AutoChest = false,
    AutoKen = false,
    AutoTrial = false,
    GodMode = false,
    AntiAdmin = false,
    InfE = false,
    InfiniteGeppo = false
}

-- [ ระบบบังคับถือและโจมตีอาวุธ ]
local function EquipAndAttack(weaponType)
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
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 0)
            task.wait(0.02)
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 0)
        end
    end)
end

-- =========================================================
-- [ แท็บที่ 1: ฟาร์มหลัก + รวบมอนในตัวฟาร์ม + ตีเร็ว ]
-- =========================================================
Tab_Farm:Dropdown({
    Title = "⚔️ เลือกอาวุธที่ใช้ฟาร์ม",
    Values = {"Sword", "Blox Fruit", "Melee"},
    Default = "Sword",
    Callback = function(selected)
        flags.SelectedWeapon = selected
    end
})

Tab_Farm:Toggle({
    Title = "⚡ Auto Farm Level (ฟาร์มเลเวล + รวบมอน + ตีเร็ว)",
    Desc = "บินฟาร์มเควสพร้อมดึงมอนรอบตัวมารุมตีและกดตีออโต้",
    Default = false,
    Callback = function(v) 
        flags.Farm = v 
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
                                    root.CanCollide = false
                                    root.CFrame = p.CFrame * CFrame.new(0, -10, 0)

                                    p.CFrame = root.CFrame * CFrame.new(0, 10, 0)
                                    p.Velocity = Vector3.new(0, 0, 0)
                                    
                                    EquipAndAttack(flags.SelectedWeapon)
                                    break 
                                end 
                            end 
                        end
                    end
                end) 
            end 
        end) 
    end
})

Tab_Farm:Toggle({
    Title = "👑 รวบมอนสเตอร์ทั้งเซิร์ฟ (Sovereign Bring)",
    Desc = "ดึงพิกัดมอนสเตอร์ทุกตัวในแมพมากองรวมกัน (ปุ่มแยกอิสระ)",
    Default = false,
    Callback = function(v) 
        flags.MapBring = v 
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
    end
})

Tab_Farm:Button({
    Title = "Kill Sea Beast (ล่าเจ้าทะเลทันที)",
    Desc = "วาร์ปไปจุดเกิดเจ้าทะเล",
    Callback = function() 
        pcall(function() 
            local sbFolder = game:GetService("Workspace"):FindFirstChild("SeaBeasts")
            if sbFolder then
                for _, sb in pairs(sbFolder:GetChildren()) do 
                    local root = sb:FindFirstChild("HumanoidRootPart")
                    local char = game.Players.LocalPlayer.Character
                    if root and char and char:FindFirstChild("HumanoidRootPart") then 
                        char.HumanoidRootPart.CFrame = root.CFrame * CFrame.new(0, 30, 0) 
                        break
                    end 
                end 
            end
        end) 
    end
})

-- =========================================================
-- [ แท็บที่ 2: ดาบแรร์ & ของลับ ]
-- =========================================================
Tab_Forbidden:Toggle({
    Title = "⚔️ Auto Farm Cursed Dual Katana (CDK)",
    Desc = "ออโต้ทำเควสหาดาบ CDK",
    Default = false,
    Callback = function(v)
        flags.AutoCDK = v
        task.spawn(function()
            while flags.AutoCDK do 
                task.wait(0.3)
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Start")
                end)
            end
        end)
    end
})

Tab_Forbidden:Toggle({
    Title = "👻 Auto Farm Soul Guitar (SG)",
    Desc = "ออโต้ทำเควสปืนโซลกีตาร์",
    Default = false,
    Callback = function(v)
        flags.AutoSG = v
        task.spawn(function()
            while flags.AutoSG do 
                task.wait(0.5)
                pcall(function() end)
            end
        end)
    end
})

Tab_Forbidden:Toggle({
    Title = "⚡ No Skill Cooldown (ลบดีเลย์สกิล)",
    Desc = "ตัดเวลาคูลดาวน์สกิลเป็น 0 กดรัวๆ",
    Default = false,
    Callback = function(v)
        flags.NoCD = v
        task.spawn(function()
            while flags.NoCD do 
                task.wait(0.1)
                pcall(function()
                    local char = game.Players.LocalPlayer.Character
                    if char then
                        for _, item in pairs(char:GetChildren()) do
                            if item:IsA("Tool") and item.Name ~= "Combat" then
                                local cd = item:FindFirstChild("Cooldown")
                                if cd then cd.Value = 0 end
                            end
                        end
                    end
                end)
            end
        end)
    end
})

-- =========================================================
-- [ แท็บที่ 3: ดันเจี้ยน & ล่าบอส ]
-- =========================================================
Tab_Raid:Toggle({
    Title = "⚡ Auto Raid Clear (ลงดันเจี้ยนออโต้)",
    Desc = "เคลียร์มอนสเตอร์ในดันเจี้ยนอัตโนมัติ",
    Default = false,
    Callback = function(v)
        flags.AutoRaid = v
        task.spawn(function()
            while flags.AutoRaid do 
                task.wait(0.2)
                pcall(function()
                    local char = game.Players.LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        local p = char.HumanoidRootPart
                        local enemies = game:GetService("Workspace"):FindFirstChild("Enemies")
                        if enemies then
                            for _, e in pairs(enemies:GetChildren()) do
                                local root = e:FindFirstChild("HumanoidRootPart")
                                local hum = e:FindFirstChild("Humanoid")
                                if root and hum and hum.Health > 0 then
                                    p.CFrame = root.CFrame * CFrame.new(0, 10, 0)
                                    break
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end
})

Tab_Raid:Toggle({
    Title = "👑 Auto Farm All Bosses (ล่าบอสทั่วเซิร์ฟ)",
    Desc = "วาร์ปล่าบอสทุกตัวในแมพ",
    Default = false,
    Callback = function(v)
        flags.AutoBoss = v
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
                                    break
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end
})

-- =========================================================
-- [ แท็บที่ 4: ทะเล & ฟาร์มของ ]
-- =========================================================
Tab_Sea:Toggle({
    Title = "🐙 Auto Farm Terror Shark (ฟาร์มฉลามยักษ์)",
    Desc = "ล็อกเป้าถล่มเทอร์รออร์ฉลาม",
    Default = false,
    Callback = function(v)
        flags.AutoTerror = v
        task.spawn(function()
            while flags.AutoTerror do 
                task.wait(0.2)
                pcall(function()
                    local char = game.Players.LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        local p = char.HumanoidRootPart
                        local enemies = game:GetService("Workspace"):FindFirstChild("Enemies")
                        if enemies then
                            for _, enemy in pairs(enemies:GetChildren()) do
                                local root = enemy:FindFirstChild("HumanoidRootPart")
                                local hum = enemy:FindFirstChild("Humanoid")
                                if enemy.Name:find("TerrorShark") and root and hum and hum.Health > 0 then
                                    p.CFrame = root.CFrame * CFrame.new(0, 20, 0)
                                    break
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end
})

Tab_Sea:Toggle({
    Title = "🕊️ Infinite Geppo / Soru (เดินอากาศไม่จำกัด)",
    Desc = "กดพุ่งตัวและกระโดดกลางอากาศรัวๆ",
    Default = false,
    Callback = function(v)
        flags.InfiniteGeppo = v
        task.spawn(function()
            while flags.InfiniteGeppo do 
                task.wait(0.1)
                pcall(function() 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnergyGeppo") 
                end)
            end
        end)
    end
})

-- =========================================================
-- [ แท็บที่ 5: ฟาร์มกระดูก & กล่อง ]
-- =========================================================
Tab_Pro:Toggle({
    Title = "💀 Auto Farm Bones (ฟาร์มกระดูกปราสาทผีสิง)",
    Desc = "ฟาร์มมอนสยองขวัญดรอปกระดูก",
    Default = false,
    Callback = function(v)
        flags.AutoBones = v
        task.spawn(function()
            while flags.AutoBones do 
                task.wait(0.2)
                pcall(function()
                    local char = game.Players.LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        local p = char.HumanoidRootPart
                        local enemies = game:GetService("Workspace"):FindFirstChild("Enemies")
                        if enemies then
                            for _, e in pairs(enemies:GetChildren()) do
                                local root = e:FindFirstChild("HumanoidRootPart")
                                local hum = e:FindFirstChild("Humanoid")
                                if (e.Name:find("Reaper") or e.Name:find("Soul")) and root and hum and hum.Health > 0 then
                                    p.CFrame = root.CFrame * CFrame.new(0, 10, 0)
                                    break
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end
})

Tab_Pro:Toggle({
    Title = "📦 Auto Collect Chests (ออโต้เก็บกล่องสมบัติ)",
    Desc = "วาร์ปเก็บกล่องรอบแมพ",
    Default = false,
    Callback = function(v)
        flags.AutoChest = v
        task.spawn(function()
            while flags.AutoChest do 
                task.wait(0.5)
                pcall(function()
                    local char = game.Players.LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        local p = char.HumanoidRootPart
                        for _, obj in pairs(game:GetService("Workspace"):GetChildren()) do
                            if obj.Name:find("Chest") and obj:FindFirstChild("TouchInterest") then
                                p.CFrame = obj.CFrame
                                task.wait(0.1)
                            end
                        end
                    end
                end)
            end
        end)
    end
})

-- =========================================================
-- [ แท็บที่ 6: ทำเผ่า V4 & มิชชัน ]
-- =========================================================
Tab_V4:Button({
    Title = "Teleport Blue Gear (วาร์ปหาเฟืองเผ่า V4)",
    Desc = "บินไปพิกัดจุดเกิดเฟือง",
    Callback = function()
        pcall(function()
            local g = game:GetService("Workspace"):FindFirstChild("BlueGear")
            local char = game.Players.LocalPlayer.Character
            if g and char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = g.CFrame
            end
        end)
    end
})

Tab_V4:Button({
    Title = "Auto Pull Lever (ดึงคันโยกยอดเขา)",
    Desc = "ดึงคันโยกห้องนาฬิกา",
    Callback = function()
        pcall(function()
            local lever = game:GetService("Workspace"):FindFirstChild("Map")
            if lever and lever:FindFirstChild("TempleOfTime") and lever.TempleOfTime:FindFirstChild("Lever") then
                fireclickdetector(lever.TempleOfTime.Lever.ClickDetector)
            end
        end)
    end
})

-- =========================================================
-- [ แท็บที่ 7: ผลไม้ & ร้านค้า ]
-- =========================================================
Tab_Fruit:Button({
    Title = "Random Fruit (สุ่มผลกับ NPC)",
    Desc = "สุ่มผลไม้",
    Callback = function() 
        pcall(function() 
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy") 
        end) 
    end
})

Tab_Fruit:Button({
    Title = "Redeem All Codes (กดรับโค้ด Exp)",
    Desc = "กรอกโค้ดเพิ่มเลเวลอัตโนมัติ",
    Callback = function() 
        pcall(function() 
            local codes = {"REWARDFUN", "NEWTROLL", "KITT_RESET", "Sub2CaptainMaui"} 
            for _, c in pairs(codes) do 
                game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(c) 
            end 
        end) 
    end
})

-- =========================================================
-- [ แท็บที่ 8: อมตะ & วาร์ปโลก ]
-- =========================================================
Tab_God:Toggle({
    Title = "🛡️ God Mode (โหมดอมตะ เลือดเต็ม)",
    Desc = "ล็อกค่าเลือดตัวละคร",
    Default = false,
    Callback = function(v)
        flags.GodMode = v
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
    end
})

Tab_God:Button({
    Title = "🌍 Teleport to Sea 1",
    Desc = "ย้ายไปโลก 1",
    Callback = function() pcall(function() game:GetService("TeleportService"):Teleport(2753915549, game.Players.LocalPlayer) end) end
})

Tab_God:Button({
    Title = "🌊 Teleport to Sea 2",
    Desc = "ย้ายไปโลก 2",
    Callback = function() pcall(function() game:GetService("TeleportService"):Teleport(4442272183, game.Players.LocalPlayer) end) end
})

Tab_God:Button({
    Title = "⚡ Teleport to Sea 3",
    Desc = "ย้ายไปโลก 3",
    Callback = function() pcall(function() game:GetService("TeleportService"):Teleport(7449423635, game.Players.LocalPlayer) end) end
})

-- =========================================================
-- [ แท็บที่ 9: ตั้งค่า & ระบบ ]
-- =========================================================
Tab_Settings:Slider({
    Title = "WalkSpeed Custom (ความเร็ววิ่ง)",
    Desc = "ปรับแต่งความเร็วตัวละคร",
    Min = 16,
    Max = 250,
    Default = 16,
    Callback = function(v) 
        pcall(function() 
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = v 
            end
        end) 
    end
})

Tab_Settings:Toggle({
    Title = "Infinite Energy (สเตมิน่าไม่จำกัด)",
    Desc = "ล็อกพลังงานเต็มตลอด",
    Default = false,
    Callback = function(v) 
        flags.InfE = v 
        task.spawn(function() 
            while flags.InfE do 
                task.wait(0.3) 
                pcall(function() 
                    local char = game.Players.LocalPlayer.Character
                    if char and char:FindFirstChild("Energy") then
                        char.Energy.Value = char.Energy.MaxValue 
                    end
                end) 
            end 
        end) 
    end
})
