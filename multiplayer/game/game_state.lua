local M = {}

---@class game_state
---@field current_state function
---@field set_state function

local state = {}

---@return game_state
function M.create()
    local instance = {}

    state.players = {}

    function instance.current_state()
        return state.players
    end

    function instance.set_state(players)
        state.players = players
    end

    return instance
end

return M