return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      ["lua"] = { "stylua" },
      ["php"] = { "php_cs_fixer" },
      ["sh"] = { "shfmt" },
      ["zsh"] = { "beautysh" },
    },
    formatters = {
      oxfmt = {
        condition = function(_, ctx)
          return vim.fs.find({ ".oxfmtrc.json", ".oxfmtrc.jsonc" }, { path = ctx.filename, upward = true })[1]
        end,
      },
      prettier = {
        condition = function(_, ctx)
          return not vim.fs.find({ ".oxfmtrc.json", ".oxfmtrc.jsonc" }, { path = ctx.filename, upward = true })[1]
        end,
      },
    },
  },
}
