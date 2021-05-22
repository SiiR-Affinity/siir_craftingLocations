Config = {}

Config.Locations = {
    MethCut = {
        Coords = vector3(120.38, -1971.20, 21.30),
        Items = {
            {
                Name = "crystal_meth_bag",
                DisplayName = "Cut Crystal Meth",
                Quantity = 1,
                MetaData = {},
                Time = 3000,
                Level = 1,
                Recipe = {
                    {'Crystal Meth', 'crystal_meth_bulk', 1, {}, true},
                    {'Gram Bag', 'gram_bag', 1, {}, true}
                }
            }
        }
    },
    -- Example = {
    --     Coords = vector3(118.81, -1966.08, 21.30),
    --     Items = {
    --         {
    --             Name = "bacon_fries",
    --             DisplayName = "Bacon Fries",
    --             Quantity = 1,
    --             MetaData = {},
    --             Time = 3000,
    --             Level = 1,
    --             Recipe = {
    --                 {'Bacon', 'bacon', 1, {}, true}
    --             }
    --         }
    --     }
    -- },
}
