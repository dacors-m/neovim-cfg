local wk = require("which-key")

wk.register({
  w = "Write file",  
  q = "Quit",
  u = "Undo history",
  h = {
    name = " Harpoon",
    h = "Harpoon window",
    a = "Add file to Harpoon",
  },
  y = "Yank on clipboard",
  [";"] = "Hover deffinition",
  x = "Little zsh terminal", 
  r = {
    name = " Rename",  
    a = "Rename all (base in current word)",
    v = "Rename variable (lsp)",
  },
  g = {
    name = " Go & Git",
    a = "Go alternate to test file in split window",
    d = "Go to deffinition",
    i = "Go to implementation",
    r = "Go to references",
    t = "Go test current pkg",
    c = "Go coverage current pkg",
    s = "Git file diff",
    g = "Git window",
  },
  p = {
    name = " Project",
    f = "Find file",
    s = "Grep search",
    v = "Toggle project view",
  }
}, { prefix = "<leader>" })

wk.register(mappings, opts)

