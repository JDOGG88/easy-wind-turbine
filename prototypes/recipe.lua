local function create_recipe(version)
    local cr = {}
    cr.type = "recipe"
    cr.name = "wind-turbine-" .. version
    cr.enabled = false
    cr.result = cr.name
    if version == 1 then
        cr.energy_required = 5
        cr.ingredients = {
            { "electronic-circuit", 1 },
            { "engine-unit", 1 },
            { "iron-gear-wheel", 4 },
            { "steel-plate", 10 }
        }
    elseif version == 2 then
        cr.energy_required = 10
        cr.ingredients = {
            { "advanced-circuit", 4 },
            { "electric-engine-unit", 4 },
            { "iron-gear-wheel", 8 },
            { "steel-plate", 20 }
        }
    elseif version == 3 then
        cr.energy_required = 10
        cr.ingredients = {
            { "advanced-circuit", 5 },
            { "processing-unit", 1 },
            { "electric-engine-unit", 10 },
            { "iron-gear-wheel", 20 },
            { "steel-plate", 40 }
        }
    end
    return cr
end

data:extend({
    create_recipe(1),
    create_recipe(2),
    create_recipe(3),
})
