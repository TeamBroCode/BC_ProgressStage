Config = {}

-- Set the core framework being used (e.g., 'QBCore') and its associated name
Config.Core = 'QBCore'      -- QBCore or Standalone
Config.CoreName = 'qb-core' -- if QBCore then enter your CoreName else leave it false

-- Configure support for custom inventories, if applicable (Currently Supports qb-inventory, ps-inventory, ox_inventory)
Config.Inventory = false        -- Set to 'inventoryName' for custom inventory support (e.g., qs-inventory)
Config.InventoryImgLink = false -- Set a custom image link for the inventory (e.g., nui://ps-inventory/html/)

-- Define default settings for the progress stage
Config.Default = {
    icon = 'far fa-bars-progress', -- Default FontAwesome icon for the progress stage
    iconColor = 'white',           -- Default color for the progress stage icon
    ringColor = 'white',           -- Default color for the progress stage ring
}