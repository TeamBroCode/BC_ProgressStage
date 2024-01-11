<h1 align="center">Brocode ProgressStage</h1>

## Overview

The `ProgressStage` function in QBCore allows you to easily create progress stages with various customization options. This README provides details on integrating and using this function in your QBCore script or Standalone.

## USAGE

```lua
exports['BC_ProgressStage']:Progress({
    duration = duration,
    useWhileDead = useWhileDead,
    canCancel = canCancel,
    controlDisables = disableControls,
    animation = animation,
    prop = prop,
    propTwo = propTwo,
    icon = icon,
    dialogues = dialogues,
}, function(cancelled)
    if not cancelled then
        if onFinish then
            onFinish()
        end
    else
        if onCancel then
            onCancel()
        end
    end
end)
```

## Parameters
- `duration` - The time in milliseconds that the progress stage will take to complete. Default
- `useWhileDead` - Whether or not the progress stage can be used while the player is dead. Default: `false`
- `canCancel` - Whether or not the progress stage can be cancelled. Default: `true`
- `disableControls` - A table of controls to disable while the progress stage is active. Default: `{ disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }`
- `animation` - A table containing the animation details. Default: `{ animDict = 'missheistdockssetup1clipboard@base', anim = 'base', flags = 33 }`
- `prop` - A table containing the prop details. Default: `{ model = 'prop_notepad_01', bone = 18905, coords = { x = 0.1, y = 0.02, z = 0.05 }, rotation = { x = 10.0, y = 0.0, z = 0.0 } }`
- `propTwo` - A table containing the second prop details. Default: `{ model = 'prop_pencil_01', bone = 58866, coords = { x = 0.11, y = -0.02, z = 0.001 }, rotation = { x = -120.0, y = 0.0, z = 0.0 } }`
- `icon` - A table containing the icon details. Default: `{ name = "fa-duotone fa-building-columns", ringColor = 'rgb(255,0,0)', iconColor = 'red', invimg = 'phone' }`
- `dialogues` - A table containing the dialogues (Max 5 Dialogues Only). Default: `{ 'Entering Personal Credentials', 'Checking In...', 'Getting Stretcher...' }`
- `onFinish` - A function to execute when the progress stage is completed.
- `onCancel` - A function to execute when the progress stage is cancelled.

## Integration

# Add to `qb-core -> client -> function.lua`

Add the following function to your `function.lua` file in the specified location:

```lua
function QBCore.Functions.ProgressStage(duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, icon, dialogues, onFinish, onCancel)
    if GetResourceState('BC_ProgressStage') ~= 'started' then
        error('BC_ProgressStage needs to be started for QBCore.Functions.ProgressStage to work')
        return false
    end

    exports['BC_ProgressStage']:Progress({
        duration = duration,
        useWhileDead = useWhileDead,
        canCancel = canCancel,
        controlDisables = disableControls,
        animation = animation,
        prop = prop,
        propTwo = propTwo,
        icon = icon,
        dialogues = dialogues,
    }, function(cancelled)
        if not cancelled then
            if onFinish then
                onFinish()
            end
        else
            if onCancel then
                onCancel()
            end
        end
    end)
end
```

## Example

Here's a simple example demonstrating how to use the ProgressStage function in QBCore:

```lua
QBCore.Functions.ProgressStage(2000, false, true, {
    disableMovement = true,
    disableCarMovement = false,
    disableMouse = false,
    disableCombat = true,
}, {
    animDict = 'missheistdockssetup1clipboard@base',
    anim = 'base',
    flags = 33,
}, {
    model = 'prop_notepad_01',
    bone = 18905,
    coords = { x = 0.1, y = 0.02, z = 0.05 },
    rotation = { x = 10.0, y = 0.0, z = 0.0 },
}, {
    model = 'prop_pencil_01',
    bone = 58866,
    coords = { x = 0.11, y = -0.02, z = 0.001 },
    rotation = { x = -120.0, y = 0.0, z = 0.0 },
}, {
    name = "fa-duotone fa-building-columns",
    ringColor = 'rgb(255,0,0)',
    iconColor = 'red',
    invimg = 'phone'    -- Any Inventory Image
}, {
    'Entering Personal Credentials',
    'Checking In...',
    'Getting Stretcher...',
}, function() -- On completion
    local bedId = GetAvailableBed()
    if bedId then
        DocCall = 0
        TriggerServerEvent("hospital:server:SendToBed", bedId, true)
    else
        QBCore.Functions.Notify(Lang:t('error.beds_taken'), "error")
    end
    Wait(2000)
    antiflag = false
end, function() -- On cancellation
    QBCore.Functions.Notify(Lang:t('error.canceled'), "error")
    Wait(2000)
    antiflag = false
end)
```