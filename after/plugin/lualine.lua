require('nvim-web-devicons').get_icons()
require('lualine').setup({
    options = { 
        section_separators = '', 
        component_separators = '',
        icons_enabled = true,
    },
    sections = {
        lualine_b = {
            {
                'branch',
                icons_enable = true,
            }
        },
        lualine_c = {
            {
                'filename',
                icons_enable = true,
                path = 1
            }
        },
        lualine_x = {
            {
                'diff',
            }
        },
        lualine_y = {
            {
                'filetype',
                colored = true,
                icon_only = false,
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

