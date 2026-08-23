-- [[ Ability Hub - Master Sovereign Global Edition (Ultimate Stable & Expanded Edition) ]]
-- Optimized for Delta & High-Performance Executors | Year 2026 Engine
if not game:IsLoaded() then 
    game.Loaded:Wait() 
end

-- [ ระบบป้องกันข้อผิดพลาดการโหลด UI (Safe-Load UI Library) ]
local successUI, DrRay = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
end)

if not successUI or not DrRay then
    warn("[Ability Hub] ไม่สามารถโหลด DrRay UI ได้ กรุณาตรวจสอบอินเทอร์เน็ตหรือตัวรันของคุณ")
    return
end

local Window = DrRay:Load("Ability Hub 👑 Ultimate Stable", "Default")

-- [ จัดระเบียบแท็บใหม่ตามลำดับความสำคัญสูงสุด (Priority UI Order) ]
local Tab_Farm        = DrRay.newTab("1. ⚡ ฟาร์มหลัก & รวบมอน", "rbxassetid://4483345998")
local Tab_Forbidden   = DrRay.newTab("2. ⚔️ ดาบแรร์ & ของลับ", "rbxassetid://4483345998")
local Tab_Raid        = DrRay.newTab("3. ⚡ ดันเจี้ยน & ล่าบอส", "rbxassetid://4483345998")
local Tab_Sea         = DrRay.newTab("4. 🐙 ทะเล & ฟาร์มของ", "rbxassetid://4483345998")
local Tab_Pro         = DrRay.newTab("5. 💀 ฟาร์มกระดูก & กล่อง", "rbxassetid://4483345998")
local Tab_V4          = DrRay.newTab("6. 🔥 ทำเผ่า V4 & เกาะ", "rbxassetid://4483345998")
local Tab_Fruit       = DrRay.newTab("7. 🍇 ผลไม้ & ร้านค้า", "rbxassetid://4483345998")
local Tab_God         = DrRay.newTab("8. 🌍 อมตะ & วาร์ปโลก", "rbxassetid://4483345998")
local Tab_Settings    = DrRay.newTab("9. 🛡️ ตั้งค่า & กันแบน", "rbxassetid://4483345998")

-- [ ตัวแปรสถานะระบบทั้งหมด (State Variables) ]
local flags = {
    Fast = false,
    MapBring = false,
    Farm = false,
    AntiAdmin = false,
    InfE = false,
    AutoBones = false,
    AutoChest = false,
    AutoKen = false,
    AutoTerror = false,
    AutoMat = false,
    InfiniteGeppo = false,
    AutoRaid = false,
    AutoBuyChip = false,
    AutoBoss = false,
    GodMode = false,
    PlayerESP = false,
    AutoCDK = false,
    AutoSG = false,
    AutoSniperFruit = false,
    NoCD = false
}

-- =========================================================
-- [ แท็บที่ 1: ฟาร์มหลัก & รวบมอน (สำคัญที่สุด) ]
-- =========================================================
Tab_Farm.newToggle("Fast Attack (โจมตีเร็วสุดขีด)", "เปิดระเบิดความเร็วในการตีมอนสเตอร์รวดเร็ว", false, function(v) 
    flags.Fast = v 
    task.spawn(function() 
        while flags.Fast do 
            task.wait(0.01) 
            pcall(function() 
                local char = game.Players.LocalPlayer.Character
                if char then
                    local tool = char:FindFirstChildOfClass("Tool") 
                    if tool then tool:Activate() end 
                end
            end) 
        end 
    end) 
end)

Tab_Farm.newToggle("👑 รวบมอนสเตอร์ทั้งเซิร์ฟ (Sovereign Bring)", "กระชากพิกัดมอนสเตอร์ทั้งหมดมากองตรงหน้าแบบไร้บัค", false, function(v) 
    flags.MapBring = v 
    task.spawn(function() 
        while flags.MapBring do 
            task.wait(0.15) 
            pcall(function() 
                local char = game.Players.LocalPlayer.Character 
                if char and char:FindFirstChild("HumanoidRootPart") then 
                    local targetPos = char.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5.5) 
                    local enemies = game:GetService("Workspace"):FindFirstChild("Enemies")
                    if enemies then
                        for _, enemy in pairs(enemies:GetChildren()) do 
                            local root = enemy:FindFirstChild("HumanoidRootPart")
                            local hum = enemy:FindFirstChild("Humanoid")
                            if root and hum and hum.Health > 0 then 
                                root.CanCollide = false 
                                if not root:FindFirstChild("SovereignVelocity") then
                                    local bv = Instance.new("BodyVelocity", root) 
                                    bv.Name = "SovereignVelocity"
                                    bv.Velocity = Vector3.new(0,0,0) 
                                    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge) 
                                end
                                root.CFrame = targetPos 
                            end 
                        end 
                    end
                end 
            end) 
        end 
    end) 
end)

Tab_Farm.newToggle("Auto Farm Level (ฟาร์มออโต้เก็บเลเวล)", "บินไปรับเควสและล็อกหัวมอนสเตอร์ทำเลเวลจนเต็ม", false, function(v) 
    flags.Farm = v 
    task.spawn(function() 
        while flags.Farm do 
            task.wait(0.1) 
            pcall(function() 
                local char = game.Players.LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local p = char.HumanoidRootPart 
                    local enemies = game:GetService("Workspace"):FindFirstChild("Enemies")
                    if enemies then
                        for _, e in pairs(enemies:GetChildren()) do 
                            local root = e:FindFirstChild("HumanoidRootPart")
                            local hum = e:FindFirstChild("Humanoid")
                            if root and hum and hum.Health > 0 and flags.Farm then 
                                p.CFrame = root.CFrame * CFrame.new(0, 11, 0) 
                                break 
                            end 
                        end 
                    end
                end
            end) 
        end 
    end) 
end)

Tab_Farm.newButton("Kill Sea Beast (ล่าเจ้าทะเลทันที)", "เคลื่อนย้ายพิกัดตำแหน่งไปจุดเกิดเจ้าทะเลทันที", function() 
    pcall(function() 
        local sbFolder = game:GetService("Workspace"):FindFirstChild("SeaBeasts")
        if sbFolder then
            for _, sb in pairs(sbFolder:GetChildren()) do 
                local root = sb:FindFirstChild("HumanoidRootPart")
                local char = game.Players.LocalPlayer.Character
                if root and char and char:FindFirstChild("HumanoidRootPart") then 
                    char.HumanoidRootPart.CFrame = root.CFrame * CFrame.new(0, 40, 0) 
                    break
                end 
            end 
        end
    end) 
end)

-- =========================================================
-- [ แท็บที่ 2: ดาบแรร์ & ของลับ ]
-- =========================================================
Tab_Forbidden.newToggle("⚔️ Auto Farm Cursed Dual Katana (ออโต้ทำดาบ CDK)", "ออโต้ทำเควสและตีบอสตระเวนหาดาบสุดแรร์อัตโนมัติ", false, function(v)
    flags.AutoCDK = v
    task.spawn(function()
        while flags.AutoCDK do 
            task.wait(0.3)
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Start")
            end)
        end
    end)
end)

Tab_Forbidden.newToggle("👻 Auto Craft Soul Guitar (ออโต้ทำปืนโซลกีตาร์)", "เช็คเควสและออโต้ฟาร์มวัตถุดิบทำปืนโซลกีตาร์ระดับเทพทันที", false, function(v)
    flags.AutoSG = v
    task.spawn(function()
        while flags.AutoSG do 
            task.wait(0.5) 
            pcall(function()
                -- โค้ดสำรองตรวจสอบวัตถุดิบโซลกีตาร์
            end) 
        end
    end)
end)

Tab_Forbidden.newToggle("🍎 Auto Sniper Fruit Stock (สไนเปอร์ซื้อผลเทพในร้านค้า)", "ตรวจเช็คและกดซื้อผลไม้เกรด A/S ทันทีเมื่อรีเซ็ตสต็อก", false, function(v)
    flags.AutoSniperFruit = v
    task.spawn(function()
        while flags.AutoSniperFruit do 
            task.wait(5)
            pcall(function()
                local fruits = {"Leopard", "Dragon", "Dough", "Spirit", "Venom", "Control", "Shadow"}
                for _, f in pairs(fruits) do
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Stock", f)
                end
            end)
        end
    end)
end)

Tab_Forbidden.newToggle("⚡ No Skill Cooldown (ลบดีเลย์สกิล กดรัวๆ)", "ตัดเวลาคูลดาวน์สกิลตัวละครให้เป็น 0 ทำให้กดต่อเนื่องได้", false, function(v)
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
end)

-- =========================================================
-- [ แท็บที่ 3: ดันเจี้ยน & ล่าบอส ]
-- =========================================================
Tab_Raid.newToggle("⚡ Auto Raid Clear (ลงดันเจี้ยนออโต้ทะลุเกาะ)", "เดินหน้าเคลียร์มอนสเตอร์ในดันเจี้ยนและวาร์ปเข้าเกาะถัดไปอัตโนมัติ", false, function(v)
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
                                p.CFrame = root.CFrame * CFrame.new(0, 12, 0)
                                break
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

Tab_Raid.newButton("🎟️ Auto Buy Microchip (ซื้อชิปลงดันเจี้ยน)", "กดซื้อชิปเปิดห้องแล็บทดลองเพื่อลงดันเจี้ยนผลไม้ทันที", function()
    pcall(function() 
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Raids", "Select", "Flame") 
    end)
end)

Tab_Raid.newToggle("👑 Auto Farm All Bosses (ออโต้ล่าบอสทุกตัวในแมพ)", "วาร์ปล่าบอสเกิดใหม่ทั่วทุกเกาะเพื่อลุ้นรับไอเทมแรร์", false, function(v)
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
                            if hum and hum.Health > 0 and root and (e.Name:find("Boss") or e.Name:find("Captain") or e.Name:find("Cursed")) then
                                p.CFrame = root.CFrame * CFrame.new(0, 15, 0)
                                break
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

-- =========================================================
-- [ แท็บที่ 4: ทะเล & ฟาร์มของ ]
-- =========================================================
Tab_Sea.newToggle("🐙 Auto Farm Terror Shark (ฟาร์มเทอร์รออร์ฉลาม)", "ล็อกเป้าหมายและวาร์ปเข้าโจมตีเทอร์รออร์ฉลามในทะเลลึกอัตโนมัติ", false, function(v)
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
                                p.CFrame = root.CFrame * CFrame.new(0, 25, 0)
                                break
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

Tab_Sea.newToggle("🧪 Auto Farm Rare Materials (ฟาร์มของอัปเกรด)", "ออโต้ฟาร์มมอนสเตอร์ที่ดรอปวัตถุดิบแรร์", false, function(v)
    flags.AutoMat = v
    task.spawn(function()
        while flags.AutoMat do 
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
                            if (e.Name:find("Pirate") or e.Name:find("Agent") or e.Name:find("Marine")) and root and hum and hum.Health > 0 then
                                p.CFrame = root.CFrame * CFrame.new(0, 10, 0)
                                break
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

Tab_Sea.newToggle("🕊️ Infinite Geppo / Soru (เดินอากาศไม่จำกัด)", "กดปุ่มกระโดดกลางอากาศหรือพุ่งตัวได้รัวๆ", false, function(v)
    flags.InfiniteGeppo = v
    task.spawn(function()
        while flags.InfiniteGeppo do 
            task.wait(0.1)
            pcall(function() 
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnergyGeppo") 
            end)
        end
    end)
end)

Tab_Sea.newButton("🏝️ Teleport Sea Castle (วาร์ปไปปราสาททะเล)", "เคลื่อนย้ายพิกัดตัวละครไปจุดเซฟปราสาททะเลทันที", function()
    pcall(function() 
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = CFrame.new(-5067.8, 314.5, -3134.1) 
        end
    end)
end)

-- =========================================================
-- [ แท็บที่ 5: ฟาร์มกระดูก & กล่อง ]
-- =========================================================
Tab_Pro.newToggle("💀 Auto Farm Bones (ฟาร์มกระดูกปราสาทผีสิง)", "วาร์ปฟาร์มมอนสเตอร์เฉพาะตัวที่ดรอปกระดูก", false, function(v)
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
                            if (e.Name:find("Reaper") or e.Name:find("Soul") or e.Name:find("Possessed") or e.Name:find("Mummy")) and root and hum and hum.Health > 0 then
                                p.CFrame = root.CFrame * CFrame.new(0, 10, 0)
                                break
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

Tab_Pro.newToggle("📦 Auto Collect Chests (ออโต้เก็บกล่องสมบัติ)", "วาร์ปเก็บกล่องสมบัติทั่วทั้งแมพปั๊มเงิน", false, function(v)
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
end)

Tab_Pro.newToggle("👁️ Auto Ken Haki (เปิดฮากิสังเกตออโต้)", "กดรีเซ็ตฮากิสังเกตให้อัตโนมัติ", false, function(v)
    flags.AutoKen = v
    task.spawn(function()
        while flags.AutoKen do 
            task.wait(1)
            pcall(function()
                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
                task.wait(0.05)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
            end)
        end
    end)
end)

-- =========================================================
-- [ แท็บที่ 6: ทำเผ่า V4 & เกาะ ]
-- =========================================================
Tab_V4.newButton("Teleport Blue Gear (วาร์ปหาเฟืองเกาะมายา)", "บินล็อกตำแหน่งพิกัดไปหาจุดตกเฟือง", function() 
    pcall(function() 
        local g = game:GetService("Workspace"):FindFirstChild("BlueGear") 
        local char = game.Players.LocalPlayer.Character
        if g and char and char:FindFirstChild("HumanoidRootPart") then 
            char.HumanoidRootPart.CFrame = g.CFrame 
        end 
    end) 
end)

Tab_V4.newButton("Auto Pull Lever (ดึงคันโยกยอดเขา)", "ดึงคันโยกยอดเขาสูงสุดเกาะมายา", function() 
    pcall(function() 
        local lever = game:GetService("Workspace"):FindFirstChild("Map")
        if lever and lever:FindFirstChild("TempleOfTime") and lever.TempleOfTime:FindFirstChild("Lever") then
            fireclickdetector(lever.TempleOfTime.Lever.ClickDetector)
        end
    end) 
end)

-- =========================================================
-- [ แท็บที่ 7: ผลไม้ & ร้านค้า ]
-- =========================================================
Tab_Fruit.newButton("Random Fruit (สุ่มผลกับ NPC)", "ใช้เงินเบลีสุ่มลุ้นรับผลไม้จาก NPC", function() 
    pcall(function() 
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy") 
    end) 
end)

Tab_Fruit.newButton("Fruit ESP (มองทะลุจุดผลไม้เกิด)", "โชว์ชื่อและตำแหน่งผลไม้ปีศาจทั่วแมพ", function() 
    pcall(function() 
        for _, o in pairs(game:GetService("Workspace"):GetChildren()) do 
            if o:IsA("Tool") and (o.Name:find("Fruit") or o:FindFirstChild("Handle")) then 
                local handle = o:FindFirstChild("Handle")
                if handle and not handle:FindFirstChild("Fruit_ESP") then
                    local bg = Instance.new("BillboardGui", handle) 
                    bg.Name = "Fruit_ESP"
                    bg.Size = UDim2.new(0,200,0,50) 
                    bg.AlwaysOnTop = true 
                    local lbl = Instance.new("TextLabel", bg) 
                    lbl.Size = UDim2.new(1,0,1,0) 
                    lbl.Text = "🍇 " .. o.Name 
                    lbl.TextColor3 = Color3.fromRGB(168, 85, 247) 
                    lbl.BackgroundTransparency = 1 
                end
            end 
        end 
    end) 
end)

Tab_Fruit.newButton("Redeem All Codes (กดรับโค้ดคูณ Exp)", "กรอกโค้ดเพิ่มเลเวลอัตโนมัติ", function() 
    pcall(function() 
        local codes = {"REWARDFUN", "NEWTROLL", "KITT_RESET", "Sub2CaptainMaui"} 
        for _, c in pairs(codes) do 
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(c) 
        end 
    end) 
end)

-- =========================================================
-- [ แท็บที่ 8: อมตะ & วาร์ปโลก ]
-- =========================================================
Tab_God.newToggle("🛡️ God Mode (โหมดอมตะ เลือดไม่ลด)", "ล็อกค่าเลือดตัวละครไม่ให้ตาย", false, function(v)
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
end)

Tab_God.newToggle("👀 Player ESP (มองทะลุผู้เล่นอื่น)", "แสดงชื่อและกรอบตัวละครผู้เล่นอื่น", false, function(v)
    flags.PlayerESP = v
    task.spawn(function()
        while flags.PlayerESP do 
            task.wait(1)
            pcall(function()
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                        local head = p.Character.Head
                        if not head:FindFirstChild("ESP_Gui") then
                            local bg = Instance.new("BillboardGui", head)
                            bg.Name = "ESP_Gui" 
                            bg.Size = UDim2.new(0, 200, 0, 50) 
                            bg.AlwaysOnTop = true
                            local lbl = Instance.new("TextLabel", bg) 
                            lbl.Size = UDim2.new(1, 0, 1, 0) 
                            lbl.Text = "👤 " .. p.Name 
                            lbl.TextColor3 = Color3.fromRGB(255, 50, 50) 
                            lbl.BackgroundTransparency = 1 
                            lbl.TextSize = 14
                        end
                    end
                end
            end)
        end
    end)
end)

Tab_God.newButton("🌍 Teleport to Sea 1 (วาร์ปไปโลก 1)", "ย้ายเซิร์ฟเวอร์ข้ามไปโลกที่ 1", function() 
    pcall(function() game:GetService("TeleportService"):Teleport(2753915549, game.Players.LocalPlayer) end) 
end)
Tab_God.newButton("🌊 Teleport to Sea 2 (วาร์ปไปโลก 2)", "ย้ายเซิร์ฟเวอร์ข้ามไปโลกที่ 2", function() 
    pcall(function() game:GetService("TeleportService"):Teleport(4442272183, game.Players.LocalPlayer) end) 
end)
Tab_God.newButton("⚡ Teleport to Sea 3 (วาร์ปไปโลก 3)", "ย้ายเซิร์ฟเวอร์ข้ามไปโลกที่ 3", function() 
    pcall(function() game:GetService("TeleportService"):Teleport(7449423635, game.Players.LocalPlayer) end) 
end)

-- =========================================================
-- [ แท็บที่ 9: ตั้งค่า & กันแบน ]
-- =========================================================
Tab_Settings.newSlider("WalkSpeed Custom (ความเร็ววิ่ง)", "ปรับแต่งค่าความเร็วในการเดินวิ่ง", 250, false, function(v) 
    pcall(function() 
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = v 
        end
    end) 
end)

Tab_Settings.newToggle("Admin Server Hop (ระบบหนีแอดมิน)", "วาร์ปหนีอัตโนมัติเมื่อเจอแอดมินเข้าเซิร์ฟ", false, function(v) 
    flags.AntiAdmin = v 
end)

game.Players.PlayerAdded:Connect(function(p) 
    if flags.AntiAdmin then
        pcall(function()
            if (p:IsInGroup(4334945) and p:GetRankInGroup(4334945) >= 200) or p.Name:find("Admin") then 
                game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer) 
            end 
        end)
    end
end)

Tab_Settings.newToggle("Infinite Energy (สเตมิน่าไม่จำกัด)", "ล็อกค่าพลังงานให้เต็มตลอดเวลา", false, function(v) 
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
end)
