local function bootstrap(url, ref)
  local name = url:gsub(".*/", "")
  local path

  path = vim.fn.stdpath("data") .. "/lazy/" .. name
  vim.opt.rtp:prepend(path)

  if vim.fn.isdirectory(path) == 0 then
    print(name .. ": installing in data dir...")

    vim.fn.system { "git", "clone", url, path }
    if ref then
      vim.fn.system { "git", "-C", path, "checkout", ref }
    end

    vim.cmd "redraw"
    print(name .. ": finished installing")
  end
end

bootstrap("https://github.com/folke/lazy.nvim")
bootstrap("https://github.com/udayvir-singh/tangerine.nvim")
bootstrap("https://github.com/udayvir-singh/hibiscus.nvim")

require("tangerine").setup {
  rtpdirs = {
    "plugin",
    "colors",
  },
  compiler = {
    verbose = false,
    hooks = { "onsave", "oninit" }
  }

}
