-- CEL / MIL control script
-- Logic:
--   Engine NOT running -> CEL ON (steady)
--   Engine running, no fuel cut -> CEL OFF
--   Fuel cut active -> CEL BLINK

local blinkState = false
local lastBlinkTime = 0
local BLINK_INTERVAL_MS = 250

function onTick()
    local rpm = getRpm()
    local running = rpm > 300  -- adjust threshold as needed

    -- TODO: confirm the correct rusEFI call for fuel cut status.
    -- Placeholder below - check wiki.rusefi.com/Lua-Scripting or the
    -- console Lua tab autocomplete for the real function/flag name.
    local fuelCutActive = false

    if not running then
        setPinState("CEL_OUTPUT", 1)
    elseif fuelCutActive then
        local now = getTimeNowMs()
        if now - lastBlinkTime > BLINK_INTERVAL_MS then
            blinkState = not blinkState
            lastBlinkTime = now
        end
        setPinState("CEL_OUTPUT", blinkState and 1 or 0)
    else
        setPinState("CEL_OUTPUT", 0)
    end
end
