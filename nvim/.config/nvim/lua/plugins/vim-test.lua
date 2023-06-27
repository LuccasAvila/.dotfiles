return {
  'vim-test/vim-test',
  cmds = { 'TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit' },
  keys = {
    { '<leader>t', '<cmd>TestNearest<cr>', desc = "Test Nearest" },
    { '<leader>T', '<cmd>TestFile<cr>', desc = "Test File" },
    { '<leader>a', '<cmd>TestSuite<cr>', desc = "Test Suite" },
    { '<leader>l', '<cmd>TestLast<cr>', desc = "Test Last" },
    { '<leader>g', '<cmd>TestVisit<cr>', desc = "Test Visit" }
  }
}
