return {
    "azratul/live-share.nvim",
    dependencies = { "jbyuki/instant.nvim" },
    config = function()
        vim.g.instant_username = "neonid0"

        require("live-share").setup({
            service = "ngrok", -- use ngrok (most stable)
            port = 8765, -- default server port
            max_attempts = 200, -- retry more times before giving up
            tcp_domain = "tcp.ngrok.io", -- for TCP tunnels
        })
    end,
}
