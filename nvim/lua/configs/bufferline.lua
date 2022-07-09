local present, bufferline = pcall(require, "bufferline")

if not present then return end

bufferline.setup({
    options = {
        buffer_close_icon = "×",
        close_icon = "×",
        right_trunc_marker = "→",
        left_trunc_marker = "←",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
                padding = 1
            }
        }
    }
})
