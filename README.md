# siir_craftingLocations
<p align='center'>SiiR Crafting Locations For Use With <a href='https://github.com/WeaselRP/weasel-crafting'>Weasel Crafting</a></p>

## WIP
I understand it would be easier to handle the passing of item in each resource but my plan for this is to replace 'Level' with a database check for XP system

* XP Gain can be set in config per item and triggered with server event
* Currently using XP Gain with <a href='https://github.com/WeaselRP/weasel-crafting'>Weasel Crafting</a> server/main.lua craftItem event TriggerEvent('siir_craftingLocations:updateXp', xPlayer, data.Item.XPGain * data.Amount)