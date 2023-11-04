
function ColorMyPencils(color)
    color = "tokyonight"
    vim.cmd.colorscheme(color)

    --vim.api.nvim.set_hl(0, "Normal", {bg = "none" })
    --vim.api.nvim.set_hl(0, "NormalFloat", {bg = "none" })
end 

ColorMyPencils() 

