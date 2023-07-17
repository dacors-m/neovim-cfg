require('lualine').setup({
    options = { section_separators = '', component_separators = '' },
    sections = {
        lualine_b = {
            {
                'branch',
                icons_enable = true,
                icon = ''
            }
        },
        lualine_x = {
            {
                'diff',
            }
        },
        lualine_z = {
            {
                'datetime',
                style = '%Y-%b-%w %I:%M %p'
            }
        }
    }
})
