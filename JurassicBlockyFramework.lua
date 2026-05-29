












local a = "v2.0.0 NameHub (jb-aqua-rewrite-20260529)"




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

    FontOptions = {
        "Gotham", "GothamBold", "GothamMedium", "GothamSemibold",
        "SourceSans", "SourceSansBold", "RobotoMono", "Arial", "Code", "Highway",
    },

    NotifySides = { "Right", "Left", "Top", "Bottom" },

    AttackKeywords = { "attack", "bite", "claw", "swing", "hit", "damage", "combat", "kill" },
    LootKeywords   = { "claim", "collect", "pickup", "loot", "reward", "amber", "coin" },
    DinoChangeKeywords = { "spawn", "select", "choose", "setdino", "changedino", "playas", "dinoselect" },
    RespawnKeywords    = { "respawn", "reset", "revive", "spawn" },
    MenuKeywords       = { "menu", "openmenu", "togglemenu" },
}




local w = {
    
    Autofarm          = false,
    FarmTarget        = "Goat",
    FarmPriority      = { "D-Rex", "Goat" },
    Speed             = 125,
    AutofarmDino      = "Gallimimus",
    CoinsGained       = 0,
    StartTime         = nil,
    StatsCounting     = false,

    
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

    
    Alive             = true,
    UIVisible         = true,
}

local x      = {}      
local y = {}      
local z    = {}      
local A     = {}      
local B   = {}      




local C = {}

function C.safe(D, E)
    return function(...)
        local F, G = pcall(D, ...)
        if not F then
            warn(("[%s][%s] %s"):format(v.Brand, E or "?", G))
        end
        return F
    end
end

function C.spawn(D, E)
    return task.spawn(C.safe(D, E or "spawn"))
end

function C.conn(D, E)
    if x[D] and x[D].Connected then x[D]:Disconnect() end
    x[D] = E
    return E
end

function C.disconnect(D)
    if x[D] and x[D].Connected then x[D]:Disconnect() end
    x[D] = nil
end

function C.disconnectAll()
    for D, E in pairs(x) do
        if E and E.Connected then pcall(function() E:Disconnect() end) end
        x[D] = nil
    end
end

function C.rand(D) return (D or "_") .. tostring(math.random(100000, 999999)) end

function C.distance(D, E)
    if not D or not E then return math.huge end
    local F = typeof(D) == "Instance" and D.Position or D
    local G = typeof(E) == "Instance" and E.Position or E
    return (F - G).Magnitude
end

function C.contains(D, E)
    for F, G in ipairs(D) do if G == E then return true end end
    return false
end

function C.shallowCopy(D)
    local E = {}
    for F, G in pairs(D) do E[F] = G end
    return E
end

function C.color3ToHex(D)
    return string.format("#%02X%02X%02X",
        math.floor(D.R * 255 + 0.5),
        math.floor(D.G * 255 + 0.5),
        math.floor(D.B * 255 + 0.5))
end

function C.color3ToInt(D)
    return math.floor(D.R * 255) * 65536 + math.floor(D.G * 255) * 256 + math.floor(D.B * 255)
end

function C.color3ToTable(D)
    return { math.floor(D.R * 255), math.floor(D.G * 255), math.floor(D.B * 255) }
end

function C.tableToColor3(D)
    if type(D) ~= "table" or #D < 3 then return Color3.new(1, 1, 1) end
    return Color3.fromRGB(D[1], D[2], D[3])
end

function C.tween(D, E, F)
    local G = TweenInfo.new(E or 0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    g:Create(D, G, F):Play()
end

function C.fmtTime(D)
    D = math.max(0, math.floor(D))
    local E = math.floor(D / 3600)
    local F = math.floor((D % 3600) / 60)
    local G = D % 60
    if E > 0 then return string.format("%dh %dm %ds", E, F, G) end
    if F > 0 then return string.format("%dm %ds", F, G) end
    return string.format("%ds", G)
end




local D = {}

function D.encode(E)
    local F, G = pcall(function() return l:JSONEncode(E) end)
    return F and G or "{}"
end

function D.decode(E)
    if type(E) ~= "string" or #E == 0 then return {} end
    local F, G = pcall(function() return l:JSONDecode(E) end)
    return F and G or {}
end




local E = {}

function E.send(F, G)
    G = G or 3
    if not _G._NHJB_NotifyGui or not _G._NHJB_NotifyGui.Parent then
        local H = Instance.new("ScreenGui")
        H.Name = C.rand("_NHJB_NF_")
        H.IgnoreGuiInset = true
        H.ResetOnSpawn   = false
        H.DisplayOrder   = 1000000
        local I = pcall(function() H.Parent = m end)
        if not I then
            local J = q:WaitForChild("PlayerGui", 5)
            if J then H.Parent = J end
        end
        _G._NHJB_NotifyGui = H
    end

    local H = Instance.new("Frame")
    H.Size = UDim2.fromOffset(280, 50)
    H.BackgroundColor3 = w.MainColor
    H.BorderSizePixel = 0
    H.Parent = _G._NHJB_NotifyGui
    Instance.new("UICorner", H).CornerRadius = UDim.new(0, 8)
    local I = Instance.new("UIStroke", H)
    I.Color = w.AccentColor
    I.Transparency = 0.5

    local J = Instance.new("TextLabel", H)
    J.Size = UDim2.new(1, -20, 1, -10)
    J.Position = UDim2.fromOffset(10, 5)
    J.BackgroundTransparency = 1
    J.Text = tostring(F)
    J.TextColor3 = w.FontColor
    J.Font = Enum.Font[w.FontFace] or Enum.Font.Gotham
    J.TextSize = 12
    J.TextWrapped = true
    J.TextXAlignment = Enum.TextXAlignment.Left

    table.insert(B, H)
local K=function()        

local K = w.NotificationSide
        local L = 0
        for M, N in ipairs(B) do
            if N == H then L = M break end
        end
        local M = 10 + (L - 1) * 58
        if K == "Right"  then H.Position = UDim2.new(1, -290, 0, M) end
        if K == "Left"   then H.Position = UDim2.new(0,   10, 0, M) end
        if K == "Top"    then H.Position = UDim2.new(0.5, -140 + (L - 1) * 0, 0, M) end
        if K == "Bottom" then H.Position = UDim2.new(0.5, -140, 1, -60 - (L - 1) * 58) end
end
    
K()
    task.delay(0, function()
        for L, M in ipairs(B) do
            local N = 0
            for O, P in ipairs(B) do if P == M then N = O break end end
            if N > 0 then
                local O = 10 + (N - 1) * 58
                local P = w.NotificationSide
                if P == "Right"  then M.Position = UDim2.new(1, -290, 0, O) end
                if P == "Left"   then M.Position = UDim2.new(0,   10, 0, O) end
                if P == "Bottom" then M.Position = UDim2.new(0.5, -140, 1, -60 - (N - 1) * 58) end
            end
        end
    end)

    task.delay(G, function()
        if not H or not H.Parent then return end
        C.tween(H, 0.25, { BackgroundTransparency = 1 })
        for L, M in ipairs(H:GetDescendants()) do
            if M:IsA("TextLabel") then C.tween(M, 0.25, { TextTransparency = 1 }) end
            if M:IsA("UIStroke")  then C.tween(M, 0.25, { Transparency = 1 })     end
        end
        task.wait(0.3)
        for L = #B, 1, -1 do
            if B[L] == H then table.remove(B, L) break end
        end
        H:Destroy()
    end)
end




local F = {}

function F.get()           return q.Character end
function F.root()
    local G = F.get(); if not G then return nil end
    return G:FindFirstChild("HumanoidRootPart") or G.PrimaryPart
end
function F.humanoid()
    local G = F.get(); if not G then return nil end
    return G:FindFirstChildOfClass("Humanoid")
end

function F.applySpeed()
    local G = F.humanoid(); if not G then return end
    G.WalkSpeed = w.Autofarm and w.Speed or v.DefaultWS
end

function F.applyAnchor()
    local G = F.root(); if not G then return end
    G.Anchored = w.Anchored
end




local G = {}

local function walk(H, I, J)
    J = J or {}
    if not H or J[H] then return end
    J[H] = true
    for K, L in ipairs(H:GetChildren()) do
        I(L)
        walk(L, I, J)
    end
end

function G.remoteByKeywords(H)
    local I = {}
    for J, K in ipairs(H) do I[#I + 1] = K:lower() end
    local J
    walk(i, function(K)
        if J then return end
        if K:IsA("RemoteEvent") or K:IsA("RemoteFunction") then
            local L = K.Name:lower()
            for M, N in ipairs(I) do
                if L:find(N, 1, true) then J = K; return end
            end
        end
    end)
    return J
end

function G.allRemotes(H)
    H = H or 300
    local I = {}
    walk(i, function(J)
        if #I >= H then return end
        if J:IsA("RemoteEvent") or J:IsA("RemoteFunction") then
            I[#I + 1] = J:GetFullName() .. "  [" .. J.ClassName .. "]"
        end
    end)
    return I
end




local H = {}

function H.allWithHumanoid()
    local I = {}
    for J, K in ipairs(h:GetDescendants()) do
        if K:IsA("Model") and K ~= F.get() then
            local L = K:FindFirstChildOfClass("Humanoid")
            local M = K:FindFirstChild("HumanoidRootPart") or K.PrimaryPart
            if L and M and L.Health > 0 then I[#I + 1] = { model = K, hum = L, root = M } end
        end
    end
    return I
end

function H.matchesName(I, J)
    if not J or J == "" then return true end
    if J == "Players"  then return d:GetPlayerFromCharacter(I) ~= nil end
    if J == "All NPCs" then return d:GetPlayerFromCharacter(I) == nil end
    local K = I.Name:lower()
    return K:find(J:lower(), 1, true) ~= nil
end

function H.bestByPriority(I)
    local J = H.allWithHumanoid()
    local K   = F.root()
    if not K then return nil end

    
    for L, M in ipairs(I or {}) do
        local N ,O=(math.huge
)        for P, Q in ipairs(J) do
            if H.matchesName(Q.model, M) then
                if w.MaxTargetHP == 0 or Q.hum.Health <= w.MaxTargetHP then
                    if Q.hum.Health >= w.MinTargetHP then
                        local R = C.distance(K, Q.root)
                        if R < N then O, N = Q, R end
                    end
                end
            end
        end
        if O then return O end
    end
    return nil
end

function H.dump(I)
    I = I or 50
    local J  = F.root()
    local K = {}
    for L, M in ipairs(H.allWithHumanoid()) do
        if #K >= I then break end
        local N = J and C.distance(J, M.root) or -1
        local O = d:GetPlayerFromCharacter(M.model)
        K[#K + 1] = ("%-30s HP=%-6.1f dist=%-6.1f %s"):format(
            M.model.Name:sub(1, 30), M.hum.Health, N, O and ("player=" .. O.Name) or "NPC")
    end
    return K
end




local I = {}
local J

function I.remote()
    if J and J.Parent then return J end
    J = G.remoteByKeywords(v.AttackKeywords)
    return J
end

function I.fireAt(K)
    local L = I.remote()
    if not L or not K then return false end
    local M = {
        { K.model }, { K.hum }, { K.root }, { K.model.Name }, { },
    }
    for N, O in ipairs(M) do
        local P = pcall(function()
            if L:IsA("RemoteEvent") then L:FireServer(table.unpack(O))
            else L:InvokeServer(table.unpack(O)) end
        end)
        if P then return true end
    end
    return false
end




local K = {}

function K.start()
    if x.autofarm and x.autofarm.Connected then return end
    C.conn("autofarm", e.Heartbeat:Connect(function() end))   
    x.autofarm = nil

    C.spawn(function()
        local L = 0
        while w.Alive and w.Autofarm do
            local M = F.root()
            if M then
                F.applySpeed()

                local N = (w.FarmPriority and #w.FarmPriority > 0) and w.FarmPriority or { w.FarmTarget }
                local O = H.bestByPriority(N)

                local P = F.humanoid()
                if P and P.Health < w.DisengageAt and w.DisengageAt > 0 then
                    
                else
                    if O and O.model.Parent then
                        local Q = C.distance(M, O.root)
                        if Q > w.Range then
                            local R = CFrame.new(O.root.Position) * CFrame.new(w.OffsetX, w.OffsetY, math.min(8, w.Range * 0.2))
                            R = CFrame.lookAt(R.Position, O.root.Position)
                            pcall(function() M.CFrame = R end)
                        end

                        if tick() >= L then
                            local R = I.fireAt(O)
                            if R and w.StatsCounting then
                                w.CoinsGained = w.CoinsGained + 1
                            end
                            L = tick() + 0.35
                        end
                    end
                end
            end
            task.wait(0.1)
        end
        F.applySpeed()   
    end, "AutoFarm.loop")
end




local L = {}

function L.start()
    C.spawn(function()
        local M = 0
        while w.Alive do
            if w.AutoAttackNearby or w.AutoAttack or w.AutoTPToPlayer then
                local N = F.root()
                if N then
                    local O
                    if w.AutoTPToPlayer and w.TargetPlayer ~= "" then
                        local P = d:FindFirstChild(w.TargetPlayer)
                        if P and P.Character then
                            local Q = P.Character:FindFirstChild("HumanoidRootPart")
                            local R = P.Character:FindFirstChildOfClass("Humanoid")
                            if Q and R then
                                local S = CFrame.new(Q.Position) * CFrame.new(w.OffsetX, w.OffsetY, 0)
                                S = CFrame.lookAt(S.Position, Q.Position)
                                pcall(function() N.CFrame = S end)
                                if w.AutoAttack then
                                    O = { model = P.Character, hum = R, root = Q }
                                end
                            end
                        end
                    end

                    if not O and w.AutoAttackNearby then
                        O = H.bestByPriority({ "Players" })
                    end
                    if not O and w.AutoAttack then
                        O = H.bestByPriority(w.FarmPriority)
                    end

                    if O and tick() >= M then
                        local P = C.distance(N, O.root)
                        if P <= w.Range then
                            local Q = F.humanoid()
                            if not Q or Q.Health >= w.DisengageAt or w.DisengageAt == 0 then
                                I.fireAt(O)
                                M = tick() + 0.35
                            end
                        end
                    end

                    if w.TargetPOV and O and O.root then
                        pcall(function()
                            p.CameraType    = Enum.CameraType.Scriptable
                            p.CFrame        = CFrame.new(O.root.Position + Vector3.new(0, 8, 12), O.root.Position)
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




local M = {}

function M.clearAll()
    for N, O in pairs(y) do
        if O and O.Parent then O:Destroy() end
        y[N] = nil
    end
end

function M.applyHighlight(N, O)
    if y[N] then return end
    local P = Instance.new("Highlight")
    P.Adornee = N
    P.FillColor = O
    P.OutlineColor = O
    P.FillTransparency    = w.FillTransparency
    P.OutlineTransparency = w.OutlineTransparency
    P.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    P.Parent = N
    y[N] = P
end

function M.refresh()
    
    for N, O in pairs(y) do
        if O and O.Parent then
            O.FillTransparency    = w.FillTransparency
            O.OutlineTransparency = w.OutlineTransparency
        end
    end
end

function M.start()
    C.spawn(function()
        while w.Alive do
            
            for N, O in pairs(y) do
                if not N.Parent or not O.Parent then
                    if O.Parent then O:Destroy() end
                    y[N] = nil
                end
            end

            if w.GoatESP or w.AmberESP then
                for N, O in ipairs(H.allWithHumanoid()) do
                    local P = O.model.Name:lower()
                    if w.GoatESP and (P:find("goat", 1, true) or P:find("dino", 1, true) or d:GetPlayerFromCharacter(O.model) == nil) then
                        M.applyHighlight(O.model, w.GoatESPColor)
                    end
                end
                if w.AmberESP then
                    for N, O in ipairs(h:GetDescendants()) do
                        if O:IsA("Model") or O:IsA("BasePart") then
                            local P = O.Name:lower()
                            if P:find("amber", 1, true) and not y[O] then
                                M.applyHighlight(O, w.AmberESPColor)
                            end
                        end
                    end
                end
            else
                M.clearAll()
            end
            task.wait(0.5)
        end
        M.clearAll()
    end, "ESP.loop")
end




local N = {}
local O, P, Q

function N.enable()
    local R = F.get(); if not R then return end
    local S = F.root(); if not S then return end
    local T = F.humanoid()

    N.disable()
    Q = {}

    O = Instance.new("BodyVelocity")
    O.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    O.Velocity = Vector3.zero
    O.Parent = S

    P = Instance.new("BodyGyro")
    P.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    P.P = 1000
    P.CFrame = S.CFrame
    P.Parent = S

    if T then T.PlatformStand = true end

    C.conn("fly_input_began", f.InputBegan:Connect(function(U, V)
        if V then return end
        Q[U.KeyCode] = true
    end))
    C.conn("fly_input_ended", f.InputEnded:Connect(function(U)
        Q[U.KeyCode] = false
    end))

    C.conn("fly_step", e.RenderStepped:Connect(function()
        if not (w.Fly and O and O.Parent) then return end
        local U = p
        if not U then return end
        local V = Vector3.zero
        if Q[Enum.KeyCode.W]      then V = V + U.CFrame.LookVector end
        if Q[Enum.KeyCode.S]      then V = V - U.CFrame.LookVector end
        if Q[Enum.KeyCode.A]      then V = V - U.CFrame.RightVector end
        if Q[Enum.KeyCode.D]      then V = V + U.CFrame.RightVector end
        if Q[Enum.KeyCode.Space]  then V = V + Vector3.new(0, 1, 0) end
        if Q[Enum.KeyCode.LeftControl] then V = V - Vector3.new(0, 1, 0) end

        if V.Magnitude > 0 then V = V.Unit * w.FlySpeed
        else V = Vector3.zero end
        O.Velocity = V
        P.CFrame = U.CFrame
    end))
end

function N.disable()
    C.disconnect("fly_input_began")
    C.disconnect("fly_input_ended")
    C.disconnect("fly_step")
    if O then pcall(function() O:Destroy() end); O = nil end
    if P then pcall(function() P:Destroy() end); P = nil end
    local R = F.humanoid()
    if R then pcall(function() R.PlatformStand = false end) end
    Q = nil
end




local R = {}

function R.respawn()
    local S = F.humanoid()
    if S then
        S.Health = 0
    else
        pcall(function() q.Character:BreakJoints() end)
    end
end

function R.openMenu()
    local S = G.remoteByKeywords(v.MenuKeywords)
    if S then
        pcall(function()
            if S:IsA("RemoteEvent") then S:FireServer() else S:InvokeServer() end
        end)
        return
    end
    
    pcall(function() k:CaptureController() end)
end

function R.attachAutoRespawn()
    C.conn("char_died_watch", q.CharacterAdded:Connect(function(S)
        local T = S:WaitForChild("Humanoid", 5)
        if not T then return end
        T.Died:Connect(function()
            if not w.AutoRespawn then return end
            task.wait(w.RespawnDelay)
            if not w.AutoRespawn then return end
            
            pcall(function() q:LoadCharacter() end)
        end)
    end))
end




local S = {}

function S.fetchServers()
    local T = game.PlaceId
    local U = ("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100"):format(T)
    local V = c({ Url = U, Method = "GET" })
    if not V or V.StatusCode ~= 200 then return {} end
    local W = D.decode(V.Body or "")
    local X = {}
    for Y, Z in ipairs(W.data or {}) do
        if Z.id and Z.id ~= game.JobId then
            X[#X + 1] = { id = Z.id, playing = Z.playing or 0, max = Z.maxPlayers or 0 }
        end
    end
    return X
end

function S.joinJobId(T)
    if not T or T == "" then return end
    pcall(function() n:TeleportToPlaceInstance(game.PlaceId, T, q) end)
end

function S.rejoin()
    pcall(function() n:TeleportToPlaceInstance(game.PlaceId, game.JobId, q) end)
end

function S.randomHop()
    local T = S.fetchServers()
    if #T == 0 then E.send("No servers found.") return end
    local U = T[math.random(1, #T)]
    S.joinJobId(U.id)
end

function S.attachWatchers()
    
    C.conn("friend_watch", d.PlayerAdded:Connect(function(T)
        if not w.HopOnFriend then return end
        local U, V = pcall(function() return q:IsFriendsWith(T.UserId) end)
        if U and V then S.randomHop() end
    end))

    
    C.spawn(function()
        while w.Alive do
            if w.HopOnPlayerCount > 0 and #d:GetPlayers() <= w.HopOnPlayerCount then
                S.randomHop()
                task.wait(10)
            end
            task.wait(5)
        end
    end, "Hop.thresholdLoop")
end




local T = {}

function T.isAdmin(U)
    U = U:lower()
    for V, W in ipairs(w.AdminList) do
        if U:find(W, 1, true) then return true end
    end
    return false
end

function T.attach()
    C.conn("admin_watch", d.PlayerAdded:Connect(function(U)
        if not w.KickOnAdmin then return end
        if T.isAdmin(U.Name) or T.isAdmin(U.DisplayName or "") then
            E.send("Admin detected: " .. U.Name .. " — kicking self.", 5)
            task.wait(0.3)
            pcall(function() q:Kick("[NameHub] Admin detected: " .. U.Name) end)
        end
    end))

    
    C.spawn(function()
        task.wait(2)
        if not w.KickOnAdmin then return end
        for U, V in ipairs(d:GetPlayers()) do
            if V ~= q and (T.isAdmin(V.Name) or T.isAdmin(V.DisplayName or "")) then
                E.send("Admin in server: " .. V.Name .. " — kicking self.", 5)
                task.wait(0.3)
                pcall(function() q:Kick("[NameHub] Admin in server: " .. V.Name) end)
                return
            end
        end
    end, "Safety.initScan")
end




local U = {}
local V = 0

function U.send(W)
    if not W and w.WebhookLink == "" then return end
    if w.WebhookLink == "" then E.send("Set a webhook URL first.") return end

    local X = w.StartTime and (os.time() - w.StartTime) or 0
    local Y    = X > 0 and (w.CoinsGained / (X / 60)) or 0

    local Z = w.WebhookAnonymous and "Anonymous" or q.Name
    local _       = w.WebhookTimezone
    local aa   = os.time() + _ * 3600
    local ab   = os.date("!%Y-%m-%d %H:%M:%S", aa) .. (" UTC%+d"):format(_)

    local ac = {
        username = "NameHub JB",
        embeds = {{
            title  = "NameHub Jurassic Blocky — Stats",
            color  = C.color3ToInt(w.WebhookColor),
            fields = {
                { name = "User",          value = Z,                                inline = true },
                { name = "Server",        value = ("`%s`"):format(game.JobId or "n/a"),    inline = true },
                { name = "Time",          value = ab,                                  inline = false },
                { name = "Coins Gained",  value = tostring(w.CoinsGained),                 inline = true },
                { name = "Rate (per min)",value = string.format("%.1f", Y),             inline = true },
                { name = "Elapsed",       value = C.fmtTime(X),                      inline = true },
                { name = "Auto-Farm",     value = w.Autofarm and "ON" or "OFF",            inline = true },
                { name = "Target",        value = w.FarmTarget,                            inline = true },
                { name = "Dino",          value = w.AutofarmDino,                          inline = true },
            },
            footer = { text = a },
        }},
    }
    local ad = D.encode(ac)
    local ae = pcall(function()
        c({
            Url     = w.WebhookLink,
            Method  = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body    = ad,
        })
    end)
    if ae then
        V = tick()
        if W then E.send("Webhook sent.") end
    elseif W then
        E.send("Webhook failed.")
    end
end

function U.attachInterval()
    C.spawn(function()
        while w.Alive do
            if w.WebhookLink ~= "" and w.WebhookInterval > 0 then
                if tick() - V >= w.WebhookInterval * 60 then
                    U.send(false)
                end
            end
            task.wait(30)
        end
    end, "Webhook.interval")
end
local aa=function()    




C.conn("antiafk", q.Idled:Connect(function()
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

local ab = {}

function ab.applyValues(ac)
    w.BgColor       = ac.Bg
    w.MainColor     = ac.Main
    w.AccentColor   = ac.Accent
    w.OutlineColor  = ac.Outline
    w.FontColor     = ac.Font
end

function ab.apply()
    for ac, ad in pairs(z) do
        if ad.themeUpdate then pcall(ad.themeUpdate) end
    end
end

function ab.load(ac)
    local ad = A[ac]
    if not ad then return end
    w.Theme = ac
    ab.applyValues(ad)
    ab.apply()
end

function ab.listNames()
    local ac = {}
    for ad in pairs(A) do ac[#ac + 1] = ad end
    table.sort(ac)
    return ac
end

function ab.saveCurrent(ac)
    if not ac or ac == "" then return false end
    local ad = {
        Bg      = C.color3ToTable(w.BgColor),
        Main    = C.color3ToTable(w.MainColor),
        Accent  = C.color3ToTable(w.AccentColor),
        Outline = C.color3ToTable(w.OutlineColor),
        Font    = C.color3ToTable(w.FontColor),
    }
    pcall(b.writefile, t .. "/" .. ac .. ".json", D.encode(ad))
    return true
end




local ac = {}

local ad = {
    "Autofarm", "FarmTarget", "FarmPriority", "Speed", "AutofarmDino",
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
}
local ae=function()    

local ae = {}
    for W, X in ipairs(ad) do
        local Y = w[X]
        if typeof(Y) == "Color3" then
            ae[X] = { _c3 = true, v = C.color3ToTable(Y) }
        else
            ae[X] = Y
        end
    end
    return ae
end local W=function(

W)    
for X, Y in pairs(W or {}) do
        if type(Y) == "table" and Y._c3 then
            w[X] = C.tableToColor3(Y.v)
        else
            w[X] = Y
        end
    end
end

function ac.save(X)
    if not X or X == "" then E.send("Config name required.") return end
    pcall(b.writefile, s .. "/" .. X .. ".json", D.encode(ae()))
    E.send("Saved config: " .. X)
end

function ac.load(X)
    if not X or X == "" then return end
    if not b.isfile(s .. "/" .. X .. ".json") then E.send("No config: " .. X) return end
    local Y = ""
    pcall(function() Y = b.readfile(s .. "/" .. X .. ".json") end)
    W(D.decode(Y))
    
    for Z, _ in pairs(z) do
        if _.refresh then pcall(_.refresh) end
    end
    ab.apply()
    E.send("Loaded config: " .. X)
end

function ac.delete(X)
    if not X or X == "" then return end
    pcall(b.delfile, s .. "/" .. X .. ".json")
    E.send("Deleted config: " .. X)
end

function ac.list()
    local X = {}
    local Y, Z = pcall(b.listfiles, s)
    if not Y or type(Z) ~= "table" then return X end
    for _, af in ipairs(Z) do
        local ag = af:match("([^/\\]+)%.json$")
        if ag then X[#X + 1] = ag end
    end
    table.sort(X)
    return X
end

function ac.setAutoload(af)
    pcall(b.writefile, u, af or "")
    w.AutoloadConfig = af or ""
end

function ac.resetAutoload()
    pcall(b.delfile, u)
    w.AutoloadConfig = ""
end

function ac.getAutoload()
    if not b.isfile(u) then return "" end
    local af = ""
    pcall(function() af = b.readfile(u) end)
    return (af or ""):gsub("%s+$", "")
end

function ac.exportCurrent()
    return D.encode(ae())
end

function ac.importString(af)
    if not af or af == "" then E.send("Nothing to import.") return end
    local ag = D.decode(af)
    if not ag or not next(ag) then E.send("Invalid import data.") return end
    W(ag)
    for X, Y in pairs(z) do
        if Y.refresh then pcall(Y.refresh) end
    end
    ab.apply()
    E.send("Imported config.")
end





local af = {}
local ag=function(
ag, X, Y)    
local Z = Instance.new(ag)
    for _, ah in pairs(X or {}) do Z[_] = ah end
    if Y then for ah, _ in ipairs(Y) do _.Parent = Z end end
    return Z
end local ah=function()

return Enum.Font[w.FontFace] or Enum.Font.Gotham end


function af.newWindow(X)
    X = X or {}
    local Y = ag("ScreenGui", {
        Name = C.rand("_NHJB_"),
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

    local _ = ag("Frame", {
        Name = "Window",
        Position = UDim2.fromOffset(60, 60),
        Size     = UDim2.fromOffset(X.width or 760, X.height or 520),
        BackgroundColor3 = w.BgColor,
        BorderSizePixel  = 0,
        Active           = true,
        Parent           = Y,
    })
    ag("UICorner", { CornerRadius = UDim.new(0, 10), Parent = _ })
    local ai = ag("UIStroke", { Color = w.OutlineColor, Transparency = 0.6, Thickness = 1, Parent = _ })

    
    local aj = ag("TextLabel", {
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
    
    do
        local ak, al, am
local an=function(an)            
ak = true
            al = an.Position
            am  = _.Position
            an.Changed:Connect(function()
                if an.UserInputState == Enum.UserInputState.End then ak = false end
            end)
end        
aj.InputBegan:Connect(function(ao)
            if ao.UserInputType == Enum.UserInputType.MouseButton1 or ao.UserInputType == Enum.UserInputType.Touch then
                an(ao)
            end
        end)
        f.InputChanged:Connect(function(ao)
            if ak and (ao.UserInputType == Enum.UserInputType.MouseMovement or ao.UserInputType == Enum.UserInputType.Touch) then
                local ap = ao.Position - al
                _.Position = UDim2.new(am.X.Scale, am.X.Offset + ap.X,
                                         am.Y.Scale, am.Y.Offset + ap.Y)
            end
        end)
    end

    
    local ak = ag("Frame", {
        Parent = _,
        Size = UDim2.new(0, 150, 1, 0),
        BackgroundColor3 = w.MainColor,
        BorderSizePixel = 0,
    })
    ag("UICorner", { CornerRadius = UDim.new(0, 10), Parent = ak })
    
    ag("Frame", {
        Parent = ak,
        Position = UDim2.new(1, -12, 0, 0),
        Size = UDim2.new(0, 12, 1, 0),
        BackgroundColor3 = w.MainColor,
        BorderSizePixel = 0,
    })

    local al = ag("TextLabel", {
        Parent = ak,
        Size = UDim2.new(1, -20, 0, 36),
        Position = UDim2.fromOffset(20, 18),
        BackgroundTransparency = 1,
        Text = v.Brand,
        Font = Enum.Font.GothamBold,
        TextSize = 22,
        TextColor3 = w.AccentColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local am = ag("Frame", {
        Parent = ak,
        Position = UDim2.fromOffset(0, 70),
        Size = UDim2.new(1, 0, 1, -90),
        BackgroundTransparency = 1,
    })
    local an = ag("UIListLayout", {
        Parent = am,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
    })

    
    local ao = ag("Frame", {
        Parent = _,
        Position = UDim2.new(0, 150, 0, 0),
        Size = UDim2.new(1, -150, 0, 60),
        BackgroundTransparency = 1,
    })

    local ap = ag("Frame", {
        Parent = ao,
        Position = UDim2.fromOffset(20, 16),
        Size = UDim2.new(1, -80, 0, 28),
        BackgroundColor3 = w.MainColor,
        BorderSizePixel = 0,
    })
    ag("UICorner", { CornerRadius = UDim.new(0, 6), Parent = ap })

    local aq = ag("TextLabel", {
        Parent = ap,
        Size = UDim2.fromOffset(28, 28),
        Position = UDim2.fromOffset(2, 0),
        BackgroundTransparency = 1,
        Text = "Q",
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextColor3 = w.FontColor,
    })

    local ar = ag("TextBox", {
        Parent = ap,
        Position = UDim2.fromOffset(30, 0),
        Size = UDim2.new(1, -36, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        PlaceholderText = "Search",
        TextColor3 = w.FontColor,
        PlaceholderColor3 = Color3.fromRGB(120, 130, 140),
        Font = ah(),
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
    })

    
    local as = ag("Frame", {
        Parent = _,
        Position = UDim2.new(0, 150, 0, 60),
        Size = UDim2.new(1, -150, 1, -84),
        BackgroundTransparency = 1,
    })

    
    local at = ag("Frame", {
        Parent = _,
        Position = UDim2.new(0, 150, 1, -24),
        Size = UDim2.new(1, -150, 0, 24),
        BackgroundTransparency = 1,
    })
    ag("TextLabel", {
        Parent = at,
        Size = UDim2.new(1, -30, 1, 0),
        BackgroundTransparency = 1,
        Text = v.SubBrand,
        Font = ah(),
        TextSize = 12,
        TextColor3 = Color3.fromRGB(120, 130, 140),
    })
    local au = ag("TextLabel", {
        Parent = at,
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
        local av, aw, ax
        au.InputBegan:Connect(function(ay)
            if ay.UserInputType == Enum.UserInputType.MouseButton1 or ay.UserInputType == Enum.UserInputType.Touch then
                av = true
                aw = ay.Position
                ax = _.Size
                ay.Changed:Connect(function()
                    if ay.UserInputState == Enum.UserInputState.End then av = false end
                end)
            end
        end)
        f.InputChanged:Connect(function(ay)
            if av and (ay.UserInputType == Enum.UserInputType.MouseMovement or ay.UserInputType == Enum.UserInputType.Touch) then
                local az = ay.Position - aw
                _.Size = UDim2.new(0, math.max(560, ax.X.Offset + az.X), 0, math.max(380, ax.Y.Offset + az.Y))
            end
        end)
    end

    local av = {
        gui = Y, win = _, sidebar = ak, pageList = am,
        content = as, header = ao, searchBox = ar, dragHandle = aj,
        pages = {},   
        active = nil,
        winStroke = ai, resize = au,
    }

    
    table.insert(z, {
        themeUpdate = function()
            _.BackgroundColor3 = w.BgColor
            ai.Color = w.OutlineColor
            ak.BackgroundColor3 = w.MainColor
            for aw, ax in ipairs(ak:GetChildren()) do
                if ax:IsA("Frame") then ax.BackgroundColor3 = w.MainColor end
            end
            al.TextColor3 = w.AccentColor
            al.Font = ah()
            ap.BackgroundColor3 = w.MainColor
            aq.TextColor3 = w.FontColor
            ar.TextColor3 = w.FontColor
            ar.Font = ah()
            aj.TextColor3 = w.FontColor
            au.TextColor3 = w.FontColor
            for aw, ax in pairs(av.pages) do
                if ax.btn then ax.btn.btnRefreshTheme() end
            end
        end
    })

    function av:addPage(aw)
        local ax = ag("TextButton", {
            Parent = am,
            LayoutOrder = #am:GetChildren(),
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundColor3 = w.MainColor,
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false,
        })
        local ay = ag("TextLabel", {
            Parent = ax,
            Size = UDim2.new(1, -30, 1, 0),
            Position = UDim2.fromOffset(20, 0),
            BackgroundTransparency = 1,
            Text = aw,
            Font = ah(),
            TextSize = 13,
            TextColor3 = w.FontColor,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
        local az = ag("Frame", {
            Parent = ax,
            Size = UDim2.new(0, 3, 0.6, 0),
            Position = UDim2.new(0, 0, 0.2, 0),
            BackgroundColor3 = w.AccentColor,
            BorderSizePixel = 0,
            Visible = false,
        })

        function ax.btnRefreshTheme()
            ax.BackgroundColor3 = w.MainColor
            ay.TextColor3 = w.FontColor
            ay.Font = ah()
            az.BackgroundColor3 = w.AccentColor
        end

        local aA = ag("Frame", {
            Parent = as,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Visible = false,
        })

        av.pages[aw] = { btn = ax, frame = aA, label = ay, indicator = az }

        ax.MouseButton1Click:Connect(function() av:selectPage(aw) end)
        if not av.active then av:selectPage(aw) end
        return aA
    end

    function av:selectPage(aw)
        for ax, ay in pairs(av.pages) do
            local az = (ax == aw)
            ay.frame.Visible = az
            ay.indicator.Visible = az
            ay.label.TextColor3 = az and w.AccentColor or w.FontColor
        end
        av.active = aw
    end

    return av
end


function af.newColumn(ai, aj)
    local ak = ag("Frame", {
        Parent = ai,
        Size = UDim2.new(aj or 0.5, -12, 1, -20),
        BackgroundTransparency = 1,
    })
    local al = ag("UIListLayout", {
        Parent = ak,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 8),
    })
    return ak, al
end


function af.newCard(ai, aj)
    aj = aj or {}
    local ak = ag("Frame", {
        Parent = ai,
        LayoutOrder = aj.order or 0,
        Size = UDim2.new(1, 0, 0, aj.height or 200),
        BackgroundColor3 = w.MainColor,
        BorderSizePixel = 0,
    })
    ag("UICorner", { CornerRadius = UDim.new(0, 8), Parent = ak })

    table.insert(z, {
        themeUpdate = function() ak.BackgroundColor3 = w.MainColor end
    })

    local al
    local am = ag("Frame", {
        Parent = ak,
        Size = UDim2.new(1, 0, 1, aj.tabs and -34 or 0),
        Position = UDim2.fromOffset(0, aj.tabs and 34 or 0),
        BackgroundTransparency = 1,
    })

    local an = {}
    if aj.tabs then
        al = ag("Frame", {
            Parent = ak,
            Size = UDim2.new(1, -20, 0, 28),
            Position = UDim2.fromOffset(10, 4),
            BackgroundTransparency = 1,
        })
        local ao = 1 / #aj.tabs
        for ap, aq in ipairs(aj.tabs) do
            local ar = ag("TextButton", {
                Parent = al,
                Size = UDim2.new(ao, -4, 1, 0),
                Position = UDim2.new((ap - 1) * ao, 2, 0, 0),
                BackgroundColor3 = w.BgColor,
                BorderSizePixel = 0,
                Text = aq,
                Font = ah(),
                TextSize = 12,
                TextColor3 = w.FontColor,
                AutoButtonColor = false,
            })
            ag("UICorner", { CornerRadius = UDim.new(0, 6), Parent = ar })

            local as = ag("ScrollingFrame", {
                Parent = am,
                Size = UDim2.new(1, -16, 1, -8),
                Position = UDim2.fromOffset(8, 4),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ScrollBarThickness = 3,
                ScrollBarImageColor3 = w.AccentColor,
                CanvasSize = UDim2.new(0, 0, 0, 0),
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                ScrollingDirection = Enum.ScrollingDirection.Y,
                Visible = (ap == 1),
            })
            ag("UIListLayout", { Parent = as, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6) })
            an[aq] = { btn = ar, frame = as }

            ar.MouseButton1Click:Connect(function()
                for at, au in pairs(an) do
                    au.frame.Visible = (at == aq)
                    au.btn.BackgroundColor3 = (at == aq) and w.AccentColor or w.BgColor
                end
            end)

            if ap == 1 then ar.BackgroundColor3 = w.AccentColor end

            table.insert(z, {
                themeUpdate = function()
                    ar.Font = ah()
                    ar.TextColor3 = w.FontColor
                    if as.Visible then ar.BackgroundColor3 = w.AccentColor else ar.BackgroundColor3 = w.BgColor end
                    as.ScrollBarImageColor3 = w.AccentColor
                end
            })
        end
        return ak, an
    else
        local ao = ag("ScrollingFrame", {
            Parent = am,
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
        ag("UIListLayout", { Parent = ao, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6) })

        if aj.title then
            local ap = ag("TextLabel", {
                Parent = ak,
                Size = UDim2.new(1, -20, 0, 28),
                Position = UDim2.fromOffset(10, 4),
                BackgroundTransparency = 1,
                Text = aj.title,
                Font = Enum.Font.GothamBold,
                TextSize = 13,
                TextColor3 = w.FontColor,
                TextXAlignment = Enum.TextXAlignment.Center,
            })
            am.Position = UDim2.fromOffset(0, 30)
            am.Size = UDim2.new(1, 0, 1, -30)
            table.insert(z, {
                themeUpdate = function() ap.TextColor3 = w.FontColor; ap.Font = Enum.Font.GothamBold end
            })
        end

        return ak, ao
    end
end





function af.label(ai, aj, ak)
    ak = ak or {}
    local al = ag("TextLabel", {
        Parent = ai,
        LayoutOrder = ak.order or 0,
        Size = UDim2.new(1, 0, 0, ak.height or 18),
        BackgroundTransparency = 1,
        Text = aj,
        Font = ah(),
        TextSize = ak.size or 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local am = { instance = al, setText = function(am, an) al.Text = an end }
    function am.themeUpdate() al.TextColor3 = w.FontColor; al.Font = ah() end
    table.insert(z, am)
    return am
end

function af.button(ai, aj, ak)
    local al = ag("TextButton", {
        Parent = ai,
        LayoutOrder = #ai:GetChildren(),
        Size = UDim2.new(1, 0, 0, 28),
        BackgroundColor3 = w.BgColor,
        BorderSizePixel = 0,
        Text = aj,
        Font = ah(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        AutoButtonColor = true,
    })
    ag("UICorner", { CornerRadius = UDim.new(0, 6), Parent = al })
    al.MouseButton1Click:Connect(function() pcall(ak) end)

    local am = { instance = al, label = aj }
    function am.themeUpdate()
        al.BackgroundColor3 = w.BgColor
        al.TextColor3 = w.FontColor
        al.Font = ah()
    end
    table.insert(z, am)
    return am
end

function af.toggle(ai, aj, ak, al)
    local am = ag("Frame", {
        Parent = ai,
        LayoutOrder = #ai:GetChildren(),
        Size = UDim2.new(1, 0, 0, 26),
        BackgroundTransparency = 1,
    })
    local an = ag("TextLabel", {
        Parent = am,
        Size = UDim2.new(1, -50, 1, 0),
        BackgroundTransparency = 1,
        Text = aj,
        Font = ah(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local ao = ag("TextButton", {
        Parent = am,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        Size = UDim2.fromOffset(36, 18),
        BackgroundColor3 = w.BgColor,
        Text = "",
        AutoButtonColor = false,
        BorderSizePixel = 0,
    })
    ag("UICorner", { CornerRadius = UDim.new(1, 0), Parent = ao })
    local ap = ag("Frame", {
        Parent = ao,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 2, 0.5, 0),
        Size = UDim2.fromOffset(14, 14),
        BackgroundColor3 = w.FontColor,
        BorderSizePixel = 0,
    })
    ag("UICorner", { CornerRadius = UDim.new(1, 0), Parent = ap })
local aq=function()        

local aq = w[ak]
        if aq then
            ao.BackgroundColor3 = w.AccentColor
            ap.Position = UDim2.new(1, -16, 0.5, 0)
        else
            ao.BackgroundColor3 = w.BgColor
            ap.Position = UDim2.new(0, 2, 0.5, 0)
        end
        ap.BackgroundColor3 = w.FontColor
end
    
aq()

    ao.MouseButton1Click:Connect(function()
        w[ak] = not w[ak]
        aq()
        if al then pcall(al, w[ak]) end
    end)

    local ar = { instance = am, label = aj, key = ak }
    function ar.themeUpdate() an.TextColor3 = w.FontColor; an.Font = ah(); aq() end
    function ar.refresh() aq() end
    table.insert(z, ar)
    return ar
end

function af.slider(ai, aj, ak, al, am, an, ao)
    an = an or 1
    local ap = ag("Frame", {
        Parent = ai,
        LayoutOrder = #ai:GetChildren(),
        Size = UDim2.new(1, 0, 0, 24),
        BackgroundColor3 = w.BgColor,
        BorderSizePixel = 0,
    })
    ag("UICorner", { CornerRadius = UDim.new(0, 4), Parent = ap })

    local aq = ag("Frame", {
        Parent = ap,
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = w.AccentColor,
        BorderSizePixel = 0,
    })
    ag("UICorner", { CornerRadius = UDim.new(0, 4), Parent = aq })

    local ar = ag("TextLabel", {
        Parent = ap,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        Font = ah(),
        TextSize = 12,
        TextColor3 = w.FontColor,
    })
local as=function()        

local as = tonumber(w[ak]) or al
        as = math.clamp(as, al, am)
        local at = (am == al) and 0 or (as - al) / (am - al)
        aq.Size = UDim2.new(at, 0, 1, 0)
        local au
        if an < 1 then au = string.format("%s: %.2f", aj, as) else au = string.format("%s: %d", aj, math.floor(as + 0.5)) end
        ar.Text = au
end
    
as()

    local at = false
local au=function(au)        
local av = (au - ap.AbsolutePosition.X) / ap.AbsoluteSize.X
        av = math.clamp(av, 0, 1)
        local aw = al + av * (am - al)
        aw = math.floor(aw / an + 0.5) * an
        aw = math.clamp(aw, al, am)
        w[ak] = aw
        as()
        if ao then pcall(ao, aw) end
end
    
ap.InputBegan:Connect(function(av)
        if av.UserInputType == Enum.UserInputType.MouseButton1 or av.UserInputType == Enum.UserInputType.Touch then
            at = true
            au(av.Position.X)
        end
    end)
    ap.InputEnded:Connect(function(av)
        if av.UserInputType == Enum.UserInputType.MouseButton1 or av.UserInputType == Enum.UserInputType.Touch then
            at = false
        end
    end)
    f.InputChanged:Connect(function(av)
        if at and (av.UserInputType == Enum.UserInputType.MouseMovement or av.UserInputType == Enum.UserInputType.Touch) then
            au(av.Position.X)
        end
    end)

    local av = { instance = ap, label = aj, key = ak }
    function av.themeUpdate()
        ap.BackgroundColor3 = w.BgColor
        aq.BackgroundColor3 = w.AccentColor
        ar.TextColor3 = w.FontColor
        ar.Font = ah()
    end
    function av.refresh() as() end
    table.insert(z, av)
    return av
end

function af.dropdown(ai, aj, ak, al, am)
    local an = ag("Frame", {
        Parent = ai,
        LayoutOrder = #ai:GetChildren(),
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundTransparency = 1,
    })
    local ao = ag("TextLabel", {
        Parent = an,
        Size = UDim2.new(1, 0, 0, 16),
        BackgroundTransparency = 1,
        Text = aj,
        Font = ah(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local ap = ag("TextButton", {
        Parent = an,
        Position = UDim2.fromOffset(0, 18),
        Size = UDim2.new(1, 0, 0, 24),
        BackgroundColor3 = w.BgColor,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
    })
    ag("UICorner", { CornerRadius = UDim.new(0, 4), Parent = ap })
    local aq = ag("TextLabel", {
        Parent = ap,
        Size = UDim2.new(1, -24, 1, 0),
        Position = UDim2.fromOffset(8, 0),
        BackgroundTransparency = 1,
        Text = tostring(w[ak] or "---"),
        Font = ah(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local ar = ag("TextLabel", {
        Parent = ap,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -8, 0.5, 0),
        Size = UDim2.fromOffset(12, 12),
        BackgroundTransparency = 1,
        Text = "v",
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextColor3 = w.FontColor,
    })

    
    local as
local at=function()        
if as then as:Destroy(); as = nil; return end
        local at = an:FindFirstAncestorOfClass("ScreenGui")
        if not at then return end
        as = ag("Frame", {
            Parent = at,
            BackgroundColor3 = w.MainColor,
            BorderSizePixel = 0,
            ZIndex = 50,
        })
        ag("UICorner", { CornerRadius = UDim.new(0, 4), Parent = as })
        ag("UIStroke", { Color = w.OutlineColor, Transparency = 0.5, Parent = as })

        local au = ap.AbsolutePosition
        local av = ap.AbsoluteSize
        local aw = math.min(160, #al * 22 + 4)
        as.Position = UDim2.fromOffset(au.X, au.Y + av.Y + 2)
        as.Size = UDim2.fromOffset(av.X, aw)

        local ax = ag("ScrollingFrame", {
            Parent = as,
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
        ag("UIListLayout", { Parent = ax, SortOrder = Enum.SortOrder.LayoutOrder })

        for ay, az in ipairs(al) do
            local aA = ag("TextButton", {
                Parent = ax,
                Size = UDim2.new(1, 0, 0, 22),
                BackgroundColor3 = w.BgColor,
                BorderSizePixel = 0,
                Text = tostring(az),
                Font = ah(),
                TextSize = 12,
                TextColor3 = w.FontColor,
                AutoButtonColor = true,
                ZIndex = 52,
            })
            aA.MouseButton1Click:Connect(function()
                w[ak] = az
                aq.Text = tostring(az)
                if as then as:Destroy(); as = nil end
                if am then pcall(am, az) end
            end)
        end
end
    
ap.MouseButton1Click:Connect(at)

    local au = { instance = an, label = aj, key = ak, options = al }
    function au.setOptions(av, aw)
        al = aw or {}
        au.options = al
        if as then as:Destroy(); as = nil end
    end
    function au.themeUpdate()
        ao.TextColor3 = w.FontColor; ao.Font = ah()
        ap.BackgroundColor3 = w.BgColor
        aq.TextColor3 = w.FontColor; aq.Font = ah()
        ar.TextColor3 = w.FontColor
    end
    function au.refresh() aq.Text = tostring(w[ak] or "---") end
    table.insert(z, au)
    return au
end

function af.multiDropdown(ai, aj, ak, al, am)
    
    local an = ag("Frame", {
        Parent = ai,
        LayoutOrder = #ai:GetChildren(),
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundTransparency = 1,
    })
    local ao = ag("TextLabel", {
        Parent = an,
        Size = UDim2.new(1, 0, 0, 16),
        BackgroundTransparency = 1,
        Text = aj,
        Font = ah(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local ap = ag("TextButton", {
        Parent = an,
        Position = UDim2.fromOffset(0, 18),
        Size = UDim2.new(1, 0, 0, 24),
        BackgroundColor3 = w.BgColor,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
    })
    ag("UICorner", { CornerRadius = UDim.new(0, 4), Parent = ap })
    local aq = ag("TextLabel", {
        Parent = ap,
        Size = UDim2.new(1, -24, 1, 0),
        Position = UDim2.fromOffset(8, 0),
        BackgroundTransparency = 1,
        Text = "",
        Font = ah(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local ar = ag("TextLabel", {
        Parent = ap,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -8, 0.5, 0),
        Size = UDim2.fromOffset(12, 12),
        BackgroundTransparency = 1,
        Text = "v",
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextColor3 = w.FontColor,
    })
local as=function()        

local as = w[ak] or {}
        aq.Text = (#as > 0) and table.concat(as, ", ") or "---"
end    
as()

    local at
local au=function()        
if at then at:Destroy(); at = nil; return end
        local au = an:FindFirstAncestorOfClass("ScreenGui")
        if not au then return end
        at = ag("Frame", {
            Parent = au,
            BackgroundColor3 = w.MainColor,
            BorderSizePixel = 0,
            ZIndex = 50,
        })
        ag("UICorner", { CornerRadius = UDim.new(0, 4), Parent = at })
        ag("UIStroke", { Color = w.OutlineColor, Transparency = 0.5, Parent = at })

        local av = ap.AbsolutePosition
        local aw = ap.AbsoluteSize
        local ax = math.min(220, #al * 24 + 4)
        at.Position = UDim2.fromOffset(av.X, av.Y + aw.Y + 2)
        at.Size = UDim2.fromOffset(aw.X, ax)

        local ay = ag("ScrollingFrame", {
            Parent = at,
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
        ag("UIListLayout", { Parent = ay, SortOrder = Enum.SortOrder.LayoutOrder })

        for az, aA in ipairs(al) do
            local X = ag("Frame", {
                Parent = ay,
                Size = UDim2.new(1, 0, 0, 24),
                BackgroundColor3 = w.BgColor,
                BorderSizePixel = 0,
                ZIndex = 52,
            })
            local Y = ag("TextLabel", {
                Parent = X,
                Size = UDim2.fromOffset(20, 24),
                BackgroundTransparency = 1,
                Text = C.contains(w[ak] or {}, aA) and "[X]" or "[ ]",
                Font = Enum.Font.GothamBold,
                TextSize = 11,
                TextColor3 = w.AccentColor,
                TextXAlignment = Enum.TextXAlignment.Center,
                ZIndex = 53,
            })
            local Z = ag("TextLabel", {
                Parent = X,
                Position = UDim2.fromOffset(24, 0),
                Size = UDim2.new(1, -24, 1, 0),
                BackgroundTransparency = 1,
                Text = tostring(aA),
                Font = ah(),
                TextSize = 12,
                TextColor3 = w.FontColor,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 53,
            })
            local _ = ag("TextButton", {
                Parent = X,
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text = "",
                AutoButtonColor = false,
                ZIndex = 54,
            })
            _.MouseButton1Click:Connect(function()
                w[ak] = w[ak] or {}
                local aB = w[ak]
                local aC
                for aD, aE in ipairs(aB) do if aE == aA then aC = aD break end end
                if aC then table.remove(aB, aC) else table.insert(aB, aA) end
                Y.Text = C.contains(aB, aA) and "[X]" or "[ ]"
                as()
                if am then pcall(am, aB) end
            end)
        end
end
    
ap.MouseButton1Click:Connect(au)

    local av = { instance = an, label = aj, key = ak, options = al }
    function av.themeUpdate()
        ao.TextColor3 = w.FontColor; ao.Font = ah()
        ap.BackgroundColor3 = w.BgColor
        aq.TextColor3 = w.FontColor; aq.Font = ah()
        ar.TextColor3 = w.FontColor
    end
    function av.refresh() as() end
    table.insert(z, av)
    return av
end

function af.colorPicker(ai, aj, ak, al)
    local am = ag("Frame", {
        Parent = ai,
        LayoutOrder = #ai:GetChildren(),
        Size = UDim2.new(1, 0, 0, 26),
        BackgroundTransparency = 1,
    })
    local an = ag("TextLabel", {
        Parent = am,
        Size = UDim2.new(1, -40, 1, 0),
        BackgroundTransparency = 1,
        Text = aj,
        Font = ah(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local ao = ag("TextButton", {
        Parent = am,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        Size = UDim2.fromOffset(28, 18),
        BackgroundColor3 = w[ak] or Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Text = "",
    })
    ag("UICorner", { CornerRadius = UDim.new(0, 3), Parent = ao })
    ag("UIStroke", { Color = w.OutlineColor, Transparency = 0.5, Parent = ao })

    local ap
local aq=function()        
ao.BackgroundColor3 = w[ak] or Color3.new(1, 1, 1)
end local ar=function()        


if ap then ap:Destroy(); ap = nil; return end
        local ar = am:FindFirstAncestorOfClass("ScreenGui")
        if not ar then return end
        ap = ag("Frame", {
            Parent = ar,
            BackgroundColor3 = w.MainColor,
            BorderSizePixel = 0,
            ZIndex = 50,
        })
        ag("UICorner", { CornerRadius = UDim.new(0, 6), Parent = ap })
        ag("UIStroke", { Color = w.OutlineColor, Transparency = 0.5, Parent = ap })

        local as = ao.AbsolutePosition
        ap.Position = UDim2.fromOffset(as.X - 160, as.Y + 24)
        ap.Size = UDim2.fromOffset(190, 130)
local at=function(
at, au, av)            
local aw = ag("Frame", {
                Parent = ap,
                Position = UDim2.fromOffset(36, av),
                Size = UDim2.fromOffset(140, 16),
                BackgroundColor3 = w.BgColor,
                BorderSizePixel = 0,
                ZIndex = 51,
            })
            ag("UICorner", { CornerRadius = UDim.new(0, 3), Parent = aw })
            local ax = ag("Frame", {
                Parent = aw,
                Size = UDim2.new((w[ak][au] or 1), 0, 1, 0),
                BackgroundColor3 = au == "R" and Color3.fromRGB(220, 38, 38)
                                or au == "G" and Color3.fromRGB(34, 197, 94)
                                or                    Color3.fromRGB(59, 130, 246),
                BorderSizePixel = 0,
                ZIndex = 52,
            })
            ag("UICorner", { CornerRadius = UDim.new(0, 3), Parent = ax })
            local ay = ag("TextLabel", {
                Parent = ap,
                Position = UDim2.fromOffset(8, av),
                Size = UDim2.fromOffset(24, 16),
                BackgroundTransparency = 1,
                Text = at,
                Font = Enum.Font.GothamBold,
                TextSize = 12,
                TextColor3 = w.FontColor,
                ZIndex = 51,
            })
            local az = ag("TextLabel", {
                Parent = ap,
                Position = UDim2.fromOffset(178, av),
                Size = UDim2.fromOffset(0, 16),
                BackgroundTransparency = 1,
                Text = "",
                Font = ah(),
                TextSize = 11,
                TextColor3 = w.FontColor,
                ZIndex = 51,
            })
local aA=function(aA)                
aA = math.clamp(aA, 0, 1)
                local aB = w[ak]
                local aC, aD, aE = aB.R, aB.G, aB.B
                if au == "R" then aC = aA end
                if au == "G" then aD = aA end
                if au == "B" then aE = aA end
                w[ak] = Color3.new(aC, aD, aE)
                ax.Size = UDim2.new(aA, 0, 1, 0)
                az.Text = tostring(math.floor(aA * 255 + 0.5))
                aq()
                if al then pcall(al, w[ak]) end
end            
az.Text = tostring(math.floor((w[ak][au] or 0) * 255 + 0.5))

            local aB
            aw.InputBegan:Connect(function(aC)
                if aC.UserInputType == Enum.UserInputType.MouseButton1 or aC.UserInputType == Enum.UserInputType.Touch then
                    aB = true
                    aA((aC.Position.X - aw.AbsolutePosition.X) / aw.AbsoluteSize.X)
                end
            end)
            aw.InputEnded:Connect(function(aC)
                if aC.UserInputType == Enum.UserInputType.MouseButton1 or aC.UserInputType == Enum.UserInputType.Touch then
                    aB = false
                end
            end)
            f.InputChanged:Connect(function(aC)
                if aB and (aC.UserInputType == Enum.UserInputType.MouseMovement or aC.UserInputType == Enum.UserInputType.Touch) then
                    aA((aC.Position.X - aw.AbsolutePosition.X) / aw.AbsoluteSize.X)
                end
            end)
end
        
at("R", "R", 10)
        at("G", "G", 36)
        at("B", "B", 62)

        local au = ag("TextButton", {
            Parent = ap,
            Position = UDim2.fromOffset(36, 92),
            Size = UDim2.fromOffset(140, 24),
            BackgroundColor3 = w.AccentColor,
            BorderSizePixel = 0,
            Text = "Done",
            Font = ah(),
            TextSize = 12,
            TextColor3 = w.FontColor,
            AutoButtonColor = true,
            ZIndex = 51,
        })
        ag("UICorner", { CornerRadius = UDim.new(0, 4), Parent = au })
        au.MouseButton1Click:Connect(function()
            if ap then ap:Destroy(); ap = nil end
        end)
end
    
ao.MouseButton1Click:Connect(ar)

    local as = { instance = am, label = aj, key = ak }
    function as.themeUpdate()
        an.TextColor3 = w.FontColor; an.Font = ah()
        aq()
    end
    function as.refresh() aq() end
    table.insert(z, as)
    return as
end

function af.textInput(ai, aj, ak, al, am)
    local an = ag("Frame", {
        Parent = ai,
        LayoutOrder = #ai:GetChildren(),
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundTransparency = 1,
    })
    local ao = ag("TextLabel", {
        Parent = an,
        Size = UDim2.new(1, 0, 0, 16),
        BackgroundTransparency = 1,
        Text = aj,
        Font = ah(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local ap = ag("TextBox", {
        Parent = an,
        Position = UDim2.fromOffset(0, 18),
        Size = UDim2.new(1, 0, 0, 24),
        BackgroundColor3 = w.BgColor,
        BorderSizePixel = 0,
        Text = tostring(w[ak] or ""),
        PlaceholderText = al or "",
        Font = ah(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        PlaceholderColor3 = Color3.fromRGB(120, 130, 140),
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
    })
    ag("UICorner", { CornerRadius = UDim.new(0, 4), Parent = ap })
    local aq = ag("UIPadding", { Parent = ap, PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8) })

    ap.FocusLost:Connect(function()
        w[ak] = ap.Text
        if am then pcall(am, ap.Text) end
    end)

    local ar = { instance = an, label = aj, key = ak }
    function ar.themeUpdate()
        ao.TextColor3 = w.FontColor; ao.Font = ah()
        ap.BackgroundColor3 = w.BgColor
        ap.TextColor3 = w.FontColor
        ap.Font = ah()
    end
    function ar.refresh() ap.Text = tostring(w[ak] or "") end
    table.insert(z, ar)
    return ar
end

function af.keybind(ai, aj, ak, al)
    local am = ag("Frame", {
        Parent = ai,
        LayoutOrder = #ai:GetChildren(),
        Size = UDim2.new(1, 0, 0, 26),
        BackgroundTransparency = 1,
    })
    local an = ag("TextLabel", {
        Parent = am,
        Size = UDim2.new(1, -100, 1, 0),
        BackgroundTransparency = 1,
        Text = aj,
        Font = ah(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local ao = ag("TextButton", {
        Parent = am,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        Size = UDim2.fromOffset(96, 22),
        BackgroundColor3 = w.BgColor,
        BorderSizePixel = 0,
        Text = tostring(w[ak] or "None"),
        Font = ah(),
        TextSize = 12,
        TextColor3 = w.FontColor,
        AutoButtonColor = true,
    })
    ag("UICorner", { CornerRadius = UDim.new(0, 4), Parent = ao })

    local ap = false
    ao.MouseButton1Click:Connect(function()
        ap = true
        ao.Text = "..."
    end)
    f.InputBegan:Connect(function(aq, ar)
        if not ap then return end
        if aq.UserInputType ~= Enum.UserInputType.Keyboard then return end
        ap = false
        local as = aq.KeyCode.Name
        w[ak] = as
        ao.Text = as
        if al then pcall(al, as) end
    end)

    local aq = { instance = am, label = aj, key = ak }
    function aq.themeUpdate()
        an.TextColor3 = w.FontColor; an.Font = ah()
        ao.BackgroundColor3 = w.BgColor
        ao.TextColor3 = w.FontColor; ao.Font = ah()
    end
    function aq.refresh() ao.Text = tostring(w[ak] or "None") end
    table.insert(z, aq)
    return aq
end
local ai=function()    




w.Alive = false
    w.Autofarm = false
    w.Fly = false
    w.AutoAttack = false
    w.AutoAttackNearby = false
    w.AutoTPToPlayer = false

    N.disable()
    M.clearAll()
    C.disconnectAll()
    if p.CameraType == Enum.CameraType.Scriptable then
        pcall(function() p.CameraType = Enum.CameraType.Custom end)
    end

    local ai = F.humanoid()
    if ai then pcall(function() ai.WalkSpeed = v.DefaultWS; ai.JumpPower = v.DefaultJP end) end
    local aj = F.root()
    if aj then pcall(function() aj.Anchored = false end) end
local ak=function(

ak)        
if not ak then return end
        for al, am in ipairs(ak:GetChildren()) do
            if am:IsA("ScreenGui") and (am.Name:sub(1, 6) == "_NHJB_" or am.Name:sub(1, 9) == "_NHJB_NF_") then
                pcall(function() am:Destroy() end)
            end
        end
end    
ak(m)
    if q then ak(q:FindFirstChild("PlayerGui")) end
    _G._NHJB_NotifyGui = nil

    getgenv()._NameHubJB_Alive  = false
    getgenv()._NameHubJB_Unload = nil
end




local aj = af.newWindow({ width = 760, height = 520 })
local ak, al, am, an
local ao, ap, aq, ar


local as = aj:addPage("Main")

local at  = af.newColumn(as, 0.5)
at.Position = UDim2.fromOffset(8, 8)

local au = af.newColumn(as, 0.5)
au.Position = UDim2.new(0.5, 4, 0, 8)


local av, aw = af.newCard(at, { tabs = { "Main", "ESP" }, height = 360 })

do
    local ax = aw["Main"].frame
    af.toggle(ax, "Autofarm", "Autofarm", function(ay)
        if ay then
            w.StartTime = w.StartTime or os.time()
            w.StatsCounting = true
            K.start()
        else
            F.applySpeed()
        end
    end)
    af.dropdown(ax, "Farm Targets", "FarmTarget", v.FarmTargetOptions, function(ay)
        
        if #w.FarmPriority == 0 then w.FarmPriority = { ay } end
    end)
    af.multiDropdown(ax, "Farm Priority List", "FarmPriority", v.FarmTargetOptions)
    af.slider(ax, "Speed", "Speed", 16, 200, 1, function() F.applySpeed() end)
    af.dropdown(ax, "Autofarm Dino", "AutofarmDino", v.DinoOptions, function(ay)
        local az = G.remoteByKeywords(v.DinoChangeKeywords)
        if az then
            pcall(function()
                if az:IsA("RemoteEvent") then az:FireServer(ay) else az:InvokeServer(ay) end
            end)
        end
    end)

    local ay = af.label(ax, "Coins Gained: 0")
    local az  = af.label(ax, "Rate: N/A")
    local aA = af.label(ax, "Time Elapsed: N/A")
    ak, am, al = ay, az, aA

    af.button(ax, "Start Counting Stats", function()
        w.CoinsGained = 0
        w.StartTime = os.time()
        w.StatsCounting = true
        E.send("Stats counter started.")
    end)
end

do
    local ax = aw["ESP"].frame
    af.toggle(ax, "Goat ESP", "GoatESP", function(ay)
        if ay then M.start() end
    end)
    af.colorPicker(ax, "Goat ESP Color", "GoatESPColor")
    af.toggle(ax, "Amber ESP", "AmberESP", function(ay)
        if ay then M.start() end
    end)
    af.colorPicker(ax, "Amber ESP Color", "AmberESPColor")
    af.toggle(ax, "No Prompt Delay", "NoPromptDelay")
    af.slider(ax, "Outline Transparency", "OutlineTransparency", 0, 1, 0.05, function() M.refresh() end)
    af.slider(ax, "Fill Transparency", "FillTransparency", 0, 1, 0.05, function() M.refresh() end)
end


local ax, ay = af.newCard(au, { tabs = { "Player", "Combat" }, height = 360 })

do
    local az = ay["Player"].frame
    af.toggle(az, "Fly", "Fly", function(aA)
        if aA then N.enable() else N.disable() end
    end)
    af.slider(az, "Fly Speed", "FlySpeed", 10, 300, 1)
    af.button(az, "Respawn", function() R.respawn() end)
    af.button(az, "Menu", function() R.openMenu() end)
    af.slider(az, "Respawn Delay", "RespawnDelay", 0, 30, 1)
    af.toggle(az, "Auto Respawn", "AutoRespawn")
    af.toggle(az, "Anchored", "Anchored", function() F.applyAnchor() end)
end

do
    local az = ay["Combat"].frame
    af.slider(az, "Offset (X-axis)", "OffsetX", -20, 20, 1)
    af.slider(az, "Offset (Y-axis)", "OffsetY", -20, 20, 1)
    af.slider(az, "Range", "Range", 5, 200, 1)
    af.slider(az, "Max Target HP", "MaxTargetHP", 0, 5000, 10)
    af.slider(az, "Min Target HP", "MinTargetHP", 0, 5000, 10)
    af.slider(az, "Disengage At", "DisengageAt", 0, 1000, 10)
    af.toggle(az, "Target POV", "TargetPOV")
    af.toggle(az, "Auto Attack Nearby Player", "AutoAttackNearby")
    af.toggle(az, "Auto Attack", "AutoAttack")
    af.toggle(az, "Auto TP to Player", "AutoTPToPlayer")
local aA=function()        


local aA = { "" }
        for aB, aC in ipairs(d:GetPlayers()) do
            if aC ~= q then aA[#aA + 1] = aC.Name end
        end
        return aA
end    
ar = af.dropdown(az, "Target Player", "TargetPlayer", aA())
    
    C.conn("tp_player_add", d.PlayerAdded:Connect(function() ar:setOptions(aA()) end))
    C.conn("tp_player_rem", d.PlayerRemoving:Connect(function() ar:setOptions(aA()) end))
end


local az = aj:addPage("Teleport")
local aA  = af.newColumn(az, 0.5)
aA.Position = UDim2.fromOffset(8, 8)
local aB, aC = af.newCard(aA, { title = "Server Hop", height = 460 })

do
    af.button(aC, "Join selected server", function()
        if w.SelectedJobId ~= "" then S.joinJobId(w.SelectedJobId) end
    end)
    af.button(aC, "Refresh Server List", function()
        E.send("Fetching servers...")
        C.spawn(function()
            local aD = S.fetchServers()
            w.ServerListCache = aD
            local aE = {}
            for X, Y in ipairs(aD) do aE[#aE + 1] = ("%s  (%d/%d)"):format(Y.id:sub(1, 8), Y.playing, Y.max) end
            if #aE == 0 then aE = { "(no servers)" } end
            ao:setOptions(aE)
            E.send(("Fetched %d servers"):format(#aD))
        end)
    end)
    ao = af.dropdown(aC, "Server List", "SelectedJobId", { "---" }, function(aD)
        for aE, X in ipairs(w.ServerListCache or {}) do
            if aD:sub(1, 8) == X.id:sub(1, 8) then w.SelectedJobId = X.id; return end
        end
    end)
    af.button(aC, "Get PlayerCount", function()
        for aD, aE in ipairs(w.ServerListCache or {}) do
            if aE.id == w.SelectedJobId then
                E.send(("Server %s: %d/%d players"):format(aE.id:sub(1,8), aE.playing, aE.max))
                return
            end
        end
        E.send("Refresh server list first.")
    end)
    af.button(aC, "Copy JobId", function()
        pcall(setclipboard, w.SelectedJobId)
        E.send("Copied JobId.")
    end)
    af.button(aC, "Join Selected JobId", function()
        S.joinJobId(w.SelectedJobId)
    end)
    af.textInput(aC, "JobId", "SelectedJobId", "Enter JobId here")
    af.button(aC, "Rejoin Server", function() S.rejoin() end)
    af.button(aC, "Server Hop", function() S.randomHop() end)
    af.slider(aC, "Hop On Player Count", "HopOnPlayerCount", 0, 30, 1)
    af.toggle(aC, "Hop On Friend Detection", "HopOnFriend")
end


local aD = aj:addPage("Safety")
local aE = af.newColumn(aD, 0.5)
aE.Position = UDim2.fromOffset(8, 8)
local X, Y = af.newCard(aE, { title = "Admin Detection", height = 80 })
af.toggle(Y, "Kick On Detection", "KickOnAdmin")


local Z = aj:addPage("Webhook")
local _  = af.newColumn(Z, 0.5)
_.Position = UDim2.fromOffset(8, 8)
local aF, aG = af.newCard(_, { title = "Webhook", height = 280 })
do
    af.textInput(aG, "Webhook Link", "WebhookLink", "https://discord.com/api/webhooks/...")
    af.slider(aG, "Webhook Interval (minutes)", "WebhookInterval", 1, 60, 1)
    af.slider(aG, "Timezone (UTC offset)", "WebhookTimezone", -12, 12, 1)
    af.colorPicker(aG, "Embed Color", "WebhookColor")
    af.toggle(aG, "Anonymous Mode", "WebhookAnonymous")
    af.button(aG, "Force Send Webhook Request", function() U.send(true) end)
end


local aH = aj:addPage("Settings")

local aI  = af.newColumn(aH, 0.5)
aI.Position = UDim2.fromOffset(8, 8)
local aJ = af.newColumn(aH, 0.5)
aJ.Position = UDim2.new(0.5, 4, 0, 8)

local aK, aL = af.newCard(aI, { title = "Themes", height = 280 })
do
    af.colorPicker(aL, "Background color", "BgColor",   function() ab.apply() end)
    af.colorPicker(aL, "Main color",        "MainColor", function() ab.apply() end)
    af.colorPicker(aL, "Accent color",      "AccentColor", function() ab.apply() end)
    af.colorPicker(aL, "Outline color",     "OutlineColor", function() ab.apply() end)
    af.colorPicker(aL, "Font color",        "FontColor", function() ab.apply() end)
    af.dropdown(aL, "Font Face", "FontFace", v.FontOptions, function() ab.apply() end)
    aq = af.dropdown(aL, "Theme list", "Theme", ab.listNames())
    af.button(aL, "Load theme", function() ab.load(w.Theme) end)
    af.button(aL, "Overwrite theme", function()
        if ab.saveCurrent(w.Theme) then E.send("Saved theme: " .. w.Theme) end
    end)
end

local aM, aN = af.newCard(aJ, { title = "Configuration", height = 320 })
do
    af.textInput(aN, "Config name", "_cfgName", "name")
    af.button(aN, "Create config", function() ac.save(w._cfgName or "") end)
    ap = af.dropdown(aN, "Config list", "_cfgPicked", ac.list())
    af.button(aN, "Refresh list", function() ap:setOptions(ac.list()) end)
    af.button(aN, "Load config",      function() ac.load(w._cfgPicked or "") end)
    af.button(aN, "Overwrite config", function() ac.save(w._cfgPicked or "") end)
    af.button(aN, "Delete config",    function()
        ac.delete(w._cfgPicked or "")
        ap:setOptions(ac.list())
    end)
    af.button(aN, "Set autoload",   function()
        if w._cfgPicked and w._cfgPicked ~= "" then
            ac.setAutoload(w._cfgPicked)
            if an then an:setText("Current autoload config: " .. w.AutoloadConfig) end
            E.send("Autoload set: " .. w.AutoloadConfig)
        end
    end)
    af.button(aN, "Reset autoload", function()
        ac.resetAutoload()
        if an then an:setText("Current autoload config: none") end
    end)
    an = af.label(aN,
        "Current autoload config: " .. (ac.getAutoload() ~= "" and ac.getAutoload() or "none"))
    af.textInput(aN, "Import Data", "_importData", "paste exported config here")
    af.button(aN, "Export config", function()
        local aO = ac.exportCurrent()
        pcall(setclipboard, aO)
        E.send("Exported to clipboard.")
    end)
    af.button(aN, "Import config", function() ac.importString(w._importData or "") end)
end

local aO, aP = af.newCard(aI, { title = "Menu", height = 110 })
do
    af.keybind(aP, "Menu bind", "MenuBind")
    af.toggle(aP, "Autoexecute", "Autoexecute", function(aQ)
        if aQ then
            
            local aR = 'pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/kyronshaw912-collab/NameHub/main/loader.lua"))() end)'
            local aS = { "autoexec/", "auto_exec/", "autoexecute/" }
            local aT
            for aU, aV in ipairs(aS) do
                local aW = pcall(b.writefile, aV .. "NameHubJB_loader.lua", aR)
                if aW then aT = aV; break end
            end
            if aT then E.send("Autoexec written: " .. aT) else E.send("Autoexec unsupported by executor.") end
        end
    end)
    af.dropdown(aP, "Notification Side", "NotificationSide", v.NotifySides)
end




aj.searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local aQ = aj.searchBox.Text:lower()
    for aR, aS in pairs(z) do
        if aS.instance and aS.label and aS.instance.Parent then
            local aT = (aQ == "") or aS.label:lower():find(aQ, 1, true)
            aS.instance.Visible = aT and true or false
        end
    end
end)




C.conn("ui_toggle", f.InputBegan:Connect(function(aQ, aR)
    if aR then return end
    if aQ.UserInputType ~= Enum.UserInputType.Keyboard then return end
    if aQ.KeyCode.Name == w.MenuBind then
        w.UIVisible = not w.UIVisible
        aj.win.Visible = w.UIVisible
    end
end))




C.conn("stats_tick", e.Heartbeat:Connect(function()
    if not w.Alive then return end
    if ak then ak:setText("Coins Gained: " .. tostring(w.CoinsGained)) end
    if w.StartTime and w.StatsCounting then
        local aQ = os.time() - w.StartTime
        if al  then al:setText("Time Elapsed: " .. C.fmtTime(aQ)) end
        if am then
            local aR = aQ > 0 and (w.CoinsGained / (aQ / 60)) or 0
            am:setText(("Rate: %.1f/min"):format(aR))
        end
    else
        if al  then al:setText("Time Elapsed: N/A") end
        if am then am:setText("Rate: N/A") end
    end
end))




C.conn("charadded", q.CharacterAdded:Connect(function()
    task.wait(0.2)
    if w.Fly then N.enable() end
    F.applySpeed()
    F.applyAnchor()
end))




getgenv()._NameHubJB_Alive  = true
getgenv()._NameHubJB_Unload = ai

aa()
R.attachAutoRespawn()
S.attachWatchers()
T.attach()
U.attachInterval()
L.start()


do
    local aQ = ac.getAutoload()
    if aQ ~= "" then
        w.AutoloadConfig = aQ
        ac.load(aQ)
        if an then an:setText("Current autoload config: " .. aQ) end
    end
end

ab.apply()
E.send(v.Brand .. " " .. v.SubBrand .. " " .. a .. " loaded.", 4)

return true
