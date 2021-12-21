local actions = require('telescope.actions')
local actions_state = require('telescope.actions.state')
local action_set = require('telescope.actions.set')
local custom_actions = { }

-- Telescope keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap('n', '<Leader>fE', ':lua require("telescope.builtin").file_browser({ hidden = true, cwd = "$HOME" })<CR>', opts)
keymap('n', '<Leader>fe', ':lua require("telescope.builtin").file_browser({ hidden = true })<CR>', opts)
keymap('n', '<Leader>fF', ":lua require('plugins.telescope').search_home()<CR>", opts)
keymap('n', '<Leader>ff', ":lua require('plugins.telescope').search_current()<CR>", opts)
keymap('n', '<Leader>fD', ":lua require('plugins.telescope').Cd('$HOME')<CR>", opts)
keymap('n', '<Leader>fd', ":lua require('plugins.telescope').Cd()<CR>", opts)
keymap('n', '<Leader>fr', ':Telescope live_grep<CR>', opts)
keymap('n', '<Leader>fg', ':Telescope git_files<CR>', opts)
keymap('n', '<Leader>fb', ':Telescope buffers<CR>', opts)
keymap('n', '<Leader>fs', ':Telescope sessions<CR>', opts)
keymap('n', '<Leader>fq', ':Telescope quickfix<CR>', opts)
keymap('n', '<Leader>fl', ':Telescope loclist<CR>', opts)

function custom_actions._multiopen(prompt_bufnr, open_cmd)
    local picker = actions_state.get_current_picker(prompt_bufnr)
    local num_selections = #picker:get_multi_selection()
    if num_selections > 1 then
        local cwd = picker.cwd
        if cwd == nil then
            cwd = ""
        else
            cwd = string.format("%s/", cwd)
        end
        vim.cmd("bw!") -- wipe the prompt buffer
        for _, entry in ipairs(picker:get_multi_selection()) do
            vim.cmd(string.format("%s %s%s", open_cmd, cwd, entry.value))
        end
        vim.cmd('stopinsert')
    else
        if open_cmd == "vsplit" then
            actions.file_vsplit(prompt_bufnr)
        elseif open_cmd == "split" then
            actions.file_split(prompt_bufnr)
        elseif open_cmd == "tabe" then
            actions.file_tab(prompt_bufnr)
        else
            actions.file_edit(prompt_bufnr)
        end
    end
end
function custom_actions.multi_selection_open_vsplit(prompt_bufnr)
    custom_actions._multiopen(prompt_bufnr, "vsplit")
end
function custom_actions.multi_selection_open_split(prompt_bufnr)
    custom_actions._multiopen(prompt_bufnr, "split")
end
function custom_actions.multi_selection_open_tab(prompt_bufnr)
    custom_actions._multiopen(prompt_bufnr, "tabe")
end
function custom_actions.multi_selection_open(prompt_bufnr)
    custom_actions._multiopen(prompt_bufnr, "edit")
end

local cdPicker = function(name, cmd)
    require('telescope.pickers').new({}, {
        prompt_title = name,
        finder = require('telescope.finders').new_table{ results = require('telescope.utils').get_os_command_output(cmd) },
        previewer = require('telescope.previewers').vim_buffer_cat.new({}),
        sorter = require('telescope.sorters').get_fuzzy_file(),
        attach_mappings = function(prompt_bufnr)
            require('telescope.actions.set').select:replace(function(_, type)
                local entry = actions_state.get_selected_entry()
                actions.close(prompt_bufnr)
                local dir = require('telescope.from_entry').path(entry)
                vim.cmd('cd '..dir)
            end)
            return true
        end,
    }):find()
end

require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzf_sorter,
        prompt_prefix = ' > ',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

		layout_strategy = "flex",
		-- layout_strategy = "horizontal",

		layout_config = {
			preview_cutoff = 10,
			horizontal = {
				width = { padding = 0.05 },
				height = { padding = 0.05 },
				preview_width = 0.6,
			},
			vertical = {
				width = { padding = 0.05 },
				height = { padding = 0.05 },
				preview_height = 0.4,
			}
		},

        mappings = {
            i = {
                -- ["<C-x>"] = false,
                ["<C-q>"] = actions.smart_send_to_qflist,
		-- ["<Esc>"] = actions.close,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
				["<C-l>"] = actions.add_selection,
				["<C-h>"] = actions.remove_selection,
                ["<C-b>"] = custom_actions.multi_selection_open,
                ["<C-v>"] = custom_actions.multi_selection_open_vsplit,
                ["<C-x>"] = custom_actions.multi_selection_open_split,
                ["<C-t>"] = custom_actions.multi_selection_open_tab,
            },
			n = {
                ["<C-b>"] = custom_actions.multi_selection_open,
                ["<C-v>"] = custom_actions.multi_selection_open_vsplit,
                ["<C-x>"] = custom_actions.multi_selection_open_split,
                ["<C-t>"] = custom_actions.multi_selection_open_tab,
            }
        }
    },
    extensions = {
        fzf = {
			fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
			case_mode = "smart_case",
        }
    }
}

-- require("telescope").load_extension("git_worktree")
-- require('telescope').load_extension('fzy_native')
require('telescope').load_extension('fzf')

local M = {}

M.Cd = function(path)
    path = path or '.'
    cdPicker('Cd', { vim.o.shell, '-c', "fd . "..path.." -t d -H --ignore-file " .. vim.fn.expand("$HOME/.config/ignore/vim-ignore") })
end


M.search_home = function()
    require("telescope.builtin").find_files({
        prompt_title = "< ~ >",
        cwd = vim.fn.expand('$HOME'),
		hidden = true,
		find_command = { 'fd', '--ignore-file', vim.fn.expand('$HOME/.config/ignore/vim-ignore'), '-t', 'f', '-H' },
    })
end

M.search_current = function()
    require("telescope.builtin").find_files({
        prompt_title = "< . >",
		hidden = true,
		find_command = { 'fd', '--ignore-file', vim.fn.expand('$HOME/.config/ignore/vim-ignore'), '-t', 'f', '-H' },
    })
end

            -- map(mode, key, lua function to call)
            --
            -- good place to look: telescope.actions (init.lua)
            -- lua function to call:  (gets bufnr, not necessarily needed)
            --   require('telescope.actions.state').get_selected_entry(bufnr)
            --   Actions just take the bufnr and give out information
            --   require('telescope.actions').close(bufnr)
            --
            --   check out telescope.actions for _all the available_ supported
            --   actions.
            --
            --   :h telescope.setup ->
            --   :h telescope.builtin ->
            --   :h telescope.layout ->
            --   :h telescope.actions
            --

return M
