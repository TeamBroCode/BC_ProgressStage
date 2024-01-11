<h1 align="center"><a href="https://discord.gg/brocode" target="_blank" rel="noopener noreferrer">Brocode ProgressStage</a></h1>

The ProgressStage is a standalone script. This script, designed to enhance progress stage functionalities, comes with additional features specifically tailored for QBCore. The README provides comprehensive details on integration and usage, including support for Inventory Images and Font Awesome Pro version 6.5.1 Icons.

## Features

-   Progress Stage with Inventory Images
-   Progress Stage with Font Awesome Pro Icons
-   Progress Stage with Customizable Settings
-   Progress Stage with Customizable Dialogues

## Installation

1. Download the script.
2. Add the script to your resources folder.
3. Add `ensure BC_ProgressStage` to your server.cfg file.
4. Restart your server.

## Preview

https://github.com/TeamBroCode/BC_ProgressStage/assets/91739770/01506d94-9e2b-41ed-90de-1f04cbfe862a

## Usage

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

-   `duration` - The duration in milliseconds for the progress stage to complete. Default value is not specified.
-   `useWhileDead` - A boolean indicating whether the progress stage can be used while the player is dead. Default: `false`.
-   `canCancel` - A boolean indicating whether the progress stage can be canceled. Default: `true`.
-   `disableControls` - A table specifying controls to disable while the progress stage is active. Default: `{ disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }`.
-   `animation` - A table containing animation details. Default: `{ animDict = 'missheistdockssetup1clipboard@base', anim = 'base', flags = 33 }`.
-   `prop` - A table with prop details. Default: `{ model = 'prop_notepad_01', bone = 18905, coords = { x = 0.1, y = 0.02, z = 0.05 }, rotation = { x = 10.0, y = 0.0, z = 0.0 } }`.
-   `propTwo` - A table with details for a second prop. Default: `{ model = 'prop_pencil_01', bone = 58866, coords = { x = 0.11, y = -0.02, z = 0.001 }, rotation = { x = -120.0, y = 0.0, z = 0.0 } }`.
-   `icon` - A table specifying icon details. Default: `{ name = "far fa-bars-progress", ringColor = 'rgb(255,255,255)', iconColor = 'white' }`.
-   `dialogues` - A table containing dialogues (up to a maximum of 5). Default: `{ 'Entering Personal Credentials', 'Checking In...', 'Getting Stretcher...' }`.
-   `onFinish` - A function to execute when the progress stage is successfully completed.
-   `onCancel` - A function to execute when the progress stage is canceled.

The following parameters are passed into the icon table: (optional parameters, otherwise, it takes the default values mentioned)

-   `name` - The name of the icon to use. Default: `far fa-bars-progress`. Supports Font Awesome Pro Icons.
-   `ringColor` - The color of the ring. Default: `white`. Supports RGB and Hex Colors.
-   `iconColor` - The color of the icon. Default: `white`. Supports RGB and Hex Colors.
-   `invimg` - The inventory image to use. Supports any inventory image or, if provided, an HTTPS image link.

**Note:** Ensure that you follow the specified format and guidelines when providing values for these parameters.

## Integration (Only for QBCore)

### Add to `qb-core -> client -> function.lua`

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

### Example

Here's a simple example demonstrating how to use the ProgressStage function in QBCore:

```lua
QBCore.Functions.ProgressStage(2000, false, true, {     -- Time | useWhileDead | canCancel
    disableMovement = true,
    disableCarMovement = false,
    disableMouse = false,
    disableCombat = true,
}, { -- Animation table (optional params)
    animDict = 'missheistdockssetup1clipboard@base',
    anim = 'base',
    flags = 33,
}, { -- Prop table (optional params)
    model = 'prop_notepad_01',
    bone = 18905,
    coords = { x = 0.1, y = 0.02, z = 0.05 },
    rotation = { x = 10.0, y = 0.0, z = 0.0 },
}, { -- PropTwo table (optional params)
    model = 'prop_pencil_01',
    bone = 58866,
    coords = { x = 0.11, y = -0.02, z = 0.001 },
    rotation = { x = -120.0, y = 0.0, z = 0.0 },
}, {    -- Icon table
    name = "far fa-bars-progress",
    ringColor = 'rgb(255,0,0)',
    iconColor = 'red',
    invimg = 'phone'    -- Any Inventory Image or Https Image (Optional)
}, { -- Dialogue table (Mandatory params / Maximum 5 Dialogues Only)
    'Entering Personal Credentials',
    'Checking In...',
    'Getting Stretcher...',
}, function() -- On completion
    Completion()
end, function() -- On cancellation
    Cancel()
end)
```

## FAQ

**Why is the script not working?** <br>
Ensure that you have followed all instructions and added everything correctly to your configuration and client files. If the issue persists, please open an GitHub issue for further assistance.

**How do I change the default settings?** <br>
You can modify the default settings in the config.lua file. Ensure that you adhere to the correct format.

**How do I change the default settings for a specific progress stage?** <br>
You can change the default settings for a specific progress stage by passing a table with the settings as the first parameter of the function. Make sure to use the correct format.

**How do I change the default settings for a specific progress stage without changing the default settings?** <br>
You can change the default settings for a specific progress stage by passing a table with the settings as the first parameter of the function. Make sure to use the correct format.

**How do I use the Inventory Images?** <br>
You can utilize any inventory image by adding it to your inventory images folder. Use the image name as the invimg parameter. If the invimg is added, it will take precedence over the specified icon, displaying only the inventory image.

**How do I use the Font Awesome Icons?** <br>
You can use any Font Awesome icon you want. Just make sure to use the correct name of the icon as the `name` parameter. You can find the name of the icon on the [Font Awesome website](https://fontawesome.com/icons).

## Support

If you need any help, feel free to join my [Discord Server](https://discord.gg/brocode) and create a ticket in the support channel.
