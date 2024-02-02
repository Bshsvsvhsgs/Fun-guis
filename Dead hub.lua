local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()

local Window = Library.CreateLib("Dead hub", "LightTheme")

local Fe = Window:NewTab("Fe")

local FeSection = Fe:NewSection("Fe")



FeSection:NewButton("Ghost hub  ", "Очень мощный хаб, но многие скрипты старые и gui немного уродливое", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
end)






FeSection:NewButton("Universal admins", "универсальные админки. Скрипт от мухомора", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bshsvsvhsgs/Admin-hub/main/admin%20hubbb.txt"))()
end)

FeSection:NewButton("Pendulum hub", "очень много всяких анимаций которые возможно не работают", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))()
end)
FeSection:NewButton("Nullware hub", "  лучший хаб для реанимаций", function()
    getgenv().Theme = "Blue" -- To change the UI Theme, set this to one of the following options: "Red", "Purple", "Blue", "Green", "Yellow"
loadstring(game:HttpGet("https://gist.githubusercontent.com/M6HqVBcddw2qaN4s/2d722888a388017c18028cd434c43a25/raw/dcccf1027fe4b90780e47767aaf584389c9d7771/EULma3fU90PUOKUn?identifier=".. (function()local a=""for b=1,256 do local c=math.random(1,3)a=a..string.char(c==1 and math.random(48,57)or c==2 and math.random(97,122)or c==3 and math.random(65,90))end;return a end)()))()
end)

FeSection:NewButton("читатель координат","Делай ТП скрипты проще! Скрипт от мухомора", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Bshsvsvhsgs/Fun-guis/main/coordenate%20reader%20v%203.1.txt"))()
end)

FeSection:NewButton("менеджер игроков","позволяет следить за данными игроков. Скрипт от мухомора", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Bshsvsvhsgs/Fun-guis/main/player%20manager%20v1%20fixed.txt"))()
end)

FeSection:NewButton("fake tools", "хз что сюда писать", function()
    loadstring(game:HttpGet(('https://pastefy.app/VYIAk3o1/raw'),true))()
end)

FeSection:NewButton("fling gui", "очень мощно", function()
    loadstring(game:HttpGet("https://paste.ee/r/NTtmf" , true))()
end)

FeSection:NewButton("touch fling gui", "очень очень мощно", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()
end)


FeSection:NewButton("ignore touchinterests", "делает твоего персонажа бессмертным работает только в паркурах и обби", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/ignore-touchinterests/main/main",true))()
end)


--Дополнение

local Player = Window:NewTab("Player")

local PlayerSection = Player:NewSection("Player")

PlayerSection:NewSlider("Walk Speed", "измени скорость ходьбы лол", 500, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)


PlayerSection:NewSlider("Jump Power", "измени силу прыжка и прыгай как ёбнутый", 500, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)


PlayerSection:NewSlider("Gravity", "измени гравитацию и стань Юрием Гагариным", 666, 0, function(s)
    game.Workspace.Gravity = s
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Toggle = false

PlayerSection:NewToggle("Noclip", "проходи сквозь стенки лол", function(state)
    Toggle = state
    if Toggle then   
        for _, child in ipairs(LocalPlayer.Character:GetDescendants()) do
            if child:IsA("BasePart") then
                child.CanCollide = false
            end
        end
    else
        print("Toggle Off")
        for _, child in ipairs(LocalPlayer.Character:GetDescendants()) do
            if child:IsA("BasePart") then
                child.CanCollide = true
            end
        end
    end
end)

PlayerSection:NewToggle("anti killbrick", "не даёт сдохнуть лол", function(state)
    if state then
        local player = game:GetService("Players").LocalPlayer
        local UIS = game:GetService("UserInputService")
        local myzaza = true
        local connection
        
        connection = UIS.InputBegan:Connect(function(input, GPE)
            if GPE then 
                return 
            end
            myzaza = not myzaza
            local parts = workspace:GetPartBoundsInRadius(player.Character.HumanoidRootPart.Position, 10)
            for _, part in ipairs(parts) do
                part.CanTouch = myzaza
            end
        end)
        
        game:BindToClose(function()
            connection:Disconnect()
        end)
    else
        local player = game:GetService("Players").LocalPlayer
        local parts = workspace:GetPartBoundsInRadius(player.Character.HumanoidRootPart.Position, 10)
        for _, part in ipairs(parts) do
            part.CanTouch = true
        end
    end
end)

PlayerSection:NewToggle("anti client kick", "даёт возможность не быть кикнутым локальным скриптом.", function(state)
    if state then
        -- Ваш существующий код для включения
        if not hookmetamethod then
            game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
                Text = "Твой эксплойт не поддерживает анти кик лол",
                Color = Color3.fromRGB(255, 0, 0),
                Font = Enum.Font.SourceSansBold,
                FontSize = Enum.FontSize.Size18
            })
            return
        end
        
        oldhmmi = hookmetamethod(game, "__index", function(self, method)
            if self == LocalPlayer and method:lower() == "kick" then
                game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
                    Text = "Expected ':' not '.' calling member function Kick",
                    Color = Color3.fromRGB(255, 0, 0),
                    Font = Enum.Font.SourceSansBold,
                    FontSize = Enum.FontSize.Size18
                })
                return
            end
            return oldhmmi(self, method)
        end)
        
        oldhmmnc = hookmetamethod(game, "__namecall", function(self, ...)
            if self == LocalPlayer and getnamecallmethod():lower() == "kick" then
                game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
                    Text = "Была воспроизведена попытка кика, но она заблокирована ЛоЛ",
                    Color = Color3.fromRGB(0, 255, 0),
                    Font = Enum.Font.SourceSansBold,
                    FontSize = Enum.FontSize.Size18
                })
                return
            end
            return oldhmmnc(self, ...)
        end)
        
        game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
            Text = "анти кик включён",
            Color = Color3.fromRGB(0, 255, 0),
            Font = Enum.Font.SourceSansBold,
            FontSize = Enum.FontSize.Size18
        })
    else
        
        if oldhmmi then
            hookmetamethod(game, "__index", oldhmmi)
            oldhmmi = nil
        end
        
        if oldhmmnc then
            hookmetamethod(game, "__namecall", oldhmmnc)
            oldhmmnc = nil
        end
        
        game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
            Text = "анти кик выключен",
            Color = Color3.fromRGB(0, 255, 0),
            Font = Enum.Font.SourceSansBold,
            FontSize = Enum.FontSize.Size18
        })
    end
end)

local hiddenfling = false
local detection = nil
local flingThread = nil

local function EnableWalkFling()
    hiddenfling = true
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
      Text = "Walkfling enabled";
      Color = Color3.fromRGB(0, 255, 0);
      Font = Enum.Font.SourceSans;
      FontSize = Enum.FontSize.Size18;
    })
  
    if game:GetService("ReplicatedStorage"):FindFirstChild("juisdfj0i32i0eidsuf0iok") then
        hiddenfling = true
    else
        hiddenfling = true
        detection = Instance.new("Decal")
        detection.Name = "juisdfj0i32i0eidsuf0iok"
        detection.Parent = game:GetService("ReplicatedStorage")
      
        local function fling()
            local hrp, c, vel, movel = nil, nil, nil, 0.1
            while hiddenfling do
                game:GetService("RunService").Heartbeat:Wait()
                local lp = game.Players.LocalPlayer
                while hiddenfling and not (c and c.Parent and hrp and hrp.Parent) do
                    game:GetService("RunService").Heartbeat:Wait()
                    c = lp.Character
                    hrp = c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
                end
                if hiddenfling then
                    vel = hrp.Velocity
                    hrp.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
                    game:GetService("RunService").RenderStepped:Wait()
                    if c and c.Parent and hrp and hrp.Parent then
                        hrp.Velocity = vel
                    end
                    game:GetService("RunService").Stepped:Wait()
                    if c and c.Parent and hrp and hrp.Parent then
                        hrp.Velocity = vel + Vector3.new(0, movel, 0)
                        movel = movel * -1
                    end
                end
            end
        end
      
        flingThread = coroutine.create(fling)
        coroutine.resume(flingThread)
    end
end

local function DisableWalkFling()
    hiddenfling = false
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
      Text = "Walkfling disabled";
      Color = Color3.fromRGB(255, 0, 0);
      Font = Enum.Font.SourceSans;
      FontSize = Enum.FontSize.Size18;
    })
    
    if flingThread then
        coroutine.yield(flingThread)
        flingThread = nil
    end    
end

PlayerSection:NewToggle("Walk Fling", "Самый лучший флинг лол.", function(state)
    if state then
        EnableWalkFling()
    else
        DisableWalkFling()
    end
end)
