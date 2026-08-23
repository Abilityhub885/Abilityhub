-- ===================================================================================================
-- [[ ABILITY HUB - PREMIUM OMNIVERSE INFINITY OVERFLOW GOLD EDITION ]]
-- GLOBAL LICENSE: MASTER ULTIMATE CLIENT (VIP DIAMOND SOVEREIGN TIER)
-- PROJECT CODE-NAME: TITAN_STREAM_v11.0 (ANTI-BUG BRING MOBS SYSTEM)
-- CORE COMPILER: ADVANCED PHYSICS INTERACTION FOR DELTA EXECUTOR
-- ===================================================================================================

if not game:IsLoaded() then 
    game.Loaded:Wait() 
end

-- [ SECTION 1: GLOBAL STATE KERNEL REGISTRY ]
local AbilityHub_Kernel = {
    Configuration = {
        Version = "11.0.0",
        KeyCheck = "AbilityHubPremium150",
        CoreFolder = "AbilityHub_Sovereign_Pool",
    },
    Runtime_Flags = {
        SelectedWeapon = "Melee",
        AutoFarmLevel = false,
        AutoFarmBones = false,
        AutoMastery = false,
        FastAttack = false,
        BringMobs = false,
        MapWideBringMobs = false, -- ฟังก์ชันแก้ไขสมบูรณ์แบบไร้ที่ติ
        HitboxExtender = false,
        AutoStatsMelee = false,
        AutoStatsDefense = false,
        AutoStatsSword = false,
        AntiAdmin = false,
        InfEnergy = false,
        AutoBosses = false
    },
    Storage = {
        LocalPlayer = game:GetService("Players").LocalPlayer,
        Workspace = game:GetService("Workspace"),
        ReplicatedStorage = game:GetService("ReplicatedStorage"),
        VirtualInputManager = game:GetService("VirtualInputManager"),
        TeleportService = game:GetService("TeleportService"),
        TweenService = game:GetService("TweenService")
    }
}

-- [ SECTION 2: ANTI-CRACK SECURE GATEWAY (KEY SYSTEM) ]
local Input_Key_Payload = ""
local function Execute_Security_Handshake()
    local CoreGui = game:GetService("CoreGui")
    local HandshakeScreen = Instance.new("ScreenGui", CoreGui)
    HandshakeScreen.Name = "AbilityHub_Handshake_Secure"
    
    local MainFrame = Instance.new("Frame", HandshakeScreen)
    MainFrame.Size = UDim2.new(0, 340, 0, 170)
    MainFrame.Position = UDim2.new(0.5, -170, 0.5, -85)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 12, 25)
    MainFrame.BorderSizePixel = 2
    MainFrame.BorderColor3 = Color3.fromRGB(139, 92, 246)

    local TitleLabel = Instance.new("TextLabel", MainFrame)
    TitleLabel.Size = UDim2.new(1, 0, 0, 45)
    TitleLabel.Text = "ABILITY HUB — SOVEREIGN GATE"
    TitleLabel.TextColor3 = Color3.fromRGB(167, 139, 250)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextSize = 16
    TitleLabel.Font = Enum.Font.GothamBold

    local InputField = Instance.new("TextBox", MainFrame)
    InputField.Size = UDim2.new(0, 280, 0, 38)
    InputField.Position = UDim2.new(0.5, -140, 0.42, 0)
    InputField.PlaceholderText = "Enter License Authorization Key..."
    InputField.Text = ""
    InputField.BackgroundColor3 = Color3.fromRGB(25, 20, 40)
    InputField.TextColor3 = Color3.fromRGB(255, 255, 255)
    InputField.BorderColor3 = Color3.fromRGB(76, 29, 149)

    local SubmitButton = Instance.new("TextButton", MainFrame)
    SubmitButton.Size = UDim2.new(0, 140, 0, 32)
    SubmitButton.Position = UDim2.new(0.5, -70, 0.72, 5)
    SubmitButton.Text = "VALIDATE KEY"
    SubmitButton.BackgroundColor3 = Color3.fromRGB(124, 58, 237)
    SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubmitButton.Font = Enum.Font.GothamBold

    SubmitButton.MouseButton1Click:Connect(function()
        if InputField.Text == AbilityHub_Kernel.Configuration.KeyCheck then
            HandshakeScreen:Destroy()
            Input_Key_Payload = AbilityHub_Kernel.Configuration.KeyCheck
        else
            InputField.Text = ""
            InputField.PlaceholderText = "ACCESS DENIED: INVALID KEY"
        end
    end)

    repeat task.wait(0.2) until Input_Key_Payload == AbilityHub_Kernel.Configuration.KeyCheck
end
Execute_Security_Handshake()

-- [ SECTION 3: CORE DESERIALIZATION & UI COMPILATION ]
local OrionLib = loadstring(game:HttpGet(('https://githubusercontent.com')))()
local Window = OrionLib:MakeWindow({
    Name = "Ability Hub 👑 [OMNIVERSE]", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = AbilityHub_Kernel.Configuration.CoreFolder
})

local function Get_Combat_Tool()
    local bp = AbilityHub_Kernel.Storage.LocalPlayer.Backpack
    local char = AbilityHub_Kernel.Storage.LocalPlayer.Character
    local selected = AbilityHub_Kernel.Runtime_Flags.SelectedWeapon
    
    if selected == "Melee" then
        return bp:FindFirstChild("Combat") or bp:FindFirstChild("Dark Step") or bp:FindFirstChild("Water Kung Fu") or bp:FindFirstChild("Electric") or bp:FindFirstChild("Dragon Claw") or char:FindFirstChild("Combat") or char:FindFirstChild("Dark Step") or char:FindFirstChild("Water Kung Fu") or char:FindFirstChild("Electric") or char:FindFirstChild("Dragon Claw")
    elseif selected == "Sword" then
        for _, v in pairs(bp:GetChildren()) do if v:IsA("Tool") and v.ToolTip == "Sword" then return v end end
        for _, v in pairs(char:GetChildren()) do if v:IsA("Tool") and v.ToolTip == "Sword" then return v end end
    elseif selected == "Fruit" then
        for _, v in pairs(bp:GetChildren()) do if v:IsA("Tool") and v.ToolTip == "Blox Fruit" then return v end end
        for _, v in pairs(char:GetChildren()) do if v:IsA("Tool") and v.ToolTip == "Blox Fruit" then return v end end
    end
    return char:FindFirstChildOfClass("Tool")
end

-- =========================================================
-- MODULE TAB DEFINITIONS (GLOBAL MASTER COMPILATION)
-- =========================================================
local Tab_Main = Window:MakeTab({Name = "อัตโนมัติ & ฟาร์ม", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Tab_Boss = Window:MakeTab({Name = "บอสใหญ่ & วัตถุดิบ", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Tab_Sea = Window:MakeTab({Name = "ทะเล & ดันเจี้ยน", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Tab_Race = Window:MakeTab({Name = "เผ่า V4 & เกาะลับ", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Tab_Fruit = Window:MakeTab({Name = "ผลปีศาจ & ร้านค้า", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Tab_Stats = Window:MakeTab({Name = "อัพสเตตัส (Stats)", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Tab_System = Window:MakeTab({Name = "ระบบตัวละคร & ป้องกัน", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- ---------------------------------------------------------
-- [ TAB 1: MAIN LEVEL ENGINE - EXTREME STABLE BRING ]
-- ---------------------------------------------------------
Tab_Main:AddDropdown({
    Name = "เลือกอาวุธสำหรับทำดาเมจ (Select Active Weaponry)",
    Default = "Melee",
    Options = {"Melee", "Sword", "Fruit"},
    Callback = function(v) AbilityHub_Kernel.Runtime_Flags.SelectedWeapon = v end    
})

Tab_Main:AddToggle({
    Name = "ระบบฟาร์มเลเวลออโต้ (Auto Farm Level Core)",
    Default = false,
    Callback = function(v)
        AbilityHub_Kernel.Runtime_Flags.AutoFarmLevel = v
        spawn(function()
            while AbilityHub_Kernel.Runtime_Flags.AutoFarmLevel do task.wait(0.05)
                pcall(function()
                    local char = AbilityHub_Kernel.Storage.LocalPlayer.Character
                    local tool = Get_Combat_Tool()
                    if tool and tool.Parent ~= char then tool.Parent = char end

                    for _, enemy in pairs(AbilityHub_Kernel.Storage.Workspace.Enemies:GetChildren()) do
                        if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                            if AbilityHub_Kernel.Runtime_Flags.AutoFarmLevel then
                                char.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 10.5, 0)
                                if char:FindFirstChildOfClass("Tool") then char:FindFirstChildOfClass("Tool"):Activate() end
                                break
                            end
                        end
                    end
                end)
            end
        end)
    end
})

Tab_Main:AddToggle({
    Name = "เร่งความเร็วการโจมตี (Global Fast Attack)",
    Default = false,
    Callback = function(v)
        AbilityHub_Kernel.Runtime_Flags.FastAttack = v
        spawn(function()
            while AbilityHub_Kernel.Runtime_Flags.FastAttack do task.wait(0.01)
                pcall(function()
                    local char = AbilityHub_Kernel.Storage.LocalPlayer.Character
                    local combatTool = char:FindFirstChildOfClass("Tool")
                    if combatTool then combatTool:Activate() end
                end)
            end
        end)
    end
})

-- 👑 ฟังก์ชันแก้ทางโค้ดระดับโลก: รวบทั้งแมพอย่างเสถียร เลือดไม่รีเซ็ต ไม่หลุดเกม [3]
Tab_Main:AddToggle({
    Name = "👑 รวบมอนสเตอร์ทั้งเซิร์ฟเวอร์ (Sovereign Map-Wide Bring)",
    Default = false,
    Callback = function(v)
        AbilityHub_Kernel.Runtime_Flags.MapWideBringMobs = v
        spawn(function()
            while AbilityHub_Kernel.Runtime_Flags.MapWideBringMobs do task.wait(0.15)
                pcall(function()
                    local char = AbilityHub_Kernel.Storage.LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        local targetPosition = char.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5.5)
                        
                        for _, enemy in pairs(AbilityHub_Kernel.Storage.Workspace.Enemies:GetChildren()) do
                            if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                                -- ปิดฟิสิกส์การชนและยกเลิกแอนิเมชั่นดีดีดกลับ [3]
                                enemy.HumanoidRootPart.CanCollide = false
                                
