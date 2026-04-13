-- Theme Palette: Ghost (gray-purple base, distinct accent hues)
-- Edit THIS file to change the entire color scheme.
-- Every highlight in the editor references these names.

return {
  -- Backgrounds
  bg = "#0c0b10",
  surface = "#17151e",
  gutter = "#111015",
  overlay = "#221f2b",
  visual = "#2c2838",

  -- Foreground scale (bright → dim)
  fg = "#c4bdd4",       -- washed lavender (body text)
  dim = "#584f6a",      -- muted purple-gray (comments, receded)
  muted = "#443d55",    -- deeper mute
  faint = "#252230",    -- near-invisible (guides, separators)

  -- Accent hues (each a distinct ghostly color)
  rose = "#a899cc",        -- lilac (keywords, logic — the signature ghost purple)
  rose_bright = "#a8c4a0", -- sage green (strings, literals)
  rose_hot = "#c46878",    -- muted red (errors, preprocessor)

  -- Supporting colors (distinct hues for readability)
  iris = "#7ea0b8",      -- steel blue (types, modules)
  gold = "#c4a87a",      -- muted amber (warnings)
  foam = "#7aab9a",      -- teal (links, redirections)
  pine = "#85b594",      -- sage green (search accent)
  fn_call = "#d4a8b8",   -- ghost pink (function calls)

  -- Functional (git, diagnostics)
  error = "#c46878",
  warn = "#c4a87a",
  info = "#7ea0b8",
  hint = "#584f6a",
  git_add = "#85b594",
  git_change = "#7ea0b8",
  git_delete = "#c46878",
}
