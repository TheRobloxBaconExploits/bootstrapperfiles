-- Etheract Defender Initialization
print("[EtheractDefender] Initializing...")

-- Remove previous version if it exists
local existing = game:GetService("CoreGui"):FindFirstChild("EtheractBlockerUI")
if existing then
    existing:Destroy()
    print("[EtheractDefender] Removed previous EtheractBlockerUI.")
end

-- Clear any previous getgenv().EtheractDefender
if getgenv().EtheractDefender then
    getgenv().EtheractDefender = nil
    print("[EtheractDefender] Cleared existing EtheractDefender object.")
end

-- Set up new Defender
getgenv().EtheractDefender = {}
local EtheractDefender = getgenv().EtheractDefender

local badPatterns = {
    { pattern = 'https?://[%w%.%-_/%%]+', reason = 'External HTTP URL' },
    { pattern = 'discord%.com/api/webhooks', reason = 'Discord Webhook' },
    { pattern = 'webhook', reason = 'Generic Webhook Reference' },
    { pattern = 'grabify', reason = 'IP Logger Domain' },
    { pattern = 'iplogger', reason = 'IP Logger Domain' },
    { pattern = 'api%.ipify%.org', reason = 'IP Fetching API' },
    { pattern = 'ipinfo%.io', reason = 'IP Info Service' },
    { pattern = '%d+%.%d+%.%d+%.%d+', reason = 'Hardcoded IP Address' },
    { pattern = 'setclipboard', reason = 'Clipboard Hijack' },
    { pattern = 'token', reason = 'Token/Key Leak Attempt' }
}

local function detect(script)
    local matches = {}
    local lower = script:lower()
    for _, entry in ipairs(badPatterns) do
        if lower:match(entry.pattern) then
            table.insert(matches, entry.reason)
        end
    end
    return #matches > 0, matches
end

function EtheractDefender.SecureRun(script)
    print("[EtheractDefender] Script received for scanning.")
    local bad, reasons = detect(script)
    if bad then
        print("[EtheractDefender] ⚠️ Threat detected: " .. table.concat(reasons, ", "))
        local CoreGui = game:GetService("CoreGui")

        local gui = Instance.new("ScreenGui")
        gui.Name = "EtheractBlockerUI"
        gui.ResetOnSpawn = false
        gui.Parent = CoreGui

        local frame = Instance.new("Frame", gui)
        frame.Size = UDim2.new(0, 420, 0, 240)
        frame.Position = UDim2.new(0.5, -210, 0.5, -120)
        frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)

        local title = Instance.new("TextLabel", frame)
        title.Size = UDim2.new(1, 0, 0.25, 0)
        title.Text = "🚨 Blocked by Project Etheract Security"
        title.TextColor3 = Color3.fromRGB(255, 85, 85)
        title.BackgroundTransparency = 1
        title.TextScaled = true
        title.Font = Enum.Font.SourceSansBold

        local reasonLabel = Instance.new("TextLabel", frame)
        reasonLabel.Position = UDim2.new(0, 10, 0.25, 0)
        reasonLabel.Size = UDim2.new(1, -20, 0.4, 0)
        reasonLabel.Text = "Reason(s): " .. table.concat(reasons, ", ")
        reasonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        reasonLabel.BackgroundTransparency = 1
        reasonLabel.TextWrapped = true
        reasonLabel.TextScaled = true
        reasonLabel.Font = Enum.Font.SourceSans

        local run = Instance.new("TextButton", frame)
        run.Position = UDim2.new(0.05, 0, 0.75, 0)
        run.Size = UDim2.new(0.4, 0, 0.2, 0)
        run.Text = "Run Anyway"
        run.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        run.TextScaled = true
        run.Font = Enum.Font.SourceSansBold

        local close = Instance.new("TextButton", frame)
        close.Position = UDim2.new(0.55, 0, 0.75, 0)
        close.Size = UDim2.new(0.4, 0, 0.2, 0)
        close.Text = "Close"
        close.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        close.TextScaled = true
        close.Font = Enum.Font.SourceSansBold

        run.MouseButton1Click:Connect(function()
            print("[EtheractDefender] User clicked 'Run Anyway'. Executing script.")
            gui:Destroy()
            loadstring(script)()
        end)

        close.MouseButton1Click:Connect(function()
            print("[EtheractDefender] User clicked 'Close'. Script canceled.")
            gui:Destroy()
        end)
    else
        print("[EtheractDefender] ✅ Script is clean. Executing...")
        loadstring(script)()
    end
end

print("[EtheractDefender] Active and ready.")
