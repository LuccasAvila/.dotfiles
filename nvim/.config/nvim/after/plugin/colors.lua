require("tokyonight").setup({
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
})

function ColorMyPencils(color)
  color = color or "tokyonight"
  vim.cmd.colorscheme(color)
end

ColorMyPencils()

