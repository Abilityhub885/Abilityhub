-- =====================================================================
-- [[ ABILITY HUB - SUPREME ENTERPRISE EDITION (FIXED UI) ]]
-- Build Version: 20.2.0 (Complete Tabs & Modular Skills)
-- Target: Blox Fruits (Sea 1, Sea 2, Sea 3 Full Auto Integration)
-- =====================================================================

if not game:IsLoaded() then 
    game.Loaded:Wait() 
end

if _G.AbilityHubLoaded then
    pcall(function()
        if game:GetService("CoreGui"):FindFirstChild("Rayfield") then
            game:GetService("CoreGui").Rayfield:Destroy()
        end
    end)
end
_G.AbilityHubLoaded = true

local Players             = game:GetService("Players")
local Workspace           = game:GetService("Workspace")
local ReplicatedStorage   = game:GetService("ReplicatedStorage")
local TeleportService     = game:GetService("TeleportService")
local VirtualUser         = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")

local LocalPlayer         = Players.LocalPlayer
local Camera              = Workspace.CurrentCamera

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local MainWindow = Rayfield:CreateWindow({
    Name = "Ability Hub ⚡ Supreme Enterprise Edition",
    LoadingTitle = "กำลังโหลดระบบฟาร์มและตั้งค่าสกิล...",
    LoadingSubtitle = "by Master Sovereign - Fixed Edition",
    ConfigurationSaving = { Enabled = true, FolderName = "AbilityHubClean", FileName = "Config" },
    KeySystem = false,
})

-- =====================================================================
-- CONFIGURATION & STATE TABLE
-- =====================================================================
local Config = {
    AutoFarm        = false,
    AutoQuest       = true,
    AutoBuso        = true,
    FastAttack      = true,
    SelectedWeapon  = "Melee",
    
    -- แยกฟังก์ชันกดสกิล
    UseSkillZ       = false,
    UseSkillX       = false,
    UseSkillC       = false,
    UseSkillV       = false,
}

-- =====================================================================
-- EXPANDED QUEST DATABASE (LEVEL 1 TO 2550+)
-- =====================================================================
local QuestRegistry = {
    -- [ SEA 1 ]
    { Level = 1,    Mob = "Bandit",             QuestID = "BanditQuest1",     Index = 1,  NpcPos = CFrame.new(1060, 16, 1546),  MobPos = CFrame.new(1159, 17, 1632) },
    { Level = 10,   Mob = "Monkey",             QuestID = "JungleQuest",      Index = 1,  NpcPos = CFrame.new(-1598, 36, 153),  MobPos = CFrame.new(-1499, 39, 44) },
    { Level = 30,   Mob = "Pirate",             QuestID = "BuggyQuest1",      Index = 1,  NpcPos = CFrame.new(-1140, 4, 3827),  MobPos = CFrame.new(-1201, 14, 3935) },
    { Level = 60,   Mob = "Desert Bandit",      QuestID = "DesertQuest",      Index = 1,  NpcPos = CFrame.new(896, 6, 4388),    MobPos = CFrame.new(944, 7, 4402) },
    { Level = 90,   Mob = "Snow Bandit",        QuestID = "SnowQuest",        Index = 1,  NpcPos = CFrame.new(1389, 87, -1298), MobPos = CFrame.new(1386, 105, -1455) },
    { Level = 120,  Mob = "Chief Petty Officer",QuestID = "MarineQuest",      Index = 1,  NpcPos = CFrame.new(-5035, 27, 4325), MobPos = CFrame.new(-4884, 21, 4293) },
    { Level = 150,  Mob = "Sky Bandit",         QuestID = "SkyQuest",         Index = 1,  NpcPos = CFrame.new(-4842, 718, -2623), MobPos = CFrame.new(-4981, 290, -2900) },
    { Level = 190,  Mob = "Prisoner",           QuestID = "PrisonerQuest",    Index = 1,  NpcPos = CFrame.new(487, 48, 631),    MobPos = CFrame.new(521, 48, 475) },
    { Level = 250,  Mob = "Toga Warrior",       QuestID = "ColosseumQuest",   Index = 1,  NpcPos = CFrame.new(-1580, 8, -3057), MobPos = CFrame.new(-1840, 52, -2750) },
    { Level = 300,  Mob = "Military Spy",       QuestID = "MagmaQuest",       Index = 1,  NpcPos = CFrame.new(-5315, 12, 8515),   MobPos = CFrame.new(-5800, 80, 8830) },
    { Level = 375,  Mob = "Fishman Warrior",    QuestID = "FishmanQuest",     Index = 1,  NpcPos = CFrame.new(6112, 19, 1565),   MobPos = CFrame.new(6080, 20, 1150) },
    { Level = 450,  Mob = "God's Guard",        QuestID = "SkyExp1Quest",     Index = 1,  NpcPos = CFrame.new(-4721, 845, -1954), MobPos = CFrame.new(-4680, 915, -1920) },
    { Level = 550,  Mob = "Royal Squad",        QuestID = "SkyExp2Quest",     Index = 1,  NpcPos = CFrame.new(-7859, 5545, -380), MobPos = CFrame.new(-7660, 5635, -1450) },
    { Level = 700,  Mob = "Galley Pirate",      QuestID = "FountainQuest",    Index = 1,  NpcPos = CFrame.new(5259, 38, 4050),   MobPos = CFrame.new(5560, 85, 3950) },

    -- [ SEA 2 ]
    { Level = 750,  Mob = "Raider",             QuestID = "Area1Quest",       Index = 1,  NpcPos = CFrame.new(-606, 15, 2292),   MobPos = CFrame.new(-730, 38, 2450) },
    { Level = 800,  Mob = "Swan Pirate",        QuestID = "Area2Quest",       Index = 1,  NpcPos = CFrame.new(633, 18, 918),     MobPos = CFrame.new(870, 125, 1200) },
    { Level = 850,  Mob = "Factory Staff",      QuestID = "FactoryQuest",     Index = 1,  NpcPos = CFrame.new(304, 73, -55),     MobPos = CFrame.new(450, 100, -150) },
    { Level = 900,  Mob = "Marine Lieutenant",  QuestID = "MarineQuest2",     Index = 1,  NpcPos = CFrame.new(-2440, 73, 3217),  MobPos = CFrame.new(-2700, 85, 3400) },
    { Level = 1000, Mob = "Zombie",             QuestID = "ZombieQuest",      Index = 1,  NpcPos = CFrame.new(-5453, 13, -794),  MobPos = CFrame.new(-5650, 60, -700) },
    { Level = 1100, Mob = "Snow Trooper",       QuestID = "SnowMountainQuest",Index = 1,  NpcPos = CFrame.new(607, 400, -5370),  MobPos = CFrame.new(450, 430, -5250) },
    { Level = 1200, Mob = "Lab Subordinate",    QuestID = "IceSideQuest",     Index = 1,  NpcPos = CFrame.new(-6062, 16, -4904),  MobPos = CFrame.new(-5750, 50, -4300) },
    { Level = 1300, Mob = "Magma Ninja",        QuestID = "FireSideQuest",    Index = 1,  NpcPos = CFrame.new(-5428, 16, -5290),  MobPos = CFrame.new(-5300, 80, -5900) },
    { Level = 1400, Mob = "Ship Deckhand",      QuestID = "ShipQuest1",       Index = 1,  NpcPos = CFrame.new(1038, 125, 32915), MobPos = CFrame.new(1200, 140, 33000) },

    -- [ SEA 3 ]
    { Level = 1500, Mob = "Pirate Millionaire", QuestID = "PortQuest",        Index = 1,  NpcPos = CFrame.new(-290, 43, 5581),   MobPos = CFrame.new(-350, 70, 5800) },
    { Level = 1575, Mob = "Dragon Crew Warrior",QuestID = "HydraQuest1",      Index = 1,  NpcPos = CFrame.new(5203, 104, 10471), MobPos = CFrame.new(5400, 120, 10300) },
    { Level = 1700, Mob = "Marine Commodore",   QuestID = "ResortQuest",      Index = 1,  NpcPos = CFrame.new(2401, 14, -32),    MobPos = CFrame.new(2200, 30, -100) },
    { Level = 1800, Mob = "Fishman Raider",     QuestID = "MuIslandQuest",    Index = 1,  NpcPos = CFrame.new(-10581, 331, -8760),MobPos = CFrame.new(-10800, 340, -8500) },
    { Level = 1900, Mob = "Pirate Recruiter",   QuestID = "CandyQuest1",      Index = 1,  NpcPos = CFrame.new(-1147, 12, -14450),MobPos = CFrame.new(-1200, 20, -14200) },
    { Level = 2000, Mob = "Candy Staff",        QuestID = "CandyQuest2",      Index = 1,  NpcPos = CFrame.new(-655, 14, -15248), MobPos = CFrame.new(-800, 30, -15400) },
    { Level = 2100, Mob = "Chocolate Bar Battler",QuestID = "CocoaQuest1",    Index = 2,  NpcPos = CFrame.new(233, 21, -12180),  MobPos = CFrame.new(350, 45, -12300) },
    { Level = 2200, Mob = "Candy Rebel",        QuestID = "CandyQuest3",      Index = 2,  NpcPos = CFrame.new(160, 30, -14380),  MobPos = CFrame.new(250, 40, -14600) },
    { Level = 2300, Mob = "Cake Guard",         QuestID = "CakeQuest1",       Index = 2,  NpcPos = CFrame.new(-1905, 38, -11867),MobPos = CFrame.new(-1700, 50, -11600) },
    { Level = 2450, Mob = "Isle Outlaw",        QuestID = "TikiQuest1",       Index = 1,  NpcPos = CFrame.new(-16500, 15, 1050), MobPos = CFrame.new(-16700, 30, 1200) },
}

-- =====================================================================
-- CORE FUNCTIONS
-- =====================================================================
local function GetPlayerLevel()
    local success, lvl = pcall(function() return LocalPlayer.Data.Level.Value end)
    return success and lvl or 1
end

local function GetCurrentQuestData()
    local userLevel = GetPlayerLevel()
    local currentQuest = QuestRegistry[1]
    for _, q in ipairs(QuestRegistry) do
        if userLevel >= q.Level then
            currentQuest = q
        end
    end
    return currentQuest
end

local function VerifyQuest(questData)
    if not Config.AutoQuest then return end
    pcall(function()
        local mainGui = LocalPlayer.PlayerGui:FindFirstChild("Main")
        local questFrame = mainGui and mainGui:FindFirstChild("Quest")
        if not questFrame or not questFrame.Visible then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = questData.NpcPos
                task.wait(0.3)
                ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", questData.QuestID, questData.Index)
            end
        end
    end)
end

local function EquipWeapon(weaponType)
    pcall(function()
        local char = LocalPlayer.Character
        if not char then return end
        if not char:FindFirstChildOfClass("Tool") and LocalPlayer.Backpack then
            for _, item in pairs(LocalPlayer.Backpack:GetChildren()) do
                if item:IsA("Tool") and item.ToolTip == weaponType then
                    char.Humanoid:EquipTool(item)
                    break
                end
            end
        end
    end)
end

-- ฟังก์ชันกดสกิลแบบแยกอิสระ (Z, X, C, V)
local function ExecuteSkills()
    pcall(function()
        local keysToPress = {}
        if Config.UseSkillZ then table.insert(keysToPress, Enum.KeyCode.Z) end
        if Config.UseSkillX then table.insert(keysToPress, Enum.KeyCode.X) end
        if Config.UseSkillC then table.insert(keysToPress, Enum.KeyCode.C) end
        if Config.UseSkillV then table.insert(keysToPress, Enum.KeyCode.V) end
        
        if #keysToPress > 0 then
            for _, keycode in ipairs(keysToPress) do
                VirtualInputManager:SendKeyEvent(true, keycode, false, game)
                task.wait(0.02)
                VirtualInputManager:SendKeyEvent(false, keycode, false, game)
                task.wait(0.05)
            end
        end
    end)
end

-- =====================================================================
-- USER INTERFACE TABS (CREATED CORRECTLY WITHOUT OVERLAPS)
-- =====================================================================
local Tab_Farm     = MainWindow:CreateTab("⚡ ระบบฟาร์มหลัก", "crosshair")
local Tab_Skills   = MainWindow:CreateTab("🎯 ตั้งค่าสกิลออโต้", "zap")
local Tab_Teleport = MainWindow:CreateTab("🌍 ย้ายโลก / วาร์ป", "globe")

-- --- [ Tab 1: ระบบฟาร์มหลัก ] ---
Tab_Farm:CreateDropdown({
    Name = "⚔️ เลือกอาวุธฟาร์ม",
    Options = {"Melee", "Sword", "Blox Fruit", "Gun"},
    CurrentOption = "Melee",
    Callback = function(Option)
        Config.SelectedWeapon = Option[1]
    end,
})

Tab_Farm:CreateToggle({
    Name = "⚡ เปิด/ปิด ออโต้ฟาร์มเควสเวลตัน",
    CurrentValue = false,
    Callback = function(Value)
        Config.AutoFarm = Value
        task.spawn(function()
            while Config.AutoFarm do
                task.wait(0.1)
                pcall(function()
                    local char = LocalPlayer.Character
                    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
                    local hrp = char.HumanoidRootPart
                    
                    local quest = GetCurrentQuestData()
                    VerifyQuest(quest)
                    EquipWeapon(Config.SelectedWeapon)
                    
                    if Config.AutoBuso then
                        pcall(function()
                            if not LocalPlayer.Character:FindFirstChild("Buso") then
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
                            end
                        end)
                    end
                    
                    local enemies = Workspace:FindFirstChild("Enemies")
                    local targetFound = false
                    
                    if enemies then
                        for _, enemy in pairs(enemies:GetChildren()) do
                            local eRoot = enemy:FindFirstChild("HumanoidRootPart")
                            local eHum = enemy:FindFirstChild("Humanoid")
                            if eRoot and eHum and eHum.Health > 0 and enemy.Name == quest.Mob and Config.AutoFarm then
                                targetFound = true
                                eRoot.CanCollide = false
                                eRoot.CFrame = hrp.CFrame * CFrame.new(0, -6, 0)
                                hrp.CFrame = eRoot.CFrame * CFrame.new(0, 10, 0)
                                
                                local tool = char:FindFirstChildOfClass("Tool")
                                if tool then
                                    tool:Activate()
                                    if Config.FastAttack then
                                        VirtualUser:Button1Down(Vector2.new(0,0), Camera.CFrame)
                                        VirtualUser:Button1Up(Vector2.new(0,0), Camera.CFrame)
                                    end
                                    
                                    -- เรียกใช้ฟังก์ชันกดสกิล
                                    ExecuteSkills()
                                end
                                break
                            end
                        end
                    end
                    
                    if not targetFound and quest then
                        hrp.CFrame = quest.MobPos * CFrame.new(0, 15, 0)
                    end
                end)
            end
        end)
    end,
})

Tab_Farm:CreateToggle({
    Name = "🛡️ เปิดเกราะฮาคิออโต้ (Buso Haki)",
    CurrentValue = true,
    Callback = function(Value)
        Config.AutoBuso = Value
    end,
})

-- --- [ Tab 2: ตั้งค่าสกิลออโต้ ] ---
Tab_Skills:CreateToggle({
    Name = "🌀 ใช้สกิล Z ออโต้",
    CurrentValue = false,
    Callback = function(Value)
        Config.UseSkillZ = Value
    end,
})

Tab_Skills:CreateToggle({
    Name = "🌀 ใช้สกิล X ออโต้",
    CurrentValue = false,
    Callback = function(Value)
        Config.UseSkillX = Value
    end,
})

Tab_Skills:CreateToggle({
    Name = "🌀 ใช้สกิล C ออโต้",
    CurrentValue = false,
    Callback = function(Value)
        Config.UseSkillC = Value
    end,
})

Tab_Skills:CreateToggle({
    Name = "🌀 ใช้สกิล V ออโต้",
    CurrentValue = false,
    Callback = function(Value)
        Config.UseSkillV = Value
    end,
})

-- --- [ Tab 3: ย้ายโลก / วาร์ป ] ---
Tab_Teleport:CreateButton({
    Name = "🚀 วาร์ปไปโลก 2 (Sea 2)",
    Callback = function()
        TeleportService:Teleport(4442272183, LocalPlayer)
    end,
})

Tab_Teleport:CreateButton({
    Name = "⚡ วาร์ปไปโลก 3 (Sea 3)",
    Callback = function()
        TeleportService:Teleport(7449423635, LocalPlayer)
    end,
})

Rayfield:LoadConfiguration()
