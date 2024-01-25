require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            hide_by_name = {
                "node_modules",
                "git",
            },
            visible = true,
        },
        follow_current_file = {
            enabled = true,
            leave_dirs_open = false
        },
   },
    buffers = {
        follow_current_file = {
            enabled = true,
            leave_dirs_open = true
        }
    }
})

vim.keymap.set("n", "<leader>nt", "<cmd>Neotree toggle<cr>")
