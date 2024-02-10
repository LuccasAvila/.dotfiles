return  {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  cmd = { 'FlutterRun', 'FlutterDevTools', 'FlutterCopyProfilerUrl', 'FlutterDevToolsActivate' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    flutter_lookup_cmd = "asdf where flutter"
  },
}
