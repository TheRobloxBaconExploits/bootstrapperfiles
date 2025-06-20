getgenv().EtheractDefender = {}; local e = getgenv().EtheractDefender; local p = {
    {pattern='https?://[%w%.%-_/%%]+',reason='External HTTP URL'},
    {pattern='discord%.com/api/webhooks',reason='Discord Webhook'},
    {pattern='webhook',reason='Generic Webhook Reference'},
    {pattern='grabify',reason='IP Logger Domain'},
    {pattern='iplogger',reason='IP Logger Domain'},
    {pattern='api%.ipify%.org',reason='IP Fetching API'},
    {pattern='ipinfo%.io',reason='IP Info Service'},
    {pattern='%d+%.%d+%.%d+%.%d+',reason='Hardcoded IP Address'},
    {pattern='setclipboard',reason='Clipboard Hijack'},
    {pattern='token',reason='Token/Key Leak Attempt'}
}; local function d(s)local m={}local l=s:lower()for _,v in ipairs(p)do if l:match(v.pattern)then table.insert(m,v.reason)end end return #m>0,m end
function e.SecureRun(s)local b,r=d(s)if b then local g=game:GetService('CoreGui')local u=Instance.new('ScreenGui')u.Name='EtheractBlockerUI'u.ResetOnSpawn=false u.Parent=g
local f=Instance.new('Frame',u)f.Size=UDim2.new(0,420,0,240)f.Position=UDim2.new(0.5,-210,0.5,-120)f.BackgroundColor3=Color3.fromRGB(18,18,18)
local t=Instance.new('TextLabel',f)t.Size=UDim2.new(1,0,0.25,0)t.Text='🚨 Blocked by Project Etheract Security't.TextColor3=Color3.fromRGB(255,85,85)t.BackgroundTransparency=1 t.TextScaled=true t.Font=Enum.Font.SourceSansBold
local rl=Instance.new('TextLabel',f)rl.Position=UDim2.new(0,10,0.25,0)rl.Size=UDim2.new(1,-20,0.4,0)rl.Text='Reason(s): '..table.concat(r,', ')rl.TextColor3=Color3.fromRGB(255,255,255)rl.BackgroundTransparency=1 rl.TextWrapped=true rl.TextScaled=true rl.Font=Enum.Font.SourceSans
local a=Instance.new('TextButton',f)a.Position=UDim2.new(0.05,0,0.75,0)a.Size=UDim2.new(0.4,0,0.2,0)a.Text='Run Anyway'a.BackgroundColor3=Color3.fromRGB(0,200,0)a.TextScaled=true a.Font=Enum.Font.SourceSansBold
local c=Instance.new('TextButton',f)c.Position=UDim2.new(0.55,0,0.75,0)c.Size=UDim2.new(0.4,0,0.2,0)c.Text='Close'c.BackgroundColor3=Color3.fromRGB(200,0,0)c.TextScaled=true c.Font=Enum.Font.SourceSansBold
a.MouseButton1Click:Connect(function()u:Destroy()loadstring(s)()end) c.MouseButton1Click:Connect(function()u:Destroy()end)
else loadstring(s)()end end
