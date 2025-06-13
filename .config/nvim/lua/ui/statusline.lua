-- Config taken from https://github.com/mcauley-penney/nvim/blob/main/lua/ui/statusline.lua

local M = {}

local api, fn, bo = vim.api, vim.fn, vim.bo
local get_opt = api.nvim_get_option_value

local status, miniIcons = pcall(require, "mini.icons")
if not status then
    return
end

-- files and directories -----------------------------
local branch_cache = setmetatable({}, { __mode = "k" })
local remote_cache = setmetatable({}, { __mode = "k" })


local function git_cmd(root, ...)
  -- tiny helper that returns stdout or nil+err
  local job = vim.system({ "git", "-C", root, ... }, { text = true }):wait()
  if job.code ~= 0 then return nil, job.stderr end
  return vim.trim(job.stdout)
end

local tools = {
    ui = {
        icons = {
            -- branch = "",
            branch = " ",
            repo = " ",
            bullet = "•",
            open_bullet = "○",
            ok = "✔",
            d_chev = "∨",
            ellipses = "…",
            node = "╼ ",
            document = "≡",
            lock = "",
            r_chev = ">",
            error = "ⓧ ",
            warning = "⚠ ",
            info = "ⓘ ",
        }
    },
    nonprog_modes = {
        ["markdown"] = true,
        ["org"] = true,
        ["orgagenda"] = true,
        ["text"] = true,
    },
    hl_str = function(hl, str)
        return "%#" .. hl .. "#" .. str .. "%*"
    end,
    get_path_root = function(path)
        if path == "" then return end

        local root = vim.b.path_root
        if root then return root end

        local root_items = {
            ".git",
        }

        root = vim.fs.root(path, root_items)
        if root == nil then return nil end
        if root then vim.b.path_root = root end
        return root
    end,
    get_git_remote_name = function(root)
        if not root then return nil end
        if remote_cache[root] then return remote_cache[root] end

        local out = git_cmd(root, "config", "--get", "remote.origin.url")
        if not out then return nil end

        -- normalise to short repo name
        out = out:gsub(":", "/"):gsub("%.git$", ""):match("([^/]+/[^/]+)$")

        remote_cache[root] = out
        return out
    end,
    get_git_branch = function(root)
        if not root then return nil end
        if branch_cache[root] then return branch_cache[root] end

        local out = git_cmd(root, "rev-parse", "--abbrev-ref", "HEAD")
        if out == "HEAD" then out = git_cmd(root, "rev-parse", "--short", "HEAD") end
        branch_cache[root] = out
        return out
    end,
    diagnostics_available = function()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        local diagnostics = vim.lsp.protocol.Methods.textDocument_publishDiagnostics

        for _, cfg in pairs(clients) do
            if cfg:supports_method(diagnostics) then return true end
        end

        return false
    end,
    group_number = function(num, sep)
        if num < 999 then return tostring(num) end

        num = tostring(num)
        return num:reverse():gsub("(%d%d%d)", "%1" .. sep):reverse():gsub("^,", "")
    end
}


--- plugin begins here

local icons = tools.ui.icons
local mini_icons = miniIcons

local HL = {
    repo = { "ModeMsg", icons.repo },
    branch = { "ModeMsg", icons.branch },
    file = { "NonText", icons.node },
    fileinfo = { "NonText", icons.document },
    nomodifiable = { "DiagnosticWarn", icons.bullet },
    modified = { "DiagnosticError", icons.bullet },
    readonly = { "DiagnosticWarn", icons.lock },
    error = { "DiagnosticError", icons.error },
    warn = { "DiagnosticWarn", icons.warning },
    visual = { "DiagnosticInfo", "‹› " },
}

local ICON = {}
for k, v in pairs(HL) do
    ICON[k] = tools.hl_str(v[1], v[2])
end

local ORDER = {
    "pad",
    "path",
    "venv",
    "mod",
    "ro",
    "sep",
    "diag",
    "fileinfo",
    "pad",
    "scrollbar",
    "pad",
}

local PAD = " "
local SEP = "%="
local SBAR =
{ "▔", "🮂", "🬂", "🮃", "▀", "▄", "▃", "🬭", "▂", "▁" }

-- utilities -----------------------------------------
local function concat(parts)
    local out, i = {}, 1
    for _, k in ipairs(ORDER) do
        local v = parts[k]
        if v and v ~= "" then
            out[i] = v
            i = i + 1
        end
    end
    return table.concat(out, " ")
end

local function esc_str(str)
    return str:gsub("([%(%)%%%+%-%*%?%[%]%^%$])", "%%%1")
end

-- path and git info -----------------------------------------
local function path_widget(root, fname)
    local file_name = fn.fnamemodify(fname, ":t")
    local f_icon, hl = mini_icons.get("file", file_name)
    f_icon = file_name ~= "" and tools.hl_str(hl, f_icon) or ""
    local icon_name = f_icon .. file_name

    if bo.buftype == "help" then return ICON.file .. icon_name end

    local remote = tools.get_git_remote_name(root)
    local branch = tools.get_git_branch(root)
    local dir_path = fn.fnamemodify(fname, ":h") .. "/"

    local repo_info = ""
    if remote and branch then
        dir_path = dir_path:gsub("^" .. esc_str(root) .. "/", "")
        repo_info = string.format("%s %s  %s %s   ", ICON.repo, remote, ICON.branch, branch)
    end

    local win_w = api.nvim_win_get_width(0)
    local need = #repo_info + #dir_path + #icon_name
    if win_w < need + 15 then dir_path = "" end
    if win_w < need - #dir_path + 10 then repo_info = "" end

    return repo_info .. ICON.file .. dir_path .. icon_name
end

-- diagnostics ---------------------------------------------
local function diagnostics_widget()
    if not tools.diagnostics_available() then return "" end
    local diag_count = vim.diagnostic.count()
    local err, warn = diag_count[1] or 0, diag_count[2] or 0
    return string.format("%s %-3d  %s %-3d  ", ICON.error, err, ICON.warn, warn)
end

-- file/selection info -------------------------------------
local function fileinfo_widget()
    local ft = get_opt("filetype", {})
    local lines = tools.group_number(api.nvim_buf_line_count(0), ",")
    local str

    if not tools.nonprog_modes[ft] then
        str = string.format("  %3s lines", lines)
        return ICON.fileinfo .. tools.hl_str("NonText", str)
    end

    local wc = fn.wordcount()
    if not wc.visual_words then
        str = string.format(
            "%3s lines  %3s words",
            lines,
            tools.group_number(wc.words, ",")
        )
        return tools.hl_str("NonText", str)
    end

    local vlines = math.abs(fn.line(".") - fn.line("v")) + 1
    str = string.format(
        "%3s lines  %3s words  %5s chars",
        tools.group_number(vlines, ","),
        tools.group_number(wc.visual_words, ","),
        tools.group_number(wc.visual_chars, ",")
    )

    return tools.hl_str("NonText", str)
end

-- python venv ---------------------------------------------
local function venv_widget()
    if bo.filetype ~= "python" then return "" end
    local env = vim.env.VIRTUAL_ENV
    if env and env ~= "" then
        return string.format(
            "'.venv': %s  ",
            tools.hl_str("Comment", fn.fnamemodify(env, ":t"))
        )
    end
    env = vim.env.CONDA_DEFAULT_ENV
    if env and env ~= "" then
        return string.format("conda: %s  ", tools.hl_str("Comment", env))
    end
    return tools.hl_str("Comment", "[no venv]")
end

-- scrollbar ---------------------------------------------
local function scrollbar_widget()
    local cur = api.nvim_win_get_cursor(0)[1]
    local total = api.nvim_buf_line_count(0)
    local idx = math.floor((cur - 1) / total * #SBAR) + 1
    return tools.hl_str("FloatBorder", SBAR[idx]:rep(2))
end

-- render ---------------------------------------------
function M.render()
    local fname = api.nvim_buf_get_name(0)
    local root = (bo.buftype == "" and tools.get_path_root(fname)) or nil
    if bo.buftype ~= "" and bo.buftype ~= "help" then fname = bo.ft end

    local buf = api.nvim_win_get_buf(vim.g.statusline_winid)

    local parts = {
        pad = PAD,
        path = path_widget(root, fname),
        venv = venv_widget(),
        mod = get_opt("modifiable", { buf = buf })
        and (get_opt("modified", { buf = buf }) and ICON.modified or " ")
        or ICON.nomodifiable,
        ro = get_opt("readonly", { buf = buf }) and ICON.readonly or "",
        sep = SEP,
        diag = diagnostics_widget(),
        fileinfo = fileinfo_widget(),
        scrollbar = scrollbar_widget(),
    }

    return concat(parts)
end

vim.o.statusline = "%!v:lua.require('ui.statusline').render()"

return M
