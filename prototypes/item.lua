local function create_item(version)
    local ci = table.deepcopy(data.raw.item.substation)
    ci.type = "item"
    ci.name = "wind-turbine-" .. version
    ci.icon = "__easy-wind-turbine__/graphics/wind-turbine-" .. version .. "-icon.png"
    ci.icon_size = 64
    ci.group = "logistics"
    ci.subgroup = "energy"
    ci.order = "b[steam-power]-c[wind-turbine]"
    ci.place_result = ci.name
    ci.stack_size = 100
    if version == 1 then
        ci.localised_description = { "entity-description.wind-turbine", "1MW" }
    elseif version == 2 then
        ci.localised_description = { "entity-description.wind-turbine", "4MW's" }
    elseif version == 3 then
        ci.localised_description = { "entity-description.wind-turbine", "10MW's" }
    end
    ci.localised_name = { "entity-name.wind-turbine", "" .. version .. "" }
    return ci
end

data:extend({
    create_item(1),
    create_item(2),
    create_item(3),
})
