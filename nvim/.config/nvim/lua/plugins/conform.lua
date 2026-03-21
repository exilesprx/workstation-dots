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
    },
    formatters = {
      oxfmt = {
        condition = function(self, ctx)
          return vim.fs.find({ ".oxfmtrc.json", ".oxfmtrc.jsonc" }, { path = ctx.filename, upward = true })[1]
        end,
      },
      prettier = {
        condition = function(self, ctx)
          return vim.fs.find({ ".prettierrc.json" }, { path = ctx.filename, upward = true })[1]
        end,
      },
    },
  },
}
