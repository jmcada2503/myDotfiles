vim.g.slime_target = 'tmux'
-- '{last}' = the last active pane other than the current one, in the current session
vim.g.slime_default_config = {
    -- $TMUX = "<socket_path>,<pid>,<session_index>"; use the socket nvim is actually attached to
    socket_name = vim.split(vim.env.TMUX or '', ',')[1],
    target_pane = '{last}',
}
-- Use slime_default_config instead of prompting every time
vim.g.slime_dont_ask_default = 1
