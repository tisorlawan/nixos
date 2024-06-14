return {
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "yioneko/nvim-yati" },
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "vim",
        "vimdoc",
        "markdown_inline",
        "markdown",
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "ruby" },
      },
      indent = { enable = true, disable = { "python", "css", "rust" } },
      yati = {
        enable = true,
        disable = { "rust" },
        default_lazy = true,
        default_fallback = "auto",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.install").prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  -- {
  --   "rayliwell/tree-sitter-rstml",
  --   dependencies = { "nvim-treesitter" },
  --   build = ":TSUpdate",
  --   config = function()
  --     require("tree-sitter-rstml").setup()
  --   end,
  -- },
  -- Experimental automatic tag closing and renaming (optional)
  {
    "rayliwell/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
