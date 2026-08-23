-- =====================================================================
-- [[ ABILITY HUB - HYPERSCALE MULTI-SEA SUPREME (REVISED & FIXED EDITION) ]]
-- Build Version: 18.5.0 Ultimate Enterprise Edition
-- Target Game: Blox Fruits (Sea 1, Sea 2, Sea 3 Complete Integration)
-- =====================================================================

if not game:IsLoaded() then 
    game.Loaded:Wait() 
end

if _G.MultiSeaUltimateLoaded then
    pcall(function()
        if game:GetService("CoreGui"):FindFirstChild("Rayfield") then
            game:GetService("CoreGui").Rayfield:Destroy()
        end
    end)
end
_G.MultiSeaUltimateLoaded = true

local HttpService           = game:GetService("HttpService")
local TweenService          = game:GetService("TweenService")
local RunService            = game:GetService("RunService")
local Players               = game:GetService("Players")
local Workspace             = game:GetService("Workspace")
local ReplicatedStorage     = game:GetService("ReplicatedStorage")
local TeleportService       = game:GetService("TeleportService")
local VirtualUser           = game:GetService("VirtualUser")
local VirtualInputManager   = game:GetService("VirtualInputManager")

local LocalPlayer           = Players.LocalPlayer
local Camera                = Workspace.CurrentCamera

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local UltimateWindow = Rayfield:CreateWindow({
    Name = "Ability Hub 🌐 Multi-Sea Supreme (Max Level & Auto Transition)",
    LoadingTitle = "กำลังโหลดระบบฟาร์มตันและข้ามโลกออโต้...",
    LoadingSubtitle = "by Master Sovereign - Multi-Sea Architecture",
    ConfigurationSaving = { Enabled = true, FolderName = "AbilityHubMultiSea", FileName = "UltimateConfig" },
    KeySystem = false,
})

-- =====================================================================
-- SECTION 1: GLOBAL CONFIGURATION
-- =====================================================================
local UltimateConfig = {
    AutoFarmLevel       = false,
    AutoSeaTransition   = true,
    AutoSkillZ          = true,
    AutoSkillX          = true,
    AutoSkillC          = true,
    AutoSkillV          = true,
    FastAttack          = false,
    AutoBuso            = false,
    AutoObservation     = false,
    AutoChest           = false,
    AutoFruit           = false,
    NoClipMode          = false,
    InfiniteGeppo       = false,
    CustomWalkSpeed     = 16,
    DiscordWebhookURL   = "",
    SelectedWeapon      = "Sword",
    TweenFlightSpeed    = 350,
}

-- =====================================================================
-- SECTION 2: ULTIMATE MULTI-SEA QUEST DATABASE (LEVEL 0 TO MAX 2550+)
-- =====================================================================
local UltimateQuestRegistry = {
    -- [ SEA 1: LEVEL 0 - 700 ]
    { Level = 0,    Mob = "Bandit",             QuestID = "BanditQuest1",     Index = 1,  NpcPos = CFrame.new(1060, 16, 1546),  MobPos = CFrame.new(1159, 17, 1632) },
    { Level = 10,   Mob = "Monkey",             QuestID = "JungleQuest",      Index = 1,  NpcPos = CFrame.new(-1598, 36, 153),  MobPos = CFrame.new(-1499, 39, 44) },
    { Level = 15,   Mob = "Gorilla",            QuestID = "JungleQuest",      Index = 2,  NpcPos = CFrame.new(-1598, 36, 153),  MobPos = CFrame.new(-1237, 6, -502) },
    { Level = 30,   Mob = "Pirate",             QuestID = "BuggyQuest1",      Index = 1,  NpcPos = CFrame.new(-1140, 4, 3827),  MobPos = CFrame.new(-1201, 14, 3935) },
    { Level = 40,   Mob = "Brute",              QuestID = "BuggyQuest1",      Index = 2,  NpcPos = CFrame.new(-1140, 4, 3827),  MobPos = CFrame.new(-1390, 15, 4084) },
    { Level = 60,   Mob = "Desert Bandit",      QuestID = "DesertQuest",      Index = 1,  NpcPos = CFrame.new(896, 6, 4388),    MobPos = CFrame.new(944, 7, 4402) },
    { Level = 75,   Mob = "Desert Officer",     QuestID = "DesertQuest",      Index = 2,  NpcPos = CFrame.new(896, 6, 4388),    MobPos = CFrame.new(1099, 6, 4350) },
    { Level = 90,   Mob = "Snow Bandit",        QuestID = "SnowQuest",        Index = 1,  NpcPos = CFrame.new(1389, 87, -1298), MobPos = CFrame.new(1386, 105, -1455) },
    { Level = 100,  Mob = "Snowman",            QuestID = "SnowQuest",        Index = 2,  NpcPos = CFrame.new(1389, 87, -1298), MobPos = CFrame.new(1155, 142, -1531) },
    { Level = 120,  Mob = "Chief Petty Officer",QuestID = "MarineQuest",      Index = 1,  NpcPos = CFrame.new(-5035, 27, 4325), MobPos = CFrame.new(-4884, 21, 4293) },
    { Level = 150,  Mob = "Sky Bandit",         QuestID = "SkyQuest",         Index = 1,  NpcPos = CFrame.new(-4842, 718, -2623), MobPos = CFrame.new(-4981, 290, -2900) },
    { Level = 175,  Mob = "Dark Master",        QuestID = "SkyQuest",         Index = 2,  NpcPos = CFrame.new(-4842, 718, -2623), MobPos = CFrame.new(-5245, 388, -2275) },
    { Level = 190,  Mob = "Prisoner",           QuestID = "PrisonerQuest",    Index = 1,  NpcPos = CFrame.new(487, 48, 631),    MobPos = CFrame.new(521, 48, 475) },
    { Level = 210,  Mob = "Dangerous Prisoner", QuestID = "PrisonerQuest",    Index = 2,  NpcPos = CFrame.new(487, 48, 631),    MobPos = CFrame.new(890, 48, 120) },
    { Level = 250,  Mob = "Toga Warrior",       QuestID = "ColosseumQuest",   Index = 1,  NpcPos = CFrame.new(-1580, 8, -3057), MobPos = CFrame.new(-1840, 52, -2750) },
    { Level = 275,  Mob = "Gladiator",          QuestID = "ColosseumQuest",   Index = 2,  NpcPos = CFrame.new(-1580, 8, -3057), MobPos = CFrame.new(-1390, 8, -3200) },
    { Level = 300,  Mob = "Military Spy",       QuestID = "MagmaQuest",       Index = 1,  NpcPos = CFrame.new(-5315, 12, 8515),   MobPos = CFrame.new(-5800, 80, 8830) },
    { Level = 325,  Mob = "Military Warrior",   QuestID = "MagmaQuest",       Index = 2,  NpcPos = CFrame.new(-5315, 12, 8515),   MobPos = CFrame.new(-5960, 15, 8740) },
    { Level = 375,  Mob = "Fishman Warrior",    QuestID = "FishmanQuest",     Index = 1,  NpcPos = CFrame.new(6112, 19, 1565),   MobPos = CFrame.new(6080, 20, 1150) },
    { Level = 400,  Mob = "Fishman Commando",   QuestID = "FishmanQuest",     Index = 2,  NpcPos = CFrame.new(6112, 19, 1565),   MobPos = CFrame.new(6350, 20, 1340) },
    { Level = 450,  Mob = "God's Guard",        QuestID = "SkyExp1Quest",     Index = 1,  NpcPos = CFrame.new(-4721, 845, -1954), MobPos = CFrame.new(-4680, 915, -1920) },
    { Level = 525,  Mob = "Shanda",             QuestID = "SkyExp1Quest",     Index = 2,  NpcPos = CFrame.new(-4721, 845, -1954), MobPos = CFrame.new(-7860, 5555, -370) },
    { Level = 550,  Mob = "Royal Squad",        QuestID = "SkyExp2Quest",     Index = 1,  NpcPos = CFrame.new(-7859, 5545, -380), MobPos = CFrame.new(-7660, 5635, -1450) },
    { Level = 625,  Mob = "Royal Soldier",      QuestID = "SkyExp2Quest",     Index = 2,  NpcPos = CFrame.new(-7859, 5545, -380), MobPos = CFrame.new(-7490, 5625, -1980) },
    { Level = 700,  Mob = "Galley Pirate",      QuestID = "FountainQuest",    Index = 1,  NpcPos = CFrame.new(5259, 38, 4050),   MobPos = CFrame.new(5560, 85, 3950) },
    { Level = 725,  Mob = "Galley Captain",     QuestID = "FountainQuest",    Index = 2,  NpcPos = CFrame.new(5259, 38, 4050),   MobPos = CFrame.new(5320, 60, 4750) },

    -- [ SEA 2: LEVEL 750 - 1500 ]
    { Level = 750,  Mob = "Raider",             QuestID = "Area1Quest",       Index = 1,  NpcPos = CFrame.new(-606, 15, 2292),   MobPos = CFrame.new(-730, 38, 2450) },
    { Level = 775,  Mob = "Mercenary",          QuestID = "Area1Quest",       Index = 2,  NpcPos = CFrame.new(-606, 15, 2292),   MobPos = CFrame.new(-850, 40, 2100) },
    { Level = 800,  Mob = "Swan Pirate",        QuestID = "Area2Quest",       Index = 1,  NpcPos = CFrame.new(633, 18, 918),     MobPos = CFrame.new(870, 125, 1200) },
    { Level = 850,  Mob = "Factory Staff",      QuestID = "FactoryQuest",     Index = 1,  NpcPos = CFrame.new(304, 73, -55),     MobPos = CFrame.new(450, 100, -150) },
    { Level = 900,  Mob = "Marine Lieutenant",  QuestID = "MarineQuest2",     Index = 1,  NpcPos = CFrame.new(-2440, 73, 3217),  MobPos = CFrame.new(-2700, 85, 3400) },
    { Level = 950,  Mob = "Marine Captain",     QuestID = "MarineQuest2",     Index = 2,  NpcPos = CFrame.new(-2440, 73, 3217),  MobPos = CFrame.new(-2200, 90, 3050) },
    { Level = 1000, Mob = "Zombie",             QuestID = "ZombieQuest",      Index = 1,  NpcPos = CFrame.new(-5453, 13, -794),  MobPos = CFrame.new(-5650, 60, -700) },
    { Level = 1050, Mob = "Vampire",            QuestID = "ZombieQuest",      Index = 2,  NpcPos = CFrame.new(-5453, 13, -794),  MobPos = CFrame.new(-5900, 50, -1250) },
    { Level = 1100, Mob = "Snow Trooper",       QuestID = "SnowMountainQuest",Index = 1,  NpcPos = CFrame.new(607, 400, -5370),  MobPos = CFrame.new(450, 430, -5250) },
    { Level = 1150, Mob = "Winter Warrior",     QuestID = "SnowMountainQuest",Index = 2,  NpcPos = CFrame.new(607, 400, -5370),  MobPos = CFrame.new(1100, 460, -5100) },
    { Level = 1200, Mob = "Lab Subordinate",    QuestID = "IceSideQuest",     Index = 1,  NpcPos = CFrame.new(-6062, 16, -4904),  MobPos = CFrame.new(-5750, 50, -4300) },
    { Level = 1250, Mob = "Horned Warrior",     QuestID = "IceSideQuest",     Index = 2,  NpcPos = CFrame.new(-6062, 16, -4904),  MobPos = CFrame.new(-6300, 60, -5600) },
    { Level = 1300, Mob = "Magma Ninja",        QuestID = "FireSideQuest",    Index = 1,  NpcPos = CFrame.new(-5428, 16, -5290),  MobPos = CFrame.new(-5300, 80, -5900) },
    { Level = 1350, Mob = "Lava Pirate",        QuestID = "FireSideQuest",    Index = 2,  NpcPos = CFrame.new(-5428, 16, -5290),  MobPos = CFrame.new(-5100, 60, -4700) },
    { Level = 1400, Mob = "Ship Deckhand",      QuestID = "ShipQuest1",       Index = 1,  NpcPos = CFrame.new(1038, 125, 32915), MobPos = CFrame.new(1200, 140, 33000) },
    { Level = 1425, Mob = "Ship Engineer",      QuestID = "ShipQuest1",       Index = 2,  NpcPos = CFrame.new(1038, 125, 32915), MobPos = CFrame.new(900, 135, 32700) },
    { Level = 1450, Mob = "Ship Steward",       QuestID = "ShipQuest2",       Index = 1,  NpcPos = CFrame.new(969, 125, 33423),  MobPos = CFrame.new(1100, 130, 33500) },
    { Level = 1475, Mob = "Ship Officer",       QuestID = "ShipQuest2",       Index = 2,  NpcPos = CFrame.new(969, 125, 33423),  MobPos = CFrame.new(850, 130, 33300) },

    -- [ SEA 3: LEVEL 1500 - 2550+ (MAX) ]
    { Level = 1500, Mob = "Pirate Millionaire", QuestID = "PortQuest",        Index = 1,  NpcPos = CFrame.new(-290, 43, 5581),   MobPos = CFrame.new(-350, 70, 5800) },
    { Level = 1525, Mob = "Pistol Billionaire", QuestID = "PortQuest",        Index = 2,  NpcPos = CFrame.new(-290, 43, 5581),   MobPos = CFrame.new(-450, 80, 6000) },
    { Level = 1575, Mob = "Dragon Crew Warrior",QuestID = "HydraQuest1",      Index = 1,  NpcPos = CFrame.new(5203, 104, 10471), MobPos = CFrame.new(5400, 120, 10300) },
    { Level = 1600, Mob = "Dragon Crew Archer", QuestID = "HydraQuest1",      Index = 2,  NpcPos = CFrame.new(5203, 104, 10471), MobPos = CFrame.new(5600, 130, 10550) },
    { Level = 1625, Mob = "Female Islander",    QuestID = "HydraQuest2",      Index = 1,  NpcPos = CFrame.new(5734, 610, -300),  MobPos = CFrame.new(5850, 620, -150) },
    { Level = 1650, Mob = "Giant Islander",     QuestID = "HydraQuest2",      Index = 2,  NpcPos = CFrame.new(5734, 610, -300),  MobPos = CFrame.new(5500, 630, -500) },
    { Level = 1700, Mob = "Marine Commodore",   QuestID = "ResortQuest",      Index = 1,  NpcPos = CFrame.new(2401, 14, -32),    MobPos = CFrame.new(2200, 30, -100) },
    { Level = 1750, Mob = "Marine Rear Admiral",QuestID = "ResortQuest",      Index = 2,  NpcPos = CFrame.new(2401, 14, -32),    MobPos = CFrame.new(2600, 40, -200) },
    { Level = 1800, Mob = "Fishman Raider",     QuestID = "MuIslandQuest",    Index = 1,  NpcPos = CFrame.new(-10581, 331, -8760),MobPos = CFrame.new(-10800, 340, -8500) },
    { Level = 1850, Mob = "Water Fighter",      QuestID = "MuIslandQuest",    Index = 2,  NpcPos = CFrame.new(-10581, 331, -8760),MobPos = CFrame.new(-10300, 350, -8900) },
    { Level = 1900, Mob = "Pirate Recruiter",   QuestID = "CandyQuest1",      Index = 1,  NpcPos = CFrame.new(-1147, 12, -14450),MobPos = CFrame.new(-1200, 20, -14200) },
    { Level = 1950, Mob = "Confection Pirate",  QuestID = "CandyQuest1",      Index = 2,  NpcPos = CFrame.new(-1147, 12, -14450),MobPos = CFrame.new(-950, 30, -14700) },
    { Level = 2000, Mob = "Candy Staff",        QuestID = "CandyQuest2",      Index = 1,  NpcPos = CFrame.new(-655, 14, -15248), MobPos = CFrame.new(-800, 30, -15400) },
    { Level = 2050, Mob = "Candy Pirate",       QuestID = "CandyQuest2",      Index = 2,  NpcPos = CFrame.new(-655, 14, -15248), MobPos = CFrame.new(-500, 30, -15000) },
    { Level = 2075, Mob = "Cocoa Warrior",      QuestID = "CocoaQuest1",      Index = 1,  NpcPos = CFrame.new(233, 21, -12180),  MobPos = CFrame.new(150, 40, -12000) },
    { Level = 2100, Mob = "Chocolate Bar Battler",QuestID = "CocoaQuest1",    Index = 2,  NpcPos = CFrame.new(233, 21, -12180),  MobPos = CFrame.new(350, 45, -12300) },
    { Level = 2150, Mob = "Sweet Thief",        QuestID = "CandyQuest3",      Index = 1,  NpcPos = CFrame.new(160, 30, -14380),  MobPos = CFrame.new(50, 40, -14200) },
    { Level = 2200, Mob = "Candy Rebel",        QuestID = "CandyQuest3",      Index = 2,  NpcPos = CFrame.new(160, 30, -14380),  MobPos = CFrame.new(250, 40, -14600) },
    { Level = 2250, Mob = "Baker Chef",         QuestID = "CakeQuest1",       Index = 1,  NpcPos = CFrame.new(-1905, 38, -11867),MobPos = CFrame.new(-2100, 50, -12100) },
    { Level = 2300, Mob = "Cake Guard",         QuestID = "CakeQuest1",       Index = 2,  NpcPos = CFrame.new(-1905, 38, -11867),MobPos = CFrame.new(-1700, 50, -11600) },
    { Level = 2350, Mob = "Baking Staff",       QuestID = "CakeQuest2",       Index = 1,  NpcPos = CFrame.new(-1905, 38, -11867),MobPos = CFrame.new(-1400, 50, -12300) },
    { Level = 2400, Mob = "Head Baker",         QuestID = "CakeQuest2",       Index = 2,  NpcPos = CFrame.new(-1905, 38, -11867),MobPos = CFrame.new(-1200, 50, -12000) },
    { Level = 2450, Mob = "Isle Outlaw",        QuestID = "TikiQuest1",       Index = 1,  NpcPos = CFrame.new(-16500, 15, 1050), MobPos = CFrame.new(-16700, 30, 1200) },
    { Level = 2500, Mob = "Island Boy",         QuestID = "TikiQuest1",       Index = 2,  NpcPos = CFrame.new(-16500, 15, 1050), MobPos = CFrame.new(-16300, 30, 900) },
}

-- =====================================================================
-- SECTION 3: ENGINE & AUTO SEA TRANSITION ROUTINES
-- =====================================================================
local function GetCurrentPlayerLevel()
    local success, lvl = pcall(function()
        return LocalPlayer.Data.Level.Value
    end)
    return success and lvl or 1
end

-- ระบบตรวจสอบและทำเควสข้ามโลกอัตโนมัติ (Sea 1 -> Sea 2 เมื่อเลเวล 700 / Sea 2 -> Sea 3 เมื่อเลเวล 1500)
local function CheckAndPerformSeaTransition(lvl)
    if not UltimateConfig.AutoSeaTransition then return end
    
    pcall(function()
        if lvl >= 700 and game.PlaceId == 2753915549 then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(-3879, 14, -1950)
                task.wait(0.5)
                ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa")
            end
        elseif lvl >= 1500 and game.PlaceId == 4442272183 then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(-601, 16, 2853)
                task.wait(0.5)
                ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
            end
        end
    end)
end

local function GetBestQuestData()
    local userLvl = GetCurrentPlayerLevel()
    CheckAndPerformSeaTransition(userLvl)
    
    local selectedQ = UltimateQuestRegistry[1]
    for _, quest in ipairs(UltimateQuestRegistry) do
        if userLvl >= quest.Level then
            selectedQ = quest
        end
    end
    return selectedQ
end

local function VerifyAndFetchQuest(qData)
    pcall(function()
        local mainGui = LocalPlayer.PlayerGui:FindFirstChild("Main")
        local questContainer = mainGui and mainGui:FindFirstChild("Quest")
        if not questContainer or not questContainer.Visible then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = qData.NpcPos
                task.wait(0.35)
                ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", qData.QuestID, qData.Index)
            end
        end
    end)
end

local function ExecuteCombat(weaponChoice)
    pcall(function()
        local char = LocalPlayer.Character
        if not char then return end
        
        local activeTool = char:FindFirstChildOfClass("Tool")
        if not activeTool and LocalPlayer.Backpack then
            for _, item in pairs(LocalPlayer.Backpack:GetChildren()) do
                if item:IsA("Tool") and item.ToolTip == weaponChoice then
                    char.Humanoid:EquipTool(item)
                    break
                end
            end
        end
        
        local currentTool = char:FindFirstChildOfClass("Tool")
        if currentTool then
            currentTool:Activate()
            
            if UltimateConfig.FastAttack then
                task.spawn(function()
                    pcall(function()
                        VirtualUser:Button1Down(Vector2.new(0,0), Camera.CFrame)
                        VirtualUser:Button1Up(Vector2.new(0,0), Camera.CFrame)
                    end)
                end)
            end
            
            if UltimateConfig.AutoSkillZ then
                local keys = {Enum.KeyCode.Z, Enum.KeyCode.X, Enum.KeyCode.C, Enum.KeyCode.V}
                for _, keycode in ipairs(keys) do
                    VirtualInputManager:SendKeyEvent(true, keycode, false, game)
                    task.wait(0.01)
                    VirtualInputManager:SendKeyEvent(false, keycode, false, game)
                end
            end
        end
    end)
end

-- =====================================================================
-- SECTION 4: USER INTERFACE (UI) CREATION
-- =====================================================================
local Tab_Main = UltimateWindow:CreateTab("⚡ ระบบฟาร์มเวลตันออโต้", "swords")
local Tab_Sea  = UltimateWindow:CreateTab("🌊 ระบบข้ามโลกออโต้", "globe")

-- --- [ Tab 1: ฟาร์มเวลตัน ] ---
Tab_Main:CreateDropdown({
    Name = "⚔️ เลือกอาวุธสำหรับฟาร์มยาวถึงตัน",
    Options = {"Sword", "Blox Fruit", "Melee", "Gun"},
    CurrentOption = "Sword",
    Callback = function(Option)
        UltimateConfig.SelectedWeapon = Option[1]
    end,
})

Tab_Main:CreateToggle({
    Name = "⚡ Infinite Max Level Auto Farm (รับเควส + วาร์ปตีมอนออโต้จนเวลตัน)",
    CurrentValue = false,
    Callback = function(Value)
        UltimateConfig.AutoFarmLevel = Value
        task.spawn(function()
            while UltimateConfig.AutoFarmLevel do
                task.wait(0.1)
                pcall(function()
                    local char = LocalPlayer.Character
                    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
                    
                    local hrp = char.HumanoidRootPart
                    local currentQuest = GetBestQuestData()
                    
                    VerifyAndFetchQuest(currentQuest)
                    
                    local enemiesFolder = Workspace:FindFirstChild("Enemies")
                    local targetFound = false
                    
                    if enemiesFolder then
                        for _, enemy in pairs(enemiesFolder:GetChildren()) do
                            local eRoot = enemy:FindFirstChild("HumanoidRootPart")
                            local eHum = enemy:FindFirstChild("Humanoid")
                            
                            if eRoot and eHum and eHum.Health > 0 and enemy.Name == currentQuest.Mob and UltimateConfig.AutoFarmLevel then
                                targetFound = true
                                eRoot.CanCollide = false
                                
                                eRoot.CFrame = hrp.CFrame * CFrame.new(0, -8, 0)
                                hrp.CFrame = eRoot.CFrame * CFrame.new(0, 10, 0)
                                hrp.Velocity = Vector3.new(0, 0, 0)
                                
                                ExecuteCombat(UltimateConfig.SelectedWeapon)
                                break
                            end
                        end
                    end
                    
                    if not targetFound and currentQuest then
                        hrp.CFrame = currentQuest.MobPos * CFrame.new(0, 15, 0)
                    end
                end)
            end
        end)
    end,
})

-- --- [ Tab 2: ข้ามโลกอัตโนมัติ ] ---
Tab_Sea:CreateToggle({
    Name = "🌍 Auto Sea Transition (เวล 700 ไปโลก 2 / เวล 1500 ไปโลก 3 ออโต้)",
    CurrentValue = true,
    Callback = function(Value)
        UltimateConfig.AutoSeaTransition = Value
    end,
})

Tab_Sea:CreateButton({
    Name = "🚀 วาร์ปไปโลกที่ 2 ทันที (Sea 2)",
    Callback = function()
        pcall(function() TeleportService:Teleport(4442272183, LocalPlayer) end)
    end,
})

Tab_Sea:CreateButton({
    Name = "⚡ วาร์ปไปโลกที่ 3 ทันที (Sea 3)",
    Callback = function()
        pcall(function() TeleportService:Teleport(7449423635, LocalPlayer) end)
    end,
})

Rayfield:LoadConfiguration()
