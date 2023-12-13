require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false
        },
        follow_current_file = {
            enabled = true,
            leave_dirs_open = true
        },
    },
    buffers = {
        follow_current_file = {
            enabled = true,
            leave_dirs_open = true
        }
    }
})
