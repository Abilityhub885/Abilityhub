-- =====================================================================
-- [[ ABILITY HUB - VOLLEYBALL LEGENDS (GOD-TIER EDITION) ]]
-- Build Version: 8.5.0 (Advanced Packet Spoofing & Secure Engine)
-- Target: Volleyball Legends
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
local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService          = game:GetService("RunService")

local LocalPlayer         = Players.LocalPlayer
local Camera              = Workspace.CurrentCamera

-- โหลด UI แบบเบาสบายเครื่อง (Rayfield Minimal)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local MainWindow = Rayfield:CreateWindow({
    Name = "⚡ Ability Hub - Volleyball Legends",
    LoadingTitle = "กำลังโหลดระบบรีโมทขั้นสูงและเกราะพรางตัว...",
    LoadingSubtitle = "by Ability Hub - God Tier Edition",
    ConfigurationSaving = { Enabled = true, FolderName = "AbilityHubVL", FileName = "Config" },
    KeySystem = false,
})

-- =====================================================================
-- CONFIGURATION & BYPASS SETTINGS
-- =====================================================================
local Config = {
    AutoStyleSpin   = false,
    AutoAbilitySpin = false,
    SpamClaim       = false,
    BypassRankSpoof = false,
    HumanizeDelay   = true,
    AntiAFK         = true,
}

-- ระบบสุ่มดีเลย์หน่วงเวลาตบตา Anti-Cheat
local function SafeWait(min, max)
    if Config.HumanizeDelay then
        task.wait(math.random(min * 100, max * 100) / 100)
    else
        task.wait(min)
    end
end

-- ระบบค้นหา Remote อัตโนมัติ (รองรับการเปลี่ยนชื่อโครงสร้างแมพ)
local function GetTargetRemote(keyword)
    local folders = {ReplicatedStorage, ReplicatedStorage:FindFirstChild("Packages"), ReplicatedStorage:FindFirstChild("Remotes"), ReplicatedStorage:FindFirstChild("Network")}
    for _, folder in pairs(folders) do
        if folder then
            for _, remote in pairs(folder:GetDescendants()) do
                if remote:IsA("RemoteEvent") and remote.Name:lower():find(keyword:lower()) then
                    return remote
                end
            end
        end
    end
    return nil
end

-- =====================================================================
-- TABS SETUP
-- =====================================================================
local Tab_GodMode = MainWindow:CreateTab("⚡ ระบบรีโมทเทพ (God Mode)", "zap")
local Tab_Spin    = MainWindow:CreateTab("🎰 ออโต้สปิน (เซฟ)", "repeat")
local Tab_Safety  = MainWindow:CreateTab("🛡️ เกราะพรางตัว & ป้องกัน", "shield")

-- --- [ Tab 1: ระบบรีโมทเทพ & จำลองยศ ] ---
Tab_GodMode:CreateToggle({
    Name = "🚀 เปิด/ปิด จำลองแพ็กเก็ตยศ Bronze II (Rank Spoof)",
    CurrentValue = false,
    Callback = function(Value)
        Config.BypassRankSpoof = Value
        task.spawn(function()
            while Config.BypassRankSpoof do
                SafeWait(3, 5)
                pcall(function()
                    local remote = GetTargetRemote("rank") or GetTargetRemote("reward") or GetTargetRemote("claim")
                    if remote then
                        remote:FireServer("BronzeII", true, 999)
                    end
                end)
            end
        end)
    end,
})

Tab_GodMode:CreateToggle({
    Name = "🔥 โหมดปั๊มรับของรางวัลซ้ำรัวๆ (Packet Spam Claim)",
    CurrentValue = false,
    Callback = function(Value)
        Config.SpamClaim = Value
        task.spawn(function()
            while Config.SpamClaim do
                SafeWait(0.2, 0.4)
                pcall(function()
                    local remote = GetTargetRemote("claim") or GetTargetRemote("reward")
                    if remote then
                        remote:FireServer()
                    else
                        for _, ui in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
                            if ui:IsA("TextButton") and (ui.Text:lower():find("claim") or ui.Text:lower():find("reward")) then
                                local pos = ui.AbsolutePosition
                                local size = ui.AbsoluteSize
                                VirtualInputManager:SendMouseButtonEvent(pos.X + size.X/2, pos.Y + size.Y/2, 0, true, game, 0)
                                task.wait(0.02)
                                VirtualInputManager:SendMouseButtonEvent(pos.X + size.X/2, pos.Y + size.Y/2, 0, false, game, 0)
                            end
                        end
                    end
                end)
            end
        end)
    end,
})

-- --- [ Tab 2: ออโต้สปินขั้นสูง ] ---
Tab_Spin:CreateToggle({
    Name = "✨ ออโต้สปินสไตล์ (Style Spin)",
    CurrentValue = false,
    Callback = function(Value)
        Config.AutoStyleSpin = Value
        task.spawn(function()
            while Config.AutoStyleSpin do
                SafeWait(1.0, 1.6)
                pcall(function()
                    local remote = GetTargetRemote("style") or GetTargetRemote("spin")
                    if remote then
                        remote:FireServer("Style")
                    else
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                        task.wait(0.04)
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
                    end
                end)
            end
        end)
    end,
})

Tab_Spin:CreateToggle({
    Name = "🔮 ออโต้สปินความสามารถ (Ability Spin)",
    CurrentValue = false,
    Callback = function(Value)
        Config.AutoAbilitySpin = Value
        task.spawn(function()
            while Config.AutoAbilitySpin do
                SafeWait(1.0, 1.6)
                pcall(function()
                    local remote = GetTargetRemote("ability") or GetTargetRemote("spin")
                    if remote then
                        remote:FireServer("Ability")
                    else
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                        task.wait(0.04)
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
                    end
                end)
            end
        end)
    end,
})

-- --- [ Tab 3: เกราะพรางตัว & ความปลอดภัย ] ---
Tab_Safety:CreateToggle({
    Name = "🛡️ เปิดโหมดพรางตัวเลียนแบบมนุษย์ (Humanize Delay)",
    CurrentValue = true,
    Callback = function(Value)
        Config.HumanizeDelay = Value
    end,
})

Tab_Safety:CreateToggle({
    Name = "🛡️ เปิดระบบกันหลุด AFK ข้ามคืน",
    CurrentValue = true,
    Callback = function(Value)
        Config.AntiAFK = Value
        if Value then
            local vu = game:GetService("VirtualUser")
            LocalPlayer.Idled:Connect(function()
                if Config.AntiAFK then
                    vu:Button2Down(Vector2.new(0,0), Camera.CFrame)
                    task.wait(1)
                    vu:Button2Up(Vector2.new(0,0), Camera.CFrame)
                end
            end)
        end
    end,
})

Rayfield:LoadConfiguration()
