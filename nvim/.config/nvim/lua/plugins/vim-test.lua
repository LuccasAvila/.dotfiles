return {
  'vim-test/vim-test',
  cmds = { 'TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit' },
  keys = {
    { '<leader>tn', '<cmd>TestNearest<cr>', desc = "Test Nearest" },
    { '<leader>tf', '<cmd>TestFile<cr>', desc = "Test File" },
    { '<leader>ts', '<cmd>TestSuite<cr>', desc = "Test Suite" },
    { '<leader>tl', '<cmd>TestLast<cr>', desc = "Test Last" },
    { '<leader>tv', '<cmd>TestVisit<cr>', desc = "Test Visit" }
  }
}
