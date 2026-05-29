



















local a = "v0.1.1 NameHub (jurassic-blocky-placeid-guard)"







do
    local b = { [11653088948] = true }   
    local c = game.PlaceId
    if not b[c] then
        local d = ("[NameHub Jurassic Blocky] Wrong game (PlaceId=%d). "
                  .. "Use the NameHub Universal Loader from the Discord panel."):format(c)
        warn(d)
        if type(StarterGui) ~= "userdata" then
            pcall(function()
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "NameHub", Text = "Wrong game for Jurassic Blocky script.", Duration = 8,
                })
            end)
        end
        error(d, 0)
    end
end







getgenv = getgenv or function() return _G end

local b = tostring(math.random(100000, 999999))  
                                                            




local c           = game:GetService("Players")
local d        = game:GetService("RunService")
local e  = game:GetService("UserInputService")
local f      = game:GetService("TweenService")
local g         = game:GetService("Workspace")
local h = game:GetService("ReplicatedStorage")
local i        = game:GetService("StarterGui")
local j       = game:GetService("VirtualUser")
local k       = game:GetService("HttpService")
local l           = game:GetService("CoreGui")
local m          = game:GetService("Lighting")
local n   = game:GetService("TeleportService")







do
    if type(_G.JurassicBlocky_Shutdown) == "function" then
        pcall(_G.JurassicBlocky_Shutdown)
    end
    _G.JurassicBlocky_Shutdown = nil

    local o= {}
    local p= _G
    if type(p.gethui) == "function" then
        local q, r = pcall(p.gethui); if q and r then table.insert(o, r) end
    end
    pcall(function() table.insert(o, l) end)
    local q = c.LocalPlayer
    if q then
        local r = q:FindFirstChildOfClass("PlayerGui")
        if r then table.insert(o, r) end
    end

    local r = { "JurassicBlocky", "NameHub_JB" }
local s=function(s)        
for t, u in ipairs(s:GetDescendants()) do
            if u:IsA("ScreenGui") then
                local v = u.Name or ""
                for w, x in ipairs(r) do
                    if v:sub(1, #x) == x then
                        pcall(function() u:Destroy() end)
                        break
                    end
                end
            end
        end
end    
for t = 1, 3 do
        for u, v in ipairs(o) do pcall(s, v) end
    end
end







local o = {
    
    DebugMode             = false,
    NotifyDuration        = 4,

    
    DefaultWalkSpeed      = 16,
    DefaultJumpPower      = 50,
    BoostedWalkSpeed      = 80,
    BoostedJumpPower      = 100,
    FlySpeed              = 50,
    TweenTeleportSeconds  = 0.8,

    
    AutoEatThreshold      = 35,
    AutoDrinkThreshold    = 35,
    AutoSleepThreshold    = 25,
    AutoBreathThreshold   = 40,
    SurvivalLoopInterval  = 1.0,
    HungerDelay           = 0,
    ThirstDelay           = 0,
    StopInfHungerAt       = 100,
    RespawnDelay          = 0,
    AutofarmSpawnDelay    = 10,

    
    AutoFarmRadius        = 1500,
    AutoFarmInterval      = 0.35,
    
    
    
    SafeFarmSpeed         = 250,
    SafeFarmSpeedMax      = 1000,
    SafeFarmHopCap        = 120,
    SafeFarmHopCapMax     = 300,
    SafeFarmInterHop      = 0.02,
    InstantFarmTP         = true,    
    InstantTPMaxJump      = 80,      
    InstantTPInterJump    = 0.05,
    InstantTPSettleTime   = 0.15,
    InstantTPPostDelay    = 0.10,
    InstantTPBurstMode    = false,
    InstantTPBurstStuds   = 50,

    
    
    
    TargetLandingYOffset  = 4,
    TargetLandingXOffset  = 0,
    TargetLandingZOffset  = 0,
    TargetLandingJitter   = 0,
    TargetMinDistance     = 0,
    TargetTargetPriority  = "Closest",   
    TargetSkipOccupied    = false,
    TargetOccupiedRadius  = 25,
    TargetMaxStuckHops    = 60,
    TargetPickupRetries   = 4,
    TargetPickupMethod    = "All",       
    TargetPostCollectStep = 5,
    TargetHoverClearance  = 4,

    
    FarmTarget            = "Berry",
    MinimumDay            = 0,

    
    CombatOffsetX         = 0,
    CombatOffsetY         = -3,
    CombatRange           = 40,
    MaxTargetHP           = 0,
    MinTargetHP           = 0,
    DisengageAtHP         = 25,

    
    DefaultFOV            = 70,
    FreecamSpeed          = 10,
    LocalPlayerTransparency = 0,
    PlayerTransparency    = 0,

    
    TweenSpeed            = 40,
    TeleportLocations     = {} ,

    
    HopOnPlayerCount      = 0,

    
    PriceLimit            = 100000,
    MissionClaimDelay     = 0,
    AdminKickOnDetection  = true,
    AntiAFKEnabled        = true,

    
    WebhookLink           = "",
    DiscordWebhook        = "",
    WebhookIntervalMin    = 10,
    EmbedColor            = Color3.fromRGB(85, 200, 110),

    
    
    
    Remotes = {
        Eat       = "Eat",
        Drink     = "Drink",
        Sleep     = "Sleep",
        Quest     = "ClaimQuest",
        Attack    = "Attack",
        Heal      = "Heal",
        Respawn   = "Respawn",
        SpawnDino = "Spawn",
        BuyDino   = "Buy",
        Pickup    = "Pickup",
    },

    
    GUIName               = "JurassicBlocky",
    GUIToggleKey          = "RightControl",
    GUIAccentColor        = Color3.fromRGB(85, 200, 110),    
    GUIBackgroundColor    = Color3.fromRGB(22, 26, 24),
    ShowCustomCursor      = true,
    NotifySide            = "Right",

    
    Keybinds = {
        InfHunger        = "Eight",
        InfThirst        = "Nine",
        InfOxygen        = "Zero",
        AddHunger        = "Four",
        AddThirst        = "B",
        EnableSpeed      = "Six",
        EnableJumppower  = "Seven",
        InfiniteJump     = "Y",
        Noclip           = "N",
        Fly              = "F",
        Teleport         = "L",
        ToggleAANP       = "V",
        Suicide          = "Delete",
    },
}




local p = {
    
    AutoFarm              = false,
    AutoCollectAll        = false,
    AutoFindBerries       = false,
    ResourceESP           = false,

    
    AutoEat         = false,
    AutoDrink       = false,
    AutoSleep       = false,
    AutoBreath      = false,
    AutoQuest       = false,
    InfHunger       = false,
    InfThirst       = false,
    InfOxygen       = false,
    SafeFarmSpeed   = true,
    InstantFarmTP   = false,
    KickBypass      = false,
    StopEatInCombat = false,
    AutoRespawn     = false,

    
    SpeedBoost   = false,
    JumpBoost    = false,
    InfiniteJump = false,
    Noclip       = false,
    Fly          = false,
    AutoAttack   = false,
    AutoSpawn    = false,

    
    AutoHeal          = false,
    TargetPOV         = false,
    AutoAttackPlayers = false,
    AutoAttackNPCs    = false,

    
    EnableKeybinds        = false,
    EnableSpecialKeybinds = false,

    
    ESP                = false,
    SelfESP            = false,
    InfoText           = false,
    RemoveNameFromInfo = false,
    SpectatePlayer     = false,
    Freecam            = false,
    DisableLighting    = false,
    FullBright         = false,
    UnderwaterVision   = false,
    DisableVisualRain  = false,
    Disable3DRendering = false,
    DisableGameNotifs  = false,
    DisableScriptNotifs = false,
    NoclipCamera       = false,
    InfiniteZoom       = false,

    
    AccurateGrowth  = false,
    FPSBoost        = false,
    KickOnAdmin     = true,
    MenuOnAdmin     = false,
    SpawnAfterAdmin = false,

    
    AutoMission = false,

    
    HopOnFriendDetect = false,

    
    AnonymousMode = false,

    
    StatMonitor = false,
    AntiAFK     = true,
}







local q  = c.LocalPlayer
local r    
local s     
local t     

local u = {}
local v = { value = true }
local w=function(
w, x)    
if u[w] then u[w]:Disconnect() end
    u[w] = x
end local x=function()    


for x, y in pairs(u) do
        if y.Connected then y:Disconnect() end
        u[x] = nil
    end
end




local y = {}

function y.debug(...)
    if o.DebugMode then print("[JurassicBlocky]", ...) end
end

function y.safe(z, A)
    local B, C = pcall(z)
    if not B then y.debug("Error in", A or "anonymous", "->", C) end
end

local z
function y.setLibrary(A) z = A end

function y.notify(A, B)
    if z and z.Notify then
        y.safe(function()
            z:Notify({
                Title       = A,
                Description = B,
                Time        = o.NotifyDuration,
            })
        end, "libNotify")
        return
    end
    y.safe(function()
        i:SetCore("SendNotification", {
            Title    = A,
            Text     = B,
            Duration = o.NotifyDuration,
        })
    end, "notify")
end

function y.waitForCharacter()    
local A = q.Character or q.CharacterAdded:Wait()
    local B  = (A:WaitForChild("Humanoid", 10) )    
local C = (A:WaitForChild("HumanoidRootPart", 10) )    
return A, B, C
end

function y.distance(A, B)    
return (A - B).Magnitude
end

function y.tweenTo(A, B)
    if not t then return end
    local C = B or o.TweenTeleportSeconds
    local D = TweenInfo.new(C, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local E = f:Create(t, D, {CFrame = A})
    E:Play()
    
    local F = false
    E.Completed:Connect(function() F = true end)
    local G = os.clock()
    while not F and (os.clock() - G) < (C * 2 + 0.5) do
        task.wait(0.05)
    end
end
local A=function(


A)    
local B, C = pcall(function() return getfenv and getfenv(0) or _ENV end)
    if B and type(C) == "table" then
        local D = (C )[A]
        if type(D) == "function" then return D, "getfenv(0)" end
    end
    local D = (_G )[A]
    if type(D) == "function" then return D, "_G" end
    if type(shared) == "table" then
        local E = (shared )[A]
        if type(E) == "function" then return E, "shared" end
    end
    local E = B and (C ).getgenv or (_G ).getgenv
    if type(E) == "function" then
        local F, G = pcall(E)
        if F and type(G) == "table" then
            local H = (G )[A]
            if type(H) == "function" then return H, "getgenv()" end
        end
    end
    return nil, nil
end


local B= {}
local C=function(C)    
local D = B[C]
    if D == false then return nil end
    if D and (D ).Parent then return D end
    local E = h:FindFirstChild(C, true)
    B[C] = E or false
    return E
end

function y.fireRemote(D, ...)
    local E = C(D)
    if not E then y.debug("Remote not found:", D); return end
    local F = table.pack(...)
    if E:IsA("RemoteEvent") then
        y.safe(function() E:FireServer(table.unpack(F, 1, F.n)) end, "fire:"..D)
    elseif E:IsA("RemoteFunction") then
        y.safe(function() E:InvokeServer(table.unpack(F, 1, F.n)) end, "invoke:"..D)
    end
end


local D= {}
local E=function(E)    
local F = table.concat(E, "|")
    local G = D[F]
    if G == false then return nil end
    if G and (G ).Parent then return G end
    for H, I in ipairs(h:GetDescendants()) do
        if I:IsA("RemoteEvent") or I:IsA("RemoteFunction") then
            local J = I.Name:lower()
            for K, L in ipairs(E) do
                if J:find(L, 1, true) then
                    D[F] = I
                    return I
                end
            end
        end
    end
    D[F] = false
    return nil
end local F=function(

F)    
if F:IsA("RemoteEvent") then
        y.safe(function() (F ):FireServer() end, "fire:"..F.Name)
    elseif F:IsA("RemoteFunction") then
        y.safe(function() (F ):InvokeServer() end, "invoke:"..F.Name)
    end
end local G=function(




G)    
r = G
    s  = (G:WaitForChild("Humanoid", 10) )    
t  = (G:WaitForChild("HumanoidRootPart", 10) )    
if s then
        s.WalkSpeed = p.SpeedBoost and o.BoostedWalkSpeed or o.DefaultWalkSpeed
        s.JumpPower = p.JumpBoost  and o.BoostedJumpPower  or o.DefaultJumpPower
    end
    y.debug("Character bound:", G.Name)
end

if q.Character then G(q.Character) end
w("CharacterAdded", q.CharacterAdded:Connect(G))




w("AntiAFK", q.Idled:Connect(function()
    if not p.AntiAFK then return end
    y.safe(function()
        j:CaptureController()
        j:ClickButton2(Vector2.new())
        y.debug("Anti-AFK ping fired")
    end, "AntiAFK")
end))




w("InfiniteJump", e.JumpRequest:Connect(function()
    if p.InfiniteJump and s then
        s:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end))




local H= {}
local I=function()    
H = {}
    if not r then return end
    for I, J in ipairs(r:GetDescendants()) do
        if J:IsA("BasePart") then table.insert(H, J) end
    end
end

w("CharacterAddedNoclipRebuild",
    q.CharacterAdded:Connect(function(J)
        J:WaitForChild("HumanoidRootPart", 5)
        I()
    end))
if r then I() end

w("Noclip", d.Stepped:Connect(function()
    if not p.Noclip then return end
    for J, K in ipairs(H) do
        if K.Parent and K.CanCollide then K.CanCollide = false end
    end
end))






local J = {
    Hunger = { "Hunger", "Food", "Fullness", "Satiety", "Belly", "Stomach" },
    Thirst = { "Thirst", "Water", "Hydration", "Drink" },
    Oxygen = { "Oxygen", "Breath", "Breathe", "Air", "AirSupply", "Lungs", "Lung", "OxygenLevel" },
    Breath = { "Breath", "Oxygen", "Air" },
    Energy = { "Energy", "Sleep", "Stamina", "Rest", "Fatigue", "Sleepiness" },
    Health = { "Health", "HP", "Life" },
    
    Coins  = { "Coins", "Cash", "Gold", "Money", "Credits", "Currency" },
    XP     = { "XP", "Experience", "EXP" },
    Level  = { "Level", "Lvl", "Lv" },
}
local K=function()    

local K= { q }
    for L, M in ipairs({"PlayerStats","Stats","Data","leaderstats","Status","Vitals","PlayerData","Survival"}) do
        local N = q:FindFirstChild(M)
        if N then table.insert(K, N) end
    end
    if r then
        table.insert(K, r)
        for L, M in ipairs({"Stats","PlayerStats","Status","Vitals"}) do
            local N = r:FindFirstChild(M)
            if N then table.insert(K, N) end
        end
    end
    return K
end

local L= {}
local M=function(
M)    
local N = J[M] or { M }
    for O, P in ipairs(K()) do
        for Q, R in ipairs(N) do
            local S = P:FindFirstChild(R)
            if S and (S:IsA("NumberValue") or S:IsA("IntValue")) then return S end
        end
    end
    local function scan(O, P)        
if P > 4 then return nil end
        for Q, R in ipairs(O:GetChildren()) do
            for S, T in ipairs(N) do
                if R.Name == T and (R:IsA("NumberValue") or R:IsA("IntValue")) then
                    return R                 
end
            end
            if not R:IsA("BasePart") and not R:IsA("Script") and not R:IsA("LocalScript") then
                local S = scan(R, P + 1); if S then return S end
            end
        end
        return nil
    end
    local O = scan(q, 0); if O then return O end
    if r then return scan(r, 0) end
    return nil
end local N=function(

N)    
local O = L[N]
    if O and O.Parent then return O end
    local P = M(N)
    L[N] = P
    return P
end

w("CharacterAddedStatCacheReset",
    q.CharacterAdded:Connect(function() L = {} end))
local O=function()    

local O = {}
    local function visit(P, Q, R)
        if R > 5 then return end
        for S, T in ipairs(P:GetChildren()) do
            local U = Q .. "." .. T.Name
            if T:IsA("NumberValue") or T:IsA("IntValue") then
                table.insert(O, {name = T.Name, value = T.Value, path = U})
            elseif not T:IsA("BasePart") and not T:IsA("Script") and not T:IsA("LocalScript") then
                visit(T, U, R + 1)
            end
        end
    end
    visit(q, "Players.LocalPlayer", 0)
    if r then visit(r, "workspace." .. r.Name, 0) end
    return O
end local P=function()    


local P = {}
    for Q, R in ipairs(h:GetDescendants()) do
        if R:IsA("RemoteEvent") or R:IsA("RemoteFunction") then
            table.insert(P, {name = R.Name, class = R.ClassName, path = R:GetFullName()})
        end
    end
    return P
end local Q=function(

Q)    
local R = N(Q); return R and R.Value or nil
end local R=function()    


if s and s.Health < s.MaxHealth * 0.9 then return true end
    return false
end


local S = { Hunger = false, Thirst = false }
local T = 0.05
local U      = 200
local aa=function(
V, W, X)    
if S[V] then return end
    S[V] = true
    task.spawn(function()
        local Y = 0
        local Z = os.clock()
        while Y < U and v.value do
            local _ = (V == "Hunger" and p.InfHunger)
                         or (V == "Thirst" and p.InfThirst)
            if not _ then break end
            if not (r and s and s.Health > 0) then break end
            local aa = N(V)
            local ab = o.StopInfHungerAt > 0 and o.StopInfHungerAt or 100
            if not aa then break end
            if aa.Value >= ab - 1 then break end
            y.fireRemote(W)
            local ac = E(X)
            if ac then F(ac) end
            Y += 1
            task.wait(T)
        end
        y.debug(("[InfStat] %s burst ended after %d fires in %.2fs"):format(V, Y, os.clock() - Z))
        S[V] = false
    end)
end


local ab     = 0
local ac   = 1.0
local V  = 60
local W   = 30
local X local ad=function(

Y)    
local Z = N("Oxygen")
    if not Z then return end
    if X == nil then
        X = E({"breath","oxygen","air","surface","lung"}) or false
    end
    if X and (X ).Parent then
        F(X )
    end
    local _ = math.max(Y, Z.Value)
    if Z.Value < _ then Z.Value = _ end
    if Z.Value >= W then return end
    if tick() - ab < ac then return end
    if not t then return end
    ab = tick()
    pcall(function()
        t.CFrame = t.CFrame + Vector3.new(0, V, 0)
        if t.AssemblyLinearVelocity then
            local ad = t.AssemblyLinearVelocity
            t.AssemblyLinearVelocity = Vector3.new(ad.X, math.max(ad.Y, 0), ad.Z)
        end
    end)
end


task.spawn(function()
    while v.value and task.wait(0.25) do
        if not (r and s and s.Health > 0) then continue end
        local Y = o.StopInfHungerAt > 0 and o.StopInfHungerAt or 100
        local Z = R()
        if p.InfHunger and not (p.StopEatInCombat and Z) then
            local _ = N("Hunger")
            if _ and _.Value < Y - 1 and not S.Hunger then
                aa("Hunger", o.Remotes.Eat, {"eat","feed","hunger","food","consume"})
            end
        end
        if p.InfThirst then
            local _ = N("Thirst")
            if _ and _.Value < Y - 1 and not S.Thirst then
                aa("Thirst", o.Remotes.Drink, {"drink","thirst","hydrate","water"})
            end
        end
        if p.InfOxygen then ad(Y) end
    end
end)


task.spawn(function()
    while v.value and task.wait(o.SurvivalLoopInterval) do
        if not (r and s and s.Health > 0) then continue end
        local Y = R()
        if p.AutoEat then
            local Z = Q("Hunger")
            if Z and Z <= o.AutoEatThreshold and not (p.StopEatInCombat and Y) then
                if o.HungerDelay > 0 then task.wait(o.HungerDelay) end
                local _ = E({"eat","feed","hunger","food","consume"})
                if _ then F(_) end
            end
        end
        if p.AutoDrink then
            local Z = Q("Thirst")
            if Z and Z <= o.AutoDrinkThreshold then
                if o.ThirstDelay > 0 then task.wait(o.ThirstDelay) end
                local _ = E({"drink","thirst","hydrate","water"})
                if _ then F(_) end
            end
        end
        if p.AutoSleep then
            local Z = Q("Energy")
            if Z and Z <= o.AutoSleepThreshold then
                local _ = E({"sleep","rest","energy","nap"})
                if _ then F(_) end
            end
        end
        if p.AutoBreath then
            local Z = Q("Breath")
            if Z and Z <= o.AutoBreathThreshold and t then
                t.CFrame = t.CFrame + Vector3.new(0, 30, 0)
            end
        end
        if p.AutoHeal and s.Health <= o.DisengageAtHP then
            local Z = E({"heal","health","regen","cure"})
            if Z then F(Z) end
        end
    end
end)




task.spawn(function()
    while v.value and task.wait(0.5) do
        if not p.AutoRespawn then continue end
        if s and s.Health <= 0 then
            if o.RespawnDelay > 0 then task.wait(o.RespawnDelay) end
            y.fireRemote(o.Remotes.Respawn)
            local Y = E({"respawn","reload","revive","spawn"})
            if Y then F(Y) end
        end
    end
end)
local Y=function(



Y)    
local Z = Y:FindFirstChildOfClass("Humanoid")
    if not Z or Z.Health <= 0 then return false end
    if o.MaxTargetHP > 0 and Z.MaxHealth > o.MaxTargetHP then return false end
    if Z.Health < o.MinTargetHP then return false end
    return true
end

task.spawn(function()
    while v.value and task.wait(0.25) do
        if not (p.AutoAttack or p.AutoAttackPlayers or p.AutoAttackNPCs) then continue end
        if not (r and t and s and s.Health > 0) then continue end
        local Z ,_=(math.huge
)        local ae= {}
        if p.AutoAttackPlayers then
            for af, ag in ipairs(c:GetPlayers()) do
                if ag ~= q and ag.Character then table.insert(ae, ag.Character) end
            end
        end
        if p.AutoAttackNPCs then
            for af, ag in ipairs(g:GetChildren()) do
                if ag:IsA("Model") and ag:FindFirstChildOfClass("Humanoid") and not c:GetPlayerFromCharacter(ag) then
                    table.insert(ae, ag)
                end
            end
        end
        for af, ag in ipairs(ae) do
            local ah = ag:FindFirstChild("HumanoidRootPart") or ag.PrimaryPart
            if ah and ah:IsA("BasePart") and Y(ag) then
                local ai = (ah.Position - t.Position).Magnitude
                if ai <= o.CombatRange and ai < Z then _, Z = ag, ai end
            end
        end
        if _ then
            y.fireRemote(o.Remotes.Attack, _)
            local af = E({"attack","damage","bite","strike","hit"})
            if af then
                if af:IsA("RemoteEvent") then y.safe(function() af:FireServer(_) end, "attack")
                elseif af:IsA("RemoteFunction") then y.safe(function() af:InvokeServer(_) end, "attack") end
            end
            if p.TargetPOV and g.CurrentCamera then
                g.CurrentCamera.CameraSubject = _:FindFirstChildOfClass("Humanoid")
            end
        end
    end
end)






local ae= {
    
    Berry        = { "berry","berries","fruit","fruits","plant","bush" },
    Meat         = { "meat","steak","flesh","carcass","drumstick" },
    Fish         = { "fish","tuna","salmon","cod","trout","catfish","fishing" },
    
    Wood         = { "wood","log","logs","branch","stick","twig","plank","timber" },
    Stone        = { "stone","rock","cobble","boulder","pebble" },
    
    Fossil       = { "fossil","bone","skeleton","skull","tooth" },
    Egg          = { "egg","eggs","nest","clutch" },
    
    Water        = { "water","pond","river","stream","puddle","spring" },
    
    Iron         = { "iron","ironore","ore","metal","copper","tin" },
    Gold         = { "gold","goldore","nugget" },
    Diamond      = { "diamond","gem","crystal","ruby","sapphire","emerald" },
    
    Sapling      = { "sapling","seedling","seed","seeds" },
    Mushroom     = { "mushroom","fungus","shroom","cap" },
    
    Loot         = { "loot","bag","drop","pickup","crate","chest" },
}


local af= {}
local ag = 0
local ah=function()    
if tick() - ag > 0.5 then
        af = g:GetDescendants()
        ag = tick()
    end
    return af
end

local ai= {}
local Z=function(Z)    
local _ = ai[Z]
    if not _ then return false end
    if tick() >= _ then ai[Z] = nil; return false end
    return true
end local aj=function(

_)    
local aj= {}
    local ak= {}
    local al = ae[_]
    if not al then al = { _:lower() } end
local am=function(am)        
return am.PrimaryPart
            or (am:FindFirstChild("HumanoidRootPart") )            
or am:FindFirstChildWhichIsA("BasePart")
end local an=function(
an)        
local ao = an:lower()
        for ap, aq in ipairs(al) do
            if ao:find(aq, 1, true) then return true end
        end
        return false
end    
for ao, ap in ipairs(ah()) do
        if an(ap.Name) then
            if ap:IsA("BasePart") then
                local aq= ap.Parent or ap
                if aq:IsA("Model") then
                    if not ak[aq] then
                        ak[aq] = true
                        table.insert(aj, ap)
                    end
                else
                    table.insert(aj, ap)
                end
            elseif ap:IsA("Model") then
                if not ak[ap] then
                    ak[ap] = true
                    local aq = am(ap)
                    if aq then table.insert(aj, aq) end
                end
            end
        end
    end
    return aj
end

local ak local al=function()    

local al= {}
    local am= {}
local an=function(an)        
if not an or an == "" or am[an] then return end
        am[an] = true; table.insert(al, an)
end    
local ao = (ak and ak.FarmTargets and ak.FarmTargets.Value) or o.FarmTarget
    if type(ao) == "string" then an(ao) end
    if ak and ak.FarmPriority and type(ak.FarmPriority.Value) == "table" then
        for ap, aq in pairs(ak.FarmPriority.Value) do
            if aq and type(ap) == "string" then an(ap) end
        end
    end
    return al
end

local am local an=function()    

if am and (am ).Parent then return am end
    am = E({"collect","pickup","claim","harvest","gather","interact","grab"})
    return am
end local ao=function(

ao)    
local ap= ao
    while ap and not ap:IsA("Model") and ap.Parent and ap.Parent ~= g do
        ap = ap.Parent
    end
    return ap or ao
end local ap=function(

ap, aq)    
local _ = math.max(o.TargetHoverClearance or 4, 1)
    if aq:IsA("Model") then
        local ar, as, at = pcall(function() return (aq ):GetBoundingBox() end)
        if ar and as and at then
            local au = as.Position
            local av = au.Y + at.Y * 0.5
            return Vector3.new(au.X, av + _, au.Z)
        end
    end
    return ap.Position + Vector3.new(0, ap.Size.Y * 0.5 + _, 0)
end


local aq
local ar
local as
do
    local at= _G
local au=function(...)        
for au, av in ipairs({...}) do
            local _ = at[av]; if type(_) == "function" then return _ end
            local aw = at.Synapse
            if type(aw) == "table" and type(aw[av]) == "function" then return aw[av] end
        end
        return nil
end    
aq  = au("fireproximityprompt","fireProximityPrompt")
    ar = au("firetouchinterest","fireTouchInterest")
    as = au("fireclickdetector","fireClickDetector")
end

if aq then print("[JurassicBlocky] fireproximityprompt available") end
local at=function(
at)    
local au = ao(at)
    local av = r and ((r:FindFirstChild("HumanoidRootPart") )) or nil
    local aw = o.TargetPickupMethod or "All"
    local _ = (aw == "All" or aw == "ProximityPrompt")
    local ax  = (aw == "All" or aw == "Touch")
    local ay  = (aw == "All" or aw == "Click")
    local az = (aw == "All" or aw == "Remote")

    
    
    
    if not _G.JBPickupDiag then _G.JBPickupDiag = {} end
    if not _G.JBPickupDiag[at.Name] then
        _G.JBPickupDiag[at.Name] = true
        local aA = au:GetDescendants()
        local aB, aC, aD, aE = 0, 0, 0, 0
        for aF, aG in ipairs(aA) do
            if aG:IsA("ProximityPrompt") then aB += 1 end
            if aG:IsA("ClickDetector") then aC += 1 end
            if aG:IsA("BasePart") then aD += 1 end
            if aG:IsA("Tool") then aE += 1 end
        end
        local aF = av and (av.Position - at.Position).Magnitude or -1
        print(("[PickupDiag] %s: prompts=%d, clickdetectors=%d, parts=%d, tools=%d, dist=%.1f"):format(
            at.Name, aB, aC, aD, aE, aF))
    end

    if _ then
        for aA, aB in ipairs(au:GetDescendants()) do
            if aB:IsA("ProximityPrompt") and aB.Enabled then
                if aq then
                    y.safe(function() aq(aB) end, "fireProx")
                else
                    y.safe(function()
                        local aC = aB.HoldDuration
                        aB.HoldDuration = 0
                        aB:InputHoldBegin(); task.wait(0.05); aB:InputHoldEnd()
                        aB.HoldDuration = aC
                    end, "prompt")
                end
            end
        end
    end
    if ax and ar and av then
        for aA, aB in ipairs(au:IsA("Model") and au:GetDescendants() or {at}) do
            if aB:IsA("BasePart") then
                y.safe(function() ar(av, aB, 0); task.wait(); ar(av, aB, 1) end, "touch")
            end
        end
    end
    if ay and as then
        for aA, aB in ipairs(au:GetDescendants()) do
            if aB:IsA("ClickDetector") then
                y.safe(function() as(aB, 0); as(aB) end, "click")
            end
        end
    end
    if az then
        local aA = an()
        if aA then
            y.safe(function()
                if aA:IsA("RemoteEvent") then aA:FireServer(at, au)
                elseif aA:IsA("RemoteFunction") then aA:InvokeServer(at, au) end
            end, "collectRemote")
        end
    end
end local au=function(



au, av)    
if not t then return false end
    local aw= au.Position
    aw = aw + Vector3.new(
        o.TargetLandingXOffset,
        o.TargetLandingYOffset,
        o.TargetLandingZOffset)
    if o.TargetLandingJitter > 0 then
        local ax = o.TargetLandingJitter
        aw = aw + Vector3.new(
            (math.random() - 0.5) * 2 * ax, 0,
            (math.random() - 0.5) * 2 * ax)
    end
    local ax   = o.InstantTPBurstMode
    local ay = ax and math.max(o.InstantTPBurstStuds, 5)
                          or math.max(o.InstantTPMaxJump, 5)
    local az   = math.max(o.InstantTPInterJump, 0)
    local aA = 0
    local aB = (aw - t.Position).Magnitude
    local aC = aB
    local aD = 0
    local aE = math.max(o.TargetMaxStuckHops, 10)

    while t and v.value do
        if not p.AutoFarm then return false end
        local aF = t.Position
        local aG = (aw - aF).Magnitude
        if aG < ay then
            y.safe(function() t.CFrame = CFrame.new(aw) end, "finalHop")
            return true
        end
        local _ = aF + (aw - aF).Unit * ay
        y.safe(function() t.CFrame = CFrame.new(_) end, "hop")
        aA += 1
        if aA % 5 == 0 then
            local aH = ay * 5 * 0.3
            if (aC - aG) < aH then
                aD += 1
                if aD >= 3 then
                    y.debug("[InstantTP] STUCK - bailing")
                    return false
                end
            else aD = 0 end
            aC = aG
        end
        if aA >= aE then
            y.debug("[InstantTP] hop cap hit")
            return false
        end
        if ax then d.Heartbeat:Wait()
        elseif az > 0 then task.wait(az) end
    end
    return false
end local av=function(

av, aw)    
local ax = ao(av)
    local ay = aw or o.TargetPickupRetries or 3
    for az = 1, ay do
        if not av.Parent or not ax.Parent then return true end
        if not p.AutoFarm then return false end
        au(av, ax)
        if t and av.Parent then
            local aA = ap(av, ax)
            y.safe(function() t.CFrame = CFrame.new(aA) end, "snap1")
        end
        task.wait(o.InstantTPSettleTime)
        at(av)
        task.wait(0.08)
        if not av.Parent or not ax.Parent then return true end
        if t and av.Parent then
            local aA = ap(av, ax)
            y.safe(function() t.CFrame = CFrame.new(aA) end, "snap2")
        end
        at(av)
        task.wait(0.05)
        if not av.Parent or not ax.Parent then return true end
    end
    if t and o.TargetPostCollectStep > 0 then
        local az = (t.Position - av.Position)
        if az.Magnitude > 0.1 then
            local aA = t.Position + az.Unit * o.TargetPostCollectStep
            y.safe(function() t.CFrame = CFrame.new(aA) end, "postCollectStep")
        end
    end
    return false
end local aw=function(

aw, ax)    
local ay = ao(aw)
    local az = ax or 6
    for aA = 1, az do
        if not aw.Parent or not ay.Parent then return true end
        at(aw)
        if t then
            local aB = Vector3.new(((aA % 2) == 0 and 1 or -1) * 2, 0, ((aA % 2) == 0 and -1 or 1) * 2)
            y.safe(function() y.tweenTo(t.CFrame + aB, 0.08) end, "wiggle")
        end
        task.wait(0.12)
        if not aw.Parent or not ay.Parent then return true end
    end
    return false
end local ax=function(

ax)    
if not t then return end
    local ay  = math.clamp(o.SafeFarmSpeed,  20, o.SafeFarmSpeedMax)
    local az = math.clamp(o.SafeFarmHopCap, 10, o.SafeFarmHopCapMax)
    local aA  = math.max(o.SafeFarmInterHop, 0)
    if not p.SafeFarmSpeed then
        local aB = (t.Position - ax.Position).Magnitude
        y.tweenTo(ax, math.clamp(aB / 300, 0.2, 1.5))
        return
    end
    while t and v.value do
        if not p.AutoFarm then return end
        local aB = t.Position
        local aC   = ax.Position
        local aD    = (aC - aB).Magnitude
        if aD < 4 then return end
        if aD <= az then
            y.tweenTo(ax, aD / ay); return
        end
        local aE = aB + (aC - aB).Unit * az
        y.tweenTo(CFrame.new(aE), az / ay)
        if aA > 0 then task.wait(aA) end
    end
end

local ay = 0
local az=function(az)    
if not o.DebugMode then return end
    if tick() - ay < 1.5 then return end
    ay = tick()
    y.debug("[Autofarm] " .. az)
end

_G.JBAutoFarmHeartbeat = _G.JBAutoFarmHeartbeat or 0

task.spawn(function()
    while v.value and task.wait(o.AutoFarmInterval) do
        _G.JBAutoFarmHeartbeat = (_G.JBAutoFarmHeartbeat or 0) + 1
        if _G.JBAutoFarmHeartbeat % 60 == 0 then
            y.debug(("[AutoFarm] heartbeat %d, AutoFarm=%s, InstantTP=%s"):format(
                _G.JBAutoFarmHeartbeat, tostring(p.AutoFarm), tostring(p.InstantFarmTP)))
        end
        local aA, aB = pcall(function()
            if not p.AutoFarm then return end
            if not (r and t) then return end
            local aA = al()
            if #aA == 0 then az("no target selected"); return end

            local aB= {}
            if o.TargetSkipOccupied then
                for aC, aD in ipairs(c:GetPlayers()) do
                    if aD ~= q and aD.Character then
                        local aE = aD.Character:FindFirstChild("HumanoidRootPart")
                        if aE and aE:IsA("BasePart") then table.insert(aB, aE) end
                    end
                end
            end
local aC=function(aC)                
if #aB == 0 then return false end
                local aD = o.TargetOccupiedRadius
                for aE, aF in ipairs(aB) do
                    if (aF.Position - aC.Position).Magnitude <= aD then return true end
                end
                return false
end
            
local aD= {}
            local aE, aF, aG, aH = 0, 0, 0, 0
            for _, aI in ipairs(aA) do
                local aJ = aj(aI)
                for aK, aL in ipairs(aJ) do
                    aE += 1
                    if Z(aL) then aF += 1; continue end
                    local aM = (aL.Position - t.Position).Magnitude
                    if aM < o.TargetMinDistance then aG += 1; continue end
                    if aM > o.AutoFarmRadius then continue end
                    if o.TargetSkipOccupied and aC(aL) then aH += 1; continue end
                    local aN = aL.Size.X * aL.Size.Y * aL.Size.Z
                    table.insert(aD, { part = aL, dist = aM, vol = aN })
                end
            end

            local aI            
local aJ = math.huge
            if #aD > 0 then
                local aK = o.TargetTargetPriority
                if aK == "Furthest" then
                    table.sort(aD, function(aL, aM) return aL.dist > aM.dist end)
                    aI = aD[1].part; aJ = aD[1].dist
                elseif aK == "Largest" then
                    table.sort(aD, function(aL, aM) return aL.vol > aM.vol end)
                    aI = aD[1].part; aJ = aD[1].dist
                elseif aK == "Random" then
                    local aL = aD[math.random(1, #aD)]
                    aI = aL.part; aJ = aL.dist
                else
                    table.sort(aD, function(aL, aM) return aL.dist < aM.dist end)
                    aI = aD[1].part; aJ = aD[1].dist
                end
            end

            if aE == 0 then
                if tick() - (_G.JBAutoFarmNoTargetLog or 0) > 4 then
                    _G.JBAutoFarmNoTargetLog = tick()
                    print(("[AutoFarm] 0 in workspace for: %s"):format(table.concat(aA, ", ")))
                end
                return
            end
            if not aI then
                if tick() - (_G.JBAutoFarmAllFilteredLog or 0) > 4 then
                    _G.JBAutoFarmAllFilteredLog = tick()
                    print(("[AutoFarm] %d found, all filtered (range=%d). Raise Farm Range or move closer."):format(
                        aE, o.AutoFarmRadius))
                end
                return
            end

            local aK = ao(aI)
            if p.InstantFarmTP then
                az(("INSTANT TP %d studs"):format(math.floor(aJ)))
                local aL = av(aI, o.TargetPickupRetries or 3)
                if not aL then ai[aI] = tick() + 6 end
                task.wait(o.InstantTPPostDelay)
            else
                az(("walking %d studs"):format(math.floor(aJ)))
                local aL = CFrame.new(ap(aI, aK))
                ax(aL)
                if aI.Parent and aK.Parent then
                    local aM = aw(aI, 6)
                    if not aM then ai[aI] = tick() + 10 end
                end
                task.wait(0.1)
            end
        end)
        if not aA then
            _G.JBAutoFarmLastError = tostring(aB)
            warn("[JurassicBlocky] [AutoFarm] loop error: " .. tostring(aB))
        end
    end
end)




task.spawn(function()
    while v.value and task.wait(5) do
        if not p.AutoQuest then continue end
        y.fireRemote(o.Remotes.Quest)
        local aA = E({"quest","mission","claim","reward","complete"})
        if aA then F(aA) end
    end
end)
local aA=function(



aA)    
if not aA:IsA("Model") then return false end
    local aB = aA:FindFirstChildOfClass("Humanoid")
    if not aB or aB.Health <= 0 then return false end
    return aA.PrimaryPart ~= nil
        or aA:FindFirstChild("HumanoidRootPart") ~= nil
        or aA:FindFirstChildWhichIsA("BasePart") ~= nil
end

local aB = 6
local aC=function()    
local aC= {}
    local function walk(aD, aE)
        if aE > aB then return end
        for aF, aG in ipairs(aD:GetChildren()) do
            if aG:IsA("Model") then
                if aA(aG) then aC[aG ] = true end
            elseif aG:IsA("Folder") or aG:IsA("Configuration") or aG == g then
                walk(aG, aE + 1)
            end
        end
    end
    walk(g, 0)
    for aD, aE in ipairs(c:GetPlayers()) do
        local aF = aE.Character
        if aF and aA(aF) then aC[aF] = true end
    end
    return aC
end

local aD = {
    Active = false, Entries = {} ,
    LastScan = 0, ScanInterval = 0.75, LastScanCount = 0,
    TracerGui = nil ,
    Settings = {
        Enabled = false, ShowSelf = false, ShowPlayers = true, ShowNPCs = true,
        ShowOwner = true, ShowTeam = true, TeamCheck = false, MaxDistance = 2000,
        Boxes = true, BoxType = "2D", BoxThickness = 1,
        Tracers = false, TracerOrigin = "Bottom", TracerThickness = 1,
        TracerStyle = "Solid", TracerTransparency = 0,
        TracerDistanceFade = false, TracerRainbow = false, TracerRainbowSpeed = 0.5,
        TracerOffscreenOnly = false, TracerOnPlayers = true, TracerOnNPCs = true,
        TracerEndDot = false, TracerOriginDot = false, TracerToHead = false,
        TracerTeamColor = false, TracerHealthColor = false,
        Names = true, Distance = true, HealthText = true, HealthBar = true, HeadDot = false,
        Chams = false, ChamsMode = "Standard", ChamsDepth = "AlwaysOnTop",
        ChamsDualColor = false, ChamsOnPlayers = true, ChamsOnNPCs = true,
        ChamsTeamColor = false, ChamsDistanceFade = false,
        ChamsPulseSpeed = 2, ChamsRainbowSpeed = 0.5,
        TextSize = 14, HeadDotRadius = 4,
        Colors = {
            Box = Color3.fromRGB(255, 255, 255), BoxOutline = Color3.fromRGB(0, 0, 0),
            Tracer = Color3.fromRGB(255, 255, 255), Name = Color3.fromRGB(255, 255, 255),
            Distance = Color3.fromRGB(200, 200, 200),
            HealthHi = Color3.fromRGB(0, 255, 0), HealthLo = Color3.fromRGB(255, 0, 0),
            HeadDot = Color3.fromRGB(255, 255, 255),
            ChamsFill = Color3.fromRGB(85, 200, 110), ChamsOutline = Color3.fromRGB(255, 255, 255),
            ChamsVisible = Color3.fromRGB(0, 255, 0), ChamsOccluded = Color3.fromRGB(255, 60, 60),
            ChamsPlayer = Color3.fromRGB(0, 170, 255), ChamsNPC = Color3.fromRGB(255, 170, 0),
            Player = Color3.fromRGB(0, 170, 255), NPC = Color3.fromRGB(255, 170, 0),
            Friendly = Color3.fromRGB(0, 255, 100), Enemy = Color3.fromRGB(255, 70, 70),
        },
        BoxFillTransparency = 0.5, ChamsFillTransparency = 0.5, ChamsOutlineTransparency = 0,
    },
}
local aE=function(
aE, aF)    
local aG = aE.PrimaryPart
        or aE:FindFirstChild("HumanoidRootPart")
        or aE:FindFirstChildWhichIsA("BasePart")
    if not aG or not aG:IsA("BasePart") then return false end
    local aH = aF.CFrame.Position
    local aI = aG.Position - aH
    if aI.Magnitude < 1 then return true end
    local aJ = RaycastParams.new()
    aJ.FilterType = Enum.RaycastFilterType.Exclude
    aJ.FilterDescendantsInstances = { aE, r or q.Character or aE }
    aJ.IgnoreWater = true
    return g:Raycast(aH, aI, aJ) == nil
end local aF=function(

aF)    
local aG = aF:FindFirstChild("Head")
        or aF.PrimaryPart
        or aF:FindFirstChild("HumanoidRootPart")
        or aF:FindFirstChild("Torso")
        or aF:FindFirstChild("UpperTorso")
        or aF:FindFirstChildWhichIsA("BasePart")
    if aG and aG:IsA("BasePart") then return aG end
    return nil
end local aG=function()    


if aD.TracerGui and aD.TracerGui.Parent then return aD.TracerGui end
    local aG = Instance.new("ScreenGui")
    aG.Name = "JurassicBlocky_Tracers_" .. b
    aG.ResetOnSpawn = false; aG.IgnoreGuiInset = true
    aG.DisplayOrder = 9; aG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    local aH= _G
    local aI = false
    if type(aH.gethui) == "function" then
        local aJ, aK = pcall(aH.gethui); if aJ and aK then aG.Parent = aK; aI = true end
    end
    if not aI then
        local aJ, aK = pcall(function() return l end)
        if aJ and aK then aG.Parent = aK; aI = true end
    end
    if not aI then aG.Parent = q:WaitForChild("PlayerGui") end
    aD.TracerGui = aG
    return aG
end local aH=function(

aH)    
local aI= {}
    local aJ = aF(aH)
    if not aJ then return aI end

    local aK = Instance.new("BillboardGui")
    aK.Name = "JB_ESP"; aK.Adornee = aJ; aK.AlwaysOnTop = true
    aK.LightInfluence = 0; aK.Size = UDim2.new(0, 240, 0, 70)
    aK.StudsOffset = Vector3.new(0, 6, 0); aK.MaxDistance = 5000; aK.Parent = aJ
    aI.billboard = aK
local aL=function(
aL, aM, aN, _, aO, aP)        
local aQ = Instance.new("TextLabel")
        aQ.Name = aL; aQ.BackgroundTransparency = 1; aQ.Size = aM; aQ.Position = aP
        aQ.Font = aN; aQ.TextSize = _; aQ.TextColor3 = aO
        aQ.TextStrokeTransparency = 0.3; aQ.TextStrokeColor3 = Color3.new(0, 0, 0)
        aQ.Text = ""; aQ.Parent = aK
        return aQ
end    
aI.nameLabel = aL("Name",     UDim2.new(1,0,0,20), Enum.Font.GothamBold, aD.Settings.TextSize, aD.Settings.Colors.Name,     UDim2.fromOffset(0,0))
    aI.nameLabel.Text = aH.Name
    aI.distLabel = aL("Distance", UDim2.new(1,0,0,14), Enum.Font.Gotham,     math.max(10, aD.Settings.TextSize - 2), aD.Settings.Colors.Distance, UDim2.fromOffset(0,20))

    local aM = Instance.new("Frame")
    aM.Name = "HpBg"; aM.BackgroundColor3 = Color3.new(0,0,0); aM.BackgroundTransparency = 0.3
    aM.BorderSizePixel = 0; aM.Size = UDim2.new(1,-40,0,5); aM.Position = UDim2.new(0,20,0,38); aM.Parent = aK
    Instance.new("UICorner", aM).CornerRadius = UDim.new(0,2)
    aI.hpBg = aM
    local aN = Instance.new("Frame")
    aN.Name = "HpBar"; aN.BackgroundColor3 = aD.Settings.Colors.HealthHi
    aN.BorderSizePixel = 0; aN.Size = UDim2.fromScale(1,1); aN.Parent = aM
    Instance.new("UICorner", aN).CornerRadius = UDim.new(0,2)
    aI.hpBar = aN
    aI.hpText = aL("HpText", UDim2.new(1,0,0,14), Enum.Font.Gotham, math.max(10, aD.Settings.TextSize - 2), Color3.new(1,1,1), UDim2.fromOffset(0,46))

    local aO = Instance.new("Part")
    aO.Name = "JB_BoxAnchor"; aO.Anchored = true; aO.CanCollide = false
    aO.CanQuery = false; aO.CanTouch = false; aO.Massless = true
    aO.Transparency = 1; aO.Size = Vector3.new(4,6,4); aO.Parent = aH
    aI.boxPart = aO
    local aP = Instance.new("SelectionBox")
    aP.Adornee = aO; aP.LineThickness = 0.05
    aP.Color3 = aD.Settings.Colors.Box; aP.SurfaceTransparency = 1
    aP.SurfaceColor3 = aD.Settings.Colors.Box; aP.Visible = false; aP.Parent = aO
    aI.boxSel = aP

    local aQ = aH:FindFirstChild("Head") or aH.PrimaryPart or aJ
    if aQ and aQ:IsA("BasePart") then
        local _ = Instance.new("BillboardGui")
        _.Name = "JB_HeadDot"; _.Adornee = aQ; _.AlwaysOnTop = true
        _.LightInfluence = 0; _.Size = UDim2.fromOffset(12,12); _.Enabled = false
        _.MaxDistance = 5000; _.Parent = aQ
        local aR = Instance.new("Frame")
        aR.Name = "Dot"; aR.BackgroundColor3 = aD.Settings.Colors.HeadDot
        aR.Size = UDim2.fromScale(1,1); aR.BorderSizePixel = 0; aR.Parent = _
        Instance.new("UICorner", aR).CornerRadius = UDim.new(0.5,0)
        aI.headBb = _; aI.headDot = aR
    end

    local aR = aG()
    local _ = Instance.new("Frame")
    _.Name = "JB_Tracer"; _.AnchorPoint = Vector2.new(0,0.5)
    _.BackgroundColor3 = aD.Settings.Colors.Tracer; _.BorderSizePixel = 0
    _.Size = UDim2.fromOffset(0,1); _.Position = UDim2.fromOffset(0,0)
    _.Visible = false; _.ZIndex = 1; _.Parent = aR
    local aS = Instance.new("UIGradient"); aS.Color = ColorSequence.new(aD.Settings.Colors.Tracer); aS.Enabled = false; aS.Parent = _
    local aT = Instance.new("UIStroke"); aT.Color = aD.Settings.Colors.Tracer; aT.Thickness = 2; aT.Transparency = 0.4; aT.Enabled = false; aT.Parent = _
    local aU = Instance.new("Frame"); aU.AnchorPoint = Vector2.new(0.5,0.5); aU.Size = UDim2.fromOffset(6,6); aU.BackgroundColor3 = aD.Settings.Colors.Tracer; aU.BorderSizePixel = 0; aU.Visible = false; aU.ZIndex = 2; aU.Parent = aR
    Instance.new("UICorner", aU).CornerRadius = UDim.new(0.5,0)
    local aV = aU:Clone(); aV.Parent = aR

    aI.tracer = _; aI.tracerGrad = aS; aI.tracerGlow = aT
    aI.tracerEndDot = aU; aI.tracerOriginDot = aV
    aI.highlight = nil
    return aI
end local aI=function(

aI)    
if not aI then return end
    if aI.billboard then aI.billboard:Destroy() end
    if aI.headBb    then aI.headBb:Destroy()    end
    if aI.boxPart   then aI.boxPart:Destroy()   end
    if aI.tracer    then aI.tracer:Destroy()    end
    if aI.tracerEndDot    then aI.tracerEndDot:Destroy()    end
    if aI.tracerOriginDot then aI.tracerOriginDot:Destroy() end
    if aI.highlight then aI.highlight:Destroy() end
end local aJ=function(

aJ)    
if not aJ then return end
    if aJ.billboard then aJ.billboard.Enabled = false end
    if aJ.headBb    then aJ.headBb.Enabled    = false end
    if aJ.boxSel    then aJ.boxSel.Visible    = false end
    if aJ.tracer    then aJ.tracer.Visible    = false end
    if aJ.tracerEndDot    then aJ.tracerEndDot.Visible    = false end
    if aJ.tracerOriginDot then aJ.tracerOriginDot.Visible = false end
end local aK=function(

aK)    
return c:GetPlayerFromCharacter(aK)
end local aL=function(

aL)    
local aM = aD.Settings
    local aN = aK(aL)
    if aN then
        if aM.TeamCheck and aN.Team and q.Team then
            if aN.Team == q.Team then return aM.Colors.Friendly else return aM.Colors.Enemy end
        end
        return aM.Colors.Player
    end
    return aM.Colors.NPC
end local aM=function()    


if not aD.Active then return end
    local aM = aD.Settings
    local aN = g.CurrentCamera
    if not aN then return end
    local aO = aN.CFrame.Position

    if tick() - aD.LastScan >= aD.ScanInterval then
        aD.LastScan = tick()
        local aP = aC()
        for aQ in pairs(aP) do
            if not aD.Entries[aQ] then aD.Entries[aQ] = aH(aQ) end
        end
        for aQ, aR in pairs(aD.Entries) do
            if not aP[aQ] or not aQ.Parent then
                aI(aR); aD.Entries[aQ] = nil
            end
        end
        local aQ = 0; for aR in pairs(aD.Entries) do aQ += 1 end
        aD.LastScanCount = aQ
    end

    for aP, aQ in pairs(aD.Entries) do
        local aR   = aP:FindFirstChildOfClass("Humanoid")
        local aS = aK(aP)
        local aT = aS ~= nil
        local aU = false
        if not (aR and aR.Health > 0 and aP.Parent) then aU = true end
        if not aU and not aM.ShowSelf and aP == r then aU = true end
        if not aU and aT and not aM.ShowPlayers then aU = true end
        if not aU and not aT and not aM.ShowNPCs then aU = true end
        if not aU and aS and not aM.ShowTeam
           and aS.Team and q.Team and aS.Team == q.Team then aU = true end
        if aU then aJ(aQ); if aQ.highlight then aQ.highlight.Enabled = false end; continue end

        local aV, _, aW = pcall(function() local aV, _ = aP:GetBoundingBox(); return aV, _ end)
        if not aV or not _ or not aW then aJ(aQ); continue end
        local aX = (_.Position - aO).Magnitude
        if aX > aM.MaxDistance then aJ(aQ); if aQ.highlight then aQ.highlight.Enabled = false end; continue end

        local aY = aL(aP)
        local aZ = ""
        if aM.Names then aZ = aP.Name end
        if aM.ShowOwner and aS then aZ = (aZ ~= "" and aZ .. " " or "") .. "[" .. aS.Name .. "]" end

        if aQ.billboard then
            aQ.billboard.Enabled = aM.Names or aM.ShowOwner or aM.Distance or aM.HealthText or aM.HealthBar
            aQ.nameLabel.Visible = (aM.Names or aM.ShowOwner) and aZ ~= ""
            if aQ.nameLabel.Visible then
                aQ.nameLabel.Text = aZ; aQ.nameLabel.TextColor3 = aM.Colors.Name; aQ.nameLabel.TextSize = aM.TextSize
            end
            aQ.distLabel.Visible = aM.Distance
            if aM.Distance then
                aQ.distLabel.Text = ("%d studs"):format(math.floor(aX))
                aQ.distLabel.TextColor3 = aM.Colors.Distance
                aQ.distLabel.TextSize = math.max(10, aM.TextSize - 2)
            end
            local a_ = aR             
local a0 = math.clamp(a_.Health / math.max(1, a_.MaxHealth), 0, 1)
            local a1 = aM.Colors.HealthLo:Lerp(aM.Colors.HealthHi, a0)
            if aQ.hpBg and aQ.hpBar then
                aQ.hpBg.Visible = aM.HealthBar; aQ.hpBar.Visible = aM.HealthBar
                if aM.HealthBar then aQ.hpBar.Size = UDim2.new(a0, 0, 1, 0); aQ.hpBar.BackgroundColor3 = a1 end
            end
            if aQ.hpText then
                aQ.hpText.Visible = aM.HealthText
                if aM.HealthText then
                    aQ.hpText.Text = ("%d / %d"):format(math.floor(a_.Health), math.floor(a_.MaxHealth))
                    aQ.hpText.TextColor3 = a1
                    aQ.hpText.TextSize = math.max(10, aM.TextSize - 2)
                end
            end
        end

        if aQ.boxPart and aQ.boxSel then
            if aM.Boxes then
                aQ.boxPart.CFrame = _; aQ.boxPart.Size = aW
                aQ.boxSel.Visible = true; aQ.boxSel.Color3 = aY
                aQ.boxSel.LineThickness = 0.02 + aM.BoxThickness * 0.04
                if aM.BoxType == "Filled" then
                    aQ.boxSel.SurfaceTransparency = 1 - aM.BoxFillTransparency
                    aQ.boxSel.SurfaceColor3 = aY
                else aQ.boxSel.SurfaceTransparency = 1 end
            else aQ.boxSel.Visible = false end
        end

        if aQ.tracer then
            local a_ = aM.Tracers and ((aT and aM.TracerOnPlayers) or (not aT and aM.TracerOnNPCs))
            if a_ then
                local a0 = _.Position
                if aM.TracerToHead then
                    local a1 = aP:FindFirstChild("Head")
                    if a1 and a1:IsA("BasePart") then a0 = a1.Position end
                end
                local a1= aN:WorldToViewportPoint(a0)
                local a2 = aN.ViewportSize
                local a3 = a1.Z > 0 and a1.X >= 0 and a1.X <= a2.X and a1.Y >= 0 and a1.Y <= a2.Y
                local a4 = (not aM.TracerOffscreenOnly) or (not a3)
                if a1.Z > 0 and a4 then
                    local a5 = Vector2.new(a1.X, a1.Y)
                    local a6                    
if aM.TracerOrigin == "Top" then a6 = Vector2.new(a2.X * 0.5, 0)
                    elseif aM.TracerOrigin == "Center" then a6 = Vector2.new(a2.X * 0.5, a2.Y * 0.5)
                    elseif aM.TracerOrigin == "Mouse" then local a7 = e:GetMouseLocation(); a6 = Vector2.new(a7.X, a7.Y)
                    else a6 = Vector2.new(a2.X * 0.5, a2.Y) end
                    local a7 = a5 - a6
                    local a8 = a7.Magnitude
                    local a9 = math.deg(math.atan2(a7.Y, a7.X))
                    local ba = math.max(1, aM.TracerThickness)
                    local bb = aM.Colors.Tracer
                    if aM.TracerRainbow then bb = Color3.fromHSV((tick() * aM.TracerRainbowSpeed) % 1, 1, 1)
                    elseif aM.TracerHealthColor and aR then
                        local bc = aR                         
local bd = math.clamp(bc.Health / math.max(1, bc.MaxHealth), 0, 1)
                        bb = aM.Colors.HealthLo:Lerp(aM.Colors.HealthHi, bd)
                    elseif aM.TracerTeamColor and aS and aS.Team and q.Team then
                        bb = (aS.Team == q.Team) and aM.Colors.Friendly or aM.Colors.Enemy
                    end
                    local bc = aM.TracerTransparency
                    if aM.TracerDistanceFade and aM.MaxDistance > 0 then
                        bc = math.clamp(bc + math.clamp(aX / aM.MaxDistance, 0, 1) * 0.75, 0, 1)
                    end
                    local bd = aQ.tracer
                    bd.Visible = true; bd.Position = UDim2.fromOffset(a6.X, a6.Y)
                    bd.Size = UDim2.fromOffset(math.max(a8, 1), ba); bd.Rotation = a9
                    bd.BackgroundColor3 = bb; bd.BackgroundTransparency = bc
                    local be = aM.TracerStyle
                    if be == "Glow" then
                        aQ.tracerGrad.Enabled = false; aQ.tracerGlow.Enabled = true
                        aQ.tracerGlow.Color = bb; aQ.tracerGlow.Transparency = math.min(bc + 0.3, 0.9)
                    elseif be == "Dashed" then
                        aQ.tracerGlow.Enabled = false; aQ.tracerGrad.Enabled = true
                        aQ.tracerGrad.Color = ColorSequence.new(bb)
                        local bf = {}
                        for bg = 0, 11 do
                            table.insert(bf, NumberSequenceKeypoint.new(bg / 11, (bg % 2 == 0) and 0 or 1))
                        end
                        aQ.tracerGrad.Transparency = NumberSequence.new(bf)
                    elseif be == "Gradient" then
                        aQ.tracerGlow.Enabled = false; aQ.tracerGrad.Enabled = true
                        aQ.tracerGrad.Color = ColorSequence.new(bb)
                        aQ.tracerGrad.Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0),
                        })
                    else
                        aQ.tracerGlow.Enabled = false; aQ.tracerGrad.Enabled = false
                    end
                    if aQ.tracerEndDot then
                        aQ.tracerEndDot.Visible = aM.TracerEndDot
                        if aM.TracerEndDot then
                            aQ.tracerEndDot.Position = UDim2.fromOffset(a5.X, a5.Y)
                            aQ.tracerEndDot.Size = UDim2.fromOffset(ba + 4, ba + 4)
                            aQ.tracerEndDot.BackgroundColor3 = bb
                            aQ.tracerEndDot.BackgroundTransparency = bc
                        end
                    end
                    if aQ.tracerOriginDot then
                        aQ.tracerOriginDot.Visible = aM.TracerOriginDot
                        if aM.TracerOriginDot then
                            aQ.tracerOriginDot.Position = UDim2.fromOffset(a6.X, a6.Y)
                            aQ.tracerOriginDot.Size = UDim2.fromOffset(ba + 4, ba + 4)
                            aQ.tracerOriginDot.BackgroundColor3 = bb
                            aQ.tracerOriginDot.BackgroundTransparency = bc
                        end
                    end
                else
                    aQ.tracer.Visible = false
                    if aQ.tracerEndDot    then aQ.tracerEndDot.Visible    = false end
                    if aQ.tracerOriginDot then aQ.tracerOriginDot.Visible = false end
                end
            else
                aQ.tracer.Visible = false
                if aQ.tracerEndDot    then aQ.tracerEndDot.Visible    = false end
                if aQ.tracerOriginDot then aQ.tracerOriginDot.Visible = false end
            end
        end

        if aQ.headBb and aQ.headDot then
            if aM.HeadDot then
                aQ.headBb.Enabled = true
                local a_ = math.max(6, aM.HeadDotRadius * 2)
                aQ.headBb.Size = UDim2.fromOffset(a_, a_)
                aQ.headDot.BackgroundColor3 = aM.Colors.HeadDot
            else aQ.headBb.Enabled = false end
        end

        local a_ = aM.Chams and ((aT and aM.ChamsOnPlayers) or (not aT and aM.ChamsOnNPCs))
        if a_ then
            if not aQ.highlight then
                aQ.highlight = Instance.new("Highlight"); aQ.highlight.Name = "JB_Chams"
            end
            local a0 = aQ.highlight
            local a1            
if aM.ChamsMode == "Rainbow" then a1 = Color3.fromHSV((tick() * aM.ChamsRainbowSpeed) % 1, 1, 1)
            elseif aM.ChamsMode == "Health-based" then
                local a2 = aR                 
local a3 = math.clamp(a2.Health / math.max(1, a2.MaxHealth), 0, 1)
                a1 = aM.Colors.HealthLo:Lerp(aM.Colors.HealthHi, a3)
            elseif aM.ChamsTeamColor and aS and aS.Team and q.Team then
                a1 = (aS.Team == q.Team) and aM.Colors.Friendly or aM.Colors.Enemy
            elseif aM.ChamsDualColor then
                a1 = aE(aP, aN) and aM.Colors.ChamsVisible or aM.Colors.ChamsOccluded
            else
                a1 = aT and aM.Colors.ChamsPlayer or aM.Colors.ChamsNPC
            end
            local a2 = aM.ChamsFillTransparency
            local a3 = 1 - aM.ChamsOutlineTransparency
            if aM.ChamsMode == "Outline Only" then a2 = 0
            elseif aM.ChamsMode == "Fill Only" then a3 = 0
            elseif aM.ChamsMode == "Pulse" then
                local a4 = (math.sin(tick() * math.pi * 2 * aM.ChamsPulseSpeed) + 1) * 0.5
                a2 *= a4; a3 *= a4
            end
            if aM.ChamsDistanceFade and aM.MaxDistance > 0 then
                local a4 = 1 - math.clamp(aX / aM.MaxDistance, 0, 1)
                a2 *= a4; a3 *= a4
            end
            a0.Adornee = aP; a0.FillColor = a1; a0.OutlineColor = aM.Colors.ChamsOutline
            a0.FillTransparency    = 1 - math.clamp(a2,    0, 1)
            a0.OutlineTransparency = 1 - math.clamp(a3, 0, 1)
            a0.DepthMode = (aM.ChamsDepth == "AlwaysOnTop") and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
            a0.Parent = aP; a0.Enabled = true
        elseif aQ.highlight then aQ.highlight.Enabled = false end
    end
end

function aD.add(aN)
    if aD.Entries[aN] then return end
    aD.Entries[aN] = aH(aN)
end
function aD.remove(aN)
    local aO = aD.Entries[aN]
    if aO then aI(aO) end
    aD.Entries[aN] = nil
end
function aD.enable()
    if aD.Active then return end
    aD.Active = true; aD.Settings.Enabled = true; aD.LastScan = 0
    local aN = 0
    w("ESP_RenderStepped", d.RenderStepped:Connect(function(aO)
        aN += aO; if aN < (1/30) then return end; aN = 0; aM()
    end))
    task.defer(function()
        local aO = aC()
        local aP = 0
        for aQ in pairs(aO) do
            if not aD.Entries[aQ] then aD.Entries[aQ] = aH(aQ) end
            aP += 1
        end
        aD.LastScanCount = aP; aD.LastScan = tick()
        y.notify("ESP", ("Tracking %d creature%s"):format(aP, aP == 1 and "" or "s"))
    end)
end
function aD.disable()
    aD.Active = false; aD.Settings.Enabled = false
    for aN in pairs(aD.Entries) do aD.remove(aN) end
    if u.ESP_RenderStepped then u.ESP_RenderStepped:Disconnect(); u.ESP_RenderStepped = nil end
    if aD.TracerGui then pcall(function() aD.TracerGui:Destroy() end); aD.TracerGui = nil end
end




local aN = {
    Enabled = false, Entries = {} ,
    Colors = {
        Berry    = Color3.fromRGB(230,  90, 130),
        Meat     = Color3.fromRGB(220,  90,  90),
        Fish     = Color3.fromRGB( 95, 175, 230),
        Wood     = Color3.fromRGB(160, 110,  60),
        Stone    = Color3.fromRGB(170, 170, 180),
        Fossil   = Color3.fromRGB(230, 220, 180),
        Egg      = Color3.fromRGB(240, 230, 200),
        Water    = Color3.fromRGB( 80, 180, 240),
        Iron     = Color3.fromRGB(150, 150, 160),
        Gold     = Color3.fromRGB(255, 215,  90),
        Diamond  = Color3.fromRGB( 90, 245, 255),
        Sapling  = Color3.fromRGB(120, 220, 130),
        Mushroom = Color3.fromRGB(210, 130, 210),
        Loot     = Color3.fromRGB(255, 200,  80),
        Default  = Color3.fromRGB(255, 200,   0),
    },
}
local aO=function(
aO)    
return ((aN.Colors ))[aO] or aN.Colors.Default
end local aP=function(
aP)    
if aP:IsA("BasePart") then return aP end
    if aP:IsA("Model") then
        return aP.PrimaryPart or (aP:FindFirstChild("HumanoidRootPart") )            
or aP:FindFirstChildWhichIsA("BasePart")
    end
    return nil
end local aQ=function(

aQ, aR)    
local aS = aP(aQ)
    if not aS then return nil end
    local aT = aO(aR)
    local aU = Instance.new("Highlight")
    aU.Name = "JurassicBlocky_ResourceESP_" .. b
    aU.FillColor = aT; aU.OutlineColor = Color3.new(1,1,1)
    aU.FillTransparency = 0.55; aU.OutlineTransparency = 0
    aU.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    aU.Adornee = aQ; aU.Parent = aQ
    local aV = Instance.new("BillboardGui")
    aV.Name = "JurassicBlocky_ResourceLabel_" .. b
    aV.AlwaysOnTop = true; aV.LightInfluence = 0
    aV.Size = UDim2.new(0,140,0,32); aV.StudsOffsetWorldSpace = Vector3.new(0,4,0)
    aV.Adornee = aS; aV.Parent = aS
    local aW = Instance.new("TextLabel")
    aW.BackgroundTransparency = 1; aW.Size = UDim2.new(1,0,0,16)
    aW.TextColor3 = aT; aW.TextStrokeTransparency = 0; aW.TextStrokeColor3 = Color3.new(0,0,0)
    aW.Font = Enum.Font.GothamSemibold; aW.TextSize = 13; aW.Text = aR; aW.Parent = aV
    local aX = Instance.new("TextLabel")
    aX.BackgroundTransparency = 1; aX.Position = UDim2.new(0,0,0,16); aX.Size = UDim2.new(1,0,0,14)
    aX.TextColor3 = Color3.fromRGB(225,228,235); aX.TextStrokeTransparency = 0; aX.TextStrokeColor3 = Color3.new(0,0,0)
    aX.Font = Enum.Font.Gotham; aX.TextSize = 11; aX.Text = "0 studs"; aX.Parent = aV
    return { inst = aQ, anchor = aS, typeName = aR, highlight = aU, billboard = aV, title = aW, dist = aX }
end local aR=function(

aR)    
if not aR then return end
    if aR.highlight then pcall(function() aR.highlight:Destroy() end) end
    if aR.billboard then pcall(function() aR.billboard:Destroy() end) end
end

function aN.clear()
    for aS, aT in pairs(aN.Entries) do
        aR(aT); aN.Entries[aS] = nil
    end
end
function aN.disable()
    aN.Enabled = false
    if u.ResourceESP_Tick then
        u.ResourceESP_Tick:Disconnect(); u.ResourceESP_Tick = nil
    end
    aN.clear()
end
function aN.rescan()
    if not aN.Enabled then return end
    local aS = al()
    if #aS == 0 then table.insert(aS, "Berry") end
    local aT= {}
    for aU, aV in ipairs(aS) do
        for aW, aX in ipairs(aj(aV)) do
            local aY = ao(aX); aT[aY] = aV
        end
    end
    for aU, aV in pairs(aT) do
        if not aN.Entries[aU] then
            local aW = aQ(aU, aV)
            if aW then aN.Entries[aU] = aW end
        end
    end
    for aU, aV in pairs(aN.Entries) do
        if not aT[aU] or not aU.Parent then
            aR(aV); aN.Entries[aU] = nil
        end
    end
end
function aN.enable()
    if aN.Enabled then return end
    aN.Enabled = true; aN.rescan()
    task.spawn(function()
        while v.value and aN.Enabled do
            aN.rescan(); task.wait(1.0)
        end
    end)
    local aS = 0
    u.ResourceESP_Tick = d.Heartbeat:Connect(function(aT)
        if not aN.Enabled or not t then return end
        aS += aT; if aS < 0.16 then return end; aS = 0
        local aU = t.Position
        for aV, aW in pairs(aN.Entries) do
            if aW.anchor and aW.anchor.Parent then
                local aX = (aW.anchor.Position - aU).Magnitude
                aW.dist.Text = ("%d studs"):format(math.floor(aX))
            else
                aR(aW); aN.Entries[aV] = nil
            end
        end
    end)
end




local aS = {}
function aS.toPosition(aT, aU)
    if not t then return end
    local aV = CFrame.new(aT)
    if aU then y.tweenTo(aV) else t.CFrame = aV end
end
function aS.toPlayer(aT, aU)
    local aV = c:FindFirstChild(aT)
    if not aV or not aV.Character then y.notify("Teleport", "Player not found."); return end
    local aW = aV.Character:FindFirstChild("HumanoidRootPart")
    if not aW then return end
    if aU then y.tweenTo(aW.CFrame + Vector3.new(0,0,3))
    elseif t then t.CFrame = aW.CFrame + Vector3.new(0,0,3) end
end




local aT = { Frame = nil , Gui = nil }
function aT.start()
    if aT.Frame then return end
    local aU= q:WaitForChild("PlayerGui")
    y.safe(function() if l then aU = l end end, "StatMonitor parent")
    local aV = Instance.new("ScreenGui")
    aV.Name = "JurassicBlocky_HUD_" .. b; aV.ResetOnSpawn = false
    aV.IgnoreGuiInset = true; aV.Parent = aU
    aT.Gui = aV
    local aW = Instance.new("Frame")
    aW.Name = "StatMonitor"; aW.AnchorPoint = Vector2.new(1, 0)
    aW.Position = UDim2.new(1,-10,0,10); aW.Size = UDim2.new(0,180,0,110)
    aW.BackgroundColor3 = o.GUIBackgroundColor; aW.BackgroundTransparency = 0.2
    aW.BorderSizePixel = 0; aW.Parent = aV
    Instance.new("UICorner", aW).CornerRadius = UDim.new(0,8)
    local aX = Instance.new("UIListLayout", aW)
    aX.Padding = UDim.new(0,2); aX.SortOrder = Enum.SortOrder.LayoutOrder
    aX.HorizontalAlignment = Enum.HorizontalAlignment.Left
    local aY = Instance.new("UIPadding", aW)
    aY.PaddingLeft = UDim.new(0,8); aY.PaddingTop = UDim.new(0,6)
    aT.Frame = aW
    task.spawn(function()
        while v.value and aT.Frame and aT.Frame.Parent do
            task.wait(0.5)
            if not p.StatMonitor then aT.Frame.Visible = false; continue end
            aT.Frame.Visible = true
            for aZ, a_ in ipairs(aT.Frame:GetChildren()) do
                if a_:IsA("TextLabel") then a_:Destroy() end
            end
            for aZ, a_ in ipairs({"Hunger","Thirst","Energy","Breath","Health"}) do
                local a0 = Q(a_)
                local a1 = Instance.new("TextLabel")
                a1.BackgroundTransparency = 1; a1.Size = UDim2.new(1,-8,0,18)
                a1.Font = Enum.Font.Gotham; a1.TextSize = 13
                a1.TextXAlignment = Enum.TextXAlignment.Left; a1.TextColor3 = Color3.new(1,1,1)
                a1.Text = ("%s: %s"):format(a_, a0 and tostring(math.floor(a0)) or "-")
                a1.Parent = aT.Frame
            end
        end
    end)
end
function aT.stop()
    if aT.Gui then aT.Gui:Destroy() end
    aT.Gui = nil; aT.Frame = nil
end




local aU = {
    Gui = nil , Labels = {} , Conn = nil,
    Visible = { FPS = true, Ping = true, Memory = false, Coords = false, Time = false },
    Anchor = "TopLeft",
    _fpsAccum = 0, _fpsFrames = 0, _fpsCurrent = 0,
}
local aV=function(aV)    
if aV == "TopRight"     then return Vector2.new(1,0), UDim2.new(1,-12,0,12) end
    if aV == "BottomLeft"   then return Vector2.new(0,1), UDim2.new(0,12,1,-12) end
    if aV == "BottomRight"  then return Vector2.new(1,1), UDim2.new(1,-12,1,-12) end
    return Vector2.new(0,0), UDim2.new(0,12,0,12)
end
function aU.start()
    if aU.Gui and aU.Gui.Parent then return end
    local aW = Instance.new("ScreenGui")
    aW.Name = "JurassicBlocky_InfoHUD_" .. b; aW.ResetOnSpawn = false; aW.IgnoreGuiInset = true; aW.DisplayOrder = 8
    local aX= _G
    if type(aX.gethui) == "function" then
        local aY, aZ = pcall(aX.gethui); if aY and aZ then aW.Parent = aZ end
    end
    if not aW.Parent then pcall(function() aW.Parent = l end) end
    if not aW.Parent then aW.Parent = q:WaitForChild("PlayerGui") end
    local aY, aZ = aV(aU.Anchor)
    local a_ = Instance.new("Frame")
    a_.Name = "Panel"; a_.AnchorPoint = aY; a_.Position = aZ
    a_.Size = UDim2.new(0,170,0,0); a_.AutomaticSize = Enum.AutomaticSize.Y
    a_.BackgroundColor3 = Color3.fromRGB(15,17,24); a_.BackgroundTransparency = 0.15
    a_.BorderSizePixel = 0; a_.Parent = aW
    Instance.new("UICorner", a_).CornerRadius = UDim.new(0,8)
    local a0 = Instance.new("UIStroke", a_)
    a0.Color = Color3.fromRGB(70,78,100); a0.Thickness = 1; a0.Transparency = 0.4
    local a1 = Instance.new("UIPadding", a_)
    a1.PaddingTop = UDim.new(0,8); a1.PaddingBottom = UDim.new(0,8)
    a1.PaddingLeft = UDim.new(0,10); a1.PaddingRight = UDim.new(0,10)
    local a2 = Instance.new("UIListLayout", a_)
    a2.FillDirection = Enum.FillDirection.Vertical
    a2.Padding = UDim.new(0,3); a2.SortOrder = Enum.SortOrder.LayoutOrder
local a3=function(a3, a4)        
local a5 = Instance.new("TextLabel")
        a5.Name = a3; a5.BackgroundTransparency = 1
        a5.Size = UDim2.new(1,0,0,16)
        a5.Font = Enum.Font.GothamSemibold; a5.TextSize = 12
        a5.TextColor3 = Color3.fromRGB(235,238,245)
        a5.TextXAlignment = Enum.TextXAlignment.Left
        a5.LayoutOrder = a4; a5.Text = a3 .. ": -"; a5.Parent = a_
        aU.Labels[a3] = a5
end    
a3("FPS",1); a3("Ping",2); a3("Memory",3); a3("Coords",4); a3("Time",5)
    aU.Gui = aW
    aU.Conn = d.RenderStepped:Connect(function(a4)
        aU._fpsAccum += a4; aU._fpsFrames += 1
        if aU._fpsAccum >= 0.5 then
            aU._fpsCurrent = math.floor(aU._fpsFrames / aU._fpsAccum + 0.5)
            aU._fpsAccum = 0; aU._fpsFrames = 0
        end
        for a5, a6 in pairs(aU.Labels) do a6.Visible = aU.Visible[a5] == true end
        if aU.Visible.FPS then
            local a5 = aU._fpsCurrent
            local a6 = a5 >= 50 and Color3.fromRGB(95,215,135)
                or a5 >= 30 and Color3.fromRGB(255,185,95)
                or Color3.fromRGB(245,105,120)
            aU.Labels.FPS.Text = ("FPS: %d"):format(a5); aU.Labels.FPS.TextColor3 = a6
        end
        if aU.Visible.Ping then
            local a5 = game:GetService("Stats")
            local a6, a7 = pcall(function() return a5.Network.ServerStatsItem["Data Ping"]:GetValue() end)
            local a8 = a6 and math.floor(a7) or -1
            local a9 = a8 < 100 and Color3.fromRGB(95,215,135)
                or a8 < 200 and Color3.fromRGB(255,185,95)
                or Color3.fromRGB(245,105,120)
            aU.Labels.Ping.Text = a8 >= 0 and ("Ping: %d ms"):format(a8) or "Ping: ?"
            aU.Labels.Ping.TextColor3 = a9
        end
        if aU.Visible.Memory then
            local a5 = game:GetService("Stats")
            aU.Labels.Memory.Text = ("Mem: %d MB"):format(math.floor(a5:GetTotalMemoryUsageMb()))
        end
        if aU.Visible.Coords then
            if r and r:FindFirstChild("HumanoidRootPart") then
                local a5 = ((r.HumanoidRootPart )).Position
                aU.Labels.Coords.Text = ("X %d  Y %d  Z %d"):format(math.floor(a5.X), math.floor(a5.Y), math.floor(a5.Z))
            else aU.Labels.Coords.Text = "Coords: -" end
        end
        if aU.Visible.Time then
            local a5 = m.ClockTime
            local a6 = math.floor(a5); local a7 = math.floor((a5 - a6) * 60)
            aU.Labels.Time.Text = ("Time: %02d:%02d"):format(a6, a7)
        end
    end)
end
function aU.stop()
    if aU.Conn then aU.Conn:Disconnect(); aU.Conn = nil end
    if aU.Gui then aU.Gui:Destroy() end
    aU.Gui = nil; aU.Labels = {}
end
function aU.refreshAnchor()
    if not aU.Gui then return end
    local aW = aU.Gui:FindFirstChild("Panel")
    if not aW or not aW:IsA("Frame") then return end
    local aX, aY = aV(aU.Anchor); aW.AnchorPoint = aX; aW.Position = aY
end




local aW = { StartTime = tick(), StartCoins = nil , LastCoins = nil , CoinsGained = 0, CoinsSpent = 0 }
local aX=function()    
local aX = q
    local aY= { aX }
    local aZ = aX:FindFirstChild("leaderstats"); if aZ then table.insert(aY, aZ) end
    local a_ = aX:FindFirstChild("Data") or aX:FindFirstChild("PlayerData"); if a_ then table.insert(aY, a_) end
    if r then table.insert(aY, r) end
    local a0 = J.Coins
    for a1, a2 in ipairs(aY) do
        for a3, a4 in ipairs(a2:GetDescendants()) do
            if (a4:IsA("NumberValue") or a4:IsA("IntValue")) then
                local a5 = a4.Name:lower()
                for a6, a7 in ipairs(a0) do
                    if a5 == a7:lower() then return a4 end
                end
            end
        end
    end
    return nil
end local aY=function()    

local aY = aX(); if not aY then return end
    local aZ = (aY ).Value
    if not aW.StartCoins then aW.StartCoins = aZ end
    if aW.LastCoins and aZ < aW.LastCoins then
        aW.CoinsSpent += (aW.LastCoins - aZ)
    end
    if aZ >= (aW.StartCoins or 0) then
        aW.CoinsGained = aZ - (aW.StartCoins or 0)
    end
    aW.LastCoins = aZ
end
task.spawn(function() while v.value and task.wait(1) do pcall(aY) end end)




local aZ = { Folder = "JurassicBlockyFramework_Configs" }
local a_=function()    
return type((_G ).writefile) == "function"
       and type((_G ).readfile) == "function"
       and type((_G ).isfile)   == "function"
end local a0=function()    

local a0= _G
    if type(a0.makefolder) == "function" and type(a0.isfolder) == "function" then
        if not a0.isfolder(aZ.Folder) then pcall(a0.makefolder, aZ.Folder) end
    end
end
function aZ.list()    
local a1= _G
    if type(a1.listfiles) ~= "function" then return {} end
    local a2= {}
    local a3, a4 = pcall(a1.listfiles, aZ.Folder)
    if not a3 or not a4 then return a2 end
    for a5, a6 in ipairs(a4) do
        local a7 = tostring(a6):match("([^/\\]+)%.json$") or tostring(a6):match("([^/\\]+)$")
        if a7 then table.insert(a2, a7) end
    end
    return a2
end
function aZ.save(a1, a2)    
if not a_() then return false, "Executor has no file-system functions" end
    if type(a1) ~= "string" or a1 == "" then return false, "Config name empty" end
    a0()
    local a3= { _version = 1, Toggles = {}, Options = {} }
    if a2 and a2.Toggles then
        for a4, a5 in pairs(a2.Toggles) do
            if type(a5) == "table" and a5.Value ~= nil then a3.Toggles[a4] = a5.Value end
        end
    end
    if a2 and a2.Options then
        for a4, a5 in pairs(a2.Options) do
            if type(a5) == "table" then
                local a6 = a5.Value
                if typeof(a6) == "Color3" then a3.Options[a4] = { _kind = "Color3", R = a6.R, G = a6.G, B = a6.B }
                elseif type(a6) == "table" then
                    local a7 = {}
                    for a8, a9 in pairs(a6) do
                        if type(a9) == "boolean" or type(a9) == "number" or type(a9) == "string" then a7[a8] = a9 end
                    end
                    a3.Options[a4] = a7
                elseif a6 ~= nil and (type(a6) == "boolean" or type(a6) == "number" or type(a6) == "string") then
                    a3.Options[a4] = a6
                end
            end
        end
    end
    local a4 = k:JSONEncode(a3)
    local a5, a6 = pcall((_G ).writefile, aZ.Folder .. "/" .. a1 .. ".json", a4)
    if not a5 then return false, tostring(a6) end
    return true
end
function aZ.load(a1, a2)    
if not a_() then return false, "Executor has no file-system functions" end
    local a3 = aZ.Folder .. "/" .. a1 .. ".json"
    if not (_G ).isfile(a3) then return false, "Config not found" end
    local a4, a5 = pcall((_G ).readfile, a3); if not a4 then return false, tostring(a5) end
    local a6, a7 = pcall(k.JSONDecode, k, a5); if not a6 then return false, "JSON parse error" end
    if not a2 then return false, "Library missing" end
    if a7.Toggles then
        for a8, a9 in pairs(a7.Toggles) do
            local ba = a2.Toggles[a8]; if ba and ba.SetValue then pcall(ba.SetValue, ba, a9) end
        end
    end
    if a7.Options then
        for a8, a9 in pairs(a7.Options) do
            local ba = a2.Options[a8]; if not ba then continue end
            if type(a9) == "table" and a9._kind == "Color3" then
                if ba.SetValueRGB then pcall(ba.SetValueRGB, ba, Color3.new(a9.R, a9.G, a9.B))
                elseif ba.SetValue then pcall(ba.SetValue, ba, Color3.new(a9.R, a9.G, a9.B)) end
            elseif type(a9) == "table" then
                if ba.SetValue then pcall(ba.SetValue, ba, a9) end
            else
                if ba.SetValue then pcall(ba.SetValue, ba, a9) end
            end
        end
    end
    return true
end
function aZ.delete(a1)    
local a2= _G
    if type(a2.delfile) ~= "function" then return false, "delfile not available" end
    local a3 = aZ.Folder .. "/" .. a1 .. ".json"
    if not a2.isfile(a3) then return false, "Config not found" end
    local a4, a5 = pcall(a2.delfile, a3)
    return a4, a4 and nil or tostring(a5)
end
local a1=function(



a1)    
local a2 = g.CurrentCamera
    if a2 then a2.FieldOfView = a1 end
end
local a2 = q.CameraMaxZoomDistance
local a3=function(a3)    
q.CameraMaxZoomDistance = a3 and math.huge or a2
end local a4=function(
a4)    
if not r then return end
    for a5, a6 in ipairs(r:GetDescendants()) do
        if a6:IsA("BasePart") then a6.LocalTransparencyModifier = a4 end
    end
end

local a5 = { Active = false, Saved = nil }
function a5.start()
    if a5.Active then return end
    a5.Saved = {
        Ambient = m.Ambient, OutdoorAmbient = m.OutdoorAmbient,
        Brightness = m.Brightness, ClockTime = m.ClockTime,
        FogEnd = m.FogEnd, FogStart = m.FogStart,
        GlobalShadows = m.GlobalShadows,
    }
    a5.Active = true
    m.Ambient = Color3.new(1,1,1); m.OutdoorAmbient = Color3.new(1,1,1)
    m.Brightness = 2; m.ClockTime = 14
    m.FogEnd = 1e9; m.FogStart = 1e9; m.GlobalShadows = false
end
function a5.stop()
    if not a5.Active or not a5.Saved then return end
    for a6, a7 in pairs(a5.Saved) do
        y.safe(function() (m )[a6] = a7 end, "FullBright." .. a6)
    end
    a5.Active = false; a5.Saved = nil
end

local a6= {}
local a7=function(a7)    
for a8, a9 in ipairs(m:GetChildren()) do
        if a9:IsA("PostEffect") then
            local ba = a9             
if not a7 then a6[a9] = ba.Enabled; ba.Enabled = false
            else ba.Enabled = a6[a9] ~= false end
        end
    end
end

local a8 = { "rain", "snow", "storm", "weather", "fog", "mist", "dust", "lightning", "blizzard" }
local a9=function(a9)    
local ba = a9:lower()
    for bb, bc in ipairs(a8) do if ba:find(bc, 1, true) then return true end end
    return false
end
local ba= {}
local bb=function(bb)local bc=function(
bc)        
for bd, be in ipairs(bc) do
            for bf, bg in ipairs(be:GetDescendants()) do
                if (bg:IsA("ParticleEmitter") or bg:IsA("Beam") or bg:IsA("Trail")) and a9(bg.Name) then
                    if not bb then ba[bg] = (bg ).Enabled; (bg ).Enabled = false
                    else (bg ).Enabled = ba[bg] ~= false end
                end
            end
        end
end    
bc({ g, m })
end

local bc= {}
local bd= {}
local be = false
local bf=function(bf)    
if bf and not be then
        be = true
        bd = { FogEnd = m.FogEnd, FogStart = m.FogStart, FogColor = m.FogColor }
        m.FogEnd = 1e9; m.FogStart = 1e9
        for bg, _ in ipairs(m:GetDescendants()) do
            if _:IsA("ColorCorrectionEffect") or _:IsA("BlurEffect")
               or _:IsA("DepthOfFieldEffect") or _:IsA("Atmosphere") then
                bc[_] = { Enabled = (_ ).Enabled }
                if _:IsA("Atmosphere") then bc[_].Density = _.Density; _.Density = 0
                else (_ ).Enabled = false end
            end
        end
    elseif (not bf) and be then
        be = false
        for bg, _ in pairs(bc) do
            if bg.Parent then
                if bg:IsA("Atmosphere") and _.Density ~= nil then (bg ).Density = _.Density end
                if _.Enabled ~= nil then (bg ).Enabled = _.Enabled end
            end
        end
        bc = {}
        for bg, _ in pairs(bd) do (m )[bg] = _ end
        bd = {}
    end
end

local bg = { Active = false, BV = nil , Gyro = nil , Conn = nil }
function bg.start()
    if bg.Active then return end
    if not t or not s then return end
    bg.Active = true
    local _ = Instance.new("BodyVelocity")
    _.Name = "JB_FlyVel_" .. b; _.MaxForce = Vector3.new(1,1,1) * 9e9
    _.Velocity = Vector3.new(); _.P = 1250; _.Parent = t; bg.BV = _
    local bh = Instance.new("BodyGyro")
    bh.Name = "JB_FlyGyro_" .. b; bh.MaxTorque = Vector3.new(1,1,1) * 9e9
    bh.P = 1250; bh.CFrame = t.CFrame; bh.Parent = t; bg.Gyro = bh
    bg.Conn = d.RenderStepped:Connect(function()
        if not (bg.Active and t and _.Parent and g.CurrentCamera) then return end
        local bi = g.CurrentCamera
        local bj = Vector3.new()
        if e:IsKeyDown(Enum.KeyCode.W) then bj = bj + bi.CFrame.LookVector end
        if e:IsKeyDown(Enum.KeyCode.S) then bj = bj - bi.CFrame.LookVector end
        if e:IsKeyDown(Enum.KeyCode.A) then bj = bj - bi.CFrame.RightVector end
        if e:IsKeyDown(Enum.KeyCode.D) then bj = bj + bi.CFrame.RightVector end
        if e:IsKeyDown(Enum.KeyCode.Space)       then bj = bj + Vector3.new(0,1,0) end
        if e:IsKeyDown(Enum.KeyCode.LeftControl) then bj = bj - Vector3.new(0,1,0) end
        _.Velocity = (bj.Magnitude > 0 and bj.Unit or Vector3.new()) * o.FlySpeed
        bh.CFrame = bi.CFrame
    end)
end
function bg.stop()
    bg.Active = false
    if bg.Conn then bg.Conn:Disconnect(); bg.Conn = nil end
    if bg.BV   then bg.BV:Destroy();      bg.BV   = nil end
    if bg.Gyro then bg.Gyro:Destroy();    bg.Gyro = nil end
end

local bh = { Active = false, Conn = nil , OldType = Enum.CameraType.Custom }
function bh.start()
    if bh.Active then return end
    local bi = g.CurrentCamera; if not bi then return end
    bh.Active = true; bh.OldType = bi.CameraType
    bi.CameraType = Enum.CameraType.Scriptable
    bh.Conn = d.RenderStepped:Connect(function(bj)
        if not bh.Active then return end
        bi = g.CurrentCamera; if not bi then return end
        local _ = o.FreecamSpeed * bj * 10
        local bk = Vector3.new()
        if e:IsKeyDown(Enum.KeyCode.W) then bk = bk + bi.CFrame.LookVector end
        if e:IsKeyDown(Enum.KeyCode.S) then bk = bk - bi.CFrame.LookVector end
        if e:IsKeyDown(Enum.KeyCode.A) then bk = bk - bi.CFrame.RightVector end
        if e:IsKeyDown(Enum.KeyCode.D) then bk = bk + bi.CFrame.RightVector end
        if e:IsKeyDown(Enum.KeyCode.E) then bk = bk + Vector3.new(0,1,0) end
        if e:IsKeyDown(Enum.KeyCode.Q) then bk = bk - Vector3.new(0,1,0) end
        bi.CFrame = bi.CFrame + bk * _
    end)
end
function bh.stop()
    if not bh.Active then return end
    bh.Active = false
    if bh.Conn then bh.Conn:Disconnect(); bh.Conn = nil end
    local bi = g.CurrentCamera; if bi then bi.CameraType = bh.OldType end
end
local bi=function()    




local bi= {}
    local bj = (rawget(_G, "getgenv") or (getfenv and getfenv(0).getgenv))     
if type(bj) == "function" then
        local bk, _ = pcall(bj)
        if bk and type(_) == "table" then table.insert(bi, _) end
    end
    table.insert(bi, _G )
    if type(shared) == "table" then table.insert(bi, shared ) end
    if getfenv then
        local bk, _ = pcall(getfenv, 0)
        if bk and type(_) == "table" then table.insert(bi, _ ) end
    end
    for bk, _ in ipairs(bi) do
        for bl, bm in ipairs({"request","http_request","httprequest"}) do
            local bn = _[bm]; if type(bn) == "function" then return bn, bm end
        end
        for bl, bm in ipairs({"syn","fluxus","http","Krnl","krnl","Synapse","secure"}) do
            local bn = _[bm]
            if type(bn) == "table" then
                for bo, bp in ipairs({"request","httprequest"}) do
                    local bq = bn[bp]; if type(bq) == "function" then return bq, bm .. "." .. bp end
                end
            end
        end
    end
    return nil, nil
end local bj=function(

bj, bk)    
if type(bj) ~= "string" or bj == "" then
        y.notify("Webhook", "URL is empty - paste a webhook link first."); return
    end
    if not bj:lower():find("^https?://") then
        y.notify("Webhook", "URL must start with https://"); return
    end
    local bl = k:JSONEncode(bk)
    local bm, bn = bi()
    task.spawn(function()
        if not bm then
            y.notify("Webhook", "No executor request function. Try a newer executor."); return
        end
        local bo, bp = pcall(bm, {
            Url = bj, Method = "POST",
            Headers = { ["Content-Type"] = "application/json" }, Body = bl,
        })
        if not bo then y.notify("Webhook", ("Threw: %s"):format(tostring(bp))); return end
        local bq = (type(bp) == "table") and (bp.StatusCode or bp.statusCode or bp.status or bp.Status) or nil
        if type(bq) == "number" then
            if bq >= 200 and bq < 300 then y.notify("Webhook", ("Sent OK (HTTP %d via %s)"):format(bq, bn or "?"))
            else y.notify("Webhook", ("Failed HTTP %d"):format(bq)) end
        else y.notify("Webhook", ("Sent (via %s)"):format(bn or "?")) end
    end)
end




local bk = { Installed = false, BlockedCount = 0, LastError = nil }
local bl=function()    
bk.LastError = nil
    local bl = c.LocalPlayer
    if not bl then bk.LastError = "no LocalPlayer"; return false, bk.LastError end
    local bm = A("hookmetamethod")
    local bn = A("hookfunction") or A("replaceclosure")
    local bo = A("newcclosure") or function(bo) return bo end
    local bp = false
    if type(bn) == "function" then
        local bq = pcall(function()
            local bq
            bq = bn(bl.Kick, bo(function(_, br)
                if _ == bl then
                    bk.BlockedCount += 1
                    warn(("[JurassicBlocky] [KickBypass] Blocked Kick: %s"):format(tostring(br)))
                    return
                end
                return bq(_, br)
            end))
        end)
        if bq then bp = true end
    end
    if type(bm) == "function" then
        local bq = A("getnamecallmethod")
        if type(bq) == "function" then
            local br = pcall(function()
                local br
                br = bm(game, "__namecall", function(_, ...)
                    if _ == bl and bq() == "Kick" then
                        bk.BlockedCount += 1
                        warn(("[JurassicBlocky] [KickBypass] Blocked __namecall Kick: %s"):format(tostring((...))))
                        return
                    end
                    return br(_, ...)
                end)
            end)
            if br then bp = true end
        end
    end
    if bp then bk.Installed = true; return true, "Kick hook installed" end
    bk.LastError = "no hooking primitives available"
    return false, bk.LastError
end






local bm = {} do
    local bn = {
        Jungle = {
            Background = Color3.fromRGB(20,26,22), BackgroundAlt = Color3.fromRGB(26,32,28),
            Sidebar = Color3.fromRGB(22,28,24), SidebarHi = Color3.fromRGB(30,38,32),
            Header = Color3.fromRGB(26,34,28), Surface = Color3.fromRGB(34,42,36),
            SurfaceAlt = Color3.fromRGB(42,52,44), SurfaceHi = Color3.fromRGB(54,66,56),
            Border = Color3.fromRGB(48,58,50), BorderLight = Color3.fromRGB(80,100,82),
            Text = Color3.fromRGB(235,242,232), TextDim = Color3.fromRGB(160,178,156),
            Subtle = Color3.fromRGB(100,118,98),
            Accent = Color3.fromRGB(85,200,110), AccentBright = Color3.fromRGB(140,230,150),
            AccentDim = Color3.fromRGB(60,160,80), AccentDeep = Color3.fromRGB(40,130,60),
            AccentCyan = Color3.fromRGB(110,220,170),
            Risky = Color3.fromRGB(245,105,120), RiskyDim = Color3.fromRGB(170,60,75),
            ToggleOff = Color3.fromRGB(50,60,52),
            Success = Color3.fromRGB(95,215,135), Warning = Color3.fromRGB(255,185,95),
            Tooltip = Color3.fromRGB(10,14,10), Shadow = Color3.new(0,0,0),
        },
        Indigo = {
            Background = Color3.fromRGB(15,17,24), BackgroundAlt = Color3.fromRGB(20,22,32),
            Sidebar = Color3.fromRGB(18,20,28), SidebarHi = Color3.fromRGB(26,30,42),
            Header = Color3.fromRGB(22,25,36), Surface = Color3.fromRGB(28,32,44),
            SurfaceAlt = Color3.fromRGB(38,43,58), SurfaceHi = Color3.fromRGB(48,54,72),
            Border = Color3.fromRGB(42,47,64), BorderLight = Color3.fromRGB(70,78,100),
            Text = Color3.fromRGB(238,241,248), TextDim = Color3.fromRGB(160,168,188),
            Subtle = Color3.fromRGB(100,108,128),
            Accent = Color3.fromRGB(120,162,255), AccentBright = Color3.fromRGB(160,195,255),
            AccentDim = Color3.fromRGB(70,105,200), AccentDeep = Color3.fromRGB(85,75,220),
            AccentCyan = Color3.fromRGB(110,220,245),
            Risky = Color3.fromRGB(245,105,120), RiskyDim = Color3.fromRGB(170,60,75),
            ToggleOff = Color3.fromRGB(48,52,68),
            Success = Color3.fromRGB(95,215,135), Warning = Color3.fromRGB(255,185,95),
            Tooltip = Color3.fromRGB(10,11,15), Shadow = Color3.new(0,0,0),
        },
        Midnight = {
            Background = Color3.fromRGB(5,6,10), BackgroundAlt = Color3.fromRGB(8,10,16),
            Sidebar = Color3.fromRGB(7,9,14), SidebarHi = Color3.fromRGB(12,14,22),
            Header = Color3.fromRGB(10,12,18), Surface = Color3.fromRGB(14,16,24),
            SurfaceAlt = Color3.fromRGB(20,23,33), SurfaceHi = Color3.fromRGB(28,32,44),
            Border = Color3.fromRGB(22,25,36), BorderLight = Color3.fromRGB(45,50,65),
            Text = Color3.fromRGB(230,235,245), TextDim = Color3.fromRGB(140,150,170),
            Subtle = Color3.fromRGB(85,92,110),
            Accent = Color3.fromRGB(140,180,255), AccentBright = Color3.fromRGB(180,210,255),
            AccentDim = Color3.fromRGB(80,115,195), AccentDeep = Color3.fromRGB(60,85,175),
            AccentCyan = Color3.fromRGB(95,195,230),
            Risky = Color3.fromRGB(245,105,120), RiskyDim = Color3.fromRGB(170,60,75),
            ToggleOff = Color3.fromRGB(30,33,45),
            Success = Color3.fromRGB(95,215,135), Warning = Color3.fromRGB(255,185,95),
            Tooltip = Color3.fromRGB(0,0,0), Shadow = Color3.new(0,0,0),
        },
        Crimson = {
            Background = Color3.fromRGB(24,10,14), BackgroundAlt = Color3.fromRGB(32,14,18),
            Sidebar = Color3.fromRGB(28,12,16), SidebarHi = Color3.fromRGB(44,20,26),
            Header = Color3.fromRGB(36,16,22), Surface = Color3.fromRGB(48,22,28),
            SurfaceAlt = Color3.fromRGB(64,30,38), SurfaceHi = Color3.fromRGB(82,40,50),
            Border = Color3.fromRGB(70,32,40), BorderLight = Color3.fromRGB(120,55,70),
            Text = Color3.fromRGB(250,235,235), TextDim = Color3.fromRGB(215,170,175),
            Subtle = Color3.fromRGB(145,100,110),
            Accent = Color3.fromRGB(255,75,90), AccentBright = Color3.fromRGB(255,120,130),
            AccentDim = Color3.fromRGB(210,50,70), AccentDeep = Color3.fromRGB(165,30,50),
            AccentCyan = Color3.fromRGB(255,145,145),
            Risky = Color3.fromRGB(255,165,60), RiskyDim = Color3.fromRGB(180,110,40),
            ToggleOff = Color3.fromRGB(64,28,36),
            Success = Color3.fromRGB(130,220,130), Warning = Color3.fromRGB(255,200,110),
            Tooltip = Color3.fromRGB(12,4,6), Shadow = Color3.new(0,0,0),
        },
    }

    local bo = "Jungle"
    do
        local bp = function(bp)
            return rawget(getfenv(0), bp)
                or (type(getgenv) == "function" and getgenv()[bp])
                or rawget(_G, bp)
        end
        local bq = bp("readfile")
        if type(bq) == "function" then
            local br, _ = pcall(function() return bq("JurassicBlockyFramework_Theme.txt") end)
            if br and type(_) == "string" then
                local bs = _:gsub("%s+", "")
                if bn[bs] then bo = bs end
            end
        end
    end

    local bp = {}
    for bq, br in pairs(bn[bo]) do bp[bq] = br end
    local bq = bo
local br=function(br)        
local bs = bn[br]
        if not bs then return false, "no such theme" end
        for _, bt in pairs(bs) do bp[_] = bt end
        bq = br
        local bt = function(bt)
            return rawget(getfenv(0), bt)
                or (type(getgenv) == "function" and getgenv()[bt])
                or rawget(_G, bt)
        end
        local _ = bt("writefile")
        if type(_) == "function" then pcall(function() _("JurassicBlockyFramework_Theme.txt", br) end) end
        return true
end
    
local bs = game:GetService("TweenService")
    local bt  = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local _ = TweenInfo.new(0.20, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local bu=function(
bu)return UDim.new(0, bu) end local bv=function(
bv, bw, bx)        
local by = Instance.new(bv)
        if bw then for bz, bA in pairs(bw) do (by )[bz] = bA end end
        if bx then for bz, bA in ipairs(bx) do bA.Parent = by end end
        return by
end local bw=function(
bw, bx)        
bv("UICorner", { CornerRadius = bu(bx), Parent = bw })
end local bx=function(
bx, by, bz, bA)        
return (bv("UIStroke", {
            Color = by, Thickness = bz or 1, Transparency = bA or 0,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Parent = bx,
        }) )end local by=function(

by, bz, bA)        
bv("UIPadding", {
            PaddingTop = bu(bz), PaddingBottom = bu(bz),
            PaddingLeft = bu(bA or bz), PaddingRight = bu(bA or bz), Parent = by,
        })
end local bz=function(
bz, bA, bB)        
return (bv("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = bB or Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder, Padding = bu(bA or 6), Parent = bz,
        }) )end local bA=function(

bA, bB, bC)        
if not bA then return nil end
        local bD, bE = pcall(function() return bs:Create(bA, bC or bt, bB) end)
        if not bD or not bE then return nil end
        pcall(function() bE:Play() end); return bE
end local bB=function(

bB, bC)        
local bD = Instance.new("UIGradient")
        bD.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   bp.Accent),
            ColorSequenceKeypoint.new(0.5, bp.AccentCyan),
            ColorSequenceKeypoint.new(1,   bp.AccentDeep),
        })
        bD.Rotation = bC and 90 or 0; bD.Parent = bB
        return bD
end local bC=function(
bC, bD, bE)        
local bF = Instance.new("UIGradient")
        bF.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, bD), ColorSequenceKeypoint.new(1, bE) })
        bF.Rotation = 90; bF.Parent = bC
        return bF
end local bD=function(
bD)        
local bE= _G
        local bF        
if type(bE.gethui) == "function" then
            local bG, bH = pcall(bE.gethui); if bG and bH then bF = bH end
        end
        if not bF then
            local bG, bH = pcall(function() return l end); if bG and bH then bF = bH end
        end
        if not bF then bF = q:WaitForChild("PlayerGui") end
        bD.Parent = bF
end
    
local bE= {}
    bE.Toggles = {}
    bE.Options = {}
    bE.Unloaded = false
    bE.NotifySide = "Right"
    bE.ShowCustomCursor = false
    bE.ForceCheckbox = false
    bE.ShowToggleFrameInKeybinds = true
    bE.MinimizeKey = Enum.KeyCode.RightControl
    bE.ToggleKeybind = nil
    bE._unloadHooks = {}
    bE._dpi = 1
    bE._connections = {}
    bE._searchable = {}     
bE._activeTab = nil
    bE._ThemePresets = bn
    bE.CurrentTheme = bq
    function bE:SetTheme(bF)
        local bG, bH = br(bF)
        if bG then bE.CurrentTheme = bq end
        return bG, bH
    end
    function bE:_track(bF) table.insert(self._connections, bF); return bF end
    function bE:OnUnload(bF) table.insert(self._unloadHooks, bF) end
    function bE:Unload()
        if self.Unloaded then return end
        self.Unloaded = true
        v.value = false
        for bF, bG in ipairs(self._unloadHooks) do pcall(bG) end
        for bF, bG in ipairs(self._connections) do pcall(function() bG:Disconnect() end) end
        if self._gui  then pcall(function() self._gui:Destroy()  end) end
        if self._note then pcall(function() self._note:Destroy() end) end
    end
    function bE:SetNotifySide(bF) self.NotifySide = bF end
    function bE:SetDPIScale(bF) self._dpi = (bF or 100) / 100; if self._uiScale then self._uiScale.Scale = self._dpi end end

    
    local bF = 240
local bG=function()        
local bG = bv("ScreenGui", {
            Name = "JurassicBlocky_Notify_" .. b, ResetOnSpawn = false,
            IgnoreGuiInset = true, DisplayOrder = 100,
        })
        local bH = bv("Frame", {
            AnchorPoint = Vector2.new(1,1), Position = UDim2.new(1,-12,1,-12),
            Size = UDim2.new(0, bF, 1, -24), BackgroundTransparency = 1, Parent = bG,
        })
        bv("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            SortOrder = Enum.SortOrder.LayoutOrder, Padding = bu(6), Parent = bH,
        })
        bE._noteStack = bH
        bD(bG); bE._note = bG
end    
function bE:Notify(bH)
        if type(bH) == "string" then bH = { Title = "NameHub", Description = bH } end
        local bI = bH.Title or "Notice"
        local bJ  = bH.Description or bH.Content or ""
        local bK   = bH.Time or 4
        if not self._noteStack then bG() end
        local bL = (self.NotifySide == "Left")
        local bM= self._noteStack
        if bL then
            bM.AnchorPoint = Vector2.new(0,1); bM.Position = UDim2.new(0,12,1,-12)
            local bN = bM:FindFirstChildWhichIsA("UIListLayout")
            if bN then (bN ).HorizontalAlignment = Enum.HorizontalAlignment.Left end
        else
            bM.AnchorPoint = Vector2.new(1,1); bM.Position = UDim2.new(1,-12,1,-12)
            local bN = bM:FindFirstChildWhichIsA("UIListLayout")
            if bN then (bN ).HorizontalAlignment = Enum.HorizontalAlignment.Right end
        end
        local bN = bv("Frame", {
            Size = UDim2.new(0, bF, 0, 0), AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = bp.Surface, BorderSizePixel = 0, BackgroundTransparency = 1, Parent = self._noteStack,
        })
        bw(bN, 6); bx(bN, bp.Border, 1, 0.3); by(bN, 8)
        bv("UIListLayout", { FillDirection = Enum.FillDirection.Vertical, Padding = bu(2), Parent = bN })
        local bO = bv("TextLabel", {
            Size = UDim2.new(1,0,0,16), BackgroundTransparency = 1, TextTransparency = 1,
            Font = Enum.Font.GothamSemibold, TextSize = 13, Text = bI,
            TextColor3 = bp.Text, TextXAlignment = Enum.TextXAlignment.Left, Parent = bN, LayoutOrder = 1,
        })
        local bP = bv("TextLabel", {
            Size = UDim2.new(1,0,0,0), AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1, TextTransparency = 1,
            Font = Enum.Font.Gotham, TextSize = 11, Text = bJ, TextWrapped = true,
            TextColor3 = bp.TextDim, TextXAlignment = Enum.TextXAlignment.Left, Parent = bN, LayoutOrder = 2,
        })
        bA(bN,    {BackgroundTransparency = 0}, _)
        bA(bO, {TextTransparency = 0}, _)
        bA(bP,  {TextTransparency = 0}, _)
        task.delay(bK, function()
            if bN and bN.Parent then
                bA(bN,    {BackgroundTransparency = 1}, bt)
                bA(bO, {TextTransparency = 1}, bt)
                bA(bP,  {TextTransparency = 1}, bt)
                task.wait(0.14); bN:Destroy()
            end
        end)
    end

    local bH = {
        Main = "M", Player = "P", Visuals = "V", Misc = "+",
        Missions = "!", Teleport = "T", Stats = "S", Settings = "*",
    }
local bI=function(bI)        
return bH[bI] or (bI:sub(1, 1):upper())
end
    
function bE:CreateWindow(bJ)
        bJ = bJ or {}
        local bK  = bJ.Title  or "NameHub"
        local bL = bJ.Footer or ""
        self.NotifySide  = bJ.NotifySide or "Right"

        local bM = bv("ScreenGui", {
            Name = "JurassicBlocky_UI_" .. b, ResetOnSpawn = false,
            IgnoreGuiInset = true, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = 10,
        })
        self._gui = bM
        local bN = (bv("UIScale", { Scale = self._dpi, Parent = bM }) )        
self._uiScale = bN

        local bO = bv("ImageLabel", {
            AnchorPoint = Vector2.new(0.5,0.5), Position = UDim2.new(0.5,0,0.5,30),
            Size = UDim2.new(0,980,0,680), BackgroundTransparency = 1,
            Image = "rbxassetid://5028857084", ImageColor3 = Color3.new(0,0,0), ImageTransparency = 0.55,
            ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(24,24,276,276), Parent = bM,
        })
        local bP = bv("ImageLabel", {
            AnchorPoint = Vector2.new(0.5,0.5), Position = UDim2.new(0.5,0,0.5,14),
            Size = UDim2.new(0,940,0,660), BackgroundTransparency = 1,
            Image = "rbxassetid://5028857084", ImageColor3 = Color3.new(0,0,0), ImageTransparency = 0.3,
            ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(24,24,276,276), Parent = bM,
        })
        local bQ = bv("ImageLabel", {
            AnchorPoint = Vector2.new(0.5,0.5), Position = UDim2.new(0.5,0,0.5,0),
            Size = UDim2.new(0,920,0,640), BackgroundTransparency = 1,
            Image = "rbxassetid://5028857084", ImageColor3 = bp.Accent, ImageTransparency = 0.78,
            ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(24,24,276,276), Parent = bM,
        })

        local bR = bv("Frame", {
            Name = "Window", AnchorPoint = Vector2.new(0.5,0.5), Position = UDim2.new(0.5,0,0.5,0),
            Size = UDim2.new(0,880,0,600), BackgroundColor3 = bp.Background,
            BorderSizePixel = 0, ClipsDescendants = true, Parent = bM,
        })
        bw(bR, 16); bC(bR, bp.BackgroundAlt, bp.Background); bx(bR, bp.Border, 1)
        bv("UIStroke", {
            Color = bp.BorderLight, Thickness = 1, Transparency = 0.6,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Parent = bR,
        })
        local bS = bv("Frame", {
            Size = UDim2.new(1,0,0,3), BackgroundColor3 = bp.Accent,
            BorderSizePixel = 0, ZIndex = 5, Parent = bR,
        })
        bB(bS)

        local bT = bv("Frame", {
            Position = UDim2.new(0,0,0,3), Size = UDim2.new(1,0,0,54),
            BackgroundColor3 = bp.Header, BorderSizePixel = 0, Parent = bR,
        })
        bC(bT, bp.Header, bp.Background)
        local bU = bv("Frame", {
            Position = UDim2.new(0,0,1,-1), Size = UDim2.new(1,0,0,1),
            BackgroundColor3 = bp.Border, BorderSizePixel = 0, Parent = bT,
        })
        local bV = bB(bU)
        ;(bV ).Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0.2), NumberSequenceKeypoint.new(1, 1),
        })

        local bW = bv("Frame", {
            Position = UDim2.new(0,14,0,0), Size = UDim2.new(0,200,1,0),
            BackgroundTransparency = 1, Parent = bT,
        })
        bv("ImageLabel", {
            AnchorPoint = Vector2.new(0.5,0.5), Position = UDim2.new(0,19,0.5,0),
            Size = UDim2.new(0,48,0,48), BackgroundTransparency = 1,
            Image = "rbxassetid://5028857084", ImageColor3 = bp.Accent, ImageTransparency = 0.55,
            ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(24,24,276,276), Parent = bW, ZIndex = 0,
        })
        local bX = bv("Frame", {
            AnchorPoint = Vector2.new(0,0.5), Position = UDim2.new(0,4,0.5,0),
            Size = UDim2.new(0,28,0,28), BackgroundColor3 = bp.Accent, BorderSizePixel = 0,
            Parent = bW, ZIndex = 2,
        })
        bw(bX, 14); bB(bX)
        local bY = bv("TextLabel", {
            Position = UDim2.new(0,44,0,0), Size = UDim2.new(1,-44,1,0),
            BackgroundTransparency = 1, Text = bK, TextColor3 = bp.Text,
            Font = Enum.Font.GothamBold, TextSize = 18,
            TextXAlignment = Enum.TextXAlignment.Left, Parent = bW,
        })
        bW.Size = UDim2.new(0, 48 + bY.TextBounds.X + 14, 1, 0)

        local bZ = bv("Frame", {
            AnchorPoint = Vector2.new(0,0.5), Position = UDim2.new(0,220,0.5,0),
            Size = UDim2.new(1,-390,0,32), BackgroundColor3 = bp.Surface,
            BorderSizePixel = 0, Parent = bT,
        })
        bw(bZ, 8); local b_ = bx(bZ, bp.Border, 1, 0.3)
        local b0 = bv("Frame", {
            Position = UDim2.new(0,10,0.5,-6), Size = UDim2.new(0,12,0,12),
            BackgroundTransparency = 1, Parent = bZ,
        })
        local b1 = bv("Frame", {
            Size = UDim2.new(0,8,0,8), Position = UDim2.new(0,0,0,0),
            BackgroundTransparency = 1, BorderSizePixel = 0, Parent = b0,
        })
        bw(b1, 4); bx(b1, bp.TextDim, 1.5)
        bv("Frame", {
            Position = UDim2.new(0,7,0,7), Size = UDim2.new(0,4,0,1.5),
            BackgroundColor3 = bp.TextDim, BorderSizePixel = 0, Rotation = 45, Parent = b0,
        })
        local b2 = (bv("TextBox", {
            Position = UDim2.new(0,30,0,0), Size = UDim2.new(1,-36,1,0),
            BackgroundTransparency = 1, Text = "", PlaceholderText = "Search features...",
            Font = Enum.Font.Gotham, TextSize = 13, TextColor3 = bp.Text,
            PlaceholderColor3 = bp.Subtle, ClearTextOnFocus = false,
            TextXAlignment = Enum.TextXAlignment.Left, Parent = bZ,
        }) )        
b2.Focused:Connect(function()
            bA(b_, {Color = bp.Accent, Transparency = 0})
            bA(bZ,    {BackgroundColor3 = bp.SurfaceAlt})
        end)
        b2.FocusLost:Connect(function()
            bA(b_, {Color = bp.Border, Transparency = 0.3})
            bA(bZ,    {BackgroundColor3 = bp.Surface})
        end)
        local b3 = bv("TextLabel", {
            AnchorPoint = Vector2.new(1,0.5), Position = UDim2.new(1,-16,0.5,0),
            Size = UDim2.new(0,80,1,0), BackgroundTransparency = 1, Text = ":: drag",
            Font = Enum.Font.GothamMedium, TextSize = 12, TextColor3 = bp.Subtle,
            TextXAlignment = Enum.TextXAlignment.Right, Parent = bT,
        })

        b2:GetPropertyChangedSignal("Text"):Connect(function()
            local b4 = b2.Text:lower()
            for b5, b6 in ipairs(bE._searchable) do
                local b7 = (b6.parentTab == bE._activeTab) or (b6.parentTab == nil)
                if b4 == "" then b6.row.Visible = true
                else b6.row.Visible = b7 and (b6.label:lower():find(b4, 1, true) ~= nil) end
            end
        end)

        local b4 = bv("Frame", {
            Position = UDim2.new(0,0,0,57), Size = UDim2.new(1,0,1,-77),
            BackgroundTransparency = 1, Parent = bR,
        })
        local b5 = bv("Frame", {
            Size = UDim2.new(0,160,1,0), BackgroundColor3 = bp.Sidebar,
            BorderSizePixel = 0, Parent = b4,
        })
        bC(b5, bp.SidebarHi, bp.Sidebar)
        bv("Frame", {
            Position = UDim2.new(1,-1,0,0), Size = UDim2.new(0,1,1,0),
            BackgroundColor3 = bp.Border, BorderSizePixel = 0, ZIndex = 2, Parent = b5,
        })
        local b6 = bv("Frame", {
            Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1, ZIndex = 2, Parent = b5,
        })
        by(b6, 12, 10); bz(b6, 4, Enum.HorizontalAlignment.Left)
        local b7 = bv("Frame", {
            Position = UDim2.new(0,4,0,12), Size = UDim2.new(0,3,0,30),
            BackgroundColor3 = bp.Accent, BorderSizePixel = 0, Visible = false,
            ZIndex = 5, Parent = b5,
        })
        bw(b7, 2); bB(b7, true)

        local b8 = bv("Frame", {
            Position = UDim2.new(0,160,0,0), Size = UDim2.new(1,-160,1,0),
            BackgroundTransparency = 1, Parent = b4,
        })
        local b9 = bv("TextLabel", {
            Position = UDim2.new(0,0,1,-20), Size = UDim2.new(1,0,0,20),
            BackgroundTransparency = 1, Text = bL, TextColor3 = bp.Subtle,
            Font = Enum.Font.Gotham, TextSize = 11, Parent = bR,
        })
local ca=function(
ca, cb, cc, cd)            
local ce = (bv("TextButton", {
                AnchorPoint = Vector2.new(1,0.5), Position = UDim2.new(1,cb,0.5,0),
                Size = UDim2.new(0,20,0,20), BackgroundColor3 = cc, BorderSizePixel = 0,
                Text = ca, Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = bp.Text,
                AutoButtonColor = false, Parent = bT,
            }) )            
bw(ce, 4)
            ce.MouseEnter:Connect(function() bA(ce, {BackgroundColor3 = cd}) end)
            ce.MouseLeave:Connect(function() bA(ce, {BackgroundColor3 = cc}) end)
            return ce
end        
local cb = ca("X", -100, bp.RiskyDim, bp.Risky)
        local cc   = ca("-", -124, bp.Surface,  bp.SurfaceAlt)
        cb.MouseButton1Click:Connect(function() bE:Unload() end)
        b3.Size = UDim2.new(0,50,1,0); b3.Position = UDim2.new(1,-154,0.5,0)

        local cd, ce, cf = false, Vector2.new(), bR.Position
local cg=function(cg)            
cg.InputBegan:Connect(function(ch)
                if ch.UserInputType == Enum.UserInputType.MouseButton1 or ch.UserInputType == Enum.UserInputType.Touch then
                    cd = true; ce = ch.Position; cf = bR.Position
                end
            end)
            cg.InputEnded:Connect(function(ch)
                if ch.UserInputType == Enum.UserInputType.MouseButton1 or ch.UserInputType == Enum.UserInputType.Touch then
                    cd = false
                end
            end)
end        
cg(bT)
        bE:_track(e.InputChanged:Connect(function(ch)
            if cd and (ch.UserInputType == Enum.UserInputType.MouseMovement or ch.UserInputType == Enum.UserInputType.Touch) then
                local ci = ch.Position - ce
                local cj = UDim2.new(cf.X.Scale, cf.X.Offset + ci.X, cf.Y.Scale, cf.Y.Offset + ci.Y)
                bR.Position = cj
                bP.Position = UDim2.new(cj.X.Scale, cj.X.Offset, cj.Y.Scale, cj.Y.Offset + 8)
            end
        end))

        local ch= { Tabs = {}, _activeTab = nil }
        ch._root = bR; ch._sidebar = b5; ch._content = b8
local ci=function(
ci)            
if not ci then b7.Visible = false; return end
            b7.Visible = true
            local cj = ci.AbsolutePosition - b5.AbsolutePosition
            bA(b7, {
                Position = UDim2.new(0,4,0, cj.Y + 4),
                Size = UDim2.new(0,3,0, math.max(ci.AbsoluteSize.Y - 8, 18)),
            })
end local cj=function(

cj)            
for ck, cl in pairs(ch.Tabs) do
                local cm = (ck == cj)
                cl._page.Visible = cm
                if cl._row then
                    bA(cl._row, {
                        BackgroundColor3 = cm and bp.SurfaceAlt or bp.Surface,
                        BackgroundTransparency = cm and 0 or 0.55,
                    })
                end
                if cl._icon then bA(cl._icon, {TextColor3 = cm and bp.Accent or bp.TextDim}) end
                if cl._name then bA(cl._name, {TextColor3 = cm and bp.Accent or bp.Text}) end
                if cm then ci(cl._row) end
            end
            ch._activeTab = cj
            bE._activeTab = cj
            if b2.Text ~= "" then
                local ck = b2.Text:lower()
                for cl, cm in ipairs(bE._searchable) do
                    local cn = (cm.parentTab == cj) or (cm.parentTab == nil)
                    cm.row.Visible = cn and (cm.label:lower():find(ck, 1, true) ~= nil)
                end
            end
end
        
function ch:AddTab(ck, cl)
            local cm = bv("Frame", {
                Size = UDim2.new(1,0,0,34), BackgroundColor3 = bp.Surface,
                BackgroundTransparency = 0.75, BorderSizePixel = 0, ZIndex = 3, Parent = b6,
            })
            bw(cm, 8)
            local cn = (bv("TextButton", {
                Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1,
                Text = "", AutoButtonColor = false, ZIndex = 4, Parent = cm,
            }) )            
local co = bv("TextLabel", {
                Position = UDim2.new(0,14,0,0), Size = UDim2.new(0,20,1,0),
                BackgroundTransparency = 1, Text = bI(ck),
                Font = Enum.Font.GothamBold, TextSize = 15, TextColor3 = bp.TextDim,
                TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 5, Parent = cm,
            })
            local cp = bv("TextLabel", {
                Position = UDim2.new(0,38,0,0), Size = UDim2.new(1,-40,1,0),
                BackgroundTransparency = 1, Text = ck,
                Font = Enum.Font.GothamSemibold, TextSize = 13, TextColor3 = bp.Text,
                TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 5, Parent = cm,
            })
            cn.MouseEnter:Connect(function() if ch._activeTab ~= ck then bA(cm, {BackgroundTransparency = 0.5}, bt) end end)
            cn.MouseLeave:Connect(function() if ch._activeTab ~= ck then bA(cm, {BackgroundTransparency = 0.75}, bt) end end)

            local cq = bv("Frame", {
                Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1, Visible = false, Parent = b8,
            })
            by(cq, 12, 16)

            local cr = bv("ScrollingFrame", {
                Size = UDim2.new(0.5,-8,1,0), BackgroundTransparency = 1, BorderSizePixel = 0,
                CanvasSize = UDim2.new(0,0,0,0), AutomaticCanvasSize = Enum.AutomaticSize.Y,
                ScrollBarThickness = 3, ScrollBarImageColor3 = bp.BorderLight, Parent = cq,
            })
            bz(cr, 12, Enum.HorizontalAlignment.Center); by(cr, 0, 2)
            local cs = bv("ScrollingFrame", {
                Position = UDim2.new(0.5,8,0,0), Size = UDim2.new(0.5,-8,1,0),
                BackgroundTransparency = 1, BorderSizePixel = 0,
                CanvasSize = UDim2.new(0,0,0,0), AutomaticCanvasSize = Enum.AutomaticSize.Y,
                ScrollBarThickness = 3, ScrollBarImageColor3 = bp.BorderLight, Parent = cq,
            })
            bz(cs, 12, Enum.HorizontalAlignment.Center); by(cs, 0, 2)

            local ct= { _btn = cn, _icon = co, _name = cp,
                _page = cq, _row = cm, _left = cr, _right = cs, _tabName = ck }
local cu=function(
cu, cv)                
local cw = bv("Frame", {
                    Size = UDim2.new(1,0,0,0), AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = bp.Surface, BorderSizePixel = 0,
                    BackgroundTransparency = 0.15, Parent = cu,
                })
                bw(cw, 10); bx(cw, bp.Border, 1, 0.4)
                bv("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new(bp.Surface, bp.BackgroundAlt),
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.05),
                        NumberSequenceKeypoint.new(1, 0.35),
                    }),
                    Parent = cw,
                })
                bv("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Parent = cw, Padding = bu(6) })
                by(cw, 10, 12)
                local cx = bv("Frame", { Size = UDim2.new(1,0,0,22), BackgroundTransparency = 1, Parent = cw, LayoutOrder = 1 })
                local cy = bv("Frame", {
                    AnchorPoint = Vector2.new(0,0.5), Position = UDim2.new(0,0,0.5,0),
                    Size = UDim2.new(0,7,0,7), BackgroundColor3 = bp.Accent,
                    BorderSizePixel = 0, Parent = cx,
                })
                bw(cy, 4); bB(cy)
                bv("TextLabel", {
                    Position = UDim2.new(0,16,0,0), Size = UDim2.new(1,-16,1,0),
                    BackgroundTransparency = 1, Text = cv,
                    Font = Enum.Font.GothamBold, TextSize = 13, TextColor3 = bp.Text,
                    TextXAlignment = Enum.TextXAlignment.Left, Parent = cx,
                })
                local cz = bv("Frame", {
                    Size = UDim2.new(1,0,0,1), BackgroundColor3 = bp.Border,
                    BorderSizePixel = 0, Parent = cw, LayoutOrder = 2,
                })
                local cA = bB(cz)
                ;(cA ).Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.1),
                    NumberSequenceKeypoint.new(0.7, 0.6),
                    NumberSequenceKeypoint.new(1, 1),
                })
                local cB = bv("Frame", {
                    Size = UDim2.new(1,0,0,0), AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundTransparency = 1, Parent = cw, LayoutOrder = 3,
                })
                bz(cB, 7, Enum.HorizontalAlignment.Center)
                return bm._makeContainer(cw, cB, ck)
end local cv=function(
cv)                
local cw = bv("Frame", {
                    Size = UDim2.new(1,0,0,0), AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundTransparency = 1, Parent = cv,
                })
                bv("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Parent = cw, Padding = bu(4) })
                local cx = bv("Frame", { Size = UDim2.new(1,0,0,22), BackgroundTransparency = 1, Parent = cw, LayoutOrder = 1 })
                bv("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, Padding = bu(14),
                    SortOrder = Enum.SortOrder.LayoutOrder, Parent = cx,
                })
                local cy = bv("Frame", {
                    Size = UDim2.new(1,0,0,0), AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundTransparency = 1, Parent = cw, LayoutOrder = 2,
                })
                bz(cy, 6, Enum.HorizontalAlignment.Center)
                local cz= { _subTabs = {}, _activeSubtab = nil }
local cA=function(cA)                    
for cB, cC in pairs(cz._subTabs) do
                        local cD = (cB == cA)
                        cC._page.Visible = cD
                        bA(cC._btn, {TextColor3 = cD and bp.Accent or bp.TextDim})
                    end
                    cz._activeSubtab = cA
end                
function cz:AddTab(cB)
                    local cC = (bv("TextButton", {
                        Size = UDim2.new(0,0,1,0), AutomaticSize = Enum.AutomaticSize.X,
                        BackgroundTransparency = 1, AutoButtonColor = false,
                        Text = cB, Font = Enum.Font.GothamSemibold, TextSize = 13,
                        TextColor3 = bp.TextDim, Parent = cx,
                    }) )                    
local cD = bv("Frame", {
                        Size = UDim2.new(1,0,0,0), AutomaticSize = Enum.AutomaticSize.Y,
                        BackgroundTransparency = 1, Visible = false, Parent = cy,
                    })
                    bz(cD, 6, Enum.HorizontalAlignment.Center)
                    local cE = bm._makeContainer(cw, cD, ck)
                    cE._btn = cC; cE._page = cD
                    cz._subTabs[cB] = cE
                    cC.MouseButton1Click:Connect(function() cA(cB) end)
                    if cz._activeSubtab == nil then cA(cB) end
                    return cE
                end
                return cz
end            
function ct:AddLeftGroupbox(cw, cx)  return cu(cr,  cw) end
            function ct:AddRightGroupbox(cw, cx) return cu(cs, cw) end
            function ct:AddLeftGroupBox(cw, cx)  return cu(cr,  cw) end
            function ct:AddRightGroupBox(cw, cx) return cu(cs, cw) end
            function ct:AddLeftTabbox()  return cv(cr)  end
            function ct:AddRightTabbox() return cv(cs) end

            ch.Tabs[ck] = ct
            cn.MouseButton1Click:Connect(function() cj(ck) end)
            if not ch._activeTab then task.defer(function() cj(ck) end) end
            return ct
        end

        local ck = false
        cc.MouseButton1Click:Connect(function()
            ck = not ck
            b4.Visible = not ck; b9.Visible = not ck
            bA(bR,   {Size = ck and UDim2.new(0,800,0,44) or UDim2.new(0,800,0,520)}, _)
            bA(bP, {ImageTransparency = ck and 0.75 or 0.5})
        end)

        bE:_track(e.InputBegan:Connect(function(cl, cm)
            if cm then return end
            local cn = bE.ToggleKeybind and bE.ToggleKeybind.Value
            if cn and cl.KeyCode == Enum.KeyCode[tostring(cn)] then bM.Enabled = not bM.Enabled
            elseif (not cn) and cl.KeyCode == bE.MinimizeKey then bM.Enabled = not bM.Enabled end
        end))

        bD(bM)
        return ch
    end

    local bJ= {}
    bJ.__index = bJ
    function bm._makeContainer(bK, bL, bM)
        return setmetatable({ _body = bL, _tab = bM }, bJ)
    end
local bK=function(
bK, bL, bM)        
if bK and bK._tab then
            table.insert(bE._searchable, { label = bM or "", row = bL, parentTab = bK._tab })
        end
end local bL=function(
bL, bM)        
return bv("Frame", { Size = UDim2.new(1,0,0, bM or 26), BackgroundTransparency = 1, Parent = bL })
end
    
function bJ:AddToggle(bM, bN)
        bN = bN or {}
        local bO = bL(self._body, 28)
        local bP = bv("TextLabel", {
            Position = UDim2.new(0,4,0,0), Size = UDim2.new(1,-56,1,0),
            BackgroundTransparency = 1, Text = bN.Text or bM,
            Font = Enum.Font.Gotham, TextSize = 13,
            TextColor3 = bN.Risky and bp.Risky or bp.Text,
            TextXAlignment = Enum.TextXAlignment.Left, Parent = bO,
        })
        local bQ = (bv("TextButton", {
            AnchorPoint = Vector2.new(1,0.5), Position = UDim2.new(1,-4,0.5,0),
            Size = UDim2.new(0,40,0,20),
            BackgroundColor3 = bN.Default and bp.Accent or bp.ToggleOff,
            BorderSizePixel = 0, AutoButtonColor = false, Text = "", Parent = bO,
        }) )        
bw(bQ, 10)
        local bR = bB(bQ)
        ;(bR ).Transparency = NumberSequence.new(bN.Default and 0 or 1)
        local bS = bx(bQ, bp.Accent, 1.5, bN.Default and 0.4 or 1)
        local bT = bv("Frame", {
            AnchorPoint = Vector2.new(0,0.5), Position = UDim2.new(0, bN.Default and 22 or 2, 0.5, 0),
            Size = UDim2.new(0,16,0,16), BackgroundColor3 = Color3.new(1,1,1),
            BorderSizePixel = 0, Parent = bQ,
        })
        bw(bT, 8)
        local bU= { Value = bN.Default or false, _changed = {}, _row = bO, _label = bP, Type = "Toggle" }
        function bU:OnChanged(bV) table.insert(self._changed, bV) end
        function bU:SetText(bV) bP.Text = bV end
        function bU:SetValue(bV)
            self.Value = bV and true or false
            bA(bQ, {BackgroundColor3 = self.Value and bp.Accent or bp.ToggleOff})
            bA(bT,  {Position         = UDim2.new(0, self.Value and 22 or 2, 0.5, 0)})
            bA(bS, {Transparency = self.Value and 0.4 or 1})
            ;(bR ).Transparency = NumberSequence.new(self.Value and 0 or 1)
            if bN.Callback then pcall(bN.Callback, self.Value) end
            for bW, bX in ipairs(self._changed) do pcall(bX, self.Value) end
        end
        function bU:AddKeyPicker(bV, bW)   return bJ.AddKeyPicker({_body = bO},   bV, bW, bP) end
        function bU:AddColorPicker(bV, bW) return bJ.AddColorPicker({_body = bO}, bV, bW, bP) end
        bQ.MouseButton1Click:Connect(function() bU:SetValue(not bU.Value) end)
        bv("TextButton", {
            Size = UDim2.new(1,-50,1,0), BackgroundTransparency = 1, Text = "", Parent = bO,
        }).MouseButton1Click:Connect(function() bU:SetValue(not bU.Value) end)
        bE.Toggles[bM] = bU
        bK(self, bO, bN.Text or bM)
        return bU
    end

    function bJ:AddSlider(bM, bN)
        bN = bN or {}
        local bO, bP = bN.Min or 0, bN.Max or 100
        local bQ = bN.Rounding or 0
local bR=function(bR)local bS = 10 ^ bQ; return math.floor(bR * bS + 0.5) / bS end        
local bS = bL(self._body, 42)
        bv("TextLabel", {
            Size = UDim2.new(1,-80,0,18), Position = UDim2.new(0,4,0,0),
            BackgroundTransparency = 1, Text = bN.Text or bM,
            Font = Enum.Font.Gotham, TextSize = 13, TextColor3 = bp.Text,
            TextXAlignment = Enum.TextXAlignment.Left, Parent = bS,
        })
        local bT = bv("TextLabel", {
            AnchorPoint = Vector2.new(1,0), Position = UDim2.new(1,-4,0,0),
            Size = UDim2.new(0,80,0,18), BackgroundTransparency = 1,
            Text = tostring(bR(bN.Default or bO)) .. (bN.Suffix or ""),
            Font = Enum.Font.GothamSemibold, TextSize = 13, TextColor3 = bp.Accent,
            TextXAlignment = Enum.TextXAlignment.Right, Parent = bS,
        })
        local bU = bv("Frame", {
            Position = UDim2.new(0,4,0,24), Size = UDim2.new(1,-8,0,8),
            BackgroundColor3 = bp.Surface, BorderSizePixel = 0, Parent = bS,
        })
        bw(bU, 4); bx(bU, bp.Border, 1, 0.5)
        local bV = bv("Frame", { Size = UDim2.new(0,0,1,0), BackgroundColor3 = bp.Accent, BorderSizePixel = 0, Parent = bU })
        bw(bV, 4); bB(bV)
        local bW = bv("Frame", {
            AnchorPoint = Vector2.new(0.5,0.5), Position = UDim2.new(0,0,0.5,0),
            Size = UDim2.new(0,16,0,16), BackgroundColor3 = Color3.new(1,1,1),
            BorderSizePixel = 0, ZIndex = 3, Parent = bU,
        })
        bw(bW, 8); bx(bW, bp.AccentBright, 1.5, 0.1)

        local bX= { Value = bN.Default or bO, _changed = {}, Type = "Slider", Min = bO, Max = bP }
local bY=function()            
local bY = (bX.Value - bO) / math.max(bP - bO, 0.0001)
            local bZ = math.clamp(bY, 0, 1)
            bV.Size = UDim2.new(bZ, 0, 1, 0)
            bW.Position = UDim2.new(bZ, 0, 0.5, 0)
            bT.Text = tostring(bR(bX.Value)) .. (bN.Suffix or "")
end        
function bX:OnChanged(bZ) table.insert(self._changed, bZ) end
        function bX:SetValue(bZ)
            bZ = math.clamp(bR(bZ), bO, bP); self.Value = bZ; bY()
            if bN.Callback then pcall(bN.Callback, bZ) end
            for b_, b0 in ipairs(self._changed) do pcall(b0, bZ) end
        end
        local bZ = false
        bU.InputBegan:Connect(function(b_)
            if b_.UserInputType == Enum.UserInputType.MouseButton1 or b_.UserInputType == Enum.UserInputType.Touch then
                bZ = true
                local b0, b1 = bU.AbsolutePosition, bU.AbsoluteSize
                bX:SetValue(bO + ((b_.Position.X - b0.X) / b1.X) * (bP - bO))
            end
        end)
        bU.InputEnded:Connect(function(b_)
            if b_.UserInputType == Enum.UserInputType.MouseButton1 or b_.UserInputType == Enum.UserInputType.Touch then
                bZ = false
            end
        end)
        bE:_track(e.InputChanged:Connect(function(b_)
            if bZ and (b_.UserInputType == Enum.UserInputType.MouseMovement or b_.UserInputType == Enum.UserInputType.Touch) then
                local b0, b1 = bU.AbsolutePosition, bU.AbsoluteSize
                bX:SetValue(bO + ((b_.Position.X - b0.X) / b1.X) * (bP - bO))
            end
        end))
        bY()
        bE.Options[bM] = bX
        bK(self, bS, bN.Text or bM)
        return bX
    end

    function bJ:AddDropdown(bM, bN)
        bN = bN or {}
        local bO = bN.Multi == true
        local bP= bN.Values or {}
        local bQ = bL(self._body, 46)
        bv("TextLabel", {
            Position = UDim2.new(0,4,0,0), Size = UDim2.new(1,-8,0,16),
            BackgroundTransparency = 1, Text = bN.Text or bM,
            Font = Enum.Font.Gotham, TextSize = 12, TextColor3 = bp.TextDim,
            TextXAlignment = Enum.TextXAlignment.Left, Parent = bQ,
        })
        local bR = (bv("TextButton", {
            Position = UDim2.new(0,4,0,20), Size = UDim2.new(1,-8,0,24),
            BackgroundColor3 = bp.Surface, BorderSizePixel = 0,
            Text = "", AutoButtonColor = false, Parent = bQ,
        }) )        
bw(bR, 6); bx(bR, bp.Border, 1, 0.4)
        local bS = bv("TextLabel", {
            Size = UDim2.new(1,-22,1,0), Position = UDim2.new(0,12,0,0),
            BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 12, TextColor3 = bp.Text,
            TextXAlignment = Enum.TextXAlignment.Center, Parent = bR,
        })
        bv("TextLabel", {
            AnchorPoint = Vector2.new(1,0.5), Position = UDim2.new(1,-8,0.5,0),
            Size = UDim2.new(0,16,0,16), BackgroundTransparency = 1, Text = "v",
            Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = bp.TextDim, Parent = bR,
        })
        local bT= { Type = "Dropdown", _changed = {}, Values = bP, Multi = bO }
        if bO then bT.Value = (type(bN.Default) == "table") and bN.Default or {}
        else bT.Value = bN.Default or (bP[1] or "") end
local bU=function()            
if bO then
                local bU = {}
                for bV, bW in pairs(bT.Value) do if bW then table.insert(bU, bV) end end
                if #bU == 0 then bS.Text = "---" else bS.Text = table.concat(bU, ", ") end
            else bS.Text = tostring(bT.Value) end
end        
bU()
        function bT:OnChanged(bV) table.insert(self._changed, bV) end
        function bT:SetValue(bV)
            self.Value = bV; bU()
            if bN.Callback then pcall(bN.Callback, bV) end
            for bW, bX in ipairs(self._changed) do pcall(bX, bV) end
        end
        function bT:SetValues(bV)
            self.Values = bV or {}; bP = self.Values
            if not bO and not table.find(bP, self.Value) then self.Value = bP[1] or "" end
            bU()
        end
        local bV
local bW=function()if bV then bV:Destroy(); bV = nil end end        
bR.MouseButton1Click:Connect(function()
            if bV then bW() return end
            bV = bv("Frame", {
                Size = UDim2.new(0, bR.AbsoluteSize.X, 0, math.min(#bP * 24 + 8, 200)),
                Position = UDim2.new(0, bR.AbsolutePosition.X, 0, bR.AbsolutePosition.Y + bR.AbsoluteSize.Y + 2),
                BackgroundColor3 = bp.Header, BorderSizePixel = 0, ZIndex = 50, Parent = bE._gui,
            })
            bw(bV , 6); bx(bV , bp.BorderLight, 1, 0.3)
            local bX = bv("ScrollingFrame", {
                Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1, BorderSizePixel = 0,
                ScrollBarThickness = 3, ZIndex = 51,
                CanvasSize = UDim2.new(0,0,0,0), AutomaticCanvasSize = Enum.AutomaticSize.Y, Parent = bV,
            })
            bz(bX, 0, Enum.HorizontalAlignment.Center); by(bX, 3, 3)
            for bY, bZ in ipairs(bP) do
                local b_ = (bv("TextButton", {
                    Size = UDim2.new(1,0,0,22), BackgroundColor3 = bp.Surface, BorderSizePixel = 0,
                    Text = tostring(bZ), Font = Enum.Font.Gotham, TextSize = 12,
                    TextColor3 = bp.Text, ZIndex = 52, AutoButtonColor = false, Parent = bX,
                }) )                
bw(b_, 4)
                if bO and bT.Value[bZ] then b_.BackgroundColor3 = bp.Accent end
                b_.MouseEnter:Connect(function() bA(b_, {BackgroundColor3 = bO and bT.Value[bZ] and bp.Accent or bp.SurfaceAlt}) end)
                b_.MouseLeave:Connect(function() bA(b_, {BackgroundColor3 = bO and bT.Value[bZ] and bp.Accent or bp.Surface}) end)
                b_.MouseButton1Click:Connect(function()
                    if bO then
                        bT.Value[bZ] = not bT.Value[bZ]
                        b_.BackgroundColor3 = bT.Value[bZ] and bp.Accent or bp.Surface
                        bU(); if bN.Callback then pcall(bN.Callback, bT.Value) end
                        for b0, b1 in ipairs(bT._changed) do pcall(b1, bT.Value) end
                    else bT:SetValue(bZ); bW() end
                end)
            end
        end)
        bE.Options[bM] = bT
        bK(self, bQ, bN.Text or bM)
        return bT
    end

    function bJ:AddInput(bM, bN)
        bN = bN or {}
        local bO = bL(self._body, 46)
        bv("TextLabel", {
            Position = UDim2.new(0,4,0,0), Size = UDim2.new(1,-8,0,16),
            BackgroundTransparency = 1, Text = bN.Text or bM,
            Font = Enum.Font.Gotham, TextSize = 12, TextColor3 = bp.TextDim,
            TextXAlignment = Enum.TextXAlignment.Left, Parent = bO,
        })
        local bP = (bv("TextBox", {
            Position = UDim2.new(0,4,0,20), Size = UDim2.new(1,-8,0,24),
            BackgroundColor3 = bp.Surface, BorderSizePixel = 0, ClearTextOnFocus = false,
            Text = tostring(bN.Default or ""), PlaceholderText = tostring(bN.Placeholder or ""),
            Font = Enum.Font.Gotham, TextSize = 12, TextColor3 = bp.Text,
            PlaceholderColor3 = bp.TextDim, TextXAlignment = Enum.TextXAlignment.Left, Parent = bO,
        }) )        
bw(bP, 6); bx(bP, bp.Border, 1, 0.4)
        bv("UIPadding", { PaddingLeft = bu(8), PaddingRight = bu(8), Parent = bP })
        local bQ= { Value = tostring(bN.Default or ""), _changed = {}, Type = "Input" }
        function bQ:OnChanged(bR) table.insert(self._changed, bR) end
        function bQ:SetValue(bR) self.Value = tostring(bR); bP.Text = self.Value end
        bP:GetPropertyChangedSignal("Text"):Connect(function()
            if bN.Numeric then bP.Text = bP.Text:gsub("[^%-%.%d]", "") end
            bQ.Value = bP.Text
            if bN.Callback then pcall(bN.Callback, bQ.Value) end
            for bR, bS in ipairs(bQ._changed) do pcall(bS, bQ.Value) end
        end)
        bE.Options[bM] = bQ
        bK(self, bO, bN.Text or bM)
        return bQ
    end

    function bJ:AddButton(bM)
        bM = bM or {}
        local bN = bL(self._body, 30)
        local bO  = bM.Risky and bp.RiskyDim or bp.Surface
        local bP = bM.Risky and bp.Risky    or bp.SurfaceAlt
        local bQ = (bv("TextButton", {
            Size = UDim2.new(1,-8,1,-2), Position = UDim2.new(0,4,0,0),
            BackgroundColor3 = bO, BorderSizePixel = 0,
            Text = bM.Text or "Button", Font = Enum.Font.GothamSemibold, TextSize = 12,
            TextColor3 = bp.Text, AutoButtonColor = false, Parent = bN,
        }) )        
bw(bQ, 6); bx(bQ, bM.Risky and bp.Risky or bp.Border, 1, 0.4)
        bQ.MouseEnter:Connect(function() bA(bQ, {BackgroundColor3 = bP}) end)
        bQ.MouseLeave:Connect(function() bA(bQ, {BackgroundColor3 = bO}) end)
        local bR = 0
        bQ.MouseButton1Click:Connect(function()
            if bM.DoubleClick then
                bR += 1
                if bR == 1 then
                    local bS = bQ.Text; bQ.Text = "Click again to confirm"
                    task.delay(2, function() if bR == 1 then bR = 0; bQ.Text = bS end end)
                    return
                end
                bR = 0
            end
            if bM.Func then pcall(bM.Func) end
        end)
        local bS= { Type = "Button", _btn = bQ }
        function bS:SetText(bT) bQ.Text = bT end
        bK(self, bN, bM.Text or "")
        return bS
    end

    function bJ:AddKeyPicker(bM, bN, bO)
        bN = bN or {}
        local bP = self._body
        local bQ
        if bO then
            bQ = bv("Frame", {
                AnchorPoint = Vector2.new(1,0.5), Position = UDim2.new(1,-4,0.5,0),
                Size = UDim2.new(0,64,0,18), BackgroundTransparency = 1, Parent = bP,
            })
        else
            bQ = bL(bP, 26)
            bv("TextLabel", {
                Position = UDim2.new(0,4,0,0), Size = UDim2.new(1,-80,1,0),
                BackgroundTransparency = 1, Text = bN.Text or bM,
                Font = Enum.Font.Gotham, TextSize = 13, TextColor3 = bp.Text,
                TextXAlignment = Enum.TextXAlignment.Left, Parent = bQ,
            })
        end
        local bR = (bv("TextButton", {
            AnchorPoint = Vector2.new(1,0.5),
            Position = bO and UDim2.new(1,0,0.5,0) or UDim2.new(1,-4,0.5,0),
            Size = UDim2.new(0,64,0,20), BackgroundColor3 = bp.Surface, BorderSizePixel = 0,
            Text = tostring(bN.Default or "None"), Font = Enum.Font.GothamSemibold, TextSize = 11,
            TextColor3 = bp.Accent, AutoButtonColor = false, Parent = bQ,
        }) )        
bw(bR, 4); bx(bR, bp.Border, 1, 0.4)
        local bS= { Value = tostring(bN.Default or "None"), Mode = bN.Mode or "Toggle", _changed = {}, Type = "KeyPicker" }
        function bS:OnChanged(bT) table.insert(self._changed, bT) end
        function bS:SetValue(bT) self.Value = tostring(bT); bR.Text = self.Value end
        local bT = false
        bR.MouseButton1Click:Connect(function() bT = true; bR.Text = "..." end)
        bE:_track(e.InputBegan:Connect(function(bU, bV)
            if bE.Unloaded then return end
            if bT and bU.UserInputType == Enum.UserInputType.Keyboard then
                bS:SetValue(bU.KeyCode.Name); bT = false
                if bN.Callback then pcall(bN.Callback, bS.Value) end
                return
            end
            if (not bV) and bU.UserInputType == Enum.UserInputType.Keyboard
                and bU.KeyCode.Name == bS.Value then
                if bN.Callback then pcall(bN.Callback) end
            end
        end))
        bE.Options[bM] = bS
        return bS
    end

    function bJ:AddColorPicker(bM, bN, bO)
        bN = bN or {}
        local bP = self._body
        local bQ
        if bO then
            bQ = bv("Frame", {
                AnchorPoint = Vector2.new(1,0.5), Position = UDim2.new(1,-4,0.5,0),
                Size = UDim2.new(0,28,0,16), BackgroundTransparency = 1, Parent = bP,
            })
        else
            bQ = bL(bP, 26)
            bv("TextLabel", {
                Position = UDim2.new(0,4,0,0), Size = UDim2.new(1,-44,1,0),
                BackgroundTransparency = 1, Text = bN.Title or bM,
                Font = Enum.Font.Gotham, TextSize = 13, TextColor3 = bp.Text,
                TextXAlignment = Enum.TextXAlignment.Left, Parent = bQ,
            })
        end
        local bR = (bv("TextButton", {
            AnchorPoint = Vector2.new(1,0.5),
            Position = bO and UDim2.new(1,0,0.5,0) or UDim2.new(1,-4,0.5,0),
            Size = UDim2.new(0,28,0,16), Text = "", BorderSizePixel = 0,
            BackgroundColor3 = bN.Default or Color3.new(1,1,1), AutoButtonColor = false, Parent = bQ,
        }) )        
bw(bR, 4); bx(bR, bp.BorderLight, 1, 0.2)
        local bS= { Value = bN.Default or Color3.new(1,1,1), _changed = {}, Type = "ColorPicker" }
        function bS:OnChanged(bT) table.insert(self._changed, bT) end
        function bS:SetValueRGB(bT)
            self.Value = bT; bR.BackgroundColor3 = bT
            if bN.Callback then pcall(bN.Callback, bT) end
            for bU, bV in ipairs(self._changed) do pcall(bV, bT) end
        end
        function bS:SetValue(bT) self:SetValueRGB(bT) end
        local bT
local bU=function()if bT then bT:Destroy(); bT = nil end end        
bR.MouseButton1Click:Connect(function()
            if bT then bU() return end
            bT = bv("Frame", {
                Size = UDim2.new(0,220,0,120),
                Position = UDim2.new(0, bR.AbsolutePosition.X - 220, 0, bR.AbsolutePosition.Y + bR.AbsoluteSize.Y + 4),
                BackgroundColor3 = bp.Header, BorderSizePixel = 0, ZIndex = 60, Parent = bE._gui,
            })
            bw(bT , 8); bx(bT , bp.BorderLight, 1, 0.3)
            by(bT , 10); bz(bT , 6, Enum.HorizontalAlignment.Center)
local bV=function(bV, bW, bX)                
local bY = bv("Frame", { Size = UDim2.new(1,0,0,18), BackgroundTransparency = 1, Parent = bT, ZIndex = 61 })
                bv("TextLabel", {
                    Size = UDim2.new(0,14,1,0), BackgroundTransparency = 1, Text = bV, ZIndex = 61,
                    Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = bp.Text, Parent = bY,
                })
                local bZ = bv("Frame", {
                    Position = UDim2.new(0,18,0.5,-3), Size = UDim2.new(1,-50,0,6),
                    BackgroundColor3 = bp.Surface, BorderSizePixel = 0, ZIndex = 61, Parent = bY,
                })
                bw(bZ , 3)
                local b_ = bv("Frame", { Size = UDim2.new(bW(),0,1,0), BackgroundColor3 = bp.Accent, BorderSizePixel = 0, ZIndex = 62, Parent = bZ })
                bw(b_ , 3)
                local b0 = bv("TextLabel", {
                    AnchorPoint = Vector2.new(1,0.5), Position = UDim2.new(1,0,0.5,0),
                    Size = UDim2.new(0,28,1,0), BackgroundTransparency = 1, ZIndex = 61,
                    Text = tostring(math.floor(bW() * 255)), Font = Enum.Font.Gotham, TextSize = 11, TextColor3 = bp.TextDim, Parent = bY,
                })
local b1=function(b1)                    
local b2 = math.clamp((b1.Position.X - bZ.AbsolutePosition.X) / bZ.AbsoluteSize.X, 0, 1)
                    b_.Size = UDim2.new(b2, 0, 1, 0); b0.Text = tostring(math.floor(b2 * 255)); bX(b2)
end                
local b2 = false
                bZ.InputBegan:Connect(function(b3) if b3.UserInputType == Enum.UserInputType.MouseButton1 then b2 = true; b1(b3) end end)
                bZ.InputEnded:Connect(function(b3) if b3.UserInputType == Enum.UserInputType.MouseButton1 then b2 = false end end)
                bE:_track(e.InputChanged:Connect(function(b3) if b2 and b3.UserInputType == Enum.UserInputType.MouseMovement then b1(b3) end end))
end            
bV("R", function() return bS.Value.R end, function(bW) bS:SetValueRGB(Color3.new(bW, bS.Value.G, bS.Value.B)) end)
            bV("G", function() return bS.Value.G end, function(bW) bS:SetValueRGB(Color3.new(bS.Value.R, bW, bS.Value.B)) end)
            bV("B", function() return bS.Value.B end, function(bW) bS:SetValueRGB(Color3.new(bS.Value.R, bS.Value.G, bW)) end)
        end)
        bE.Options[bM] = bS
        return bS
    end

    function bJ:AddLabel(bM, bN, bO)
        local bP = bL(self._body, bN and 34 or 20)
        local bQ = bv("TextLabel", {
            Position = UDim2.new(0,4,0,0), Size = UDim2.new(1,-72,1,0),
            BackgroundTransparency = 1, Text = bM or "",
            Font = Enum.Font.Gotham, TextSize = 12, TextColor3 = bp.TextDim,
            TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = bN or false, Parent = bP,
        })
        local bR= { Type = "Label", _row = bP, _lbl = bQ, Value = bM }
        function bR:SetText(bS) self.Value = bS; bQ.Text = bS end
        function bR:AddKeyPicker(bS, bT)   return bJ.AddKeyPicker({_body = bP},   bS, bT, bQ) end
        function bR:AddColorPicker(bS, bT) return bJ.AddColorPicker({_body = bP}, bS, bT, bQ) end
        if bO then bE.Options[bO] = bR end
        return bR
    end

    function bJ:AddDivider()
        return bv("Frame", {
            Size = UDim2.new(1,-8,0,1), BackgroundColor3 = bp.Border, BorderSizePixel = 0, Parent = self._body,
        })
    end

    bm._Library = bE
    function bm.GetLibrary() return bE end
end




local bn 
local bo  
local bp    = {}
local bq local br=function(

br, bs, bt)    
bq[br]:OnChanged(function()
        local bu = bq[br].Value
        p[bs] = bu
        if bt then bt(bu) end
    end)
end local bs=function()    


bn = bm.GetLibrary()
    bq = bn.Toggles
    ak = bn.Options
    y.setLibrary(bn)

    bo = bn:CreateWindow({
        Title            = "NameHub",
        Footer           = "Jurassic Blocky -- " .. a,
        NotifySide       = o.NotifySide,
        ShowCustomCursor = o.ShowCustomCursor,
    })

    bp = {
        Main     = bo:AddTab("Main"),
        Player   = bo:AddTab("Player"),
        Visuals  = bo:AddTab("Visuals"),
        Misc     = bo:AddTab("Misc"),
        Teleport = bo:AddTab("Teleport"),
        Stats    = bo:AddTab("Stats"),
        Settings = bo:AddTab("Settings"),
    }

    
    
    
    do
        local bs = bp.Main:AddLeftTabbox():AddTab("Farm")
        bs:AddToggle("Autofarm", { Text = "Autofarm", Default = p.AutoFarm })
        bs:AddDropdown("FarmTargets", {
            Values  = { "Berry","Meat","Fish","Wood","Stone","Fossil","Egg","Water","Iron","Gold","Diamond","Sapling","Mushroom","Loot" },
            Default = o.FarmTarget, Text = "Farm Target",
            Tooltip = "Primary farm target. Keyword-matched against workspace names; the keyword list lives in FARM_TARGETS in the script.",
            Callback = function(bt) o.FarmTarget = bt end,
        })
        bs:AddDropdown("FarmPriority", {
            Values  = { "Berry","Meat","Fish","Wood","Stone","Fossil","Egg","Water","Iron","Gold","Diamond","Sapling","Mushroom","Loot" },
            Default = {}, Multi = true,
            Text    = "Additional Farm Targets",
            Tooltip = "Anything ticked here is farmed IN ADDITION to the primary target.",
        })
        bs:AddSlider("FarmRange", {
            Text = "Farm Range", Default = o.AutoFarmRadius, Min = 100, Max = 6000, Rounding = 0, Suffix = " studs",
            Callback = function(bt) o.AutoFarmRadius = bt end,
        })
        bs:AddToggle("SafeFarmSpeed", { Text = "Safe-Speed Tween Walk", Default = p.SafeFarmSpeed })
        bs:AddSlider("SafeFarmSpeedValue", {
            Text = "Walk Speed", Default = o.SafeFarmSpeed,
            Min = 20, Max = o.SafeFarmSpeedMax, Rounding = 0, Suffix = " studs/s",
            Callback = function(bt) o.SafeFarmSpeed = bt end,
        })
        bs:AddSlider("SafeFarmHopCap", {
            Text = "Hop Distance", Default = o.SafeFarmHopCap,
            Min = 10, Max = o.SafeFarmHopCapMax, Rounding = 0, Suffix = " studs",
            Callback = function(bt) o.SafeFarmHopCap = bt end,
        })
        bs:AddSlider("SafeFarmInterHop", {
            Text = "Inter-Hop Pause", Default = o.SafeFarmInterHop,
            Min = 0, Max = 0.5, Rounding = 2, Suffix = "s",
            Callback = function(bt) o.SafeFarmInterHop = bt end,
        })
        br("SafeFarmSpeed", "SafeFarmSpeed")

        bs:AddDivider()
        bs:AddLabel("Instant TP (plain CFrame; JB has no known teleport check)")
        bs:AddToggle("InstantFarmTP", { Text = "Instant TP Mode", Default = p.InstantFarmTP })
        bs:AddSlider("InstantTPMaxJump", {
            Text = "Max Jump Per Hop", Default = o.InstantTPMaxJump,
            Min = 5, Max = 250, Rounding = 0, Suffix = " studs",
            Callback = function(bt) o.InstantTPMaxJump = bt end,
        })
        bs:AddSlider("InstantTPInterJump", {
            Text = "Inter-Hop Pause", Default = o.InstantTPInterJump,
            Min = 0, Max = 1.0, Rounding = 2, Suffix = "s",
            Callback = function(bt) o.InstantTPInterJump = bt end,
        })
        bs:AddSlider("InstantTPSettleTime", {
            Text = "Pickup Settle Time", Default = o.InstantTPSettleTime,
            Min = 0.05, Max = 0.5, Rounding = 2, Suffix = "s",
            Callback = function(bt) o.InstantTPSettleTime = bt end,
        })
        bs:AddToggle("InstantTPBurstMode", { Text = "Burst Mode (~60Hz hops)", Default = o.InstantTPBurstMode })
        bq.InstantTPBurstMode:OnChanged(function() o.InstantTPBurstMode = bq.InstantTPBurstMode.Value end)
        bs:AddSlider("InstantTPBurstStuds", {
            Text = "Burst Studs Per Frame", Default = o.InstantTPBurstStuds,
            Min = 10, Max = 250, Rounding = 0, Suffix = " studs",
            Callback = function(bt) o.InstantTPBurstStuds = bt end,
        })

        bs:AddDivider()
        bs:AddLabel("Target landing options")
        bs:AddDropdown("TargetTargetPriority", {
            Values = { "Closest","Furthest","Largest","Random" },
            Default = o.TargetTargetPriority, Text = "Target Priority",
            Callback = function(bt) o.TargetTargetPriority = bt end,
        })
        bs:AddSlider("TargetLandingYOffset", {
            Text = "Landing Y Offset", Default = o.TargetLandingYOffset, Min = -10, Max = 30, Rounding = 0, Suffix = " studs",
            Callback = function(bt) o.TargetLandingYOffset = bt end,
        })
        bs:AddSlider("TargetLandingJitter", {
            Text = "Landing Jitter", Default = o.TargetLandingJitter, Min = 0, Max = 15, Rounding = 0, Suffix = " studs",
            Callback = function(bt) o.TargetLandingJitter = bt end,
        })
        bs:AddSlider("TargetMinDistance", {
            Text = "Min Distance Filter", Default = o.TargetMinDistance, Min = 0, Max = 200, Rounding = 0, Suffix = " studs",
            Callback = function(bt) o.TargetMinDistance = bt end,
        })
        bs:AddToggle("TargetSkipOccupied", { Text = "Skip Targets Near Other Players", Default = o.TargetSkipOccupied })
        bq.TargetSkipOccupied:OnChanged(function() o.TargetSkipOccupied = bq.TargetSkipOccupied.Value end)
        bs:AddSlider("TargetPickupRetries", {
            Text = "Pickup Attempts", Default = o.TargetPickupRetries, Min = 1, Max = 10, Rounding = 0,
            Callback = function(bt) o.TargetPickupRetries = bt end,
        })
        bs:AddDropdown("TargetPickupMethod", {
            Values = { "All","ProximityPrompt","Touch","Click","Remote" },
            Default = o.TargetPickupMethod, Text = "Pickup Method",
            Callback = function(bt) o.TargetPickupMethod = bt end,
        })

        bs:AddDivider()
        bs:AddLabel("Diagnostics")
        bs:AddButton({
            Text = "Scan For Targets",
            Func = function()
                local bt = al()
                if #bt == 0 then y.notify("Autofarm", "No farm target selected."); return end
                local bu = {"=== Farm Scan ==="}
                for bv, bw in ipairs(bt) do
                    table.insert(bu, ("  %-10s = %d"):format(bw, #aj(bw)))
                end
                local bv = table.concat(bu, "\n")
                print(bv); y.notify("Autofarm", bv)
            end,
        })
        bs:AddButton({
            Text = "Dump Workspace Names",
            Tooltip = "Lists up to 80 workspace Models/BaseParts whose names look resource-like. Use this to find the real names JB uses.",
            Func = function()
                local bt = {}
                local bu= {}
                local bv = {"berry","fruit","meat","fish","wood","log","stone","rock","fossil","bone","egg","water","iron","gold","diamond","sapling","mushroom","loot","drop","ore","resource","plant","tree"}
                for bw, bx in ipairs(g:GetDescendants()) do
                    if bx:IsA("Model") or bx:IsA("BasePart") then
                        local by = bx.Name:lower()
                        for bz, bA in ipairs(bv) do
                            if by:find(bA, 1, true) then
                                if not bu[bx.Name] then
                                    bu[bx.Name] = true
                                    table.insert(bt, bx.Name .. "  (" .. bx.ClassName .. ", " .. bx:GetFullName() .. ")")
                                    if #bt >= 80 then break end
                                end
                                break
                            end
                        end
                        if #bt >= 80 then break end
                    end
                end
                local bw = "=== Workspace Resource Names ===\n" .. table.concat(bt, "\n")
                if #bt == 0 then bw = bw .. "  (nothing matched - stand near a collectible)" end
                print(bw)
                local bx = A("setclipboard")
                if type(bx) == "function" then y.safe(function() bx(bw) end, "clip") end
                y.notify("Autofarm", ("Found %d hits. Console + clipboard."):format(#bt))
            end,
        })
        bs:AddButton({
            Text = "Reset Skipped Targets",
            Func = function()
                local bt = 0
                for bu in pairs(ai) do ai[bu] = nil; bt += 1 end
                y.notify("Autofarm", ("Cleared %d skipped."):format(bt))
            end,
        })
        bs:AddButton({
            Text = "Diagnose Autofarm",
            Func = function()
                local bt = {"=== Autofarm Diagnostic ==="}
                table.insert(bt, ("AutoFarm enabled : %s"):format(tostring(p.AutoFarm)))
                table.insert(bt, ("InstantFarmTP    : %s"):format(tostring(p.InstantFarmTP)))
                table.insert(bt, ("Character / Root : %s / %s"):format(tostring(r ~= nil), tostring(t ~= nil)))
                table.insert(bt, ("Farm Range       : %d studs"):format(o.AutoFarmRadius))
                local bu = al()
                table.insert(bt, ("Selected types   : %s"):format(#bu == 0 and "(NONE)" or table.concat(bu, ", ")))
                for bv, bw in ipairs(bu) do
                    local bx = aj(bw)
                    local by ,bz=(math.huge
)                    if t then
                        for bA, bB in ipairs(bx) do
                            local bC = (bB.Position - t.Position).Magnitude
                            if bC < by then by = bC; bz = bB end
                        end
                    end
                    if bz then
                        table.insert(bt, ("  %s : %d, closest %d studs (%s)"):format(bw, #bx, math.floor(by), bz:GetFullName()))
                    else
                        table.insert(bt, ("  %s : %d, RootPart missing"):format(bw, #bx))
                    end
                end
                local bv = table.concat(bt, "\n")
                print(bv); y.notify("Autofarm Diagnostic", bv)
            end,
        })

        br("Autofarm", "AutoFarm", function(bt)
            if not bt then y.notify("Autofarm", "Disabled."); return end
            for bu in pairs(ai) do ai[bu] = nil end
            local bu = al()
            if #bu == 0 then y.notify("Autofarm", "No target selected."); return end
            local bv = 0
            for bw, bx in ipairs(bu) do bv += #aj(bx) end
            y.notify("Autofarm", ("Enabled (%d targets in workspace)"):format(bv))
        end)
        br("InstantFarmTP", "InstantFarmTP")

        local bt = bp.Main:AddRightGroupbox("Resource ESP")
        bt:AddToggle("ResourceESP", { Text = "Resource ESP", Default = p.ResourceESP })
        br("ResourceESP", "ResourceESP", function(bu)
            if bu then aN.enable() else aN.disable() end
        end)

        local bu = bp.Main:AddRightGroupbox("Live Stats")
        bu:AddLabel("Items Collected: 0", false, "ItemsCollected")
        bu:AddLabel("Coins Gained: 0", false, "CoinsGained2")
        bu:AddLabel("Farm Time: 0", false, "FarmTime")
    end

    
    
    
    do
        local bs  = bp.Player:AddLeftTabbox()
        local bt = bs:AddTab("Survival")
        bt:AddToggle("InfHunger", { Text = "Inf Hunger", Default = p.InfHunger })
        bt:AddToggle("InfThirst", { Text = "Inf Thirst", Default = p.InfThirst })
        bt:AddToggle("InfOxygen", { Text = "Inf Oxygen", Default = p.InfOxygen })
        bt:AddToggle("AutoEat",   { Text = "Auto Eat at Threshold",   Default = p.AutoEat })
        bt:AddToggle("AutoDrink", { Text = "Auto Drink at Threshold", Default = p.AutoDrink })
        bt:AddToggle("AutoSleep", { Text = "Auto Sleep at Threshold", Default = p.AutoSleep })
        bt:AddSlider("AutoEatThreshold", {
            Text = "Auto Eat At", Default = o.AutoEatThreshold, Min = 5, Max = 95, Rounding = 0, Suffix = "%",
            Callback = function(bu) o.AutoEatThreshold = bu end,
        })
        bt:AddSlider("AutoDrinkThreshold", {
            Text = "Auto Drink At", Default = o.AutoDrinkThreshold, Min = 5, Max = 95, Rounding = 0, Suffix = "%",
            Callback = function(bu) o.AutoDrinkThreshold = bu end,
        })
        bt:AddSlider("StopInfHungerAt", {
            Text = "Stat Cap", Default = o.StopInfHungerAt, Min = 10, Max = 100, Rounding = 0, Suffix = "%",
            Callback = function(bu) o.StopInfHungerAt = bu end,
        })
        bt:AddToggle("StopEatInCombat", { Text = "Stop Eating In Combat", Default = p.StopEatInCombat })
        bt:AddToggle("AutoRespawn", { Text = "Auto Respawn", Default = p.AutoRespawn })
        bt:AddButton({
            Text = "Print Diagnostics",
            Tooltip = "Dumps stats + remotes to console & clipboard so we can target JB precisely.",
            Func = function()
                local bu = O()
                local bv = P()
                local bw = {"=== JurassicBlocky Diagnostics ==="}
                table.insert(bw, ("Stats found: %d"):format(#bu))
                for bx, by in ipairs(bu) do
                    table.insert(bw, ("  %-24s = %s   (%s)"):format(by.name, tostring(by.value), by.path))
                end
                table.insert(bw, ("Remotes found: %d"):format(#bv))
                for bx, by in ipairs(bv) do
                    table.insert(bw, ("  [%s] %s   (%s)"):format(by.class, by.name, by.path))
                end
                local bx = table.concat(bw, "\n")
                print(bx)
                local by = A("setclipboard")
                if type(by) == "function" then y.safe(function() by(bx) end, "clip") end
                y.notify("Diagnostics", ("%d stats, %d remotes printed%s."):format(#bu, #bv, by and " + clipboard" or ""))
            end,
        })

        br("InfHunger", "InfHunger")
        br("InfThirst", "InfThirst")
        br("InfOxygen", "InfOxygen")
        br("AutoEat",   "AutoEat")
        br("AutoDrink", "AutoDrink")
        br("AutoSleep", "AutoSleep")
        br("StopEatInCombat", "StopEatInCombat")
        br("AutoRespawn", "AutoRespawn")

        local bu = bp.Player:AddRightGroupbox("Movement")
        bu:AddToggle("EnableSpeed",     { Text = "Enable Speed",     Default = p.SpeedBoost })
        bu:AddToggle("EnableJumppower", { Text = "Enable Jumppower", Default = p.JumpBoost  })
        bu:AddSlider("Speed", {
            Text = "Speed", Default = o.BoostedWalkSpeed, Min = 16, Max = 500, Rounding = 0,
            Callback = function(bv) o.BoostedWalkSpeed = bv; if p.SpeedBoost and s then s.WalkSpeed = bv end end,
        })
        bu:AddSlider("Jumppower", {
            Text = "Jumppower", Default = o.BoostedJumpPower, Min = 50, Max = 500, Rounding = 0,
            Callback = function(bv) o.BoostedJumpPower = bv; if p.JumpBoost and s then s.JumpPower = bv end end,
        })
        bu:AddToggle("InfiniteJump", { Text = "Infinite Jump", Default = p.InfiniteJump })
        bu:AddToggle("Noclip", { Text = "Noclip", Default = p.Noclip, Risky = true })
        bu:AddToggle("Fly",    { Text = "Fly",    Default = p.Fly })
        bu:AddSlider("FlySpeed", {
            Text = "Fly Speed", Default = o.FlySpeed, Min = 5, Max = 250, Rounding = 0,
            Callback = function(bv) o.FlySpeed = bv end,
        })

        br("EnableSpeed", "SpeedBoost", function(bv)
            if s then s.WalkSpeed = bv and o.BoostedWalkSpeed or o.DefaultWalkSpeed end
        end)
        br("EnableJumppower", "JumpBoost", function(bv)
            if s then s.JumpPower = bv and o.BoostedJumpPower or o.DefaultJumpPower end
        end)
        br("InfiniteJump", "InfiniteJump")
        br("Noclip", "Noclip")
        br("Fly", "Fly", function(bv) if bv then bg.start() else bg.stop() end end)

        local bv = bp.Player:AddRightGroupbox("Combat")
        bv:AddToggle("AutoAttack",        { Text = "Auto Attack",          Default = p.AutoAttack })
        bv:AddToggle("AutoAttackPlayers", { Text = "Auto Attack Players",  Default = p.AutoAttackPlayers })
        bv:AddToggle("AutoAttackNPCs",    { Text = "Auto Attack NPCs",     Default = p.AutoAttackNPCs })
        bv:AddToggle("AutoHeal",          { Text = "Auto Heal",            Default = p.AutoHeal })
        bv:AddSlider("CombatRange", {
            Text = "Range", Default = o.CombatRange, Min = 5, Max = 500, Rounding = 0, Suffix = " studs",
            Callback = function(bw) o.CombatRange = bw end,
        })
        bv:AddSlider("DisengageAtHP", {
            Text = "Heal Below", Default = o.DisengageAtHP, Min = 0, Max = 500, Rounding = 0, Suffix = " HP",
            Callback = function(bw) o.DisengageAtHP = bw end,
        })
        br("AutoAttack",        "AutoAttack")
        br("AutoAttackPlayers", "AutoAttackPlayers")
        br("AutoAttackNPCs",    "AutoAttackNPCs")
        br("AutoHeal",          "AutoHeal")
    end

    
    
    
    do
local bs=function(bs, bt, bu, bv)            
bs:AddToggle(bt, { Text = bu, Default = aD.Settings[bv], Callback = function(bw) aD.Settings[bv] = bw end })
end local bt=function(
bt, bu, bv, bw, bx, by, bz, bA)            
bt:AddSlider(bu, {
                Text = bv, Default = aD.Settings[bw], Min = bx, Max = by,
                Rounding = bz or 1, Suffix = bA or "",
                Callback = function(bB) aD.Settings[bw] = bB end,
            })
end local bu=function(
bu, bv, bw, bx)            
bu:AddLabel(bw):AddColorPicker(bv, {
                Default = aD.Settings.Colors[bx], Title = bw,
                Callback = function(by) aD.Settings.Colors[bx] = by end,
            })
end
        
local bv = bp.Visuals:AddLeftTabbox()
        local bw = bv:AddTab("ESP")
        bw:AddToggle("ESP", { Text = "Master ESP", Default = p.ESP })
        br("ESP", "ESP", function(bx) if bx then aD.enable() else aD.disable() end end)
        bs(bw, "ESP_ShowPlayers", "Show Player Creatures", "ShowPlayers")
        bs(bw, "ESP_ShowNPCs",    "Show Wild / NPCs", "ShowNPCs")
        bs(bw, "ESP_ShowSelf",    "Show Self", "ShowSelf")
        bs(bw, "ESP_ShowOwner",   "Show Owner Name", "ShowOwner")
        bt(bw, "ESP_MaxDistance", "Max Distance", "MaxDistance", 50, 5000, 0, " studs")
        bt(bw, "ESP_TextSize",    "Text Size", "TextSize", 8, 28, 0)

        local bx = bv:AddTab("Box & Tracer")
        bs(bx, "ESP_Boxes", "Boxes", "Boxes")
        bx:AddDropdown("ESP_BoxType", {
            Values = { "2D","Corner","Filled" }, Default = aD.Settings.BoxType, Text = "Box Type",
            Callback = function(by) aD.Settings.BoxType = by end,
        })
        bt(bx, "ESP_BoxThickness", "Box Thickness", "BoxThickness", 1, 5, 0)
        bs(bx, "ESP_Tracers", "Tracers", "Tracers")
        bx:AddDropdown("ESP_TracerStyle", {
            Values = { "Solid","Glow","Dashed","Gradient" }, Default = aD.Settings.TracerStyle, Text = "Tracer Style",
            Callback = function(by) aD.Settings.TracerStyle = by end,
        })
        bx:AddDropdown("ESP_TracerOrigin", {
            Values = { "Top","Center","Bottom","Mouse" }, Default = aD.Settings.TracerOrigin, Text = "Tracer Origin",
            Callback = function(by) aD.Settings.TracerOrigin = by end,
        })
        bt(bx, "ESP_TracerThickness", "Tracer Thickness", "TracerThickness", 1, 6, 0)
        bs(bx, "ESP_TracerRainbow", "Rainbow Tracer", "TracerRainbow")

        local by = bv:AddTab("Elements")
        bs(by, "ESP_Names",      "Species Name", "Names")
        bs(by, "ESP_Distance",   "Distance",     "Distance")
        bs(by, "ESP_HealthText", "Health Text",  "HealthText")
        bs(by, "ESP_HealthBar",  "Health Bar",   "HealthBar")
        bs(by, "ESP_HeadDot",    "Head Dot",     "HeadDot")

        local bz = bv:AddTab("Chams")
        bs(bz, "ESP_Chams", "Enable Chams", "Chams")
        bz:AddDropdown("ESP_ChamsMode", {
            Values = { "Standard","Outline Only","Fill Only","Rainbow","Pulse","Health-based" },
            Default = aD.Settings.ChamsMode, Text = "Mode",
            Callback = function(bA) aD.Settings.ChamsMode = bA end,
        })
        bz:AddDropdown("ESP_ChamsDepth", {
            Values = { "AlwaysOnTop","Occluded" }, Default = aD.Settings.ChamsDepth, Text = "Depth Mode",
            Callback = function(bA) aD.Settings.ChamsDepth = bA end,
        })

        local bA = bv:AddTab("Colors")
        bu(bA, "ESP_Color_Box",      "Box", "Box")
        bu(bA, "ESP_Color_Tracer",   "Tracer", "Tracer")
        bu(bA, "ESP_Color_Name",     "Name", "Name")
        bu(bA, "ESP_Color_Distance", "Distance", "Distance")
        bu(bA, "ESP_Color_Player",   "Player", "Player")
        bu(bA, "ESP_Color_NPC",      "NPC", "NPC")

        local bB = bp.Visuals:AddRightGroupbox("General")
        bB:AddSlider("FOV", {
            Text = "FOV", Default = o.DefaultFOV, Min = 30, Max = 120, Rounding = 0,
            Callback = function(bC) o.DefaultFOV = bC; a1(bC) end,
        })
        bB:AddSlider("FreecamSpeed", {
            Text = "Freecam Speed", Default = o.FreecamSpeed, Min = 1, Max = 50, Rounding = 0,
            Callback = function(bC) o.FreecamSpeed = bC end,
        })
        bB:AddToggle("Freecam", { Text = "Freecam", Default = p.Freecam })
        bB:AddToggle("DisableLighting", { Text = "Disable Lighting Effects", Default = p.DisableLighting })
        bB:AddToggle("FullBright", { Text = "Full Bright", Default = p.FullBright })
        bB:AddToggle("DisableVisualRain", { Text = "Disable Visual Weather", Default = p.DisableVisualRain })
        bB:AddToggle("InfiniteZoom", { Text = "Infinite Zoom", Default = p.InfiniteZoom })
        bB:AddSlider("LocalPlayerTransparency", {
            Text = "Self Transparency", Default = o.LocalPlayerTransparency, Min = 0, Max = 1, Rounding = 2,
            Callback = function(bC) o.LocalPlayerTransparency = bC; a4(bC) end,
        })
        br("Freecam", "Freecam", function(bC) if bC then bh.start() else bh.stop() end end)
        br("DisableLighting", "DisableLighting", function(bC) a7(not bC) end)
        br("FullBright", "FullBright", function(bC) if bC then a5.start() else a5.stop() end end)
        br("DisableVisualRain", "DisableVisualRain", function(bC) bb(not bC) end)
        br("InfiniteZoom", "InfiniteZoom", function(bC) a3(bC) end)
    end

    
    
    
    do
        local bs = bp.Misc:AddLeftGroupbox("General")
        bs:AddToggle("FPSBoost", { Text = "FPS Boost", Default = p.FPSBoost })
        bs:AddToggle("KickBypass", {
            Text = "Generic Kick Bypass (off by default)", Default = p.KickBypass,
            Risky = true,
            Tooltip = "Hooks LocalPlayer:Kick to swallow client-initiated kicks. JB doesn't appear to use Kick aggressively; only enable if you're getting unexplained disconnects.",
        })
        bs:AddToggle("AntiAFK", { Text = "Anti-AFK", Default = p.AntiAFK })
        bs:AddToggle("StatMonitor", { Text = "Stat Monitor HUD", Default = p.StatMonitor })
        bs:AddToggle("DebugMode", { Text = "Debug Mode", Default = o.DebugMode,
            Callback = function(bt) o.DebugMode = bt end,
        })
        bs:AddButton({ Text = "Show Kick Bypass Stats", Func = function()
            local bt = {"=== Kick Bypass Stats ==="}
            table.insert(bt, ("Installed     : %s"):format(tostring(bk.Installed)))
            table.insert(bt, ("Blocked kicks : %d"):format(bk.BlockedCount))
            if bk.LastError then table.insert(bt, "Last error: " .. bk.LastError) end
            local bu = table.concat(bt, "\n")
            print(bu); y.notify("Kick Bypass", bu)
        end })
        br("FPSBoost", "FPSBoost", function(bt)
            y.safe(function() settings().Rendering.QualityLevel = bt and Enum.QualityLevel.Level01 or Enum.QualityLevel.Automatic end, "FPSBoost")
        end)
        br("KickBypass", "KickBypass", function(bt)
            if bt then
                local bu, bv = bl()
                y.notify("Kick Bypass", bu and ("Installed: " .. bv) or ("Failed: " .. bv))
            else
                y.notify("Kick Bypass", "Disabled (reload to fully unhook).")
            end
        end)
        br("AntiAFK", "AntiAFK")
        br("StatMonitor", "StatMonitor")
    end

    
    
    
    do
        local bs = bp.Teleport:AddLeftGroupbox("Teleport")
        bs:AddDropdown("TPPlayer", {
            Values = {}, Default = "", SpecialType = "Player", ExcludeLocalPlayer = true, Text = "Player",
        })
        bs:AddButton({ Text = "Teleport To Player", Func = function()
            local bt = ak.TPPlayer and ak.TPPlayer.Value
            if type(bt) == "string" and bt ~= "" then aS.toPlayer(bt, true) end
        end })
        bs:AddButton({ Text = "Teleport To Safety", Func = function()
            if t then t.CFrame = t.CFrame + Vector3.new(0,500,0) end
        end })
        bs:AddInput("CoordX", { Default = "0", Text = "X", Numeric = true })
        bs:AddInput("CoordY", { Default = "0", Text = "Y", Numeric = true })
        bs:AddInput("CoordZ", { Default = "0", Text = "Z", Numeric = true })
        bs:AddButton({ Text = "Tween to Coordinates", Func = function()
            local bt = tonumber(ak.CoordX.Value) or 0
            local bu = tonumber(ak.CoordY.Value) or 0
            local bv = tonumber(ak.CoordZ.Value) or 0
            y.tweenTo(CFrame.new(bt, bu, bv), o.TweenTeleportSeconds)
        end })
        bs:AddButton({ Text = "Rejoin Server", Func = function()
            y.safe(function() n:Teleport(game.PlaceId, q) end, "Rejoin")
        end })
        bs:AddButton({ Text = "Copy JobId", Func = function()
            local bt = A("setclipboard")
            if type(bt) == "function" then pcall(bt, game.JobId); y.notify("Teleport", "JobId copied.") end
        end })
    end

    
    
    
    do
        local bs = bp.Stats:AddLeftGroupbox("Character")
        bs:AddLabel("Health: -",    false, "DinoHealth")
        bs:AddLabel("Hunger: -",    false, "DinoHunger")
        bs:AddLabel("Thirst: -",    false, "DinoThirst")
        bs:AddLabel("Energy: -",    false, "DinoEnergy")
        bs:AddLabel("Oxygen: -",    false, "DinoOxygen")
        bs:AddLabel("Position: -",  false, "DinoPosition")
        bs:AddLabel("Walkspeed: -", false, "DinoWalkSpeed")
        bs:AddButton({ Text = "Reset Session", Func = function()
            aW.StartTime = tick(); aW.StartCoins = aW.LastCoins
            aW.CoinsGained = 0; aW.CoinsSpent = 0
            y.notify("Stats", "Session reset.")
        end })

        task.spawn(function()
            while v.value do
                task.wait(0.5)
                if bn and bn.Unloaded then break end
                y.safe(function()
                    if r and r:FindFirstChild("HumanoidRootPart") then
                        local bt = ((r.HumanoidRootPart )).Position
                        if ak.DinoPosition then
                            ak.DinoPosition:SetText(("Position: %d, %d, %d"):format(math.floor(bt.X), math.floor(bt.Y), math.floor(bt.Z)))
                        end
                    end
                    local bt = r and r:FindFirstChildOfClass("Humanoid")
                    if bt then
                        if ak.DinoHealth    then ak.DinoHealth:SetText(("Health: %d / %d"):format(math.floor(bt.Health), math.floor(bt.MaxHealth))) end
                        if ak.DinoWalkSpeed then ak.DinoWalkSpeed:SetText(("Walkspeed: %d"):format(math.floor(bt.WalkSpeed))) end
                    end
local bu=function(bu, bv)                        
local bw = N(bv)
                        if bw and ak[bu] then ak[bu]:SetText(bv .. ": " .. tostring(math.floor((bw ).Value))) end
end                    
bu("DinoHunger", "Hunger")
                    bu("DinoThirst", "Thirst")
                    bu("DinoEnergy", "Energy")
                    bu("DinoOxygen", "Oxygen")
                end, "stats-live")
            end
        end)

        local bt = bp.Stats:AddRightGroupbox("Session")
        bt:AddLabel("Session Time: 0s", false, "SessionTime")
        bt:AddLabel("Coins Gained: 0",  false, "CoinsGained")
        bt:AddLabel("Coin Rate: 0/hr",  false, "CoinRate")
        bt:AddLabel("Coins Total: 0",   false, "CoinsTotal")
        bt:AddLabel("Coins Spent: 0",   false, "CoinsSpent")
        bt:AddDivider()
        bt:AddInput("WebhookLink", {
            Default = o.WebhookLink, Text = "Webhook Link",
            Placeholder = "https://discord.com/api/webhooks/...",
            Callback = function(bu) o.WebhookLink = bu end,
        })
        bt:AddToggle("AnonymousMode", { Text = "Anonymous Mode", Default = p.AnonymousMode })
        bt:AddButton({ Text = "Send Test Webhook", Func = function()
            local bu = o.WebhookLink
            if (not bu or bu == "") and ak.WebhookLink and ak.WebhookLink.Value then
                bu = ak.WebhookLink.Value; o.WebhookLink = bu
            end
            local bv = o.EmbedColor or Color3.fromRGB(85,200,110)
            local bw = math.floor(bv.R*255)*65536 + math.floor(bv.G*255)*256 + math.floor(bv.B*255)
            local bx = p.AnonymousMode and "Anonymous" or q.Name
            bj(bu, {
                username = bx,
                embeds = {{
                    title = "JurassicBlocky -- Test",
                    description = ("Webhook test from **%s**"):format(bx),
                    color = bw,
                    timestamp = DateTime.now():ToIsoDate(),
                    footer = { text = ("PlaceId: %d"):format(game.PlaceId) },
                }},
            })
        end })
        br("AnonymousMode", "AnonymousMode")

        aW.StartTime = tick()
        task.spawn(function()
            while v.value do
                task.wait(1)
                if bn and bn.Unloaded then break end
                local bu = tick() - aW.StartTime
                local bv = math.floor(bu / 3600)
                local bw = math.floor((bu % 3600) / 60)
                local bx = math.floor(bu % 60)
                local by = bv > 0 and ("%dh %dm %ds"):format(bv,bw,bx) or ("%dm %ds"):format(bw,bx)
                local bz = aW.LastCoins or 0
                local bA = bu > 1 and math.floor(aW.CoinsGained / bu * 3600) or 0
                y.safe(function()
                    if ak.SessionTime then ak.SessionTime:SetText("Session Time: " .. by) end
                    if ak.CoinsGained then ak.CoinsGained:SetText(("Coins Gained: %s"):format(tostring(aW.CoinsGained))) end
                    if ak.CoinRate    then ak.CoinRate:SetText(("Coin Rate: %s/hr"):format(tostring(bA))) end
                    if ak.CoinsTotal  then ak.CoinsTotal:SetText(("Coins Total: %s"):format(tostring(bz))) end
                    if ak.CoinsSpent  then ak.CoinsSpent:SetText(("Coins Spent: %s"):format(tostring(aW.CoinsSpent))) end
                end, "stats-tab")
            end
        end)
    end

    
    
    
    do
        local bs = bp.Settings:AddLeftGroupbox("Menu")
        bs:AddToggle("ShowCustomCursor", { Text = "Custom Cursor", Default = o.ShowCustomCursor,
            Callback = function(bt) bn.ShowCustomCursor = bt end,
        })
        local bt = {}
        if bn._ThemePresets then
            for bu, bv in pairs(bn._ThemePresets) do table.insert(bt, bu) end
            table.sort(bt)
        else bt = { "Jungle" } end
        bs:AddDropdown("Theme", {
            Values = bt, Default = bn.CurrentTheme or "Jungle", Text = "Theme",
            Tooltip = "Pick a theme; saves to disk. Re-execute the loadstring to fully apply.",
            Callback = function(bu)
                if bn.SetTheme then
                    local bv = bn:SetTheme(bu)
                    if bv then y.notify("Theme", ("Saved '%s' - reload to fully apply"):format(bu)) end
                end
            end,
        })
        bs:AddDropdown("NotifySide", {
            Values = { "Left","Right" }, Default = o.NotifySide, Text = "Notification Side",
            Callback = function(bu) bn:SetNotifySide(bu) end,
        })
        bs:AddDropdown("DPIScale", {
            Values = { "75%","100%","125%","150%" }, Default = "100%", Text = "DPI Scale",
            Callback = function(bu) bn:SetDPIScale(tonumber((bu:gsub("%%", "")))) end,
        })
        bs:AddLabel("Menu Keybind"):AddKeyPicker("MenuKeybind", {
            Default = o.GUIToggleKey, NoUI = true, Text = "Toggle UI",
        })
        bs:AddButton({ Text = "Unload", Func = function() bn:Unload() end, DoubleClick = true, Risky = true })
        bn.ToggleKeybind = ak.MenuKeybind

        local bu = bp.Settings:AddLeftGroupbox("Info HUD")
        bu:AddToggle("InfoHUD", { Text = "Enable HUD", Default = false,
            Callback = function(bv) if bv then aU.start() else aU.stop() end end,
        })
        bu:AddToggle("HUD_FPS",    { Text = "Show FPS",    Default = true,  Callback = function(bv) aU.Visible.FPS = bv end })
        bu:AddToggle("HUD_Ping",   { Text = "Show Ping",   Default = true,  Callback = function(bv) aU.Visible.Ping = bv end })
        bu:AddToggle("HUD_Memory", { Text = "Show Memory", Default = false, Callback = function(bv) aU.Visible.Memory = bv end })
        bu:AddToggle("HUD_Coords", { Text = "Show Coords", Default = false, Callback = function(bv) aU.Visible.Coords = bv end })
        bu:AddToggle("HUD_Time",   { Text = "Show Time",   Default = false, Callback = function(bv) aU.Visible.Time = bv end })
        bu:AddDropdown("HUD_Anchor", {
            Values = { "TopLeft","TopRight","BottomLeft","BottomRight" }, Default = aU.Anchor, Text = "HUD Corner",
            Callback = function(bv) aU.Anchor = bv; aU.refreshAnchor() end,
        })

        local bv = bp.Settings:AddRightGroupbox("Performance")
        bv:AddDropdown("PerfPreset", {
            Values = { "Default","Low","Medium","High" }, Default = "Default", Text = "Graphics Preset",
            Callback = function(bw)
                if bw == "Low" then a7(false); bb(false); m.GlobalShadows = false; m.FogEnd = 1e6
                    y.notify("Performance", "Low preset applied.")
                elseif bw == "Medium" then a7(true); bb(false); m.GlobalShadows = false
                    y.notify("Performance", "Medium preset applied.")
                elseif bw == "High" then a7(true); bb(true); m.GlobalShadows = true
                    y.notify("Performance", "High preset applied.")
                else y.notify("Performance", "Default preset.") end
            end,
        })
        bv:AddToggle("DisableShadows", { Text = "Disable Shadows", Default = false,
            Callback = function(bw) m.GlobalShadows = not bw end })
        bv:AddToggle("DisableFog", { Text = "Disable Fog", Default = false,
            Callback = function(bw) m.FogEnd = bw and 1e6 or 500 end })
        bv:AddSlider("CharTransparency", {
            Text = "Character Transparency", Default = 0, Min = 0, Max = 1, Rounding = 2,
            Callback = function(bw) a4(bw) end,
        })
        bv:AddSlider("CameraFOV", {
            Text = "Camera FOV", Default = 70, Min = 30, Max = 120, Rounding = 0,
            Callback = function(bw) a1(bw) end,
        })

        local bw = bp.Settings:AddRightGroupbox("Configs")
        local bx = aZ.list()
        if #bx == 0 then bx = { "---" } end
        bw:AddInput("ConfigName", { Text = "Config Name", Default = "default", Placeholder = "Name your config" })
        bw:AddDropdown("ConfigList", { Values = bx, Default = bx[1] or "---", Text = "Saved Configs" })
local by=function()            
local by = aZ.list()
            if #by == 0 then by = { "---" } end
            if ak.ConfigList and ak.ConfigList.SetValues then ak.ConfigList:SetValues(by) end
end        
bw:AddButton({ Text = "Save Config", Func = function()
            local bz = ak.ConfigName and ak.ConfigName.Value or ""
            if bz == "" then y.notify("Config", "Type a name first."); return end
            local bA, bB = aZ.save(bz, bn)
            if bA then y.notify("Config", "Saved '" .. bz .. "'"); by()
            else y.notify("Config", "Save failed: " .. tostring(bB)) end
        end })
        bw:AddButton({ Text = "Load Config", Func = function()
            local bz = ak.ConfigList and ak.ConfigList.Value or ""
            if bz == "" or bz == "---" then y.notify("Config", "No config selected."); return end
            local bA, bB = aZ.load(bz, bn)
            if bA then y.notify("Config", "Loaded '" .. bz .. "'")
            else y.notify("Config", "Load failed: " .. tostring(bB)) end
        end })
        bw:AddButton({ Text = "Delete Config", Risky = true, DoubleClick = true, Func = function()
            local bz = ak.ConfigList and ak.ConfigList.Value or ""
            if bz == "" or bz == "---" then y.notify("Config", "No config selected."); return end
            local bA, bB = aZ.delete(bz)
            if bA then y.notify("Config", "Deleted '" .. bz .. "'"); by()
            else y.notify("Config", "Delete failed: " .. tostring(bB)) end
        end })
        bw:AddButton({ Text = "Refresh List", Func = by })
    end

    bn:OnUnload(function()
        v.value = false
        x()
        aD.disable()
        aN.disable()
        bg.stop()
        bh.stop()
        a5.stop()
        bf(false)
        bb(true)
        a7(true)
        a3(false)
        aT.stop()
        aU.stop()
        y.debug("Library unloaded; framework cleaned up.")
    end)
end




y.safe(function()
    y.waitForCharacter()
    aT.start()
    bs()
    y.notify("JurassicBlocky " .. a,
        "Loaded. RightCtrl toggles the menu. Run Print Diagnostics in the Player tab to surface JB's real remote/stat names.")
    print(("[JurassicBlocky] %s loaded successfully"):format(a))
    y.debug("Bootstrap complete")
end, "Bootstrap")





getgenv().JurassicBlocky_Shutdown = function()
    v.value = false
    if bn and not bn.Unloaded then
        bn:Unload()
    else
        x()
        aD.disable()
        aN.disable()
        bg.stop()
        bh.stop()
        a5.stop()
        bf(false)
        bb(true)
        a7(true)
        a3(false)
        aT.stop()
    end
    y.notify("JurassicBlocky", "Shut down cleanly.")
end
