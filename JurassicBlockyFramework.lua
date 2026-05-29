












local a = "v2.0.9 NameHub (jb-m1-click-20260529)"




getgenv          = getgenv          or function() return _G end
hookmetamethod   = hookmetamethod   or function() end
getrawmetatable  = getrawmetatable  or function(b) return getmetatable(b) end
setreadonly      = setreadonly      or function() end
getnamecallmethod = getnamecallmethod or function() return "" end
setclipboard     = setclipboard     or function() end

local b = {
    isfolder   = isfolder   or function() return false end,
    makefolder = makefolder or function() end,
    isfile     = isfile     or function() return false end,
    readfile   = readfile   or function() return "" end,
    writefile  = writefile  or function() end,
    delfile    = delfile    or function() end,
    listfiles  = listfiles  or function() return {} end,
    appendfile = appendfile or function() end,
}

local c = (syn and syn.request) or (http and http.request) or request or http_request or function()
    return { StatusCode = 0, Body = "", Success = false }
end




do
    local d = { [11653088948] = true }
    if not d[game.PlaceId] then
        local e = ("[NameHub Jurassic Blocky] Wrong game (PlaceId=%d)."):format(game.PlaceId)
        warn(e)
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "NameHub", Text = "Wrong game.", Duration = 6,
            })
        end)
        error(e, 0)
    end
end




do
    local d = getgenv()
    if d._NameHubJB_Alive and type(d._NameHubJB_Unload) == "function" then
        pcall(d._NameHubJB_Unload)
    end
end




local d           = game:GetService("Players")
local e        = game:GetService("RunService")
local f  = game:GetService("UserInputService")
local g      = game:GetService("TweenService")
local h         = game:GetService("Workspace")
local i = game:GetService("ReplicatedStorage")
local j        = game:GetService("StarterGui")
local k       = game:GetService("VirtualUser")
local l       = game:GetService("HttpService")
local m           = game:GetService("CoreGui")
local n   = game:GetService("TeleportService")
local o          = game:GetService("Lighting")
local p            = h.CurrentCamera

local q = d.LocalPlayer
if not q then
    d.PlayerAdded:Wait()
    q = d.LocalPlayer
end




local r    = "NameHubJB"
local s     = r .. "/configs"
local t   = r .. "/themes"
local u  = r .. "/autoload.txt"

pcall(function()
    if not b.isfolder(r)  then b.makefolder(r)  end
    if not b.isfolder(s)   then b.makefolder(s)   end
    if not b.isfolder(t) then b.makefolder(t) end
end)




local v = {
    Brand         = "NameHub",
    SubBrand      = "Jurassic Blocky",
    DefaultWS     = 16,
    DefaultJP     = 50,

    DinoOptions = {
        "Gallimimus", "Triceratops", "T-Rex", "Spinosaurus",
        "Velociraptor", "Stegosaurus", "Brachiosaurus", "Ankylosaurus",
        "Carnotaurus", "Allosaurus", "Pteranodon", "Parasaurolophus",
    },

    FarmTargetOptions = {
        "Goat", "D-Rex", "Amber", "Bambiraptor", "Triceratops",
        "T-Rex", "Spinosaurus", "Stegosaurus", "Velociraptor",
        "Players", "All NPCs",
    },

    MovementOptions = { "Teleport", "Fly", "Walk" },

    FontOptions = {
        "Gotham", "GothamBold", "GothamMedium", "GothamSemibold",
        "SourceSans", "SourceSansBold", "RobotoMono", "Arial", "Code", "Highway",
    },

    NotifySides = { "Right", "Left", "Top", "Bottom" },

    
    
    
    
    
    
    JB_AttackNames    = {
        "successOnHit",
        "HitboxClassRemote",
        "requestSkill",
        "tap",
        "damageDealt",
        "requestKnockback",
        "onHeavyRequest",
    },
    JB_LootNames      = { "collectAmber", "collect", "collectPresent" },
    JB_SpawnName      = "spawn",

    AttackKeywords = { "successOnHit", "successonhit", "hit", "bite", "claw", "swing", "attack", "damage", "combat", "kill" },
    LootKeywords   = { "collectAmber", "collect", "claim", "pickup", "loot", "reward" },
    DinoChangeKeywords = { "spawn", "selectdino", "changedino", "playas", "dinoselect" },
    RespawnKeywords    = { "respawn", "reset", "revive" },
    MenuKeywords       = { "menu", "openmenu", "togglemenu" },
}




local w = {
    
    Autofarm          = false,
    FarmTarget        = "Goat",
    FarmPriority      = { "D-Rex", "Goat" },
    Speed             = 16,
    AutoLoot          = true,
    AutofarmDino      = "Gallimimus",
    CoinsGained       = 0,
    StartTime         = nil,
    StatsCounting     = false,
    
    
    
    
    
    SkipPlayers       = true,
    
    
    
    
    
    
    
    
    
    
    
    AutofarmMovement  = "Fly",
    
    
    StopDistance      = 10,
    
    
    
    
    ManualAttackRemote = "",
    
    
    
    _FarmStatus       = "Idle",
    _LastTarget       = "",
    _LastDistance     = 0,
    _LastFire         = "",
    _AttackRemote     = "",
    _TargetsFound     = 0,
    _NamedFound       = 0,
    
    
    
    _LoopPhase        = "(never started)",
    _LoopTick         = 0,
    _LoopErr          = "",

    
    GoatESP           = false,
    GoatESPColor      = Color3.fromRGB(255, 255, 255),
    AmberESP          = false,
    AmberESPColor     = Color3.fromRGB(245, 158, 11),
    NoPromptDelay     = false,
    OutlineTransparency = 0,
    FillTransparency    = 0.5,

    
    Fly               = false,
    FlySpeed          = 90,
    RespawnDelay      = 0,
    AutoRespawn       = false,
    Anchored          = false,

    
    OffsetX           = 5,
    OffsetY           = 5,
    Range             = 50,
    MaxTargetHP       = 0,           
    MinTargetHP       = 0,
    DisengageAt       = 300,
    TargetPOV         = false,
    AutoAttackNearby  = false,
    AutoAttack        = false,
    AutoTPToPlayer    = false,
    TargetPlayer      = "",

    
    HopOnPlayerCount  = 0,
    HopOnFriend       = false,
    SelectedJobId     = "",
    ServerListCache   = {},

    
    KickOnAdmin       = false,
    AdminList         = { "admin", "staff", "moderator", "developer", "owner" },

    
    WebhookLink       = "",
    WebhookInterval   = 10,
    WebhookTimezone   = 0,
    WebhookColor      = Color3.fromRGB(59, 130, 246),
    WebhookAnonymous  = false,

    
    Theme             = "Default",
    BgColor           = Color3.fromRGB(10, 12, 16),
    MainColor         = Color3.fromRGB(18, 22, 28),
    AccentColor       = Color3.fromRGB(34, 197, 94),
    OutlineColor      = Color3.fromRGB(34, 197, 94),
    FontColor         = Color3.fromRGB(235, 240, 245),
    FontFace          = "Gotham",
    MenuBind          = "LeftAlt",
    Autoexecute       = false,
    NotificationSide  = "Right",
    AutoloadConfig    = "",
    UIScale           = 1,
    _ZoomPick         = "100%",

    
    Alive             = true,
    UIVisible         = true,
}

local x      = {}      
local y = {}      
local z    = {}      
local A     = {}      
local B   = {}      



local C




local D = {}

function D.safe(E, F)
    return function(...)
        local G, H = pcall(E, ...)
        if not G then
            warn(("[%s][%s] %s"):format(v.Brand, F or "?", H))
        end
        return G
    end
end

function D.spawn(E, F)
    return task.spawn(D.safe(E, F or "spawn"))
end

function D.conn(E, F)
    if x[E] and x[E].Connected then x[E]:Disconnect() end
    x[E] = F
    return F
end

function D.disconnect(E)
    if x[E] and x[E].Connected then x[E]:Disconnect() end
    x[E] = nil
end

function D.disconnectAll()
    for E, F in pairs(x) do
        if F and F.Connected then pcall(function() F:Disconnect() end) end
        x[E] = nil
    end
end

function D.rand(E) return (E or "_") .. tostring(math.random(100000, 999999)) end

function D.distance(E, F)
    if not E or not F then return math.huge end
    local G = typeof(E) == "Instance" and E.Position or E
    local H = typeof(F) == "Instance" and F.Position or F
    return (G - H).Magnitude
end

function D.contains(E, F)
    for G, H in ipairs(E) do if H == F then return true end end
    return false
end

function D.shallowCopy(E)
    local F = {}
    for G, H in pairs(E) do F[G] = H end
    return F
end

function D.color3ToHex(E)
    return string.format("#%02X%02X%02X",
        math.floor(E.R * 255 + 0.5),
        math.floor(E.G * 255 + 0.5),
        math.floor(E.B * 255 + 0.5))
end

function D.color3ToInt(E)
    return math.floor(E.R * 255) * 65536 + math.floor(E.G * 255) * 256 + math.floor(E.B * 255)
end

function D.color3ToTable(E)
    return { math.floor(E.R * 255), math.floor(E.G * 255), math.floor(E.B * 255) }
end

function D.tableToColor3(E)
    if type(E) ~= "table" or #E < 3 then return Color3.new(1, 1, 1) end
    return Color3.fromRGB(E[1], E[2], E[3])
end

function D.tween(E, F, G)
    local H = TweenInfo.new(F or 0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    g:Create(E, H, G):Play()
end

function D.fmtTime(E)
    E = math.max(0, math.floor(E))
    local F = math.floor(E / 3600)
    local G = math.floor((E % 3600) / 60)
    local H = E % 60
    if F > 0 then return string.format("%dh %dm %ds", F, G, H) end
    if G > 0 then return string.format("%dm %ds", G, H) end
    return string.format("%ds", H)
end




local E = {}

function E.encode(F)
    local G, H = pcall(function() return l:JSONEncode(F) end)
    return G and H or "{}"
end

function E.decode(F)
    if type(F) ~= "string" or #F == 0 then return {} end
    local G, H = pcall(function() return l:JSONDecode(F) end)
    return G and H or {}
end




local F = {}

function F.send(G, H)
    H = H or 3
    if not _G._NHJB_NotifyGui or not _G._NHJB_NotifyGui.Parent then
        local I = Instance.new("ScreenGui")
        I.Name = D.rand("_NHJB_NF_")
        I.IgnoreGuiInset = true
        I.ResetOnSpawn   = false
        I.DisplayOrder   = 1000000
        local J = pcall(function() I.Parent = m end)
        if not J then
            local K = q:WaitForChild("PlayerGui", 5)
            if K then I.Parent = K end
        end
        _G._NHJB_NotifyGui = I
    end

    local I = Instance.new("Frame")
    I.Size = UDim2.fromOffset(280, 50)
    I.BackgroundColor3 = w.MainColor
    I.BorderSizePixel = 0
    I.Parent = _G._NHJB_NotifyGui
    Instance.new("UICorner", I).CornerRadius = UDim.new(0, 8)
    local J = Instance.new("UIStroke", I)
    J.Color = w.AccentColor
    J.Transparency = 0.5

    local K = Instance.new("TextLabel", I)
    K.Size = UDim2.new(1, -20, 1, -10)
    K.Position = UDim2.fromOffset(10, 5)
    K.BackgroundTransparency = 1
    K.Text = tostring(G)
    K.TextColor3 = w.FontColor
    K.Font = Enum.Font[w.FontFace] or Enum.Font.Gotham
    K.TextSize = 12
    K.TextWrapped = true
    K.TextXAlignment = Enum.TextXAlignment.Left

    table.insert(B, I)
local L=function()        

local L = w.NotificationSide
        local M = 0
        for N, O in ipairs(B) do
            if O == I then M = N break end
        end
        local N = 10 + (M - 1) * 58
        if L == "Right"  then I.Position = UDim2.new(1, -290, 0, N) end
        if L == "Left"   then I.Position = UDim2.new(0,   10, 0, N) end
        if L == "Top"    then I.Position = UDim2.new(0.5, -140 + (M - 1) * 0, 0, N) end
        if L == "Bottom" then I.Position = UDim2.new(0.5, -140, 1, -60 - (M - 1) * 58) end
end
    
L()
    task.delay(0, function()
        for M, N in ipairs(B) do
            local O = 0
            for P, Q in ipairs(B) do if Q == N then O = P break end end
            if O > 0 then
                local P = 10 + (O - 1) * 58
                local Q = w.NotificationSide
                if Q == "Right"  then N.Position = UDim2.new(1, -290, 0, P) end
                if Q == "Left"   then N.Position = UDim2.new(0,   10, 0, P) end
                if Q == "Bottom" then N.Position = UDim2.new(0.5, -140, 1, -60 - (O - 1) * 58) end
            end
        end
    end)

    task.delay(H, function()
        if not I or not I.Parent then return end
        D.tween(I, 0.25, { BackgroundTransparency = 1 })
        for M, N in ipairs(I:GetDescendants()) do
            if N:IsA("TextLabel") then D.tween(N, 0.25, { TextTransparency = 1 }) end
            if N:IsA("UIStroke")  then D.tween(N, 0.25, { Transparency = 1 })     end
        end
        task.wait(0.3)
        for M = #B, 1, -1 do
            if B[M] == I then table.remove(B, M) break end
        end
        I:Destroy()
    end)
end




local G = {}

function G.get()           return q.Character end
function G.root()
    local H = G.get(); if not H then return nil end
    return H:FindFirstChild("HumanoidRootPart") or H.PrimaryPart
end
function G.humanoid()
    local H = G.get(); if not H then return nil end
    return H:FindFirstChildOfClass("Humanoid")
end

function G.applySpeed()
    local H = G.humanoid(); if not H then return end
    H.WalkSpeed = w.Speed
end

function G.applyAnchor()
    local H = G.root(); if not H then return end
    H.Anchored = w.Anchored
end




local H = {}

local function walk(I, J, K)
    K = K or {}
    if not I or K[I] then return end
    K[I] = true
    for L, M in ipairs(I:GetChildren()) do
        J(M)
        walk(M, J, K)
    end
end
local I=function()    




local I = { i }
    pcall(function()
        local J = q or d.LocalPlayer
        if J then
            if J.Character then I[#I + 1] = J.Character end
            local K = J:FindFirstChild("PlayerScripts")
            if K then I[#I + 1] = K end
        end
    end)
    
    
    I[#I + 1] = h
    return I
end



function H.remoteByName(J)
    if not J or J == "" then return nil end
    
    
    local K = J:find("%.") ~= nil
    local L
    for M, N in ipairs(I()) do
        if L then break end
        walk(N, function(O)
            if L then return end
            if O:IsA("RemoteEvent") or O:IsA("RemoteFunction") then
                if K then
                    if O:GetFullName():lower():find(J:lower(), 1, true) then
                        L = O
                    end
                elseif O.Name == J then
                    L = O
                end
            end
        end)
    end
    return L
end



function H.remoteByKeywords(J)
    for K, L in ipairs(J or {}) do
        local M = L:lower()
        local N
        for O, P in ipairs(I()) do
            if N then break end
            walk(P, function(Q)
                if N then return end
                if Q:IsA("RemoteEvent") or Q:IsA("RemoteFunction") then
                    if Q.Name:lower():find(M, 1, true) then N = Q end
                end
            end)
        end
        if N then return N, L end
    end
    return nil, nil
end

function H.allRemotes(J)
    J = J or 600
    local K = {}
    local L = {}
    for M, N in ipairs(I()) do
        walk(N, function(O)
            if #K >= J then return end
            if (O:IsA("RemoteEvent") or O:IsA("RemoteFunction")) and not L[O] then
                L[O] = true
                K[#K + 1] = O:GetFullName() .. "  [" .. O.ClassName .. "]"
            end
        end)
    end
    return K
end




local J = {}

function J.allWithHumanoid()
    local K = {}
    for L, M in ipairs(h:GetDescendants()) do
        if M:IsA("Model") and M ~= G.get() then
            local N = M:FindFirstChildOfClass("Humanoid")
            local O = M:FindFirstChild("HumanoidRootPart") or M.PrimaryPart
            if N and O and N.Health > 0 then K[#K + 1] = { model = M, hum = N, root = O } end
        end
    end
    return K
end






function J.allByName(K)
    if not K or K == "" then return {} end
    local L = K:lower()
    local M = {}
    local N = G.get()
    for O, P in ipairs(h:GetDescendants()) do
        if P:IsA("Model") and P ~= N and P.Name:lower():find(L, 1, true) then
            if not (w.SkipPlayers and d:GetPlayerFromCharacter(P) ~= nil) then
                local Q = P:FindFirstChild("HumanoidRootPart") or P.PrimaryPart
                if not Q then
                    
                    for R, S in ipairs(P:GetChildren()) do
                        if S:IsA("BasePart") then Q = S; break end
                    end
                end
                local R = P:FindFirstChildOfClass("Humanoid")
                if Q then
                    M[#M + 1] = { model = P, hum = R, root = Q }
                end
            end
        end
    end
    return M
end

function J.matchesName(K, L)
    local M = d:GetPlayerFromCharacter(K) ~= nil

    if L == "Players"  then return M end
    if L == "All NPCs" then return not M end

    
    
    
    
    
    
    if w.SkipPlayers and M then return false end

    if not L or L == "" then return true end
    local N = K.Name:lower()
    return N:find(L:lower(), 1, true) ~= nil
end

function J.bestByPriority(K)
    local L = J.allWithHumanoid()
    local M   = G.root()
    if not M then return nil end

    
    for N, O in ipairs(K or {}) do
        local P ,Q=(math.huge
)        for R, S in ipairs(L) do
            if J.matchesName(S.model, O) then
                if w.MaxTargetHP == 0 or S.hum.Health <= w.MaxTargetHP then
                    if S.hum.Health >= w.MinTargetHP then
                        local T = D.distance(M, S.root)
                        if T < P then Q, P = S, T end
                    end
                end
            end
        end
        if Q then return Q end
    end
    return nil
end

function J.dump(K)
    K = K or 50
    local L  = G.root()
    local M = {}
    for N, O in ipairs(J.allWithHumanoid()) do
        if #M >= K then break end
        local P = L and D.distance(L, O.root) or -1
        local Q = d:GetPlayerFromCharacter(O.model)
        M[#M + 1] = ("%-30s HP=%-6.1f dist=%-6.1f %s"):format(
            O.model.Name:sub(1, 30), O.hum.Health, P, Q and ("player=" .. Q.Name) or "NPC")
    end
    return M
end




local K = {}
local L, M

function K.findRemote()
    
    
    if w.ManualAttackRemote and w.ManualAttackRemote ~= "" then
        if L and L.Parent and M == w.ManualAttackRemote then
            return L, M
        end
        local N = H.remoteByName(w.ManualAttackRemote)
        if N then
            L, M = N, w.ManualAttackRemote
            return N, w.ManualAttackRemote
        end
        
        
    end
    if L and L.Parent then return L, M end
    for N, O in ipairs(v.JB_AttackNames) do
        local P = H.remoteByName(O)
        if P then L, M = P, O; return P, O end
    end
    local N, O = H.remoteByKeywords(v.AttackKeywords)
    L, M = N, O or ""
    return N, M
end

function K.invalidateCache() L, M = nil, nil end




function K.clickM1()
    local N
    pcall(function()
        if mouse1press and mouse1release then
            mouse1press()
            task.wait(0.04)
            mouse1release()
            N = true
        end
    end)
    if N then return true end
    pcall(function()
        k:Button1Down(Vector2.new(0, 0), h.CurrentCamera.CFrame)
        task.wait(0.04)
        k:Button1Up(Vector2.new(0, 0), h.CurrentCamera.CFrame)
        N = true
    end)
    return N == true
end




function K.aimAt(N)
    if not N or not N.root then return end
    pcall(function()
        local O = h.CurrentCamera
        local P  = G.root()
        if not (O and P) then return end
        O.CFrame = CFrame.lookAt(O.CFrame.Position, N.root.Position)
    end)
end

function K.fireAt(N)
    local O, P = K.findRemote()
    if not O or not N then return false end

    
    
    
    
    local Q
    if P == "successOnHit" then
        Q = {
            { N.hum },
            { N.model },
            { N.root },
            { N.hum, N.root.Position },
            { N.model, N.root.Position },
            { { Target = N.hum }   },
            { { Target = N.model } },
        }
    elseif P == "HitboxClassRemote" then
        
        Q = {
            { { N.hum }, "Attack" },
            { { N.model }, "Attack" },
            { N.hum, "Attack" },
            { N.model, N.root.Position },
            { N.hum },
            { N.model },
            { { N.hum } },
        }
    elseif P == "requestSkill" then
        
        Q = {
            { "BasicAttack", { N.hum } },
            { "BasicAttack", { N.model } },
            { "Attack", N.hum },
            { "Attack", N.model },
            { N.hum },
            { N.model },
        }
    elseif P == "damageDealt" then
        
        Q = {
            { N.hum, 9999 },
            { N.model, 9999 },
            { N.hum, 1 },
            { N.model, 1 },
            { { Target = N.hum, Amount = 9999 } },
        }
    elseif P == "tap" then
        Q = {
            { N.root.Position },
            { N.model },
            { N.hum },
            { },
        }
    elseif P == "requestKnockback" or P == "onHeavyRequest" then
        Q = {
            { N.hum, N.root.Position },
            { N.model, N.root.Position },
            { N.hum },
            { N.model },
        }
    else
        Q = {
            { N.model }, { N.hum }, { N.root }, { N.model.Name },
            { N.hum, N.root.Position }, { },
        }
    end

    for R, S in ipairs(Q) do
        local T = pcall(function()
            if O:IsA("RemoteEvent") then O:FireServer(table.unpack(S))
            else O:InvokeServer(table.unpack(S)) end
        end)
        if T then return true end
    end
    return false
end


function K.collectNearby()
    for N, O in ipairs(v.JB_LootNames) do
        local P = H.remoteByName(O)
        if P then
            pcall(function()
                if P:IsA("RemoteEvent") then P:FireServer() else P:InvokeServer() end
            end)
        end
    end
end




local N = {}

function N.start()
    D.spawn(function()
        local O, P, Q = 0, 0, 0
local R=function(


R, S)            
w._LoopPhase = R
            local T, U = pcall(S)
            if not T then
                w._LoopErr = ("[%s] %s"):format(R, tostring(U or ""):sub(1, 120))
            end
            return T, U
end
        
while w.Alive and w.Autofarm do
            Q = Q + 1
            w._LoopTick = Q
            w._LoopPhase = "tick start"
            local S = G.root()
            if S then
                local T, U = R("build priority list", function()
                    return (w.FarmPriority and #w.FarmPriority > 0) and w.FarmPriority or { w.FarmTarget }
                end)
                if not U then U = { w.FarmTarget or "Goat" } end
                local V, W = R("bestByPriority", function()
                    return J.bestByPriority(U)
                end)

                
                
                
                
                if not W then
                    R("name fallback", function()
                        local X = math.huge
                        for Y, Z in ipairs(U) do
                            for _, aa in ipairs(J.allByName(Z)) do
                                local ab = D.distance(S, aa.root)
                                if ab < X then W = aa; X = ab end
                            end
                            if W then break end
                        end
                    end)
                end

                local aa = G.humanoid()
                local ab = (aa and w.DisengageAt > 0 and aa.Health < w.DisengageAt)

                if ab then
                    w._FarmStatus = ("Retreating (HP %d < %d)"):format(math.floor(aa.Health), w.DisengageAt)
                    
                    
                    
                    if w.AutofarmMovement == "Fly" and FarmMove.flyActive() then
                        _fmBV.Velocity = Vector3.zero
                    end
                elseif W and W.model and W.model.Parent and W.root then
                    R("compute dist", function()
                        local X = D.distance(S, W.root)
                        w._FarmStatus    = ("Engaging %s @ %.0fm"):format(W.model.Name, X)
                        w._LastTarget    = W.model.Name
                        w._LastDistance  = X
                    end)

                    local X = w._LastDistance or 0

                    R("movement", function()
                        if w.AutofarmMovement == "Fly" then
                            if X > w.StopDistance then
                                FarmMove.flyToward(W.root.Position)
                            elseif FarmMove.flyActive() then
                                _fmBV.Velocity = Vector3.zero
                            end
                        elseif w.AutofarmMovement == "Walk" then
                            if X > w.StopDistance then
                                FarmMove.walkTo(W.root.Position)
                            end
                        else
                            if X > w.Range then
                                FarmMove.tpTo(W.root.Position)
                            end
                        end
                    end)

                    
                    
                    
                    
                    
                    if tick() >= O then
                        R("find attack remote", function()
                            local Y, Z = K.findRemote()
                            w._AttackRemote = Z ~= "" and Z or "(none)"
                        end)
                        
                        
                        
                        
                        
                        
                        if X <= w.Range then
                            R("aim at target", function() K.aimAt(W) end)
                            R("click M1", function() K.clickM1() end)
                        end
                        local Y, Z = R("fire attack remote", function()
                            return K.fireAt(W)
                        end)
                        w._LastFire = (Y and Z) and "OK" or "FAIL"
                        if Y and Z and w.StatsCounting then
                            w.CoinsGained = w.CoinsGained + 1
                        end
                        O = tick() + 0.35
                    end
                else
                    w._FarmStatus = ("Searching for: %s"):format(table.concat(U, ", "))
                    
                    if w.AutofarmMovement == "Fly" and FarmMove.flyActive() then
                        _fmBV.Velocity = Vector3.zero
                    end
                end

                
                if Q % 5 == 0 then
                    local X = #J.allWithHumanoid()
                    local Y = 0
                    for Z, _ in ipairs(U) do
                        Y = Y + #J.allByName(_)
                    end
                    w._TargetsFound = X
                    w._NamedFound   = Y
                end

                if w.AutoLoot and tick() >= P then
                    K.collectNearby()
                    P = tick() + 3
                end
            else
                w._FarmStatus = "No character"
            end
            task.wait(0.1)
        end
        
        
        FarmMove.stopFly()
        w._FarmStatus = "Idle"
    end, "AutoFarm.loop")
end




local aa = {}

function aa.start()
    D.spawn(function()
        local ab = 0
        while w.Alive do
            if w.AutoAttackNearby or w.AutoAttack or w.AutoTPToPlayer then
                local O = G.root()
                if O then
                    local P
                    if w.AutoTPToPlayer and w.TargetPlayer ~= "" then
                        local Q = d:FindFirstChild(w.TargetPlayer)
                        if Q and Q.Character then
                            local R = Q.Character:FindFirstChild("HumanoidRootPart")
                            local S = Q.Character:FindFirstChildOfClass("Humanoid")
                            if R and S then
                                local U = CFrame.new(R.Position) * CFrame.new(w.OffsetX, w.OffsetY, 0)
                                U = CFrame.lookAt(U.Position, R.Position)
                                pcall(function() O.CFrame = U end)
                                if w.AutoAttack then
                                    P = { model = Q.Character, hum = S, root = R }
                                end
                            end
                        end
                    end

                    if not P and w.AutoAttackNearby then
                        P = J.bestByPriority({ "Players" })
                    end
                    if not P and w.AutoAttack then
                        P = J.bestByPriority(w.FarmPriority)
                    end

                    if P and tick() >= ab then
                        local Q = D.distance(O, P.root)
                        if Q <= w.Range then
                            local R = G.humanoid()
                            if not R or R.Health >= w.DisengageAt or w.DisengageAt == 0 then
                                K.fireAt(P)
                                ab = tick() + 0.35
                            end
                        end
                    end

                    if w.TargetPOV and P and P.root then
                        pcall(function()
                            p.CameraType    = Enum.CameraType.Scriptable
                            p.CFrame        = CFrame.new(P.root.Position + Vector3.new(0, 8, 12), P.root.Position)
                        end)
                    end
                end
            else
                if p.CameraType == Enum.CameraType.Scriptable then
                    pcall(function() p.CameraType = Enum.CameraType.Custom end)
                end
            end
            task.wait(0.1)
        end
    end, "Combat.loop")
end




local ab = {}

function ab.clearAll()
    for O, P in pairs(y) do
        if P and P.Parent then P:Destroy() end
        y[O] = nil
    end
end

function ab.applyHighlight(O, P)
    if y[O] then return end
    local Q = Instance.new("Highlight")
    Q.Adornee = O
    Q.FillColor = P
    Q.OutlineColor = P
    Q.FillTransparency    = w.FillTransparency
    Q.OutlineTransparency = w.OutlineTransparency
    Q.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Q.Parent = O
    y[O] = Q
end

function ab.refresh()
    
    for O, P in pairs(y) do
        if P and P.Parent then
            P.FillTransparency    = w.FillTransparency
            P.OutlineTransparency = w.OutlineTransparency
        end
    end
end

function ab.start()
    D.spawn(function()
        while w.Alive do
            
            for O, P in pairs(y) do
                if not O.Parent or not P.Parent then
                    if P.Parent then P:Destroy() end
                    y[O] = nil
                end
            end

            if w.GoatESP or w.AmberESP then
                for O, P in ipairs(J.allWithHumanoid()) do
                    local Q = P.model.Name:lower()
                    if w.GoatESP and (Q:find("goat", 1, true) or Q:find("dino", 1, true) or d:GetPlayerFromCharacter(P.model) == nil) then
                        ab.applyHighlight(P.model, w.GoatESPColor)
                    end
                end
                if w.AmberESP then
                    for O, P in ipairs(h:GetDescendants()) do
                        if P:IsA("Model") or P:IsA("BasePart") then
                            local Q = P.Name:lower()
                            if Q:find("amber", 1, true) and not y[P] then
                                ab.applyHighlight(P, w.AmberESPColor)
                            end
                        end
                    end
                end
            else
                ab.clearAll()
            end
            task.wait(0.5)
        end
        ab.clearAll()
    end, "ESP.loop")
end




local O = {}
local P, Q, R

function O.enable()
    local S = G.get(); if not S then return end
    local U = G.root(); if not U then return end
    local V = G.humanoid()

    O.disable()
    R = {}

    P = Instance.new("BodyVelocity")
    P.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    P.Velocity = Vector3.zero
    P.Parent = U

    Q = Instance.new("BodyGyro")
    Q.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    Q.P = 1000
    Q.CFrame = U.CFrame
    Q.Parent = U

    if V then V.PlatformStand = true end

    D.conn("fly_input_began", f.InputBegan:Connect(function(W, X)
        if X then return end
        R[W.KeyCode] = true
    end))
    D.conn("fly_input_ended", f.InputEnded:Connect(function(W)
        R[W.KeyCode] = false
    end))

    D.conn("fly_step", e.RenderStepped:Connect(function()
        if not (w.Fly and P and P.Parent) then return end
        local W = p
        if not W then return end
        local X = Vector3.zero
        if R[Enum.KeyCode.W]      then X = X + W.CFrame.LookVector end
        if R[Enum.KeyCode.S]      then X = X - W.CFrame.LookVector end
        if R[Enum.KeyCode.A]      then X = X - W.CFrame.RightVector end
        if R[Enum.KeyCode.D]      then X = X + W.CFrame.RightVector end
        if R[Enum.KeyCode.Space]  then X = X + Vector3.new(0, 1, 0) end
        if R[Enum.KeyCode.LeftControl] then X = X - Vector3.new(0, 1, 0) end

        if X.Magnitude > 0 then X = X.Unit * w.FlySpeed
        else X = Vector3.zero end
        P.Velocity = X
        Q.CFrame = W.CFrame
    end))
end

function O.disable()
    D.disconnect("fly_input_began")
    D.disconnect("fly_input_ended")
    D.disconnect("fly_step")
    if P then pcall(function() P:Destroy() end); P = nil end
    if Q then pcall(function() Q:Destroy() end); Q = nil end
    local S = G.humanoid()
    if S then pcall(function() S.PlatformStand = false end) end
    R = nil
end






local S = {}
local U, V

function S.startFly()
    local W = G.root(); if not W then return end
    S.stopFly()
    U = Instance.new("BodyVelocity")
    U.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    U.Velocity = Vector3.zero
    U.Parent = W
    V = Instance.new("BodyGyro")
    V.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    V.P = 1000
    V.CFrame = W.CFrame
    V.Parent = W
    local X = G.humanoid()
    if X then X.PlatformStand = true end
end

function S.stopFly()
    if U then pcall(function() U:Destroy() end); U = nil end
    if V then pcall(function() V:Destroy() end); V = nil end
    
    if not w.Fly then
        local W = G.humanoid()
        if W then pcall(function() W.PlatformStand = false end) end
    end
end



function S.flyActive()
    return U ~= nil and U.Parent ~= nil
end



function S.flyToward(W)
    local X = G.root(); if not X then return end
    if not S.flyActive() then S.startFly() end
    if not U then return end
    local Y = W - X.Position
    local Z = Y.Magnitude
    if Z < 0.5 then
        U.Velocity = Vector3.zero
        return
    end
    U.Velocity = Y.Unit * w.FlySpeed
    if V then V.CFrame = CFrame.lookAt(X.Position, W) end
end


function S.tpTo(W)
    local X = G.root(); if not X then return end
    local Y = CFrame.new(W) * CFrame.new(w.OffsetX, w.OffsetY, math.min(8, w.Range * 0.2))
    Y = CFrame.lookAt(Y.Position, W)
    pcall(function() X.CFrame = Y end)
end


function S.walkTo(W)
    local X = G.humanoid()
    if X then pcall(function() X:MoveTo(W) end) end
end




local W = {}

function W.respawn()
    local X = G.humanoid()
    if X then
        X.Health = 0
    else
        pcall(function() q.Character:BreakJoints() end)
    end
end

function W.openMenu()
    local X = H.remoteByKeywords(v.MenuKeywords)
    if X then
        pcall(function()
            if X:IsA("RemoteEvent") then X:FireServer() else X:InvokeServer() end
        end)
        return
    end
    
    pcall(function() k:CaptureController() end)
end

function W.attachAutoRespawn()
    D.conn("char_died_watch", q.CharacterAdded:Connect(function(X)
        local Y = X:WaitForChild("Humanoid", 5)
        if not Y then return end
        Y.Died:Connect(function()
            if not w.AutoRespawn then return end
            task.wait(w.RespawnDelay)
            if not w.AutoRespawn then return end
            
            pcall(function() q:LoadCharacter() end)
        end)
    end))
end




local X = {}

function X.fetchServers()
    local Y = game.PlaceId
    local Z = ("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100"):format(Y)
    local _ = c({ Url = Z, Method = "GET" })
    if not _ or _.StatusCode ~= 200 then return {} end
    local ac = E.decode(_.Body or "")
    local ad = {}
    for ae, af in ipairs(ac.data or {}) do
        if af.id and af.id ~= game.JobId then
            ad[#ad + 1] = { id = af.id, playing = af.playing or 0, max = af.maxPlayers or 0 }
        end
    end
    return ad
end

function X.joinJobId(ac)
    if not ac or ac == "" then return end
    pcall(function() n:TeleportToPlaceInstance(game.PlaceId, ac, q) end)
end

function X.rejoin()
    pcall(function() n:TeleportToPlaceInstance(game.PlaceId, game.JobId, q) end)
end

function X.randomHop()
    local ac = X.fetchServers()
    if #ac == 0 then F.send("No servers found.") return end
    local ad = ac[math.random(1, #ac)]
    X.joinJobId(ad.id)
end

function X.attachWatchers()
    
    D.conn("friend_watch", d.PlayerAdded:Connect(function(ac)
        if not w.HopOnFriend then return end
        local ad, ae = pcall(function() return q:IsFriendsWith(ac.UserId) end)
        if ad and ae then X.randomHop() end
    end))

    
    D.spawn(function()
        while w.Alive do
            if w.HopOnPlayerCount > 0 and #d:GetPlayers() <= w.HopOnPlayerCount then
                X.randomHop()
                task.wait(10)
            end
            task.wait(5)
        end
    end, "Hop.thresholdLoop")
end




local ac = {}

function ac.isAdmin(ad)
    ad = ad:lower()
    for ae, af in ipairs(w.AdminList) do
        if ad:find(af, 1, true) then return true end
    end
    return false
end

function ac.attach()
    D.conn("admin_watch", d.PlayerAdded:Connect(function(ad)
        if not w.KickOnAdmin then return end
        if ac.isAdmin(ad.Name) or ac.isAdmin(ad.DisplayName or "") then
            F.send("Admin detected: " .. ad.Name .. " — kicking self.", 5)
            task.wait(0.3)
            pcall(function() q:Kick("[NameHub] Admin detected: " .. ad.Name) end)
        end
    end))

    
    D.spawn(function()
        task.wait(2)
        if not w.KickOnAdmin then return end
        for ad, ae in ipairs(d:GetPlayers()) do
            if ae ~= q and (ac.isAdmin(ae.Name) or ac.isAdmin(ae.DisplayName or "")) then
                F.send("Admin in server: " .. ae.Name .. " — kicking self.", 5)
                task.wait(0.3)
                pcall(function() q:Kick("[NameHub] Admin in server: " .. ae.Name) end)
                return
            end
        end
    end, "Safety.initScan")
end




local ad = {}
local ae = 0

function ad.send(af)
    if not af and w.WebhookLink == "" then return end
    if w.WebhookLink == "" then F.send("Set a webhook URL first.") return end

    local Y = w.StartTime and (os.time() - w.StartTime) or 0
    local Z    = Y > 0 and (w.CoinsGained / (Y / 60)) or 0

    local _ = w.WebhookAnonymous and "Anonymous" or q.Name
    local ag       = w.WebhookTimezone
    local ah   = os.time() + ag * 3600
    local ai   = os.date("!%Y-%m-%d %H:%M:%S", ah) .. (" UTC%+d"):format(ag)

    local aj = {
        username = "NameHub JB",
        embeds = {{
            title  = "NameHub Jurassic Blocky — Stats",
            color  = D.color3ToInt(w.WebhookColor),
            fields = {
                { name = "User",          value = _,                                inline = true },
                { name = "Server",        value = ("`%s`"):format(game.JobId or "n/a"),    inline = true },
                { name = "Time",          value = ai,                                  inline = false },
                { name = "Coins Gained",  value = tostring(w.CoinsGained),                 inline = true },
                { name = "Rate (per min)",value = string.format("%.1f", Z),             inline = true },
                { name = "Elapsed",       value = D.fmtTime(Y),                      inline = true },
                { name = "Auto-Farm",     value = w.Autofarm and "ON" or "OFF",            inline = true },
                { name = "Target",        value = w.FarmTarget,                            inline = true },
                { name = "Dino",          value = w.AutofarmDino,                          inline = true },
            },
            footer = { text = a },
        }},
    }
    local ak = E.encode(aj)
    local al = pcall(function()
        c({
            Url     = w.WebhookLink,
            Method  = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body    = ak,
        })
    end)
    if al then
        ae = tick()
        if af then F.send("Webhook sent.") end
    elseif af then
        F.send("Webhook failed.")
    end
end

function ad.attachInterval()
    D.spawn(function()
        while w.Alive do
            if w.WebhookLink ~= "" and w.WebhookInterval > 0 then
                if tick() - ae >= w.WebhookInterval * 60 then
                    ad.send(false)
                end
            end
            task.wait(30)
        end
    end, "Webhook.interval")
end
local af=function()    




D.conn("antiafk", q.Idled:Connect(function()
        if not w.Alive then return end
        pcall(function()
            k:Button2Down(Vector2.new(0, 0), h.CurrentCamera.CFrame)
            task.wait(1)
            k:Button2Up(Vector2.new(0, 0), h.CurrentCamera.CFrame)
        end)
    end))
end




A = {
    Default = {
        Bg      = Color3.fromRGB(10, 12, 16),
        Main    = Color3.fromRGB(18, 22, 28),
        Accent  = Color3.fromRGB(34, 197, 94),
        Outline = Color3.fromRGB(34, 197, 94),
        Font    = Color3.fromRGB(235, 240, 245),
    },
    Obsidian = {
        Bg = Color3.fromRGB(0, 0, 0), Main = Color3.fromRGB(10, 10, 10),
        Accent = Color3.fromRGB(6, 182, 212), Outline = Color3.fromRGB(6, 182, 212),
        Font = Color3.fromRGB(229, 231, 235),
    },
    BBot = {
        Bg = Color3.fromRGB(10, 14, 26), Main = Color3.fromRGB(20, 26, 43),
        Accent = Color3.fromRGB(236, 72, 153), Outline = Color3.fromRGB(236, 72, 153),
        Font = Color3.fromRGB(243, 244, 246),
    },
    Fatality = {
        Bg = Color3.fromRGB(13, 10, 20), Main = Color3.fromRGB(26, 20, 36),
        Accent = Color3.fromRGB(233, 30, 99), Outline = Color3.fromRGB(124, 58, 237),
        Font = Color3.fromRGB(255, 255, 255),
    },
    Jester = {
        Bg = Color3.fromRGB(10, 10, 15), Main = Color3.fromRGB(21, 21, 31),
        Accent = Color3.fromRGB(168, 85, 247), Outline = Color3.fromRGB(168, 85, 247),
        Font = Color3.fromRGB(245, 245, 245),
    },
    Mint = {
        Bg = Color3.fromRGB(6, 41, 31), Main = Color3.fromRGB(10, 58, 44),
        Accent = Color3.fromRGB(16, 185, 129), Outline = Color3.fromRGB(16, 185, 129),
        Font = Color3.fromRGB(236, 253, 245),
    },
    ["Tokyo Night"] = {
        Bg = Color3.fromRGB(26, 27, 38), Main = Color3.fromRGB(36, 40, 59),
        Accent = Color3.fromRGB(122, 162, 247), Outline = Color3.fromRGB(122, 162, 247),
        Font = Color3.fromRGB(192, 202, 245),
    },
    Ubuntu = {
        Bg = Color3.fromRGB(44, 0, 30), Main = Color3.fromRGB(60, 14, 45),
        Accent = Color3.fromRGB(233, 84, 32), Outline = Color3.fromRGB(233, 84, 32),
        Font = Color3.fromRGB(252, 252, 252),
    },
}

local ag = {}

function ag.applyValues(ah)
    w.BgColor       = ah.Bg
    w.MainColor     = ah.Main
    w.AccentColor   = ah.Accent
    w.OutlineColor  = ah.Outline
    w.FontColor     = ah.Font
end

function ag.apply()
    for ah, ai in pairs(z) do
        if ai.themeUpdate then pcall(ai.themeUpdate) end
    end
end

function ag.load(ah)
    local ai = A[ah]
    if not ai then return end
    w.Theme = ah
    ag.applyValues(ai)
    ag.apply()
end

function ag.listNames()
    local ah = {}
    for ai in pairs(A) do ah[#ah + 1] = ai end
    table.sort(ah)
    return ah
end

function ag.saveCurrent(ah)
    if not ah or ah == "" then return false end
    local ai = {
        Bg      = D.color3ToTable(w.BgColor),
        Main    = D.color3ToTable(w.MainColor),
        Accent  = D.color3ToTable(w.AccentColor),
        Outline = D.color3ToTable(w.OutlineColor),
        Font    = D.color3ToTable(w.FontColor),
    }
    pcall(b.writefile, t .. "/" .. ah .. ".json", E.encode(ai))
    return true
end




local ah = {}

local ai = {
    "Autofarm", "FarmTarget", "FarmPriority", "Speed", "AutofarmDino", "SkipPlayers", "AutoLoot",
    "AutofarmMovement", "StopDistance", "ManualAttackRemote",
    "GoatESP", "GoatESPColor", "AmberESP", "AmberESPColor", "NoPromptDelay",
    "OutlineTransparency", "FillTransparency",
    "Fly", "FlySpeed", "RespawnDelay", "AutoRespawn", "Anchored",
    "OffsetX", "OffsetY", "Range", "MaxTargetHP", "MinTargetHP", "DisengageAt",
    "TargetPOV", "AutoAttackNearby", "AutoAttack", "AutoTPToPlayer", "TargetPlayer",
    "HopOnPlayerCount", "HopOnFriend",
    "KickOnAdmin",
    "WebhookLink", "WebhookInterval", "WebhookTimezone", "WebhookColor", "WebhookAnonymous",
    "Theme", "BgColor", "MainColor", "AccentColor", "OutlineColor", "FontColor",
    "FontFace", "MenuBind", "Autoexecute", "NotificationSide",
    "UIScale", "_ZoomPick",
}
local aj=function()    

local aj = {}
    for ak, al in ipairs(ai) do
        local Y = w[al]
        if typeof(Y) == "Color3" then
            aj[al] = { _c3 = true, v = D.color3ToTable(Y) }
        else
            aj[al] = Y
        end
    end
    return aj
end local ak=function(

ak)    
for al, Y in pairs(ak or {}) do
        if type(Y) == "table" and Y._c3 then
            w[al] = D.tableToColor3(Y.v)
        else
            w[al] = Y
        end
    end
end

function ah.save(al)
    if not al or al == "" then F.send("Config name required.") return end
    pcall(b.writefile, s .. "/" .. al .. ".json", E.encode(aj()))
    F.send("Saved config: " .. al)
end

function ah.load(al)
    if not al or al == "" then return end
    if not b.isfile(s .. "/" .. al .. ".json") then F.send("No config: " .. al) return end
    local Y = ""
    pcall(function() Y = b.readfile(s .. "/" .. al .. ".json") end)
    ak(E.decode(Y))
    
    for Z, _ in pairs(z) do
        if _.refresh then pcall(_.refresh) end
    end
    ag.apply()
    if C and C.uiScale then C.uiScale.Scale = w.UIScale or 1 end
    F.send("Loaded config: " .. al)
end

function ah.delete(al)
    if not al or al == "" then return end
    pcall(b.delfile, s .. "/" .. al .. ".json")
    F.send("Deleted config: " .. al)
end

function ah.list()
    local al = {}
    local Y, Z = pcall(b.listfiles, s)
    if not Y or type(Z) ~= "table" then return al end
    for _, am in ipairs(Z) do
        local an = am:match("([^/\\]+)%.json$")
        if an then al[#al + 1] = an end
    end
    table.sort(al)
    return al
end

function ah.setAutoload(al)
    pcall(b.writefile, u, al or "")
    w.AutoloadConfig = al or ""
end

function ah.resetAutoload()
    pcall(b.delfile, u)
    w.AutoloadConfig = ""
end

function ah.getAutoload()
    if not b.isfile(u) then return "" end
    local al = ""
    pcall(function() al = b.readfile(u) end)
    return (al or ""):gsub("%s+$", "")
end

function ah.exportCurrent()
    return E.encode(aj())
end

function ah.importString(al)
    if not al or al == "" then F.send("Nothing to import.") return end
    local am = E.decode(al)
    if not am or not next(am) then F.send("Invalid import data.") return end
    ak(am)
    for an, Y in pairs(z) do
        if Y.refresh then pcall(Y.refresh) end
    end
    ag.apply()
    if C and C.uiScale then C.uiScale.Scale = w.UIScale or 1 end
    F.send("Imported config.")
end





local al = {}
local am=function(
am, an, Y)    
local Z = Instance.new(am)
    for _, ao in pairs(an or {}) do Z[_] = ao end
    if Y then for ao, _ in ipairs(Y) do _.Parent = Z end end
    return Z
end local an=function()

return Enum.Font[w.FontFace] or Enum.Font.Gotham end


function al.newWindow(ao)
    ao = ao or {}
    local Y = am("ScreenGui", {
        Name = D.rand("_NHJB_"),
        IgnoreGuiInset = true,
        ResetOnSpawn   = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        DisplayOrder   = 2000000,
    })
    local Z = pcall(function() Y.Parent = m end)
    if not Z then
        local _ = q:WaitForChild("PlayerGui", 5)
        if _ then Y.Parent = _ end
    end

    local _ = am("Frame", {
        Name = "Window",
        Position = UDim2.fromOffset(60, 60),
        Size     = UDim2.fromOffset(ao.width or 760, ao.height or 520),
        BackgroundColor3 = w.BgColor,
        BorderSizePixel  = 0,
        Active           = true,
        Parent           = Y,
    })
    am("UICorner", { CornerRadius = UDim.new(0, 10), Parent = _ })
    local ap = am("UIStroke", { Color = w.OutlineColor, Transparency = 0.6, Thickness = 1, Parent = _ })

    
    
    
    
    local aq = Instance.new("UIScale")
    aq.Scale  = w.UIScale or 1
    aq.Parent = _

    
    local ar = am("TextLabel", {
        Parent = _,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -16, 0, 16),
        Size = UDim2.fromOffset(28, 28),
        BackgroundTransparency = 1,
        Text = "+",
        Font = Enum.Font.GothamBold,
        TextSize = 22,
        TextColor3 = w.FontColor,
    })
    
    local as = am("Frame", {
        Parent = _,
        Size = UDim2.new(0, 150, 1, 0),
        BackgroundColor3 = w.MainColor,
        BorderSizePixel = 0,
    })
    am("UICorner", { CornerRadius = UDim.new(0, 10), Parent = as })
    
    am("Frame", {
        Parent = as,
        Position = UDim2.new(1, -12, 0, 0),
        Size = UDim2.new(0, 12, 1, 0),
        BackgroundColor3 = w.MainColor,
        BorderSizePixel = 0,
    })

    local at = am("TextLabel", {
        Parent = as,
        Size = UDim2.new(1, -20, 0, 36),
        Position = UDim2.fromOffset(20, 18),
        BackgroundTransparency = 1,
        Text = v.Brand,
        Font = Enum.Font.GothamBold,
        TextSize = 22,
        TextColor3 = w.AccentColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local au = am("Frame", {
        Parent = as,
        Position = UDim2.fromOffset(0, 70),
        Size = UDim2.new(1, 0, 1, -90),
        BackgroundTransparency = 1,
    })
    local av = am("UIListLayout", {
        Parent = au,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
    })

    
    local aw = am("Frame", {
        Parent = _,
        Position = UDim2.new(0, 150, 0, 0),
        Size = UDim2.new(1, -150, 0, 60),
        BackgroundTransparency = 1,
    })

    local ax = am("Frame", {
        Parent = aw,
        Position = UDim2.fromOffset(20, 16),
        Size = UDim2.new(1, -80, 0, 28),
        BackgroundColor3 = w.MainColor,
        BorderSizePixel = 0,
    })
    am("UICorner", { CornerRadius = UDim.new(0, 6), Parent = ax })

    local ay = am("TextLabel", {
        Parent = ax,
        Size = UDim2.fromOffset(28, 28),
        Position = UDim2.fromOffset(2, 0),
        BackgroundTransparency = 1,
        Text = "Q",
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextColor3 = w.FontColor,
    })

    local az = am("TextBox", {
        Parent = ax,
        Position = UDim2.fromOffset(30, 0),
        Size = UDim2.new(1, -36, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        PlaceholderText = "Search",
        TextColor3 = w.FontColor,
        PlaceholderColor3 = Color3.fromRGB(120, 130, 140),
        Font = an(),
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
    })

    
    
    
    
    
    
    do
        local aA, aB, aC
local aD=function(
aD, aE)            
if not aE or not aE.Parent then return false end
            local aF, aG = aE.AbsolutePosition, aE.AbsoluteSize
            return aD.X >= aF.X and aD.X <= aF.X + aG.X
               and aD.Y >= aF.Y and aD.Y <= aF.Y + aG.Y
end local aE=function(

aE, aF)            
aE.Active = true
            aE.InputBegan:Connect(function(aG)
                if aG.UserInputType ~= Enum.UserInputType.MouseButton1
                   and aG.UserInputType ~= Enum.UserInputType.Touch then return end
                local aH = aG.Position
                if aF then
                    for aI, aJ in ipairs(aF) do
                        if aD(aH, aJ) then return end
                    end
                end
                aA  = true
                aB = Vector2.new(aH.X, aH.Y)
                aC  = _.Position
                aG.Changed:Connect(function()
                    if aG.UserInputState == Enum.UserInputState.End then aA = false end
                end)
            end)
end
        
aE(ar)
        aE(at)
        aE(aw, { ax })
        aE(as, { au })   

        f.InputChanged:Connect(function(aF)
            if not aA then return end
            if aF.UserInputType ~= Enum.UserInputType.MouseMovement
               and aF.UserInputType ~= Enum.UserInputType.Touch then return end
            local aG = aF.Position
            local aH = Vector2.new(aG.X, aG.Y) - aB
            _.Position = UDim2.new(
                aC.X.Scale, aC.X.Offset + aH.X,
                aC.Y.Scale, aC.Y.Offset + aH.Y
            )
        end)
    end

    
    local aA = am("Frame", {
        Parent = _,
        Position = UDim2.new(0, 150, 0, 60),
        Size = UDim2.new(1, -150, 1, -84),
        BackgroundTransparency = 1,
    })

    
    local aB = am("Frame", {
        Parent = _,
        Position = UDim2.new(0, 150, 1, -24),
        Size = UDim2.new(1, -150, 0, 24),
        BackgroundTransparency = 1,
    })
    am("TextLabel", {
        Parent = aB,
        Size = UDim2.new(1, -30, 1, 0),
        BackgroundTransparency = 1,
        Text = v.SubBrand,
        Font = an(),
        TextSize = 12,
        TextColor3 = Color3.fromRGB(120, 130, 140),
    })
    local aC = am("TextLabel", {
        Parent = aB,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -8, 0, 0),
        Size = UDim2.fromOffset(20, 20),
        BackgroundTransparency = 1,
        Text = "<>",
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextColor3 = w.FontColor,
        Rotation = 45,
    })
    
    do
        local aD, aE, aF
        aC.InputBegan:Connect(function(aG)
            if aG.UserInputType == Enum.UserInputType.MouseButton1 or aG.UserInputType == Enum.UserInputType.Touch then
                aD = true
                aE = aG.Position
                aF = _.Size
                aG.Changed:Connect(function()
                    if aG.UserInputState == Enum.UserInputState.End then aD = false end
                end)
            end
        end)
        f.InputChanged:Connect(function(aG)
            if aD and (aG.UserInputType == Enum.UserInputType.MouseMovement or aG.UserInputType == Enum.UserInputType.Touch) then
                local aH = aG.Position - aE
                
                
                local aI = (aq.Scale > 0) and aq.Scale or 1
                _.Size = UDim2.new(0, math.max(560, aF.X.Offset + aH.X / aI),
                                     0, math.max(380, aF.Y.Offset + aH.Y / aI))
            end
        end)
    end

    local aD = {
        gui = Y, win = _, sidebar = as, pageList = au,
        content = aA, header = aw, searchBox = az, dragHandle = ar,
        pages = {},   
        active = nil,
        winStroke = ap, resize = aC,
        uiScale = aq,
    }

    
    table.insert(z, {
        themeUpdate = function()
            _.BackgroundColor3 = w.BgColor
            ap.Color = w.OutlineColor
            as.BackgroundColor3 = w.MainColor
            for aE, aF in ipairs(as:GetChildren()) do
                if aF:IsA("Frame") then aF.BackgroundColor3 = w.MainColor end
            end
            at.TextColor3 = w.AccentColor
            at.Font = an()
            ax.BackgroundColor3 = w.MainColor
            ay.TextColor3 = w.FontColor
            az.TextColor3 = w.FontColor
            az.Font = an()
            ar.TextColor3 = w.FontColor
            aC.TextColor3 = w.FontColor
            for aE, aF in pairs(aD.pages) do
                if aF.refreshTheme then pcall(aF.refreshTheme) end
            end
        end
    })

    function aD:addPage(aE)
        local aF = am("TextButton", {
            Parent = au,
            LayoutOrder = #au:GetChildren(),
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundColor3 = w.MainColor,
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false,
        })
        local aG = am("TextLabel", {
            Parent = aF,
            Size = UDim2.new(1, -30, 1, 0),
            Position = UDim2.fromOffset(20, 0),
            BackgroundTransparency = 1,
            Text = aE,
            Font = an(),
            TextSize = 13,
            TextColor3 = w.FontColor,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
        local aH = am("Frame", {
            Parent = aF,
            Size = UDim2.new(0, 3, 0.6, 0),
            Position = UDim2.new(0, 0, 0.2, 0),
            BackgroundColor3 = w.AccentColor,
            BorderSizePixel = 0,
            Visible = false,
        })
local aI=function()            


aF.BackgroundColor3 = w.MainColor
            aG.TextColor3 = w.FontColor
            aG.Font = an()
            aH.BackgroundColor3 = w.AccentColor
end
        
local aJ = am("Frame", {
            Parent = aA,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Visible = false,
        })

        aD.pages[aE] = {
            btn = aF, frame = aJ, label = aG, indicator = aH,
            refreshTheme = aI,
        }

        aF.MouseButton1Click:Connect(function() aD:selectPage(aE) end)
        if not aD.active then aD:selectPage(aE) end
        return aJ
    end

    function aD:selectPage(aE)
        for aF, aG in pairs(aD.pages) do
            local aH = (aF == aE)
            aG.frame.Visible = aH
            aG.indicator.Visible = aH
            aG.label.TextColor3 = aH and w.AccentColor or w.FontColor
        end
        aD.active = aE
    end

    return aD
end


function al.newColumn(ao, ap)
    local aq = am("Frame", {
        Parent = ao,
        Size = UDim2.new(ap or 0.5, -12, 1, -20),
        BackgroundTransparency = 1,
    })
    local ar = am("UIListLayout", {
        Parent = aq,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 8),
    })
    return aq, ar
end


function al.newCard(ao, ap)
    ap = ap or {}
    local aq = am("Frame", {
        Parent = ao,
        LayoutOrder = ap.order or 0,
        Size = UDim2.new(1, 0, 0, ap.height or 200),
        BackgroundColor3 = w.MainColor,
        BorderSizePixel = 0,
    })
    am("UICorner", { CornerRadius = UDim.new(0, 8), Parent = aq })

    table.insert(z, {
        themeUpdate = function() aq.BackgroundColor3 = w.MainColor end
    })

    local ar
    local as = am("Frame", {
        Parent = aq,
        Size = UDim2.new(1, 0, 1, ap.tabs and -34 or 0),
        Position = UDim2.fromOffset(0, ap.tabs and 34 or 0),
        BackgroundTransparency = 1,
    })

    local at = {}
    if ap.tabs then
        ar = am("Frame", {
            Parent = aq,
            Size = UDim2.new(1, -20, 0, 28),
            Position = UDim2.fromOffset(10, 4),
            BackgroundTransparency = 1,
        })
        local au = 1 / #ap.tabs
        for av, aw in ipairs(ap.tabs) do
            local ax = am("TextButton", {
                Parent = ar,
                Size = UDim2.new(au, -4, 1, 0),
                Position = UDim2.new((av - 1) * au, 2, 0, 0),
                BackgroundColor3 = w.BgColor,
                BorderSizePixel = 0,
                Text = aw,
                Font = an(),
                TextSize = 12,
                TextColor3 = w.FontColor,
                AutoButtonColor = false,
            })
            am("UICorner", { CornerRadius = UDim.new(0, 6), Parent = ax })

            local ay = am("ScrollingFrame", {
                Parent = as,
                Size = UDim2.new(1, -16, 1, -8),
                Position = UDim2.fromOffset(8, 4),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ScrollBarThickness = 3,
                ScrollBarImageColor3 = w.AccentColor,
                CanvasSize = UDim2.new(0, 0, 0, 0),
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                ScrollingDirection = Enum.ScrollingDirection.Y,
                Visible = (av == 1),
            })
            am("UIListLayout", { Parent = ay, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6) })
            at[aw] = { btn = ax, frame = ay }

            ax.MouseButton1Click:Connect(function()
                for az, aA in pairs(at) do
                    aA.frame.Visible = (az == aw)
                    aA.btn.BackgroundColor3 = (az == aw) and w.AccentColor or w.BgColor
                end
            end)

            if av == 1 then ax.BackgroundColor3 = w.AccentColor end

            table.insert(z, {
                themeUpdate = function()
                    ax.Font = an()
                    ax.TextColor3 = w.FontColor
                    if ay.Visible then ax.BackgroundColor3 = w.AccentColor else ax.BackgroundColor3 = w.BgColor end
                    ay.ScrollBarImageColor3 = w.AccentColor
                end
            })
        end
        return aq, at
    else
        local au = am("ScrollingFrame", {
            Parent = as,
            Size = UDim2.new(1, -16, 1, -8),
            Position = UDim2.fromOffset(8, 4),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = w.AccentColor,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ScrollingDirection = Enum.ScrollingDirection.Y,
        })
        am("UIListLayout", { Parent = au, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6) })

        if ap.title then
            local av = am("TextLabel", {
                Parent = aq,
                Size = UDim2.new(1, -20, 0, 28),
                Position = UDim2.fromOffset(10, 4),
                BackgroundTransparency = 1,
                Text = ap.title,
                Font = Enum.Font.GothamBold,
                TextSize = 13,
                TextColor3 = w.FontColor,
                TextXAlignment = Enum.TextXAlignment.Center,
            })
            as.Position = UDim2.fromOffset(0, 30)
            as.Size = UDim2.new(1, 0, 1, -30)
            table.insert(z, {
                themeUpdate = function() av.TextColor3 = w.FontColor; av.Font = Enum.Font.GothamBold end
            })
        end

        return aq, au
    end
end





function al.label(ao, ap, aq)
    aq = aq or {}
    local ar = am("TextLabel", {
        Parent = ao,
        LayoutOrder = aq.order or 0,
        Size = UDim2.new(1, 0, 0, aq.height or 18),
        BackgroundTransparency = 1,
        Text = ap,
        Font = an(),
        TextSize = aq.size or 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local as = { instance = ar, setText = function(as, at) ar.Text = at end }
    function as.themeUpdate() ar.TextColor3 = w.FontColor; ar.Font = an() end
    table.insert(z, as)
    return as
end

function al.button(ao, ap, aq)
    local ar = am("TextButton", {
        Parent = ao,
        LayoutOrder = #ao:GetChildren(),
        Size = UDim2.new(1, 0, 0, 28),
        BackgroundColor3 = w.BgColor,
        BorderSizePixel = 0,
        Text = ap,
        Font = an(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        AutoButtonColor = true,
    })
    am("UICorner", { CornerRadius = UDim.new(0, 6), Parent = ar })
    ar.MouseButton1Click:Connect(function() pcall(aq) end)

    local as = { instance = ar, label = ap }
    function as.themeUpdate()
        ar.BackgroundColor3 = w.BgColor
        ar.TextColor3 = w.FontColor
        ar.Font = an()
    end
    table.insert(z, as)
    return as
end

function al.toggle(ao, ap, aq, ar)
    local as = am("Frame", {
        Parent = ao,
        LayoutOrder = #ao:GetChildren(),
        Size = UDim2.new(1, 0, 0, 26),
        BackgroundTransparency = 1,
    })
    local at = am("TextLabel", {
        Parent = as,
        Size = UDim2.new(1, -50, 1, 0),
        BackgroundTransparency = 1,
        Text = ap,
        Font = an(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local au = am("TextButton", {
        Parent = as,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        Size = UDim2.fromOffset(36, 18),
        BackgroundColor3 = w.BgColor,
        Text = "",
        AutoButtonColor = false,
        BorderSizePixel = 0,
    })
    am("UICorner", { CornerRadius = UDim.new(1, 0), Parent = au })
    local av = am("Frame", {
        Parent = au,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 2, 0.5, 0),
        Size = UDim2.fromOffset(14, 14),
        BackgroundColor3 = w.FontColor,
        BorderSizePixel = 0,
    })
    am("UICorner", { CornerRadius = UDim.new(1, 0), Parent = av })
local aw=function()        

local aw = w[aq]
        if aw then
            au.BackgroundColor3 = w.AccentColor
            av.Position = UDim2.new(1, -16, 0.5, 0)
        else
            au.BackgroundColor3 = w.BgColor
            av.Position = UDim2.new(0, 2, 0.5, 0)
        end
        av.BackgroundColor3 = w.FontColor
end
    
aw()

    au.MouseButton1Click:Connect(function()
        w[aq] = not w[aq]
        aw()
        if ar then pcall(ar, w[aq]) end
    end)

    local ax = { instance = as, label = ap, key = aq }
    function ax.themeUpdate() at.TextColor3 = w.FontColor; at.Font = an(); aw() end
    function ax.refresh() aw() end
    table.insert(z, ax)
    return ax
end

function al.slider(ao, ap, aq, ar, as, at, au)
    at = at or 1
    local av = am("Frame", {
        Parent = ao,
        LayoutOrder = #ao:GetChildren(),
        Size = UDim2.new(1, 0, 0, 24),
        BackgroundColor3 = w.BgColor,
        BorderSizePixel = 0,
    })
    am("UICorner", { CornerRadius = UDim.new(0, 4), Parent = av })

    local aw = am("Frame", {
        Parent = av,
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = w.AccentColor,
        BorderSizePixel = 0,
    })
    am("UICorner", { CornerRadius = UDim.new(0, 4), Parent = aw })

    local ax = am("TextLabel", {
        Parent = av,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        Font = an(),
        TextSize = 12,
        TextColor3 = w.FontColor,
    })
local ay=function()        

local ay = tonumber(w[aq]) or ar
        ay = math.clamp(ay, ar, as)
        local az = (as == ar) and 0 or (ay - ar) / (as - ar)
        aw.Size = UDim2.new(az, 0, 1, 0)
        local aA
        if at < 1 then aA = string.format("%s: %.2f", ap, ay) else aA = string.format("%s: %d", ap, math.floor(ay + 0.5)) end
        ax.Text = aA
end
    
ay()

    local az = false
local aA=function(aA)        
local aB = (aA - av.AbsolutePosition.X) / av.AbsoluteSize.X
        aB = math.clamp(aB, 0, 1)
        local aC = ar + aB * (as - ar)
        aC = math.floor(aC / at + 0.5) * at
        aC = math.clamp(aC, ar, as)
        w[aq] = aC
        ay()
        if au then pcall(au, aC) end
end
    
av.InputBegan:Connect(function(aB)
        if aB.UserInputType == Enum.UserInputType.MouseButton1 or aB.UserInputType == Enum.UserInputType.Touch then
            az = true
            aA(aB.Position.X)
        end
    end)
    av.InputEnded:Connect(function(aB)
        if aB.UserInputType == Enum.UserInputType.MouseButton1 or aB.UserInputType == Enum.UserInputType.Touch then
            az = false
        end
    end)
    f.InputChanged:Connect(function(aB)
        if az and (aB.UserInputType == Enum.UserInputType.MouseMovement or aB.UserInputType == Enum.UserInputType.Touch) then
            aA(aB.Position.X)
        end
    end)

    local aB = { instance = av, label = ap, key = aq }
    function aB.themeUpdate()
        av.BackgroundColor3 = w.BgColor
        aw.BackgroundColor3 = w.AccentColor
        ax.TextColor3 = w.FontColor
        ax.Font = an()
    end
    function aB.refresh() ay() end
    table.insert(z, aB)
    return aB
end

function al.dropdown(ao, ap, aq, ar, as)
    local at = am("Frame", {
        Parent = ao,
        LayoutOrder = #ao:GetChildren(),
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundTransparency = 1,
    })
    local au = am("TextLabel", {
        Parent = at,
        Size = UDim2.new(1, 0, 0, 16),
        BackgroundTransparency = 1,
        Text = ap,
        Font = an(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local av = am("TextButton", {
        Parent = at,
        Position = UDim2.fromOffset(0, 18),
        Size = UDim2.new(1, 0, 0, 24),
        BackgroundColor3 = w.BgColor,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
    })
    am("UICorner", { CornerRadius = UDim.new(0, 4), Parent = av })
    local aw = am("TextLabel", {
        Parent = av,
        Size = UDim2.new(1, -24, 1, 0),
        Position = UDim2.fromOffset(8, 0),
        BackgroundTransparency = 1,
        Text = tostring(w[aq] or "---"),
        Font = an(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local ax = am("TextLabel", {
        Parent = av,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -8, 0.5, 0),
        Size = UDim2.fromOffset(12, 12),
        BackgroundTransparency = 1,
        Text = "v",
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextColor3 = w.FontColor,
    })

    
    local ay
local az=function()        
if ay then ay:Destroy(); ay = nil; return end
        local az = at:FindFirstAncestorOfClass("ScreenGui")
        if not az then return end
        ay = am("Frame", {
            Parent = az,
            BackgroundColor3 = w.MainColor,
            BorderSizePixel = 0,
            ZIndex = 50,
        })
        am("UICorner", { CornerRadius = UDim.new(0, 4), Parent = ay })
        am("UIStroke", { Color = w.OutlineColor, Transparency = 0.5, Parent = ay })

        local aA = av.AbsolutePosition
        local aB = av.AbsoluteSize
        local aC = math.min(160, #ar * 22 + 4)
        ay.Position = UDim2.fromOffset(aA.X, aA.Y + aB.Y + 2)
        ay.Size = UDim2.fromOffset(aB.X, aC)

        local aD = am("ScrollingFrame", {
            Parent = ay,
            Size = UDim2.new(1, -4, 1, -4),
            Position = UDim2.fromOffset(2, 2),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 2,
            ScrollBarImageColor3 = w.AccentColor,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ZIndex = 51,
        })
        am("UIListLayout", { Parent = aD, SortOrder = Enum.SortOrder.LayoutOrder })

        for aE, aF in ipairs(ar) do
            local aG = am("TextButton", {
                Parent = aD,
                Size = UDim2.new(1, 0, 0, 22),
                BackgroundColor3 = w.BgColor,
                BorderSizePixel = 0,
                Text = tostring(aF),
                Font = an(),
                TextSize = 12,
                TextColor3 = w.FontColor,
                AutoButtonColor = true,
                ZIndex = 52,
            })
            aG.MouseButton1Click:Connect(function()
                w[aq] = aF
                aw.Text = tostring(aF)
                if ay then ay:Destroy(); ay = nil end
                if as then pcall(as, aF) end
            end)
        end
end
    
av.MouseButton1Click:Connect(az)

    local aA = { instance = at, label = ap, key = aq, options = ar }
    function aA.setOptions(aB, aC)
        ar = aC or {}
        aA.options = ar
        if ay then ay:Destroy(); ay = nil end
    end
    function aA.themeUpdate()
        au.TextColor3 = w.FontColor; au.Font = an()
        av.BackgroundColor3 = w.BgColor
        aw.TextColor3 = w.FontColor; aw.Font = an()
        ax.TextColor3 = w.FontColor
    end
    function aA.refresh() aw.Text = tostring(w[aq] or "---") end
    table.insert(z, aA)
    return aA
end

function al.multiDropdown(ao, ap, aq, ar, as)
    
    local at = am("Frame", {
        Parent = ao,
        LayoutOrder = #ao:GetChildren(),
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundTransparency = 1,
    })
    local au = am("TextLabel", {
        Parent = at,
        Size = UDim2.new(1, 0, 0, 16),
        BackgroundTransparency = 1,
        Text = ap,
        Font = an(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local av = am("TextButton", {
        Parent = at,
        Position = UDim2.fromOffset(0, 18),
        Size = UDim2.new(1, 0, 0, 24),
        BackgroundColor3 = w.BgColor,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
    })
    am("UICorner", { CornerRadius = UDim.new(0, 4), Parent = av })
    local aw = am("TextLabel", {
        Parent = av,
        Size = UDim2.new(1, -24, 1, 0),
        Position = UDim2.fromOffset(8, 0),
        BackgroundTransparency = 1,
        Text = "",
        Font = an(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local ax = am("TextLabel", {
        Parent = av,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -8, 0.5, 0),
        Size = UDim2.fromOffset(12, 12),
        BackgroundTransparency = 1,
        Text = "v",
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextColor3 = w.FontColor,
    })
local ay=function()        

local ay = w[aq] or {}
        aw.Text = (#ay > 0) and table.concat(ay, ", ") or "---"
end    
ay()

    local az
local aA=function()        
if az then az:Destroy(); az = nil; return end
        local aA = at:FindFirstAncestorOfClass("ScreenGui")
        if not aA then return end
        az = am("Frame", {
            Parent = aA,
            BackgroundColor3 = w.MainColor,
            BorderSizePixel = 0,
            ZIndex = 50,
        })
        am("UICorner", { CornerRadius = UDim.new(0, 4), Parent = az })
        am("UIStroke", { Color = w.OutlineColor, Transparency = 0.5, Parent = az })

        local aB = av.AbsolutePosition
        local aC = av.AbsoluteSize
        local aD = math.min(220, #ar * 24 + 4)
        az.Position = UDim2.fromOffset(aB.X, aB.Y + aC.Y + 2)
        az.Size = UDim2.fromOffset(aC.X, aD)

        local aE = am("ScrollingFrame", {
            Parent = az,
            Size = UDim2.new(1, -4, 1, -4),
            Position = UDim2.fromOffset(2, 2),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 2,
            ScrollBarImageColor3 = w.AccentColor,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ZIndex = 51,
        })
        am("UIListLayout", { Parent = aE, SortOrder = Enum.SortOrder.LayoutOrder })

        for aF, aG in ipairs(ar) do
            local aH = am("Frame", {
                Parent = aE,
                Size = UDim2.new(1, 0, 0, 24),
                BackgroundColor3 = w.BgColor,
                BorderSizePixel = 0,
                ZIndex = 52,
            })
            local aI = am("TextLabel", {
                Parent = aH,
                Size = UDim2.fromOffset(20, 24),
                BackgroundTransparency = 1,
                Text = D.contains(w[aq] or {}, aG) and "[X]" or "[ ]",
                Font = Enum.Font.GothamBold,
                TextSize = 11,
                TextColor3 = w.AccentColor,
                TextXAlignment = Enum.TextXAlignment.Center,
                ZIndex = 53,
            })
            local aJ = am("TextLabel", {
                Parent = aH,
                Position = UDim2.fromOffset(24, 0),
                Size = UDim2.new(1, -24, 1, 0),
                BackgroundTransparency = 1,
                Text = tostring(aG),
                Font = an(),
                TextSize = 12,
                TextColor3 = w.FontColor,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 53,
            })
            local Y = am("TextButton", {
                Parent = aH,
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text = "",
                AutoButtonColor = false,
                ZIndex = 54,
            })
            Y.MouseButton1Click:Connect(function()
                w[aq] = w[aq] or {}
                local Z = w[aq]
                local _
                for aK, aL in ipairs(Z) do if aL == aG then _ = aK break end end
                if _ then table.remove(Z, _) else table.insert(Z, aG) end
                aI.Text = D.contains(Z, aG) and "[X]" or "[ ]"
                ay()
                if as then pcall(as, Z) end
            end)
        end
end
    
av.MouseButton1Click:Connect(aA)

    local aB = { instance = at, label = ap, key = aq, options = ar }
    function aB.themeUpdate()
        au.TextColor3 = w.FontColor; au.Font = an()
        av.BackgroundColor3 = w.BgColor
        aw.TextColor3 = w.FontColor; aw.Font = an()
        ax.TextColor3 = w.FontColor
    end
    function aB.refresh() ay() end
    table.insert(z, aB)
    return aB
end

function al.colorPicker(ao, ap, aq, ar)
    local as = am("Frame", {
        Parent = ao,
        LayoutOrder = #ao:GetChildren(),
        Size = UDim2.new(1, 0, 0, 26),
        BackgroundTransparency = 1,
    })
    local at = am("TextLabel", {
        Parent = as,
        Size = UDim2.new(1, -40, 1, 0),
        BackgroundTransparency = 1,
        Text = ap,
        Font = an(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local au = am("TextButton", {
        Parent = as,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        Size = UDim2.fromOffset(28, 18),
        BackgroundColor3 = w[aq] or Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Text = "",
    })
    am("UICorner", { CornerRadius = UDim.new(0, 3), Parent = au })
    am("UIStroke", { Color = w.OutlineColor, Transparency = 0.5, Parent = au })

    local av
local aw=function()        
au.BackgroundColor3 = w[aq] or Color3.new(1, 1, 1)
end local ax=function()        


if av then av:Destroy(); av = nil; return end
        local ax = as:FindFirstAncestorOfClass("ScreenGui")
        if not ax then return end
        av = am("Frame", {
            Parent = ax,
            BackgroundColor3 = w.MainColor,
            BorderSizePixel = 0,
            ZIndex = 50,
        })
        am("UICorner", { CornerRadius = UDim.new(0, 6), Parent = av })
        am("UIStroke", { Color = w.OutlineColor, Transparency = 0.5, Parent = av })

        local ay = au.AbsolutePosition
        av.Position = UDim2.fromOffset(ay.X - 160, ay.Y + 24)
        av.Size = UDim2.fromOffset(190, 130)
local az=function(
az, aA, aB)            
local aC = am("Frame", {
                Parent = av,
                Position = UDim2.fromOffset(36, aB),
                Size = UDim2.fromOffset(140, 16),
                BackgroundColor3 = w.BgColor,
                BorderSizePixel = 0,
                ZIndex = 51,
            })
            am("UICorner", { CornerRadius = UDim.new(0, 3), Parent = aC })
            local aD = am("Frame", {
                Parent = aC,
                Size = UDim2.new((w[aq][aA] or 1), 0, 1, 0),
                BackgroundColor3 = aA == "R" and Color3.fromRGB(220, 38, 38)
                                or aA == "G" and Color3.fromRGB(34, 197, 94)
                                or                    Color3.fromRGB(59, 130, 246),
                BorderSizePixel = 0,
                ZIndex = 52,
            })
            am("UICorner", { CornerRadius = UDim.new(0, 3), Parent = aD })
            local aE = am("TextLabel", {
                Parent = av,
                Position = UDim2.fromOffset(8, aB),
                Size = UDim2.fromOffset(24, 16),
                BackgroundTransparency = 1,
                Text = az,
                Font = Enum.Font.GothamBold,
                TextSize = 12,
                TextColor3 = w.FontColor,
                ZIndex = 51,
            })
            local aF = am("TextLabel", {
                Parent = av,
                Position = UDim2.fromOffset(178, aB),
                Size = UDim2.fromOffset(0, 16),
                BackgroundTransparency = 1,
                Text = "",
                Font = an(),
                TextSize = 11,
                TextColor3 = w.FontColor,
                ZIndex = 51,
            })
local aG=function(aG)                
aG = math.clamp(aG, 0, 1)
                local aH = w[aq]
                local aI, aJ, aK = aH.R, aH.G, aH.B
                if aA == "R" then aI = aG end
                if aA == "G" then aJ = aG end
                if aA == "B" then aK = aG end
                w[aq] = Color3.new(aI, aJ, aK)
                aD.Size = UDim2.new(aG, 0, 1, 0)
                aF.Text = tostring(math.floor(aG * 255 + 0.5))
                aw()
                if ar then pcall(ar, w[aq]) end
end            
aF.Text = tostring(math.floor((w[aq][aA] or 0) * 255 + 0.5))

            local aH
            aC.InputBegan:Connect(function(aI)
                if aI.UserInputType == Enum.UserInputType.MouseButton1 or aI.UserInputType == Enum.UserInputType.Touch then
                    aH = true
                    aG((aI.Position.X - aC.AbsolutePosition.X) / aC.AbsoluteSize.X)
                end
            end)
            aC.InputEnded:Connect(function(aI)
                if aI.UserInputType == Enum.UserInputType.MouseButton1 or aI.UserInputType == Enum.UserInputType.Touch then
                    aH = false
                end
            end)
            f.InputChanged:Connect(function(aI)
                if aH and (aI.UserInputType == Enum.UserInputType.MouseMovement or aI.UserInputType == Enum.UserInputType.Touch) then
                    aG((aI.Position.X - aC.AbsolutePosition.X) / aC.AbsoluteSize.X)
                end
            end)
end
        
az("R", "R", 10)
        az("G", "G", 36)
        az("B", "B", 62)

        local aA = am("TextButton", {
            Parent = av,
            Position = UDim2.fromOffset(36, 92),
            Size = UDim2.fromOffset(140, 24),
            BackgroundColor3 = w.AccentColor,
            BorderSizePixel = 0,
            Text = "Done",
            Font = an(),
            TextSize = 12,
            TextColor3 = w.FontColor,
            AutoButtonColor = true,
            ZIndex = 51,
        })
        am("UICorner", { CornerRadius = UDim.new(0, 4), Parent = aA })
        aA.MouseButton1Click:Connect(function()
            if av then av:Destroy(); av = nil end
        end)
end
    
au.MouseButton1Click:Connect(ax)

    local ay = { instance = as, label = ap, key = aq }
    function ay.themeUpdate()
        at.TextColor3 = w.FontColor; at.Font = an()
        aw()
    end
    function ay.refresh() aw() end
    table.insert(z, ay)
    return ay
end

function al.textInput(ao, ap, aq, ar, as)
    local at = am("Frame", {
        Parent = ao,
        LayoutOrder = #ao:GetChildren(),
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundTransparency = 1,
    })
    local au = am("TextLabel", {
        Parent = at,
        Size = UDim2.new(1, 0, 0, 16),
        BackgroundTransparency = 1,
        Text = ap,
        Font = an(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local av = am("TextBox", {
        Parent = at,
        Position = UDim2.fromOffset(0, 18),
        Size = UDim2.new(1, 0, 0, 24),
        BackgroundColor3 = w.BgColor,
        BorderSizePixel = 0,
        Text = tostring(w[aq] or ""),
        PlaceholderText = ar or "",
        Font = an(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        PlaceholderColor3 = Color3.fromRGB(120, 130, 140),
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
    })
    am("UICorner", { CornerRadius = UDim.new(0, 4), Parent = av })
    local aw = am("UIPadding", { Parent = av, PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8) })

    av.FocusLost:Connect(function()
        w[aq] = av.Text
        if as then pcall(as, av.Text) end
    end)

    local ax = { instance = at, label = ap, key = aq }
    function ax.themeUpdate()
        au.TextColor3 = w.FontColor; au.Font = an()
        av.BackgroundColor3 = w.BgColor
        av.TextColor3 = w.FontColor
        av.Font = an()
    end
    function ax.refresh() av.Text = tostring(w[aq] or "") end
    table.insert(z, ax)
    return ax
end

function al.keybind(ao, ap, aq, ar)
    local as = am("Frame", {
        Parent = ao,
        LayoutOrder = #ao:GetChildren(),
        Size = UDim2.new(1, 0, 0, 26),
        BackgroundTransparency = 1,
    })
    local at = am("TextLabel", {
        Parent = as,
        Size = UDim2.new(1, -100, 1, 0),
        BackgroundTransparency = 1,
        Text = ap,
        Font = an(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local au = am("TextButton", {
        Parent = as,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        Size = UDim2.fromOffset(96, 22),
        BackgroundColor3 = w.BgColor,
        BorderSizePixel = 0,
        Text = tostring(w[aq] or "None"),
        Font = an(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        AutoButtonColor = true,
    })
    am("UICorner", { CornerRadius = UDim.new(0, 4), Parent = au })

    local av = false
    au.MouseButton1Click:Connect(function()
        av = true
        au.Text = "..."
    end)
    f.InputBegan:Connect(function(aw, ax)
        if not av then return end
        if aw.UserInputType ~= Enum.UserInputType.Keyboard then return end
        av = false
        local ay = aw.KeyCode.Name
        w[aq] = ay
        au.Text = ay
        if ar then pcall(ar, ay) end
    end)

    local aw = { instance = as, label = ap, key = aq }
    function aw.themeUpdate()
        at.TextColor3 = w.FontColor; at.Font = an()
        au.BackgroundColor3 = w.BgColor
        au.TextColor3 = w.FontColor; au.Font = an()
    end
    function aw.refresh() au.Text = tostring(w[aq] or "None") end
    table.insert(z, aw)
    return aw
end
local ao=function()    




w.Alive = false
    w.Autofarm = false
    w.Fly = false
    w.AutoAttack = false
    w.AutoAttackNearby = false
    w.AutoTPToPlayer = false

    O.disable()
    ab.clearAll()
    D.disconnectAll()
    if p.CameraType == Enum.CameraType.Scriptable then
        pcall(function() p.CameraType = Enum.CameraType.Custom end)
    end

    local ao = G.humanoid()
    if ao then pcall(function() ao.WalkSpeed = v.DefaultWS; ao.JumpPower = v.DefaultJP end) end
    local ap = G.root()
    if ap then pcall(function() ap.Anchored = false end) end
local aq=function(

aq)        
if not aq then return end
        for ar, as in ipairs(aq:GetChildren()) do
            if as:IsA("ScreenGui") and (as.Name:sub(1, 6) == "_NHJB_" or as.Name:sub(1, 9) == "_NHJB_NF_") then
                pcall(function() as:Destroy() end)
            end
        end
end    
aq(m)
    if q then aq(q:FindFirstChild("PlayerGui")) end
    _G._NHJB_NotifyGui = nil

    getgenv()._NameHubJB_Alive  = false
    getgenv()._NameHubJB_Unload = nil
end




C = al.newWindow({ width = 760, height = 520 })
local ap, aq, ar, as
local at, au, av, aw


local ax = C:addPage("Main")

local ay  = al.newColumn(ax, 0.5)
ay.Position = UDim2.fromOffset(8, 8)

local az = al.newColumn(ax, 0.5)
az.Position = UDim2.new(0.5, 4, 0, 8)


local aA, aB = al.newCard(ay, { tabs = { "Main", "ESP" }, height = 360 })

do
    local aC = aB["Main"].frame
    al.toggle(aC, "Autofarm", "Autofarm", function(aD)
        if aD then
            w.StartTime = w.StartTime or os.time()
            w.StatsCounting = true
            N.start()
        else
            G.applySpeed()
        end
    end)
    al.dropdown(aC, "Farm Targets", "FarmTarget", v.FarmTargetOptions, function(aD)
        
        if #w.FarmPriority == 0 then w.FarmPriority = { aD } end
    end)
    al.multiDropdown(aC, "Farm Priority List", "FarmPriority", v.FarmTargetOptions)
    al.toggle(aC, "Skip Players (NPC-only autofarm)", "SkipPlayers")
    
    al.dropdown(aC, "Movement Mode", "AutofarmMovement", v.MovementOptions, function(aD)
        
        
        if aD ~= "Fly" then S.stopFly() end
    end)
    al.slider(aC, "Stop Distance (Fly/Walk only)", "StopDistance", 2, 30, 1)
    al.slider(aC, "Speed", "Speed", 16, 200, 1, function() G.applySpeed() end)
    al.dropdown(aC, "Autofarm Dino", "AutofarmDino", v.DinoOptions, function(aD)
        local aE = H.remoteByKeywords(v.DinoChangeKeywords)
        if aE then
            pcall(function()
                if aE:IsA("RemoteEvent") then aE:FireServer(aD) else aE:InvokeServer(aD) end
            end)
        end
    end)

    local aD = al.label(aC, "Coins Gained: 0")
    local aE  = al.label(aC, "Rate: N/A")
    local aF = al.label(aC, "Time Elapsed: N/A")
    ap, ar, aq = aD, aE, aF

    
    
    
    local aG  = al.label(aC, "Status: Idle")
    local aH   = al.label(aC, "Targets: 0 humanoids / 0 by name")
    local aI  = al.label(aC, "Attack remote: (not discovered)")
    local aJ = al.label(aC, "Last fire: -")
    _G._JB_StatusLbl  = aG
    _G._JB_FoundLbl   = aH
    _G._JB_RemoteLbl  = aI
    _G._JB_LastFireLbl = aJ

    al.button(aC, "Start Counting Stats", function()
        w.CoinsGained = 0
        w.StartTime = os.time()
        w.StatsCounting = true
        F.send("Stats counter started.")
    end)

    
    
    
    
    al.textInput(aC, "Manual Attack Remote (override)", "ManualAttackRemote",
        "blank = auto-discover", function()
            K.invalidateCache()
        end)

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    al.button(aC, "Force Hit Nearest Goat", function()
        local aK = G.root()
        if not aK then
            F.send("No character - spawn first.", 5)
            return
        end

        local aL, Y
        for Z, _ in ipairs(J.allWithHumanoid()) do
            if J.matchesName(_.model, "Goat") then
                local aM = D.distance(aK, _.root)
                if not Y or aM < Y then aL, Y = _, aM end
            end
        end
        if not aL then
            F.send("No Goat found. Move closer to a goat-spawn area first.", 6)
            return
        end

        local aM = aL.hum and aL.hum.Health or -1
        F.send(("Force-hitting %s at %.0fm (HP %.0f)..."):format(
            aL.model.Name, Y or 0, aM), 4)

        
        
        pcall(function()
            local Z = CFrame.new(aL.root.Position + Vector3.new(3, 3, 3))
            aK.CFrame = CFrame.lookAt(Z.Position, aL.root.Position)
        end)
        task.wait(0.2)

        
        if D.distance(aK, aL.root) > 15 then
            S.startFly()
            for Z = 1, 20 do
                if D.distance(G.root() or aK, aL.root) < 6 then break end
                S.flyToward(aL.root.Position)
                task.wait(0.1)
            end
            S.stopFly()
        end

        local Z = D.distance(G.root() or aK, aL.root)
        local _, aN = 0, 0
        for aO = 1, 10 do
            K.aimAt(aL)
            if K.clickM1() then _ = _ + 1 end
            if K.fireAt(aL) then aN = aN + 1 end
            task.wait(0.1)
        end

        local aO = aL.hum and aL.hum.Parent and aL.hum.Health or -1
        local aP  = aM - aO

        local aQ = {
            "=== NameHub JB Force-Hit Test ===",
            "Build: " .. a,
            ("Target: %s"):format(aL.model.Name),
            ("Final dist: %.1f studs"):format(Z),
            ("Start HP: %.0f -> End HP: %.0f  (damage: %.0f)"):format(aM, aO, aP),
            ("M1 clicks fired: %d / 10"):format(_),
            ("Attack remote fired: %d / 10"):format(aN),
            "",
            (aP > 0)
                and "RESULT: Damage was dealt. Autofarm should work once it gets close enough."
                or  "RESULT: NO damage. Either (a) you need a stronger dino form, (b) the goat needs a different attack remote, or (c) JB validates more than position. Paste this in Discord.",
        }
        local aR = table.concat(aQ, "\n")
        pcall(setclipboard, aR)
        F.send(("Force-hit done. Damage: %.0f. Report copied."):format(aP), 10)
    end)

    al.button(aC, "Test All Attack Remotes", function()
        local aK = G.root()
        if not aK then
            F.send("No character - spawn first.", 5)
            return
        end

        
        local aL = (w.FarmPriority and #w.FarmPriority > 0) and w.FarmPriority or { w.FarmTarget }
        local aM, aN
        for aO, aP in ipairs(aL) do
            for aQ, aR in ipairs(J.allByName(aP)) do
                local Y = D.distance(aK, aR.root)
                if not aN or Y < aN then aM, aN = aR, Y end
            end
        end
        if not aM then
            for aO, aP in ipairs(J.allWithHumanoid()) do
                local aQ = D.distance(aK, aP.root)
                if not aN or aQ < aN then aM, aN = aP, aQ end
            end
        end
        if not aM then
            F.send("No target found anywhere - server may be empty.", 5)
            return
        end

        local aO = {
            "=== NameHub JB Attack Remote Test ===",
            "Build: " .. a,
            ("Target: %s @ %.1fm  (hum=%s)"):format(
                aM.model.Name, aN or -1,
                aM.hum and "yes" or "no"),
            "",
        }

        
        
        
        local aP = 0
        local aQ  = 0
        for aR, Y in ipairs(v.JB_AttackNames) do
            local Z = H.remoteByName(Y)
            if not Z then
                aO[#aO + 1] = ("- %s: NOT FOUND"):format(Y)
            else
                aO[#aO + 1] = ("+ %s [%s] @ %s"):format(
                    Y, Z.ClassName, Z:GetFullName())
                
                local _ = {
                    { entry = "hum",            args = { aM.hum } },
                    { entry = "model",          args = { aM.model } },
                    { entry = "root",           args = { aM.root } },
                    { entry = "hum+pos",        args = { aM.hum, aM.root.Position } },
                    { entry = "model+pos",      args = { aM.model, aM.root.Position } },
                    { entry = "name(str)",      args = { aM.model.Name } },
                    { entry = "{hum} (table)",  args = { { aM.hum } } },
                    { entry = "{model}",        args = { { aM.model } } },
                    { entry = "BasicAttack+hum",args = { "BasicAttack", aM.hum } },
                    { entry = "Attack+{hum}",   args = { "Attack", { aM.hum } } },
                    { entry = "hum,9999",       args = { aM.hum, 9999 } },
                    { entry = "no args",        args = {} },
                }
                if aM.hum then _[#_ + 1] = { entry = "hum table key", args = { { Target = aM.hum } } } end

                for aS, aT in ipairs(_) do
                    aP = aP + 1
                    local aU, aV = pcall(function()
                        if Z:IsA("RemoteEvent") then
                            Z:FireServer(table.unpack(aT.args))
                        else
                            Z:InvokeServer(table.unpack(aT.args))
                        end
                    end)
                    if aU then
                        aQ = aQ + 1
                        aO[#aO + 1] = ("    OK   %s"):format(aT.entry)
                    else
                        local aW = tostring(aV or ""):sub(1, 80)
                        aO[#aO + 1] = ("    FAIL %s  --  %s"):format(aT.entry, aW)
                    end
                end
                aO[#aO + 1] = ""
            end
        end

        aO[#aO + 1] = ("Summary: %d/%d calls succeeded."):format(aQ, aP)
        aO[#aO + 1] = "If the target's HP dropped or coins went up while this ran, the OK shape just above the change is the winner. Paste into Discord."

        local aR = table.concat(aO, "\n")
        pcall(setclipboard, aR)
        F.send(("Test complete: %d/%d remote calls succeeded. Pasted to clipboard."):format(aQ, aP), 8)
    end)

    al.button(aC, "Copy All Remotes to Clipboard", function()
        local aK = H.allRemotes(600)
        local aL = {
            "=== NameHub JB Remote Dump ===",
            "Build: " .. a,
            ("Found %d remotes across ReplicatedStorage / Character / Workspace"):format(#aK),
            "",
        }
        for aM, aN in ipairs(aK) do aL[#aL + 1] = aN end
        local aM = table.concat(aL, "\n")
        pcall(setclipboard, aM)
        F.send(("Copied %d remotes to clipboard."):format(#aK), 5)
    end)

    
    
    
    
    al.button(aC, "Copy Diagnostics", function()
        local aK = { "=== NameHub JB Diagnostics ===", "Build: " .. a }
        aK[#aK + 1] = "FarmTarget: " .. tostring(w.FarmTarget)
        aK[#aK + 1] = "FarmPriority: " .. table.concat(w.FarmPriority or {}, ", ")
        aK[#aK + 1] = "SkipPlayers: " .. tostring(w.SkipPlayers)
        aK[#aK + 1] = "Status: " .. tostring(w._FarmStatus)
        aK[#aK + 1] = "LastTarget: " .. tostring(w._LastTarget) .. " @ " .. tostring(math.floor(w._LastDistance or 0)) .. "m"
        aK[#aK + 1] = "AttackRemote: " .. tostring(w._AttackRemote)
        aK[#aK + 1] = "LastFire: " .. tostring(w._LastFire)
        aK[#aK + 1] = ("LoopTick: %d  LoopPhase: %s"):format(w._LoopTick or 0, tostring(w._LoopPhase))
        if w._LoopErr ~= "" then
            aK[#aK + 1] = "LoopErr: " .. tostring(w._LoopErr)
        end
        aK[#aK + 1] = "TargetsFound (humanoid): " .. tostring(w._TargetsFound)
        aK[#aK + 1] = "TargetsFound (name fallback): " .. tostring(w._NamedFound)
        aK[#aK + 1] = ""
        aK[#aK + 1] = "--- Nearby humanoid targets (top 20) ---"
        for aL, aM in ipairs(J.dump(20)) do
            aK[#aK + 1] = aM
        end
        aK[#aK + 1] = ""
        aK[#aK + 1] = "--- Name-fallback matches per priority ---"
        local aL = G.root()
        for aM, aN in ipairs(w.FarmPriority or {}) do
            aK[#aK + 1] = ("> %s:"):format(aN)
            local aO = J.allByName(aN)
            local aP = 0
            for aQ, aR in ipairs(aO) do
                if aP >= 10 then break end
                local aS = aL and D.distance(aL, aR.root) or -1
                aK[#aK + 1] = ("    %-30s dist=%-6.1f hum=%s"):format(
                    aR.model.Name:sub(1, 30), aS, aR.hum and "yes" or "no")
                aP = aP + 1
            end
            if #aO == 0 then aK[#aK + 1] = "    (none found)" end
        end
        aK[#aK + 1] = ""
        aK[#aK + 1] = "--- Remotes across RS / Character / Workspace (top 200) ---"
        for aM, aN in ipairs(H.allRemotes(200)) do
            aK[#aK + 1] = aN
        end
        local aM = table.concat(aK, "\n")
        pcall(setclipboard, aM)
        F.send(("Diagnostics copied to clipboard (%d lines). Paste in Discord."):format(#aK), 5)
    end)
end

do
    local aC = aB["ESP"].frame
    al.toggle(aC, "Goat ESP", "GoatESP", function(aD)
        if aD then ab.start() end
    end)
    al.colorPicker(aC, "Goat ESP Color", "GoatESPColor")
    al.toggle(aC, "Amber ESP", "AmberESP", function(aD)
        if aD then ab.start() end
    end)
    al.colorPicker(aC, "Amber ESP Color", "AmberESPColor")
    al.toggle(aC, "No Prompt Delay", "NoPromptDelay")
    al.slider(aC, "Outline Transparency", "OutlineTransparency", 0, 1, 0.05, function() ab.refresh() end)
    al.slider(aC, "Fill Transparency", "FillTransparency", 0, 1, 0.05, function() ab.refresh() end)
end


local aC, aD = al.newCard(az, { tabs = { "Player", "Combat" }, height = 360 })

do
    local aE = aD["Player"].frame
    al.toggle(aE, "Fly", "Fly", function(aF)
        if aF then O.enable() else O.disable() end
    end)
    al.slider(aE, "Fly Speed", "FlySpeed", 10, 300, 1)
    al.button(aE, "Respawn", function() W.respawn() end)
    al.button(aE, "Menu", function() W.openMenu() end)
    al.slider(aE, "Respawn Delay", "RespawnDelay", 0, 30, 1)
    al.toggle(aE, "Auto Respawn", "AutoRespawn")
    al.toggle(aE, "Anchored", "Anchored", function() G.applyAnchor() end)
end

do
    local aE = aD["Combat"].frame
    al.slider(aE, "Offset (X-axis)", "OffsetX", -20, 20, 1)
    al.slider(aE, "Offset (Y-axis)", "OffsetY", -20, 20, 1)
    al.slider(aE, "Range", "Range", 5, 200, 1)
    al.slider(aE, "Max Target HP", "MaxTargetHP", 0, 5000, 10)
    al.slider(aE, "Min Target HP", "MinTargetHP", 0, 5000, 10)
    al.slider(aE, "Disengage At", "DisengageAt", 0, 1000, 10)
    al.toggle(aE, "Target POV", "TargetPOV")
    al.toggle(aE, "Auto Attack Nearby Player", "AutoAttackNearby")
    al.toggle(aE, "Auto Attack", "AutoAttack")
    al.toggle(aE, "Auto TP to Player", "AutoTPToPlayer")
local aF=function()        


local aF = { "" }
        for aG, aH in ipairs(d:GetPlayers()) do
            if aH ~= q then aF[#aF + 1] = aH.Name end
        end
        return aF
end    
aw = al.dropdown(aE, "Target Player", "TargetPlayer", aF())
    
    D.conn("tp_player_add", d.PlayerAdded:Connect(function() aw:setOptions(aF()) end))
    D.conn("tp_player_rem", d.PlayerRemoving:Connect(function() aw:setOptions(aF()) end))
end


local aE = C:addPage("Teleport")
local aF  = al.newColumn(aE, 0.5)
aF.Position = UDim2.fromOffset(8, 8)
local aG, aH = al.newCard(aF, { title = "Server Hop", height = 460 })

do
    al.button(aH, "Join selected server", function()
        if w.SelectedJobId ~= "" then X.joinJobId(w.SelectedJobId) end
    end)
    al.button(aH, "Refresh Server List", function()
        F.send("Fetching servers...")
        D.spawn(function()
            local aI = X.fetchServers()
            w.ServerListCache = aI
            local aJ = {}
            for aK, aL in ipairs(aI) do aJ[#aJ + 1] = ("%s  (%d/%d)"):format(aL.id:sub(1, 8), aL.playing, aL.max) end
            if #aJ == 0 then aJ = { "(no servers)" } end
            at:setOptions(aJ)
            F.send(("Fetched %d servers"):format(#aI))
        end)
    end)
    at = al.dropdown(aH, "Server List", "SelectedJobId", { "---" }, function(aI)
        for aJ, aK in ipairs(w.ServerListCache or {}) do
            if aI:sub(1, 8) == aK.id:sub(1, 8) then w.SelectedJobId = aK.id; return end
        end
    end)
    al.button(aH, "Get PlayerCount", function()
        for aI, aJ in ipairs(w.ServerListCache or {}) do
            if aJ.id == w.SelectedJobId then
                F.send(("Server %s: %d/%d players"):format(aJ.id:sub(1,8), aJ.playing, aJ.max))
                return
            end
        end
        F.send("Refresh server list first.")
    end)
    al.button(aH, "Copy JobId", function()
        pcall(setclipboard, w.SelectedJobId)
        F.send("Copied JobId.")
    end)
    al.button(aH, "Join Selected JobId", function()
        X.joinJobId(w.SelectedJobId)
    end)
    al.textInput(aH, "JobId", "SelectedJobId", "Enter JobId here")
    al.button(aH, "Rejoin Server", function() X.rejoin() end)
    al.button(aH, "Server Hop", function() X.randomHop() end)
    al.slider(aH, "Hop On Player Count", "HopOnPlayerCount", 0, 30, 1)
    al.toggle(aH, "Hop On Friend Detection", "HopOnFriend")
end


local aI = C:addPage("Safety")
local aJ = al.newColumn(aI, 0.5)
aJ.Position = UDim2.fromOffset(8, 8)
local aK, aL = al.newCard(aJ, { title = "Admin Detection", height = 80 })
al.toggle(aL, "Kick On Detection", "KickOnAdmin")


local aM = C:addPage("Webhook")
local aN  = al.newColumn(aM, 0.5)
aN.Position = UDim2.fromOffset(8, 8)
local aO, aP = al.newCard(aN, { title = "Webhook", height = 280 })
do
    al.textInput(aP, "Webhook Link", "WebhookLink", "https://discord.com/api/webhooks/...")
    al.slider(aP, "Webhook Interval (minutes)", "WebhookInterval", 1, 60, 1)
    al.slider(aP, "Timezone (UTC offset)", "WebhookTimezone", -12, 12, 1)
    al.colorPicker(aP, "Embed Color", "WebhookColor")
    al.toggle(aP, "Anonymous Mode", "WebhookAnonymous")
    al.button(aP, "Force Send Webhook Request", function() ad.send(true) end)
end


local aQ = C:addPage("Settings")

local aR  = al.newColumn(aQ, 0.5)
aR.Position = UDim2.fromOffset(8, 8)
local aS = al.newColumn(aQ, 0.5)
aS.Position = UDim2.new(0.5, 4, 0, 8)

local aT, aU = al.newCard(aR, { title = "Themes", height = 280 })
do
    al.colorPicker(aU, "Background color", "BgColor",   function() ag.apply() end)
    al.colorPicker(aU, "Main color",        "MainColor", function() ag.apply() end)
    al.colorPicker(aU, "Accent color",      "AccentColor", function() ag.apply() end)
    al.colorPicker(aU, "Outline color",     "OutlineColor", function() ag.apply() end)
    al.colorPicker(aU, "Font color",        "FontColor", function() ag.apply() end)
    al.dropdown(aU, "Font Face", "FontFace", v.FontOptions, function() ag.apply() end)
    av = al.dropdown(aU, "Theme list", "Theme", ag.listNames())
    al.button(aU, "Load theme", function() ag.load(w.Theme) end)
    al.button(aU, "Overwrite theme", function()
        if ag.saveCurrent(w.Theme) then F.send("Saved theme: " .. w.Theme) end
    end)
end

local aV, aW = al.newCard(aS, { title = "Configuration", height = 320 })
do
    al.textInput(aW, "Config name", "_cfgName", "name")
    al.button(aW, "Create config", function() ah.save(w._cfgName or "") end)
    au = al.dropdown(aW, "Config list", "_cfgPicked", ah.list())
    al.button(aW, "Refresh list", function() au:setOptions(ah.list()) end)
    al.button(aW, "Load config",      function() ah.load(w._cfgPicked or "") end)
    al.button(aW, "Overwrite config", function() ah.save(w._cfgPicked or "") end)
    al.button(aW, "Delete config",    function()
        ah.delete(w._cfgPicked or "")
        au:setOptions(ah.list())
    end)
    al.button(aW, "Set autoload",   function()
        if w._cfgPicked and w._cfgPicked ~= "" then
            ah.setAutoload(w._cfgPicked)
            if as then as:setText("Current autoload config: " .. w.AutoloadConfig) end
            F.send("Autoload set: " .. w.AutoloadConfig)
        end
    end)
    al.button(aW, "Reset autoload", function()
        ah.resetAutoload()
        if as then as:setText("Current autoload config: none") end
    end)
    as = al.label(aW,
        "Current autoload config: " .. (ah.getAutoload() ~= "" and ah.getAutoload() or "none"))
    al.textInput(aW, "Import Data", "_importData", "paste exported config here")
    al.button(aW, "Export config", function()
        local Y = ah.exportCurrent()
        pcall(setclipboard, Y)
        F.send("Exported to clipboard.")
    end)
    al.button(aW, "Import config", function() ah.importString(w._importData or "") end)
end

local Y, Z = al.newCard(aR, { title = "Menu", height = 160 })
do
    al.keybind(Z, "Menu bind", "MenuBind")
    al.toggle(Z, "Autoexecute", "Autoexecute", function(_)
        if _ then
            
            local aX = 'pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/kyronshaw912-collab/NameHub/main/loader.lua"))() end)'
            local aY = { "autoexec/", "auto_exec/", "autoexecute/" }
            local aZ
            for a_, a0 in ipairs(aY) do
                local a1 = pcall(b.writefile, a0 .. "NameHubJB_loader.lua", aX)
                if a1 then aZ = a0; break end
            end
            if aZ then F.send("Autoexec written: " .. aZ) else F.send("Autoexec unsupported by executor.") end
        end
    end)
    al.dropdown(Z, "Notification Side", "NotificationSide", v.NotifySides)
    al.dropdown(Z, "UI Zoom", "_ZoomPick",
        { "75%", "100%", "125%", "150%", "175%", "200%", "250%" },
        function(aX)
            local aY = tonumber((aX:gsub("%%", "")))
            if aY and aY > 0 then
                w.UIScale = aY / 100
                if C and C.uiScale then C.uiScale.Scale = w.UIScale end
            end
        end
    )
end




C.searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local aX = C.searchBox.Text:lower()
    for aY, aZ in pairs(z) do
        if aZ.instance and aZ.label and aZ.instance.Parent then
            local a_ = (aX == "") or aZ.label:lower():find(aX, 1, true)
            aZ.instance.Visible = a_ and true or false
        end
    end
end)




D.conn("ui_toggle", f.InputBegan:Connect(function(aX, aY)
    if aY then return end
    if aX.UserInputType ~= Enum.UserInputType.Keyboard then return end
    if aX.KeyCode.Name == w.MenuBind then
        w.UIVisible = not w.UIVisible
        C.win.Visible = w.UIVisible
    end
end))




D.conn("stats_tick", e.Heartbeat:Connect(function()
    if not w.Alive then return end
    if ap then ap:setText("Coins Gained: " .. tostring(w.CoinsGained)) end
    if w.StartTime and w.StatsCounting then
        local aX = os.time() - w.StartTime
        if aq  then aq:setText("Time Elapsed: " .. D.fmtTime(aX)) end
        if ar then
            local aY = aX > 0 and (w.CoinsGained / (aX / 60)) or 0
            ar:setText(("Rate: %.1f/min"):format(aY))
        end
    else
        if aq  then aq:setText("Time Elapsed: N/A") end
        if ar then ar:setText("Rate: N/A") end
    end
    
    if _G._JB_StatusLbl   then _G._JB_StatusLbl  :setText("Status: " .. tostring(w._FarmStatus)) end
    if _G._JB_FoundLbl    then _G._JB_FoundLbl   :setText(("Targets: %d humanoids / %d by name"):format(w._TargetsFound or 0, w._NamedFound or 0)) end
    if _G._JB_RemoteLbl   then _G._JB_RemoteLbl  :setText("Attack remote: " .. (w._AttackRemote ~= "" and w._AttackRemote or "(not discovered)")) end
    if _G._JB_LastFireLbl then _G._JB_LastFireLbl:setText("Last fire: " .. (w._LastFire ~= "" and w._LastFire or "-")) end
end))




D.conn("charadded", q.CharacterAdded:Connect(function()
    task.wait(0.2)
    if w.Fly then O.enable() end
    G.applySpeed()
    G.applyAnchor()
end))




getgenv()._NameHubJB_Alive  = true
getgenv()._NameHubJB_Unload = ao

af()
W.attachAutoRespawn()
X.attachWatchers()
ac.attach()
ad.attachInterval()
aa.start()


do
    local aX = ah.getAutoload()
    if aX ~= "" then
        w.AutoloadConfig = aX
        ah.load(aX)
        if as then as:setText("Current autoload config: " .. aX) end
    end
end

ag.apply()
F.send(v.Brand .. " " .. v.SubBrand .. " " .. a .. " loaded.", 4)

return true
