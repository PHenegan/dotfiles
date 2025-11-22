require('Comment').setup({
  toggler = {
    line = "<leader>cc",
    block = "<leader>bc"
  },
  opleader = {
    -- visual mode 
    line = "<leader>cc",
    block = "<leader>bc"
  },
  extra = {
    -- Adding a comment above, below, or at the end of the current line
    above = "<leader>ck",
    below = "<leader>cj",
    eol = "<leader>cl"
  }
})
