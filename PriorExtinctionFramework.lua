

















if not game:IsLoaded() then game.Loaded:Wait() end

local a = "v0.1.0 NameHub (pe-initial-20260529)"







local b = {
    [6698800091] = "Prior Extinction",
    [5558588689] = "Prior Extinction - Retro",
    [8603641600] = "Cretaceous Archipelago",
}

if not b[game.PlaceId] then
    warn(("[NameHub] This script is for Prior Extinction. Current PlaceId %d is not supported."):format(game.PlaceId))
    return
end




local c            = game:GetService("Players")
local d         = game:GetService("RunService")
local e   = game:GetService("UserInputService")
local f       = game:GetService("TweenService")
local g          = game:GetService("Workspace")
local h  = game:GetService("ReplicatedStorage")
local i         = game:GetService("StarterGui")
local j        = game:GetService("VirtualUser")
local k        = game:GetService("HttpService")
local l            = game:GetService("CoreGui")
local m           = game:GetService("Lighting")

local n        = c.LocalPlayer
local o             = g.CurrentCamera







local p = setclipboard or (toclipboard) or function(p) end
local q  = (rawget and rawget(getfenv(), "mouse1press"))  or _G.mouse1press
local r= (rawget and rawget(getfenv(), "mouse1release")) or _G.mouse1release




local s = {}

local t = {}

function t.safe(u, v)
    return function(...)
        local w, x = pcall(u, ...)
        if not w then
            warn(("[NameHub][%s] %s"):format(v or "?", tostring(x)))
        end
        return w
    end
end

function t.spawn(u, v)
    return task.spawn(t.safe(u, v or "spawn"))
end

function t.conn(u, v)
    if s[u] and s[u].Connected then s[u]:Disconnect() end
    s[u] = v
    return v
end

function t.disconnect(u)
    if s[u] and s[u].Connected then s[u]:Disconnect() end
    s[u] = nil
end

function t.distance(u, v)
    if not u or not v then return math.huge end
    local w = u.Position or u
    local x = v.Position or v
    return (w - x).Magnitude
end






local u = {
    
    Autofarm           = false,
    FarmTarget         = "Compsognathus",
    FarmRadius         = 5000,           
    Range              = 12,              
    AutofarmMovement   = "Fly",          
    StopDistance       = 6,
    Speed              = 16,
    FlySpeed           = 120,
    AttackInterval     = 0.35,            
    UseM1Click         = true,            
    AimAtTarget        = true,            
    SkipPlayers        = true,            
    MinTargetHP        = 1,
    MaxTargetHP        = 0,               
    DisengageAt        = 0,               
    AutoEat            = true,
    EatInterval        = 4,

    
    _FarmStatus        = "Idle",
    _LastTarget        = "",
    _LastDistance      = 0,
    _AttackRemote      = "",
    _LastFire          = "",
    _TargetsFound      = 0,
    _LoopPhase         = "(never started)",
    _LoopTick          = 0,

    
    Alive              = true,
    StartTime          = nil,
    KillsCounted       = 0,
    StatsCounting      = false,
}

local v = {
    Brand = "NameHub",
    
    
    
    FarmTargetOptions = {
        "Compsognathus",
        "Dryosaurus",
        "Tenontosaurus",
        "Pachycephalosaurus",
        "Iguanodon",
        "Megaraptor",
        "Allosaurus",
        "Tyrannosaurus",
        "Triceratops",
        "Stegosaurus",
        "Apatosaurus",
        "All AI",
    },
    MovementOptions = { "Teleport", "Fly", "Walk" },
    
    
    AttackKeywords = {
        "bite", "attack", "hit", "damage", "claw", "swing", "combat", "lunge",
    },
    EatKeywords = {
        "eat", "consume", "carcass", "feed",
    },
}




local w = {}

function w.get()
    return n and n.Character
end

function w.root()
    local x = w.get()
    return x and (x:FindFirstChild("HumanoidRootPart") or x.PrimaryPart)
end

function w.humanoid()
    local x = w.get()
    return x and x:FindFirstChildOfClass("Humanoid")
end

function w.applySpeed()
    local x = w.humanoid()
    if x then x.WalkSpeed = u.Speed end
end







local x = {}

local function _walk(y, z, A)
    A = A or {}
    if not y or A[y] then return end
    A[y] = true
    local B, C = pcall(function() return y:GetChildren() end)
    if not B or not C then return end
    for D, E in ipairs(C) do
        z(E)
        _walk(E, z, A)
    end
end
local y=function()    

local y = { h }
    pcall(function()
        if n then
            if n.Character then y[#y + 1] = n.Character end
            local z = n:FindFirstChild("PlayerScripts")
            if z then y[#y + 1] = z end
        end
    end)
    y[#y + 1] = g
    return y
end

function x.remoteByName(z)
    if not z or z == "" then return nil end
    local A
    for B, C in ipairs(y()) do
        if A then break end
        _walk(C, function(D)
            if A then return end
            if (D:IsA("RemoteEvent") or D:IsA("RemoteFunction")) and D.Name == z then
                A = D
            end
        end)
    end
    return A
end

function x.remoteByKeywords(z)
    for A, B in ipairs(z or {}) do
        local C = B:lower()
        local D
        for E, F in ipairs(y()) do
            if D then break end
            _walk(F, function(G)
                if D then return end
                if G:IsA("RemoteEvent") or G:IsA("RemoteFunction") then
                    if G.Name:lower():find(C, 1, true) then D = G end
                end
            end)
        end
        if D then return D, B end
    end
    return nil, nil
end

function x.allRemotes(z)
    z = z or 300
    local A = {}
    local B = {}
    for C, D in ipairs(y()) do
        _walk(D, function(E)
            if #A >= z then return end
            if (E:IsA("RemoteEvent") or E:IsA("RemoteFunction")) and not B[E] then
                B[E] = true
                A[#A + 1] = E:GetFullName() .. "  [" .. E.ClassName .. "]"
            end
        end)
    end
    return A
end




local z = {}

function z.allWithHumanoid()
    local A = {}
    local B = w.get()
    for C, D in ipairs(g:GetDescendants()) do
        if D:IsA("Model") and D ~= B then
            local E = D:FindFirstChildOfClass("Humanoid")
            local F = D:FindFirstChild("HumanoidRootPart") or D.PrimaryPart
            if E and F and E.Health > 0 then
                A[#A + 1] = { model = D, hum = E, root = F }
            end
        end
    end
    return A
end

function z.matchesName(A, B)
    if not A or not B then return false end
    if B == "All AI" then
        
        return c:GetPlayerFromCharacter(A) == nil
    end
    local C = A.Name:lower()
    return C:find(B:lower(), 1, true) ~= nil
end

function z.bestByPriority(A)
    local B = w.root()
    if not B then return nil end
    local C ,D=(math.huge
)    for E, F in ipairs(z.allWithHumanoid()) do
        local G = c:GetPlayerFromCharacter(F.model) ~= nil
        if not (u.SkipPlayers and G) then
            if z.matchesName(F.model, A) then
                if u.MaxTargetHP == 0 or F.hum.Health <= u.MaxTargetHP then
                    if F.hum.Health >= u.MinTargetHP then
                        local H = t.distance(B, F.root)
                        if H <= u.FarmRadius and H < C then
                            D, C = F, H
                        end
                    end
                end
            end
        end
    end
    return D
end








local A = {}
local B, C

function A.invalidateCache()
    B, C = nil, nil
end

function A.findRemote()
    if B and B.Parent then
        return B, C
    end
    local D, E = x.remoteByKeywords(v.AttackKeywords)
    B, C = D, E or ""
    return D, C
end

function A.aimAt(D)
    if not (u.AimAtTarget and D and D.root) then return end
    pcall(function()
        local E = g.CurrentCamera
        if E then
            E.CFrame = CFrame.lookAt(E.CFrame.Position, D.root.Position)
        end
    end)
end

function A.clickM1()
    if not u.UseM1Click then return false end
    local D
    pcall(function()
        if q and r then
            q(); task.wait(0.04); r()
            D = true
        end
    end)
    if D then return true end
    pcall(function()
        j:Button1Down(Vector2.new(0, 0), g.CurrentCamera.CFrame)
        task.wait(0.04)
        j:Button1Up(Vector2.new(0, 0), g.CurrentCamera.CFrame)
        D = true
    end)
    return D == true
end

function A.fireRemote(D)
    local E = A.findRemote()
    if not E or not D then return false end
    local F = {
        { D.hum },
        { D.model },
        { D.root },
        { D.hum, D.root.Position },
        { D.model, D.root.Position },
        { },
    }
    for G, H in ipairs(F) do
        local I = pcall(function()
            if E:IsA("RemoteEvent") then E:FireServer(table.unpack(H))
            else E:InvokeServer(table.unpack(H)) end
        end)
        if I then return true end
    end
    return false
end

function A.eatCarcass()
    
    
    
    for D, E in ipairs(v.EatKeywords) do
        local F = x.remoteByKeywords({ E })
        if F then
            pcall(function()
                if F:IsA("RemoteEvent") then F:FireServer()
                else F:InvokeServer() end
            end)
        end
    end
end







local D = {}
local E, F

function D.startFly()
    local G = w.root(); if not G then return end
    D.stopFly()
    E = Instance.new("BodyVelocity")
    E.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    E.Velocity = Vector3.zero
    E.Parent = G
    F = Instance.new("BodyGyro")
    F.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    F.P = 1000
    F.CFrame = G.CFrame
    F.Parent = G
    local H = w.humanoid(); if H then H.PlatformStand = true end
end

function D.stopFly()
    if E then pcall(function() E:Destroy() end); E = nil end
    if F then pcall(function() F:Destroy() end); F = nil end
    local G = w.humanoid()
    if G then pcall(function() G.PlatformStand = false end) end
end

function D.flyActive()
    return E ~= nil and E.Parent ~= nil
end

function D.flyToward(G)
    local H = w.root(); if not H then return end
    if not D.flyActive() then D.startFly() end
    if not E then return end
    local I = G - H.Position
    local J = I.Magnitude
    if J < 0.5 then E.Velocity = Vector3.zero; return end
    E.Velocity = I.Unit * u.FlySpeed
    if F then F.CFrame = CFrame.lookAt(H.Position, G) end
end

function D.tpTo(G)
    local H = w.root(); if not H then return end
    local I = CFrame.lookAt(G + Vector3.new(2, 2, 4), G)
    pcall(function() H.CFrame = I end)
end

function D.walkTo(G)
    local H = w.humanoid()
    if H then pcall(function() H:MoveTo(G) end) end
end




local G = {}

function G.start()
    t.spawn(function()
        local H, I, J = 0, 0, 0
local K=function(K, L)            
u._LoopPhase = K
            local M, N = pcall(L)
            if not M then
                warn(("[NameHub][autofarm][%s] %s"):format(K, tostring(N)))
            end
            return M, N
end
        
while u.Alive and u.Autofarm do
            J = J + 1
            u._LoopTick = J
            local L = w.root()
            local M = w.humanoid()

            if not L then
                u._FarmStatus = "No character (waiting for respawn)"
                task.wait(0.2)
            else
                local N, O = K("find target", function()
                    return z.bestByPriority(u.FarmTarget)
                end)

                local P = (M and u.DisengageAt > 0 and M.Health < u.DisengageAt)

                if P then
                    u._FarmStatus = ("Retreating (HP %d < %d)"):format(math.floor(M.Health), u.DisengageAt)
                    if u.AutofarmMovement == "Fly" and D.flyActive() then
                        E.Velocity = Vector3.zero
                    end
                elseif O and O.model and O.model.Parent then
                    local Q = t.distance(L, O.root)
                    u._FarmStatus   = ("Engaging %s @ %.0fm"):format(O.model.Name, Q)
                    u._LastTarget   = O.model.Name
                    u._LastDistance = Q

                    K("movement", function()
                        if u.AutofarmMovement == "Fly" then
                            if Q > u.StopDistance then
                                D.flyToward(O.root.Position)
                            elseif D.flyActive() then
                                E.Velocity = Vector3.zero
                            end
                        elseif u.AutofarmMovement == "Walk" then
                            if Q > u.StopDistance then D.walkTo(O.root.Position) end
                        else
                            if Q > u.Range then D.tpTo(O.root.Position) end
                        end
                    end)

                    if tick() >= H then
                        K("aim", function() A.aimAt(O) end)
                        if Q <= u.Range then
                            K("click M1", function() A.clickM1() end)
                            local R, S = K("fire remote", function()
                                return A.fireRemote(O)
                            end)
                            local T, U = A.findRemote()
                            u._AttackRemote = U ~= "" and U or "(none)"
                            u._LastFire = S and "OK" or "FAIL"
                            if S and u.StatsCounting then
                                u.KillsCounted = u.KillsCounted + (O.hum.Health <= 5 and 1 or 0)
                            end
                        end
                        H = tick() + u.AttackInterval
                    end
                else
                    u._FarmStatus = ("Searching for: %s"):format(u.FarmTarget or "(none)")
                    if u.AutofarmMovement == "Fly" and D.flyActive() then
                        E.Velocity = Vector3.zero
                    end
                end

                if u.AutoEat and tick() >= I then
                    K("eat", function() A.eatCarcass() end)
                    I = tick() + u.EatInterval
                end

                if J % 5 == 0 then
                    K("count targets", function()
                        u._TargetsFound = #z.allWithHumanoid()
                    end)
                end

                task.wait(0.1)
            end
        end

        D.stopFly()
        u._FarmStatus = "Idle"
    end, "AutoFarm.loop")
end




local H = {}


local I = {
    bgDark   = Color3.fromRGB(15, 18, 24),
    bgPanel  = Color3.fromRGB(22, 26, 33),
    bgInput  = Color3.fromRGB(28, 33, 42),
    accent   = Color3.fromRGB(58, 212, 124),
    accentHi = Color3.fromRGB(78, 232, 144),
    text     = Color3.fromRGB(225, 230, 240),
    textDim  = Color3.fromRGB(150, 160, 180),
    stroke   = Color3.fromRGB(45, 52, 65),
}
local J=function(
J, K)local L = Instance.new("UICorner"); L.CornerRadius = UDim.new(0, K or 8); L.Parent = J; return L end local K=function(
K, L, M)local N = Instance.new("UIStroke"); N.Color = L or I.stroke; N.Thickness = M or 1; N.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; N.Parent = K; return N end local L=function(
L, M)local N = Instance.new("UIPadding"); N.PaddingTop = UDim.new(0, M); N.PaddingBottom = UDim.new(0, M); N.PaddingLeft = UDim.new(0, M); N.PaddingRight = UDim.new(0, M); N.Parent = L; return N end local M=function(

M, N, O)    
local P = Instance.new(M)
    for Q, S in pairs(O or {}) do P[Q] = S end
    if N then P.Parent = N end
    return P
end


pcall(function()
    local N = l:FindFirstChild("NameHubPE")
    if N then N:Destroy() end
    local O = n:FindFirstChild("PlayerGui")
    if O then
        local P = O:FindFirstChild("NameHubPE"); if P then P:Destroy() end
    end
end)

local N = M("ScreenGui", nil, {
    Name = "NameHubPE",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    IgnoreGuiInset = true,
})


local O = pcall(function() N.Parent = l end)
if not O then
    N.Parent = n:WaitForChild("PlayerGui")
end

local P = M("Frame", N, {
    Name = "Root",
    Size = UDim2.new(0, 540, 0, 380),
    Position = UDim2.new(0.5, -270, 0.5, -190),
    BackgroundColor3 = I.bgDark,
    BorderSizePixel = 0,
    Active = true,
})
J(P, 12)
K(P, I.stroke, 1)


local Q = M("Frame", P, {
    Size = UDim2.new(0, 140, 1, 0),
    BackgroundColor3 = I.bgPanel,
    BorderSizePixel = 0,
})
J(Q, 12)
M("Frame", Q, { 
    Size = UDim2.new(0, 16, 1, 0),
    Position = UDim2.new(1, -16, 0, 0),
    BackgroundColor3 = I.bgPanel,
    BorderSizePixel = 0,
})
local S = M("TextLabel", Q, {
    Text = "NameHub",
    Font = Enum.Font.GothamBold,
    TextSize = 22,
    TextColor3 = I.accent,
    BackgroundTransparency = 1,
    Size = UDim2.new(1, 0, 0, 50),
    Position = UDim2.new(0, 0, 0, 4),
    TextXAlignment = Enum.TextXAlignment.Center,
})

local T = M("TextLabel", Q, {
    Text = "Prior Extinction",
    Font = Enum.Font.Gotham,
    TextSize = 11,
    TextColor3 = I.textDim,
    BackgroundTransparency = 1,
    Size = UDim2.new(1, 0, 0, 14),
    Position = UDim2.new(0, 0, 0, 50),
    TextXAlignment = Enum.TextXAlignment.Center,
})

local U = M("Frame", Q, {
    BackgroundTransparency = 1,
    Size = UDim2.new(1, -20, 1, -90),
    Position = UDim2.new(0, 10, 0, 80),
})
M("UIListLayout", U, {
    SortOrder = Enum.SortOrder.LayoutOrder,
    Padding = UDim.new(0, 6),
})


local V = M("Frame", P, {
    BackgroundColor3 = I.bgDark,
    Size = UDim2.new(1, -150, 1, -20),
    Position = UDim2.new(0, 145, 0, 10),
    BorderSizePixel = 0,
})

local W = {}      
local X
local Y=function(
Y)    
for Z, _ in pairs(W) do
        _.frame.Visible = (Z == Y)
        _.btn.BackgroundColor3 = (Z == Y) and I.accent or I.bgInput
        _.btn.TextColor3 = (Z == Y) and I.bgDark or I.text
    end
    X = Y
end local aa=function(

Z)    
local _ = M("TextButton", U, {
        Text = Z,
        Font = Enum.Font.GothamMedium,
        TextSize = 14,
        AutoButtonColor = false,
        BackgroundColor3 = I.bgInput,
        TextColor3 = I.text,
        Size = UDim2.new(1, 0, 0, 32),
        BorderSizePixel = 0,
    })
    J(_, 6)
    local aa = M("ScrollingFrame", V, {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = I.accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Visible = false,
    })
    M("UIListLayout", aa, {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 8),
    })
    L(aa, 8)
    W[Z] = { btn = _, frame = aa }
    _.MouseButton1Click:Connect(function() Y(Z) end)
end

aa("Main")
aa("Diagnostics")
aa("Settings")
Y("Main")




local Z = {}

function Z.row(_, ab)
    local ac = M("Frame", _, {
        BackgroundColor3 = I.bgPanel,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, ab or 36),
    })
    J(ac, 6)
    L(ac, 8)
    return ac
end

function Z.label(ab, ac)
    local _ = Z.row(ab, 28)
    M("TextLabel", _, {
        Text = ac,
        Font = Enum.Font.Gotham,
        TextSize = 13,
        TextColor3 = I.textDim,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    return _:FindFirstChildOfClass("TextLabel")
end

function Z.button(ab, ac, _)
    local ad = M("TextButton", ab, {
        Text = ac,
        Font = Enum.Font.GothamMedium,
        TextSize = 13,
        AutoButtonColor = false,
        BackgroundColor3 = I.accent,
        TextColor3 = I.bgDark,
        Size = UDim2.new(1, 0, 0, 32),
        BorderSizePixel = 0,
    })
    J(ad, 6)
    ad.MouseButton1Click:Connect(function()
        pcall(_)
    end)
    return ad
end

function Z.toggle(ab, ac, ad, _)
    local ae = Z.row(ab)
    M("TextLabel", ae, {
        Text = ac,
        Font = Enum.Font.Gotham,
        TextSize = 13,
        TextColor3 = I.text,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -50, 1, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local af = M("TextButton", ae, {
        AutoButtonColor = false,
        BackgroundColor3 = u[ad] and I.accent or I.bgInput,
        Size = UDim2.new(0, 38, 0, 20),
        Position = UDim2.new(1, -38, 0.5, -10),
        Text = "",
        BorderSizePixel = 0,
    })
    J(af, 10)
    local ag = M("Frame", af, {
        Size = UDim2.new(0, 16, 0, 16),
        Position = u[ad] and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8),
        BackgroundColor3 = Color3.fromRGB(240, 240, 240),
        BorderSizePixel = 0,
    })
    J(ag, 8)

    af.MouseButton1Click:Connect(function()
        u[ad] = not u[ad]
        af.BackgroundColor3 = u[ad] and I.accent or I.bgInput
        f:Create(ag, TweenInfo.new(0.15), {
            Position = u[ad] and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8),
        }):Play()
        if _ then pcall(_, u[ad]) end
    end)
    return af
end

function Z.dropdown(ab, ac, ad, ae, af)
    local ag = Z.row(ab)
    M("TextLabel", ag, {
        Text = ac,
        Font = Enum.Font.Gotham,
        TextSize = 13,
        TextColor3 = I.text,
        BackgroundTransparency = 1,
        Size = UDim2.new(0.45, 0, 1, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local _ = M("TextButton", ag, {
        Text = tostring(u[ad] or ae[1] or "-"),
        Font = Enum.Font.GothamMedium,
        TextSize = 13,
        AutoButtonColor = false,
        BackgroundColor3 = I.bgInput,
        TextColor3 = I.text,
        Size = UDim2.new(0.55, 0, 0, 24),
        Position = UDim2.new(0.45, 0, 0.5, -12),
        BorderSizePixel = 0,
    })
    J(_, 6)

    local ah = M("Frame", _, {
        BackgroundColor3 = I.bgInput,
        Size = UDim2.new(1, 0, 0, math.min(#ae, 6) * 26),
        Position = UDim2.new(0, 0, 1, 4),
        Visible = false,
        BorderSizePixel = 0,
        ZIndex = 5,
    })
    J(ah, 6)
    K(ah, I.stroke, 1)
    M("UIListLayout", ah, { SortOrder = Enum.SortOrder.LayoutOrder })

    for ai, aj in ipairs(ae) do
        local ak = M("TextButton", ah, {
            Text = aj,
            Font = Enum.Font.Gotham,
            TextSize = 12,
            BackgroundTransparency = 1,
            TextColor3 = I.text,
            Size = UDim2.new(1, 0, 0, 26),
            BorderSizePixel = 0,
            ZIndex = 6,
        })
        ak.MouseButton1Click:Connect(function()
            u[ad] = aj
            _.Text = aj
            ah.Visible = false
            if af then pcall(af, aj) end
        end)
    end

    _.MouseButton1Click:Connect(function() ah.Visible = not ah.Visible end)
    return _
end

function Z.slider(ab, ac, ad, ae, af, ag, ah)
    ag = ag or 1
    local ai = Z.row(ab, 44)
    M("TextLabel", ai, {
        Text = ("%s: %s"):format(ac, tostring(u[ad])),
        Font = Enum.Font.GothamMedium,
        TextSize = 13,
        TextColor3 = I.text,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 16),
        Position = UDim2.new(0, 0, 0, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
        Name = "lbl",
    })
    local aj = M("Frame", ai, {
        BackgroundColor3 = I.bgInput,
        Size = UDim2.new(1, 0, 0, 6),
        Position = UDim2.new(0, 0, 1, -10),
        BorderSizePixel = 0,
    })
    J(aj, 3)
    local ak = M("Frame", aj, {
        BackgroundColor3 = I.accent,
        Size = UDim2.new(((u[ad] or ae) - ae) / (af - ae), 0, 1, 0),
        BorderSizePixel = 0,
    })
    J(ak, 3)

    local _ = false
local al=function(al)        
local am = math.clamp((al - aj.AbsolutePosition.X) / aj.AbsoluteSize.X, 0, 1)
        local an = ae + (af - ae) * am
        an = math.floor(an / ag + 0.5) * ag
        u[ad] = an
        ak.Size = UDim2.new(am, 0, 1, 0)
        ai.lbl.Text = ("%s: %s"):format(ac, tostring(an))
        if ah then pcall(ah, an) end
end    
aj.InputBegan:Connect(function(am)
        if am.UserInputType == Enum.UserInputType.MouseButton1 or am.UserInputType == Enum.UserInputType.Touch then
            _ = true; al(am.Position.X)
        end
    end)
    e.InputEnded:Connect(function(am)
        if am.UserInputType == Enum.UserInputType.MouseButton1 or am.UserInputType == Enum.UserInputType.Touch then
            _ = false
        end
    end)
    e.InputChanged:Connect(function(am)
        if _ and (am.UserInputType == Enum.UserInputType.MouseMovement or am.UserInputType == Enum.UserInputType.Touch) then
            al(am.Position.X)
        end
    end)
end

function Z.statLabel(ab, ac)
    local ad = Z.row(ab, 26)
    local ae = M("TextLabel", ad, {
        Text = ac(),
        Font = Enum.Font.Code,
        TextSize = 12,
        TextColor3 = I.textDim,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    
    table.insert(_statRefreshers, function() ae.Text = ac() end)
    return ae
end
_statRefreshers = {}






do
    local ab, ac, ad
local ae=function(ae)        
if ae.UserInputType ~= Enum.UserInputType.MouseButton1
            and ae.UserInputType ~= Enum.UserInputType.Touch then return end
        ab = true; ac = ae.Position; ad = P.Position
end    
Q.InputBegan:Connect(ae)
    S.InputBegan:Connect(ae)
    e.InputChanged:Connect(function(af)
        if ab and (af.UserInputType == Enum.UserInputType.MouseMovement or af.UserInputType == Enum.UserInputType.Touch) then
            local ag = af.Position - ac
            P.Position = UDim2.new(ad.X.Scale, ad.X.Offset + ag.X, ad.Y.Scale, ad.Y.Offset + ag.Y)
        end
    end)
    e.InputEnded:Connect(function(af)
        if af.UserInputType == Enum.UserInputType.MouseButton1
            or af.UserInputType == Enum.UserInputType.Touch then ab = false end
    end)
end


do
    local ab = W["Main"].frame
    Z.toggle(ab, "Autofarm", "Autofarm", function(ac)
        if ac then
            u.StartTime = u.StartTime or os.time()
            u.StatsCounting = true
            G.start()
        end
    end)
    Z.dropdown(ab, "Target", "FarmTarget", v.FarmTargetOptions)
    Z.toggle(ab, "Skip Players (NPC-only)", "SkipPlayers")
    Z.dropdown(ab, "Movement Mode", "AutofarmMovement", v.MovementOptions, function(ac)
        if ac ~= "Fly" then D.stopFly() end
    end)
    Z.slider(ab, "Stop Distance (Fly/Walk)", "StopDistance", 2, 20, 1)
    Z.slider(ab, "Attack Range", "Range", 4, 40, 1)
    Z.slider(ab, "Speed", "Speed", 16, 200, 1, function() w.applySpeed() end)
    Z.slider(ab, "Fly Speed", "FlySpeed", 20, 300, 1)
    Z.slider(ab, "Attack Interval (s)", "AttackInterval", 0.1, 2, 0.05)
    Z.toggle(ab, "Click M1 in range", "UseM1Click")
    Z.toggle(ab, "Aim camera at target", "AimAtTarget")
    Z.toggle(ab, "Auto-Eat carcass", "AutoEat")
end


do
    local ab = W["Diagnostics"].frame
    Z.statLabel(ab, function() return "Status: " .. tostring(u._FarmStatus) end)
    Z.statLabel(ab, function() return ("Last target: %s @ %dm"):format(tostring(u._LastTarget), math.floor(u._LastDistance or 0)) end)
    Z.statLabel(ab, function() return "Attack remote: " .. (u._AttackRemote ~= "" and u._AttackRemote or "(none)") end)
    Z.statLabel(ab, function() return "Last fire: " .. tostring(u._LastFire) end)
    Z.statLabel(ab, function() return ("Loop tick: %d  phase: %s"):format(u._LoopTick or 0, tostring(u._LoopPhase)) end)
    Z.statLabel(ab, function() return ("Humanoid targets in world: %d"):format(u._TargetsFound or 0) end)
    Z.statLabel(ab, function()
        local ac = u.StartTime and (os.time() - u.StartTime) or 0
        return ("Elapsed: %ds   Kills: %d"):format(ac, u.KillsCounted)
    end)

    Z.button(ab, "Copy Diagnostics + Remote Dump", function()
        local ac = {
            "=== NameHub Prior Extinction Diagnostics ===",
            "Build: " .. a,
            "PlaceId: " .. tostring(game.PlaceId) .. " (" .. tostring(b[game.PlaceId]) .. ")",
            "Target: " .. tostring(u.FarmTarget),
            "Movement: " .. tostring(u.AutofarmMovement),
            "Status: " .. tostring(u._FarmStatus),
            "LastTarget: " .. tostring(u._LastTarget) .. " @ " .. math.floor(u._LastDistance or 0) .. "m",
            "AttackRemote: " .. tostring(u._AttackRemote),
            "LastFire: " .. tostring(u._LastFire),
            "LoopTick: " .. tostring(u._LoopTick) .. " phase: " .. tostring(u._LoopPhase),
            "",
            "--- Remotes (top 100) ---",
        }
        for ad, ae in ipairs(x.allRemotes(100)) do ac[#ac + 1] = ae end
        local ad = table.concat(ac, "\n")
        pcall(p, ad)
        i:SetCore("SendNotification", {
            Title = "NameHub", Text = ("Diagnostics copied (%d lines)."):format(#ac), Duration = 4,
        })
    end)
end


do
    local ab = W["Settings"].frame
    Z.toggle(ab, "Count Stats (kills + time)", "StatsCounting")
    Z.button(ab, "Reset Stats", function()
        u.StartTime = os.time()
        u.KillsCounted = 0
    end)
    Z.button(ab, "Unload Script", function()
        u.Autofarm = false
        u.Alive = false
        D.stopFly()
        for ac, ad in pairs(s) do pcall(function() ad:Disconnect() end) end
        pcall(function() N:Destroy() end)
    end)
    Z.label(ab, "Build: " .. a)
end



t.conn("ui_refresh", d.Heartbeat:Connect(function()
    for ab, ac in ipairs(_statRefreshers) do pcall(ac) end
end))
local ab=function(



ab)    
task.wait(0.3)
    w.applySpeed()
end
n.CharacterAdded:Connect(ab)
if n.Character then ab(n.Character) end


pcall(function()
    i:SetCore("SendNotification", {
        Title = "NameHub",
        Text = ("Prior Extinction loaded (%s)"):format(a),
        Duration = 4,
    })
end)
