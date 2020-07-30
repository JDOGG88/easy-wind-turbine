local function create_technology(version, time)
    local ct = {}
    ct.type = "technology"
    ct.name = "wind-turbine-" .. version
    ct.icon = "__easy-wind-turbine__/graphics/wind-turbine-" .. version .. "-tech.png"
    ct.icon_size = 128
    ct.effects = { { type = "unlock-recipe", recipe = "wind-turbine-" .. version } }
    ct.unit = { count = 50, time = time }
    if version == 1 then
        ct.unit.ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } }
    elseif version == 2 then
        ct.unit.ingredients = { { "automation-science-pack", 3 }, { "logistic-science-pack", 3 }, { "chemical-science-pack", 3 } }
    elseif version == 3 then
        ct.unit.ingredients = { { "automation-science-pack", 4 }, { "logistic-science-pack", 4 }, { "chemical-science-pack", 4 }, { "utility-science-pack", 4 } }
    end
    return ct
end

data:extend({
    create_technology(1, 10),
    create_technology(2, 15),
    create_technology(3, 20),
})
