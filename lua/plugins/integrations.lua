return {
  {
    "rest-nvim/rest.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("rest-nvim").setup({
        result_split_horizontal = false,
        result_split_in_place = false,
        stay_in_current_window_after_split = false,
        skip_ssl_verification = false,
        encode_url = true,
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          show_url = true,
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          show_statistics = false,
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end,
          },
        },
        jump_to_request = false,
        env_file = ".env",
        custom_dynamic_variables = {},
        yank_dry_run = true,
        search_back = true,
      })
    end,
    keys = {
      {
        "\\r",
        "<Plug>RestNvim",
        desc = "Test the current HTTP request",
      },
    },
  },
  -- LazyGit integration for Git commands
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { ";c", ":LazyGit<Return>", silent = true, noremap = true },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Database management with vim-dadbod-ui
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
    keys = {
      { "<leader>d", "<cmd>NeoTreeClose<cr><cmd>tabnew<cr>|<cmd>DBUI<cr>", desc = "Open DBUI" },
    },
  },
}
