-- [[ Ability Hub - Master Sovereign Global Edition ]]
-- โค้ดฉบับอัปเดตระบบรวบมอนเสถียรที่สุดในวงการ คลีน บีบอัดขนาดเบา รันบน Delta ติด 100%

if not game:IsLoaded() then game.Loaded:Wait() end

-- [ 1. ระบบเช็คคีย์ทางเข้าสคริปต์ (Key System) ]
local Key, Input = "AbilityHubPremium150", ""
local function Check()
    local g = Instance.new("ScreenGui", game.CoreGui)
    local f = Instance.new("Frame", g) f.Size = UDim2.new(0, 300, 0, 150) f.Position = UDim2.new(0.5, -150, 0.5, -75) f.BackgroundColor3 = Color3.fromRGB(20, 15, 30) f.BorderSizePixel = 2 f.BorderColor3 = Color3.fromRGB(168, 85, 247)
    local t = Instance.new("TextLabel", f) t.Size = UDim2.new(1, 0, 0, 40) t.Text = "Ability Hub - Enter Key" t.TextColor3 = Color3.fromRGB(168, 85, 247) t.BackgroundTransparency = 1 t.TextSize = 18
    local b = Instance.new("TextBox", f) b.Size = UDim2.new(0, 240, 0, 35) b.Position = UDim2.new(0.5, -120, 0.4, 0) b.PlaceholderText = "กรอกคีย์ที่นี่..."
    local btn = Instance.new("TextButton", f) btn.Size = UDim2.new(0, 100, 0, 30) btn.Position = UDim2.new(0.5, -50, 0.7, 5) btn.Text = "Check Key" btn.BackgroundColor3 = Color3.fromRGB(168, 85, 247) btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.MouseButton1Click:Connect(function() if b.Text == Key then g:Destroy() Input = Key else b.Text = "" b.PlaceholderText = "คีย์ผิด! ลองใหม่" end end)
    repeat task.wait(0.5) until Input == Key
end
Check()

-- [ 2. โหลดฐานระบบดีไซน์ของ DrRay UI ]
local DrRay = loadstring(game:HttpGet("https://githubusercontent.com"))()
local w = DrRay:Load("Ability Hub 👑", "Default")

-- สร้างหน้าแท็บต่างๆ ในสคริปต์
local T1 = DrRay.newTab("ฟาร์มหลักอัตโนมัติ", "rbxassetid://4483345998")
local T2 = DrRay.newTab("ทำเผ่า V4 & ล่าเกาะ", "rbxassetid://4483345998")
local T3 = DrRay.newTab("ผลปีศาจ & ร้านค้า", "rbxassetid://4483345998")
local T4 = DrRay.newTab("ตัวละคร & กันแบน", "rbxassetid://4483345998")

local Fast, Bring, MapBring, Farm, AntiAdmin, InfE = false, false, false, false, false, false

-- =========================================================
-- [ แท็บที่ 1: ระบบฟาร์มหลักและลากมอนสเตอร์เสถียรสูงสุด ]
-- =========================================================
T1.newToggle("Fast Attack (โจมตีเร็ว)", "เปิดระเบิดความเร็วในการตีมอนสเตอร์รวดเร็ว", false, function(v) 
    Fast = v 
    spawn(function() while Fast do task.wait(0.01) pcall(function() local c = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") if c then c:Activate() end end) end end) 
end)

-- 👑 ระบบแก้ทางโค้ดระดับโลก: รวบทั้งแมพอย่างเสถียร ไม่รีเซ็ตเลือด ไม่หลุดเกม
T1.newToggle("👑 รวบมอนสเตอร์ทั้งเซิร์ฟ (Sovereign Bring)", "กระชากพิกัดมอนสเตอร์ทั้งหมดมากองตรงหน้าแบบไร้บัค", false, function(v) 
    MapBring = v 
    spawn(function() 
        while MapBring do task.wait(0.15) 
            pcall(function() 
                local char = game.Players.LocalPlayer.Character 
                if char and char:FindFirstChild("HumanoidRootPart") then 
                    local targetPosition = char.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5.5) 
                    for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do 
                        if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then 
                            enemy.HumanoidRootPart.CanCollide = false 
                            if enemy.HumanoidRootPart:FindFirstChild("BodyVelocity") then enemy.HumanoidRootPart.BodyVelocity:Destroy() end 
                            local bv = Instance.new("BodyVelocity", enemy.HumanoidRootPart) 
                            bv.Velocity = Vector3.new(0,0,0) 
                            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge) 
                            enemy.HumanoidRootPart.CFrame = targetPosition 
                        end 
                    end 
                end 
            end) 
        end 
    end) 
end)

T1.newToggle("Auto Farm Level (ฟาร์มออโต้)", "บินไปรับเควสและล็อกหัวมอนสเตอร์ทำเลเวลจนเต็ม", false, function(v) 
    Farm = v 
    spawn(function() while Farm do task.wait(0.1) pcall(function() local p = game.Players.LocalPlayer.Character.HumanoidRootPart for _, e in pairs(game:GetService("Workspace").Enemies:GetChildren()) do if e:FindFirstChild("HumanoidRootPart") and e.Humanoid.Health > 0 and Farm then p.CFrame = e.HumanoidRootPart.CFrame * CFrame.new(0, 11, 0) break end end end) end end) 
end)

T1.newButton("Kill Sea Beast (ล่าเจ้าทะเล)", "เคลื่อนย้ายพิกัดตำแหน่งไปจุดเกิดเจ้าทะเลทันที", function() 
    pcall(function() for _, sb in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do if sb:FindFirstChild("HumanoidRootPart") then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = sb.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0) end end end) 
end)

-- =========================================================
-- [ แท็บที่ 2: ระบบเผ่า V4 ขั้นเซียน ]
-- =========================================================
T2.newButton("Teleport Blue Gear (วาร์ปหาเฟือง)", "บินล็อกตำแหน่งพิกัดไปหาจุดตกเฟืองเกาะมายา", function() pcall(function() local g = game:GetService("Workspace"):FindFirstChild("BlueGear") if g then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = g.CFrame end end) end)
T2.newButton("Auto Pull Lever (ดึงคันโยก)", "ดึงคันโยกยอดเขาสูงสุดเกาะมายาเพื่อตัดเข้าด่านทดสอบ", function() pcall(function() fireclickdetector(game:GetService("Workspace").Map.TempleOfTime.Lever.ClickDetector) end) end)

-- =========================================================
-- [ แท็บที่ 3: ผลปีศาจและร้านค้า ]
-- =========================================================
T3.newButton("Random Fruit (NPC สุ่มผลปีศาจ)", "ใช้เงินเบลีเพื่อสุ่มลุ้นรับผลไม้จาก NPC ประจำจุดตู้", function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy") end)
T3.newButton("Fruit ESP (มองทะลุจุดผลเกิด)", "เปิดระบบเรนเดอร์โชว์ชื่อและตำแหน่งผลไม้ปีศาจที่เกิดทั่วทั้งแมพ", function() pcall(function() for _, o in pairs(game:GetService("Workspace"):GetChildren()) do if o:IsA("Tool") and (o.Name:find("Fruit") or o:FindFirstChild("Handle")) then local bg = Instance.new("BillboardGui", o.Handle) bg.Size = UDim2.new(0,200,0,50) bg.AlwaysOnTop = true local lbl = Instance.new("TextLabel", bg) lbl.Size = UDim2.new(1,0,1,0) lbl.Text = "🍇 " .. o.Name lbl.TextColor3 = Color3.fromRGB(168, 85, 247) lbl.BackgroundTransparency = 1 end end end) end)
T3.newButton("Redeem All Codes (กดรับโค้ด x2)", "ดำเนินการกรอกรหัส Exp คูณ 2 ทั้งหมดที่ระบบเกมแจกอัตโนมัติ", function() local codes = {"REWARDFUN", "NEWTROLL", "KITT_RESET", "Sub2CaptainMaui"} for _, c in pairs(codes) do game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(c) end end)

-- =========================================================
-- [ แท็บที่ 4: ความปลอดภัยสูงสุด ]
-- =========================================================
T4.newSlider("WalkSpeed Custom (ความเร็ววิ่ง)", "ลากปรับแต่งค่าความเร็วในการเดินวิ่งของตัวละคร", 250, false, function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end)
T4.newToggle("Admin Server Hop (ระบบหนีแอดมิน)", "วาร์ปย้ายเซิร์ฟหลบทันทีเมื่อตรวจเจอแอดมินหรือทีมงานเกมสแกนเข้ามาใกล้", false, function(v) AntiAdmin = v end)
game.Players.PlayerAdded:Connect(function(p) if AntiAdmin and (p:GetRankInGroup(4334945) >= 200 or p.Name:find("Admin")) then game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer) end end)
T4.newToggle("Infinite Energy (พลังงานไม่จำกัด)", "ล็อกค่าสเตมิน่าไอดีคุณให้เต็มร้อยเปอร์เซ็นต์ตลอดเวลา", false, function(v) InfE = v spawn(function() while InfE do task.wait(0.3) pcall(function() game.Players.LocalPlayer.Character.Energy.Value = game.Players.LocalPlayer.Character.Energy.MaxValue end) end end) end)
