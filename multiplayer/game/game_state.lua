local M = {}

---@class game_state
---@field current_state function
---@field set_state function
---@field create_player function
---@field remove_player function

local state = {}

---@return game_state
function M.create()
    local instance = {}

    state.players = {}
    state.players_to_remove = {}

    function instance.current_state()
        return state.players
    end

    function instance.to_remove()
        return state.players_to_remove
    end

    function instance.set_state(players)
        if players ~= nil then
            state.players = players
        end
    end

    function instance.create_player(ip, position)
        if not position then
            -- local default_position = vmath.vector3(568, 320, 0)
            local default_position = vmath.vector3(0, 0, 0)
            position = default_position
        end

        state.players[ip] = {
            position = {
                x = position.x,
                y = position.y,
                z = position.z,
            },
            velocity = {
                x = 0,
                y = 0,
                z = 0,
            }
        }

        state.players_to_remove[ip] = nil
    end

    function instance.remove_player(ip)
        state.players_to_remove[ip] = true
        state.players[ip] = nil
    end

    function instance.check_as_removed(ip)
        state.players_to_remove[ip] = nil
    end

    function instance.set_position(ip, position)
        if not state.players[ip] then return end
        state.players[ip].position = {
            x = position.x,
            y = position.y,
            z = position.z,
        }
    end

    function instance.move_player(ip, velocity)
        if not state.players[ip] then return end
        state.players[ip].velocity = {
            x = velocity.x,
            y = velocity.y,
            z = velocity.z,
        }
    end

    return instance
end

return M
