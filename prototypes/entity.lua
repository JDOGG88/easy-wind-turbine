local function layers(direction, tint)
    local shift = { 2.5, -1.5 }
    return {
        layers = {
            {
                filename = "__easy-wind-turbine__/graphics/wind-turbine-" .. direction .. "-base.png",
                width = 300,
                height = 175,
                frame_count = 20,
                line_length = 5,
                shift = shift
            },
            {
                filename = "__easy-wind-turbine__/graphics/wind-turbine-" .. direction .. "-mask.png",
                width = 300,
                height = 175,
                frame_count = 20,
                line_length = 5,
                shift = shift,
                tint = tint,
            },
            {
                filename = "__easy-wind-turbine__/graphics/wind-turbine-" .. direction .. "-shadow.png",
                width = 300,
                height = 175,
                frame_count = 20,
                line_length = 5,
                draw_as_shadow = true,
                shift = shift
            },
        }
    }
end

local function animations(tint)
    return {
        north = layers("horizontal", tint),
        east = layers("vertical", tint),
        south = layers("horizontal", tint),
        west = layers("vertical", tint)
    }
end

local function create_entity(version, tint)
    local buffer = 16.67
    local production = 1
    local ce = {}
    ce.type = "electric-energy-interface"
    ce.name = "wind-turbine-" .. version
    ce.icon = "__easy-wind-turbine__/graphics/wind-turbine-" .. version .. "-icon.png"
    ce.icon_size = 64
    ce.minable = { mining_time = 0.5, result = ce.name }
    ce.max_health = 400
    ce.corpse = "big-remnants"
    ce.dying_explosion = "medium-explosion"
    ce.fast_replaceable_group = "wind-turbine"
    ce.collision_mask = { "item-layer", "object-layer", "water-tile" }
    ce.collision_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }
    ce.selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }
    ce.drawing_box = { { -1, -3 }, { 1, 0.25 } }
    ce.gui_mode = "none"
    ce.resistances = {
        { type = "fire", percent = 20 },
        { type = "physical", percent = 20 },
        { type = "impact", percent = 30 }
    }
    ce.energy_source = {
        type = "electric",
        usage_priority = "primary-output"
    }
    if version == 1 then
        ce.energy_source.buffer_capacity = (buffer) .. "kJ"
        ce.energy_production = (production) .. "MW"
    elseif version == 2 then
        ce.energy_source.buffer_capacity = (buffer * 4) .. "kJ"
        ce.energy_production = (production * 4) .. "MW"
    elseif version == 3 then
        ce.energy_source.buffer_capacity = (buffer * 10) .. "kJ"
        ce.energy_production = (production * 10) .. "MW"
    end
    ce.localised_name = { "entity-name.wind-turbine", "" .. version .. "" }
    ce.localised_description = { "entity-description.wind-turbine", ce.energy_production }
    ce.continuous_animation = true
    ce.animations = animations(tint)
    ce.flags = { "placeable-neutral", "player-creation" }
    ce.working_sound = {
        sound = { filename = "__base__/sound/train-wheels.ogg", volume = 0.4 },
        idle_sound = { filename = "__base__/sound/train-wheels.ogg", volume = 0.25 },
        max_sounds_per_type = 10,
    }
    return ce
end

local v1_tint = { r = 1, g = 1, b = 0 }
local v2_tint = { r = 1, g = 0, b = 0 }
local v3_tint = { r = 0, g = 0, b = 1 }

data:extend({
    create_entity(1, v1_tint),
    create_entity(2, v2_tint),
    create_entity(3, v3_tint),
})
