-- Table with garbage I don't wanna write twice
local M = {}

M.exe_exists = function(path_to_executable)
    return vim.fn.executable(path_to_executable) == 1
end

M.get_exe_if_exists = function(path_to_executable)
    return M.exe_exists(path_to_executable) and path_to_executable or nil
end

M._cmd = function(cmd_str)
    return "<cmd>" .. cmd_str .. "<cr>"
end

M._excmd = function(cmd_str)
    return ":" .. cmd_str .. "<cr>"
end

-- This function only registers the key combo with a name
-- It is purely for displaying the keybindings in whichkey
M.register_group_with_whichkey = function(keybindings, name, mode)
    local wk_status, wk = pcall(require, "which-key")
    -- If whichkey is not available then do nothing
    if not wk_status then
        return
    end

    wk.register({ [keybindings] = { name = name } }, {
        mode = mode or "n",
    })
end

return M
