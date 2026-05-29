






















local a = "v1.0.0 NameHub (jb-autofarm-rewrite-20260529)"





getgenv          = getgenv          or function() return _G end
hookmetamethod   = hookmetamethod   or function() end
getrawmetatable  = getrawmetatable  or function(b) return getmetatable(b) end
setreadonly      = setreadonly      or function() end
getnamecallmethod = getnamecallmethod or function() return "" end
setclipboard     = setclipboard     or function() end





do
    local b = { [11653088948] = true }
    local c = game.PlaceId
    if not b[c] then
        local d = ("[NameHub Jurassic Blocky] Wrong game (PlaceId=%d). "
                  .. "Use the NameHub Universal Loader from the Discord panel."):format(c)
        warn(d)
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "NameHub", Text = "Wrong game for Jurassic Blocky script.", Duration = 8,
            })
        end)
        error(d, 0)
    end
end





do
    local b = getgenv()
    if b._NameHubJB_Alive and type(b._NameHubJB_Unload) == "function" then
        pcall(b._NameHubJB_Unload)
    end
end




local b           = game:GetService("Players")
local c        = game:GetService("RunService")
local d  = game:GetService("UserInputService")
local e      = game:GetService("TweenService")
local f         = game:GetService("Workspace")
local g = game:GetService("ReplicatedStorage")
local h        = game:GetService("StarterGui")
local i       = game:GetService("VirtualUser")
local j       = game:GetService("HttpService")
local k           = game:GetService("CoreGui")

local l       = b.LocalPlayer
if not l then
    b.PlayerAdded:Wait()
    l = b.LocalPlayer
end




local m = {
    
    BrandName       = "NameHub",
    BrandSubtitle   = "Jurassic Blocky",
    BrandColor      = Color3.fromRGB(34, 197, 94),   

    
    DefaultWalkSpeed = 16,
    BoostedWalkSpeed = 60,
    DefaultJumpPower = 50,
    BoostedJumpPower = 100,

    
    AttackRange      = 18,
    AttackCooldown   = 0.35,           
    SearchRadius     = 600,            
    PreferPlayers    = false,          
    SkipFriendlyTeams = true,
    RetargetEvery    = 1.0,            

    
    
    AttackRemoteKeywords = {
        "attack", "bite", "claw", "swing", "hit", "damage", "combat",
    },
    LootRemoteKeywords = {
        "claim", "collect", "pickup", "loot", "reward",
    },

    
    AntiAFK = true,

    
    DumpRemoteLimit  = 200,
    DumpTargetLimit  = 50,
}




local n = {
    Alive          = true,
    AutoFarm       = false,
    AutoFarmTarget = nil,
    AntiAFK        = m.AntiAFK,
    WalkSpeedBoost = false,
    JumpBoost      = false,

    
    StartedAt      = os.time(),
    AttacksFired   = 0,
    LastAttackAt   = 0,
    LastError      = nil,

    
    CachedAttackRemote = nil,    
    CachedLootRemote   = nil,    
}

local o   = {}   
local p       = {}   




local q = {}

function q.notify(r, s)
    pcall(function()
        h:SetCore("SendNotification", {
            Title    = m.BrandName,
            Text     = tostring(r),
            Duration = s or 4,
        })
    end)
end

function q.safe(r, s)
    return function(...)
        local t, u = pcall(r, ...)
        if not t then
            n.LastError = tostring(u)
            warn(("[%s] %s: %s"):format(m.BrandName, s or "?", u))
        end
    end
end

function q.trackConn(r, s)
    if o[r] and o[r].Connected then
        o[r]:Disconnect()
    end
    o[r] = s
    return s
end

function q.disconnectAll()
    for r, s in pairs(o) do
        if s and s.Connected then
            pcall(function() s:Disconnect() end)
        end
        o[r] = nil
    end
end

function q.randomName(r)
    return (r or "_") .. tostring(math.random(100000, 999999))
end

function q.distance(r, s)
    if not r or not s then return math.huge end
    return (r.Position - s.Position).Magnitude
end




local r = {}

function r.getRoot()
    local s = l.Character
    if not s then return nil end
    return s:FindFirstChild("HumanoidRootPart") or s.PrimaryPart
end

function r.getHumanoid()
    local s = l.Character
    if not s then return nil end
    return s:FindFirstChildOfClass("Humanoid")
end

function r.applyWalkSpeed()
    local s = r.getHumanoid()
    if not s then return end
    s.WalkSpeed = n.WalkSpeedBoost and m.BoostedWalkSpeed or m.DefaultWalkSpeed
end

function r.applyJumpPower()
    local s = r.getHumanoid()
    if not s then return end
    if s.UseJumpPower ~= nil then s.UseJumpPower = true end
    s.JumpPower = n.JumpBoost and m.BoostedJumpPower or m.DefaultJumpPower
end

function r.onSpawn()
    r.applyWalkSpeed()
    r.applyJumpPower()
end







local s = {}

local function walkInstances(t, u)
    if not t then return end
    for v, w in ipairs(t:GetChildren()) do
        u(w)
        walkInstances(w, u)
    end
end

function s.findRemoteByKeywords(t)
    local u = {}
    for v, w in ipairs(t) do u[#u + 1] = w:lower() end

    local v
    walkInstances(g, function(w)
        if v then return end
        if w:IsA("RemoteEvent") or w:IsA("RemoteFunction") then
            local x = w.Name:lower()
            for y, z in ipairs(u) do
                if x:find(z, 1, true) then v = w; return end
            end
        end
    end)
    return v
end

function s.attackRemote()
    if n.CachedAttackRemote and n.CachedAttackRemote.Parent then
        return n.CachedAttackRemote
    end
    n.CachedAttackRemote = s.findRemoteByKeywords(m.AttackRemoteKeywords)
    return n.CachedAttackRemote
end

function s.lootRemote()
    if n.CachedLootRemote and n.CachedLootRemote.Parent then
        return n.CachedLootRemote
    end
    n.CachedLootRemote = s.findRemoteByKeywords(m.LootRemoteKeywords)
    return n.CachedLootRemote
end

function s.allRemotes(t)
    t = t or m.DumpRemoteLimit
    local u = {}
    walkInstances(g, function(v)
        if #u >= t then return end
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            u[#u + 1] = v:GetFullName() .. "  [" .. v.ClassName .. "]"
        end
    end)
    return u
end




local t = {}



function t.findBest()
    local u = r.getRoot()
    if not u then return nil end

    local v ,w=(m.SearchRadius
)
    for x, y in ipairs(f:GetDescendants()) do
        if y:IsA("Model") and y ~= l.Character then
            local z = y:FindFirstChildOfClass("Humanoid")
            local A  = y:FindFirstChild("HumanoidRootPart") or y.PrimaryPart
            if z and A and z.Health > 0 then
                local B = b:GetPlayerFromCharacter(y)
                local C     = B ~= nil
                local D  = (C == m.PreferPlayers)

                if D then
                    if m.SkipFriendlyTeams and B and l.Team
                       and B.Team == l.Team then
                        
                    else
                        local E = q.distance(u, A)
                        if E < v then
                            v  = E
                            w = y
                        end
                    end
                end
            end
        end
    end

    return w
end

function t.dump(u)
    u = u or m.DumpTargetLimit
    local v = r.getRoot()
    local w = {}

    for x, y in ipairs(f:GetDescendants()) do
        if #w >= u then break end
        if y:IsA("Model") and y ~= l.Character then
            local z = y:FindFirstChildOfClass("Humanoid")
            local A  = y:FindFirstChild("HumanoidRootPart") or y.PrimaryPart
            if z and A then
                local B = v and q.distance(v, A) or -1
                local C = b:GetPlayerFromCharacter(y)
                w[#w + 1] = ("%-40s  HP=%-6.1f  dist=%-7.1f  %s"):format(
                    y:GetFullName():sub(1, 40),
                    z.Health,
                    B,
                    C and ("player=" .. C.Name) or "NPC"
                )
            end
        end
    end
    return w
end






local u = {}

function u.fireAt(v)
    if not v then return false end
    local w = s.attackRemote()
    if not w then return false end

    local x = v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart
    local y = v:FindFirstChildOfClass("Humanoid")
    if not x or not y then return false end

    
    
    local z = {
        { v },
        { y },
        { x },
        { v.Name },
        { },
    }

    for A, B in ipairs(z) do
        local C = pcall(function()
            if w:IsA("RemoteEvent") then
                w:FireServer(table.unpack(B))
            else
                w:InvokeServer(table.unpack(B))
            end
        end)
        if C then
            n.AttacksFired = n.AttacksFired + 1
            n.LastAttackAt = tick()
            return true
        end
    end

    return false
end




local v = {}

function v.start()
    if not n.AutoFarm then return end

    task.spawn(q.safe(function()
        local w = 0

        while n.Alive and n.AutoFarm do
            local x  = tick()
            local y = r.getRoot()

            if y then
                
                if not n.AutoFarmTarget
                   or not n.AutoFarmTarget.Parent
                   or x - w > m.RetargetEvery then
                    n.AutoFarmTarget = t.findBest()
                    w = x
                end

                local z = n.AutoFarmTarget
                if z and z.Parent then
                    local A  = z:FindFirstChild("HumanoidRootPart") or z.PrimaryPart
                    local B = z:FindFirstChildOfClass("Humanoid")
                    if A and B and B.Health > 0 then
                        local C = q.distance(y, A)

                        
                        if C > m.AttackRange then
                            local D = CFrame.new(A.Position) * CFrame.new(0, 0, m.AttackRange * 0.6)
                            D = CFrame.lookAt(D.Position, A.Position)
                            pcall(function() y.CFrame = D end)
                        end

                        
                        if x - n.LastAttackAt >= m.AttackCooldown then
                            u.fireAt(z)
                        end
                    else
                        n.AutoFarmTarget = nil
                    end
                end
            end

            task.wait(0.1)
        end
    end, "AutoFarm.loop"))
end




local w = {}

function w.attach()
    local x = l.Idled:Connect(function()
        if not (n.Alive and n.AntiAFK) then return end
        pcall(function()
            i:Button2Down(Vector2.new(0, 0), f.CurrentCamera.CFrame)
            task.wait(1)
            i:Button2Up(Vector2.new(0, 0), f.CurrentCamera.CFrame)
        end)
    end)
    q.trackConn("antiafk", x)
end






local x = {}
local y=function(
y, z, A)    
local B = Instance.new(y)
    for C, D in pairs(z or {}) do B[C] = D end
    for C, D in ipairs(A or {}) do D.Parent = B end
    return B
end

function x.build()
    local z = {
        bg     = Color3.fromRGB(10, 12, 16),
        card   = Color3.fromRGB(18, 22, 28),
        accent = m.BrandColor,
        track  = Color3.fromRGB(40, 46, 54),
        dim    = Color3.fromRGB(160, 168, 178),
        white  = Color3.fromRGB(235, 240, 245),
    }

    local A = y("ScreenGui", {
        Name = q.randomName("_NHJB_"),
        IgnoreGuiInset = true,
        ResetOnSpawn   = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        DisplayOrder   = 2000000,
    })

    
    local B = pcall(function() A.Parent = k end)
    if not B then
        local C = l:WaitForChild("PlayerGui", 5)
        if not C then return nil end
        A.Parent = C
    end

    
    local C = y("Frame", {
        Name             = "Window",
        Position         = UDim2.fromOffset(60, 80),
        Size             = UDim2.fromOffset(320, 440),
        BackgroundColor3 = z.card,
        BorderSizePixel  = 0,
        Active           = true,
        Draggable        = true,
    })
    C.Parent = A
    y("UICorner", { CornerRadius = UDim.new(0, 10) }).Parent = C
    local D = y("UIStroke", { Color = z.accent, Transparency = 0.55, Thickness = 1 })
    D.Parent = C

    
    local E = y("Frame", {
        Size = UDim2.new(1, 0, 0, 56),
        BackgroundTransparency = 1,
    })
    E.Parent = C

    y("TextLabel", {
        Size = UDim2.new(1, -20, 0, 26),
        Position = UDim2.fromOffset(16, 12),
        BackgroundTransparency = 1,
        Text = m.BrandName,
        Font = Enum.Font.GothamBold,
        TextSize = 22,
        TextColor3 = z.accent,
        TextXAlignment = Enum.TextXAlignment.Left,
    }).Parent = E

    y("TextLabel", {
        Size = UDim2.new(1, -20, 0, 14),
        Position = UDim2.fromOffset(16, 36),
        BackgroundTransparency = 1,
        Text = "Jurassic Blocky  -  " .. a,
        Font = Enum.Font.Gotham,
        TextSize = 11,
        TextColor3 = z.dim,
        TextXAlignment = Enum.TextXAlignment.Left,
    }).Parent = E

    
    local F = y("TextButton", {
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -10, 0, 10),
        Size = UDim2.fromOffset(28, 28),
        BackgroundColor3 = Color3.fromRGB(60, 28, 32),
        BorderSizePixel = 0,
        Text = "X",
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        TextColor3 = z.white,
        AutoButtonColor = true,
    })
    F.Parent = E
    y("UICorner", { CornerRadius = UDim.new(0, 6) }).Parent = F

    
    y("Frame", {
        Position = UDim2.new(0, 16, 0, 60),
        Size = UDim2.new(1, -32, 0, 1),
        BackgroundColor3 = z.track,
        BorderSizePixel = 0,
    }).Parent = C

    
    local G = y("ScrollingFrame", {
        Position = UDim2.new(0, 12, 0, 70),
        Size = UDim2.new(1, -24, 1, -82),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = z.accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
    })
    G.Parent = C

    local H = y("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding   = UDim.new(0, 6),
    })
    H.Parent = G

    local I = 0
local J=function()I = I + 1 return I end local K=function(


K)        
y("TextLabel", {
            LayoutOrder = J(),
            Size = UDim2.new(1, 0, 0, 22),
            BackgroundTransparency = 1,
            Text = K,
            Font = Enum.Font.GothamBold,
            TextSize = 12,
            TextColor3 = z.dim,
            TextXAlignment = Enum.TextXAlignment.Left,
        }).Parent = G
end local L=function(


L, M, N)        
local O = y("Frame", {
            LayoutOrder = J(),
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundColor3 = z.bg,
            BorderSizePixel = 0,
        })
        O.Parent = G
        y("UICorner", { CornerRadius = UDim.new(0, 6) }).Parent = O

        y("TextLabel", {
            Position = UDim2.fromOffset(12, 0),
            Size = UDim2.new(1, -64, 1, 0),
            BackgroundTransparency = 1,
            Text = L,
            Font = Enum.Font.Gotham,
            TextSize = 13,
            TextColor3 = z.white,
            TextXAlignment = Enum.TextXAlignment.Left,
        }).Parent = O

        local P = y("TextButton", {
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -8, 0.5, 0),
            Size = UDim2.fromOffset(42, 20),
            BackgroundColor3 = M and z.accent or z.track,
            Text = "",
            AutoButtonColor = false,
        })
        P.Parent = O
        y("UICorner", { CornerRadius = UDim.new(1, 0) }).Parent = P

        local Q = y("Frame", {
            Position = M and UDim2.new(1, -18, 0.5, -8) or UDim2.fromOffset(2, 2),
            Size = UDim2.fromOffset(16, 16),
            BackgroundColor3 = z.white,
            BorderSizePixel = 0,
        })
        Q.Parent = P
        if M then Q.AnchorPoint = Vector2.new(0, 0.5) end
        y("UICorner", { CornerRadius = UDim.new(1, 0) }).Parent = Q

        local R = M
        P.MouseButton1Click:Connect(function()
            R = not R
            local S = R and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            Q.AnchorPoint = Vector2.new(0, 0.5)
            e:Create(Q, TweenInfo.new(0.15), { Position = S }):Play()
            e:Create(P, TweenInfo.new(0.15), { BackgroundColor3 = R and z.accent or z.track }):Play()
            if N then N(R) end
        end)
        return P
end local M=function(


M, N)        
local O = y("TextButton", {
            LayoutOrder = J(),
            Size = UDim2.new(1, 0, 0, 30),
            BackgroundColor3 = z.bg,
            BorderSizePixel = 0,
            Text = M,
            Font = Enum.Font.GothamMedium,
            TextSize = 13,
            TextColor3 = z.white,
            AutoButtonColor = true,
        })
        O.Parent = G
        y("UICorner", { CornerRadius = UDim.new(0, 6) }).Parent = O
        O.MouseButton1Click:Connect(N)
        return O
end
    
    
local N

    
    K("AUTO-FARM")
    L("Auto-Farm", n.AutoFarm, function(O)
        n.AutoFarm = O
        if O then
            v.start()
            q.notify("Auto-Farm ON")
        else
            q.notify("Auto-Farm OFF")
        end
    end)
    L("Prefer Players over NPCs", m.PreferPlayers, function(O)
        m.PreferPlayers = O
        n.AutoFarmTarget = nil
    end)
    L("Skip teammates", m.SkipFriendlyTeams, function(O)
        m.SkipFriendlyTeams = O
    end)

    K("MOVEMENT")
    L("Walk Speed boost (" .. m.BoostedWalkSpeed .. ")", false, function(O)
        n.WalkSpeedBoost = O
        r.applyWalkSpeed()
    end)
    L("Jump Power boost (" .. m.BoostedJumpPower .. ")", false, function(O)
        n.JumpBoost = O
        r.applyJumpPower()
    end)
    L("Anti-AFK", n.AntiAFK, function(O)
        n.AntiAFK = O
    end)

    K("DIAGNOSTICS")
    M("Dump remotes (clipboard)", function()
        local O = s.allRemotes()
        local P = "-- NameHub JB remote dump (" .. #O .. " entries)\n" .. table.concat(O, "\n")
        local Q = pcall(setclipboard, P)
        q.notify(Q and ("Copied " .. #O .. " remote paths") or "Clipboard failed - check console")
        print(P)
    end)
    M("Dump nearby targets (clipboard)", function()
        local O = t.dump()
        local P = "-- NameHub JB target dump (" .. #O .. " entries)\n" .. table.concat(O, "\n")
        local Q = pcall(setclipboard, P)
        q.notify(Q and ("Copied " .. #O .. " targets") or "Clipboard failed - check console")
        print(P)
    end)
    M("Re-scan attack remote", function()
        n.CachedAttackRemote = nil
        local O = s.attackRemote()
        q.notify(O and ("Found: " .. O:GetFullName()) or "No attack remote matched keywords")
    end)
    M("Manual: attack nearest now", function()
        local O = t.findBest()
        if not O then return q.notify("No target in range") end
        local P = u.fireAt(O)
        q.notify(P and ("Fired attack at " .. O.Name) or "Attack failed (no remote)")
    end)

    K("STATUS")
    N = y("TextLabel", {
        LayoutOrder = J(),
        Size = UDim2.new(1, 0, 0, 64),
        BackgroundColor3 = z.bg,
        BorderSizePixel = 0,
        Text = "",
        Font = Enum.Font.RobotoMono,
        TextSize = 11,
        TextColor3 = z.dim,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = true,
    })
    N.Parent = G
    y("UICorner", { CornerRadius = UDim.new(0, 6) }).Parent = N
    y("UIPadding", { PaddingTop = UDim.new(0, 6), PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8) }).Parent = N

    
    q.trackConn("status", c.Heartbeat:Connect(function()
        if not (n.Alive and N.Parent) then return end
        local O = n.AutoFarmTarget
        local P = n.CachedAttackRemote
        local Q = os.time() - n.StartedAt
        N.Text = string.format(
            "AutoFarm:   %s\nTarget:     %s\nAttack rmt: %s\nAttacks:    %d\nUptime:     %ds",
            n.AutoFarm and "ON" or "OFF",
            O and O.Name or "-",
            P and P.Name or "(none)",
            n.AttacksFired,
            Q
        )
    end))

    
    F.MouseButton1Click:Connect(function()
        if getgenv()._NameHubJB_Unload then getgenv()._NameHubJB_Unload() end
    end)

    return A, C
end
local z=function()    






n.Alive = false
    n.AutoFarm = false
    n.AntiAFK = false

    q.disconnectAll()

    
    n.WalkSpeedBoost = false
    n.JumpBoost = false
    pcall(r.applyWalkSpeed)
    pcall(r.applyJumpPower)
local z=function(

z)        
if not z then return end
        for A, B in ipairs(z:GetChildren()) do
            if B:IsA("ScreenGui") and B.Name:sub(1, 6) == "_NHJB_" then
                pcall(function() B:Destroy() end)
            end
        end
end    
z(k)
    if l then z(l:FindFirstChild("PlayerGui")) end

    getgenv()._NameHubJB_Alive  = false
    getgenv()._NameHubJB_Unload = nil

    q.notify("Unloaded.", 3)
end




do
    getgenv()._NameHubJB_Alive  = true
    getgenv()._NameHubJB_Unload = z

    
    q.trackConn("charadded", l.CharacterAdded:Connect(function()
        task.wait(0.2)
        r.onSpawn()
    end))

    
    if l.Character then r.onSpawn() end

    
    q.safe(x.build, "UI.build")()

    
    w.attach()

    
    q.safe(function() s.attackRemote() end, "Discover.attackRemote")()

    q.notify(m.BrandName .. " " .. m.BrandSubtitle .. " loaded.", 3)
end

return true
