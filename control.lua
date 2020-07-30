local turbine = {
    "wind-turbine-1",
    "wind-turbine-2",
    "wind-turbine-3",
}

script.on_event(defines.events.on_gui_opened, function(event)
    local player = game.get_player(event.player_index)
    local entity = player.selected
    for _, name in pairs(turbine) do
        if entity and entity.name == name then
            player.opened = defines.gui_type.none
        end
    end
end)
