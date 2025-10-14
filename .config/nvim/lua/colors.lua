local colors = {
  black = "#000000",

  bg0 = "#000000",
  bg1 = "#111111",
  bg2 = "#222222",
  bg3 = "#333333",
  bg4 = "#444444",
  bg5 = "#282C34",

  -- Alacritty colors
  bright_black = "#333333",
  bright_red = "#FE6D85",
  bright_green = "#95C561",
  bright_yellow = "#A7C65F",
  bright_blue = "#648CE1",
  bright_magenta = "#A485DD",
  bright_cyan = "#A7D65F",
  bright_white = "#F0F0F0",

  normal_black = "#333333",
  normal_red = "#EE6D85",
  normal_green = "#608030",
  normal_yellow = "#A7C65F",
  normal_blue = "#648CE1",
  normal_magenta = "#A485DD",
  normal_cyan = "#A7D65F",
  normal_white = "#AAAAAA",

  diff_red = "#FE6D85",
  diff_green = "#587738",
  diff_blue = "#2A3A5A",
  diff_add = "#1E2326",
  diff_change = "#262B3D",
  diff_delete = "#281B27",
  diff_text = "#1C4474",

  fg = "#ABABAB",
  orange = "#F6955B",
  grey = "#4A5057",
  light_grey = "#6C727A",
  light_ligth_grey = "#AAAAAA",
  none = "NONE",
}

local highlights = {
  Fg = { fg = colors.fg },
  Grey = { fg = colors.grey },
  Red = { fg = colors.normal_red },
  Orange = { fg = colors.orange },
  Yellow = { fg = colors.normal_yellow },
  Green = { fg = colors.bright_green },
  Blue = { fg = colors.normal_blue },
  Purple = { fg = colors.normal_magenta },
  Normal = { fg = colors.fg, bg = colors.bg0 },
  NormalNC = { fg = colors.fg, bg = colors.bg0 },
  NormalSB = { fg = colors.fg, bg = colors.bg0 },
  NormalFloat = { fg = colors.fg, bg = colors.bg0 },
  Terminal = { fg = colors.fg, bg = colors.bg0 },
  EndOfBuffer = { fg = colors.bg2, bg = colors.bg0 },
  FoldColumn = { fg = colors.fg, bg = colors.bg1 },
  Folded = { fg = colors.fg, bg = colors.bg1 },
  SignColumn = { fg = colors.fg, bg = colors.bg0 },
  ToolbarLine = { fg = colors.fg },
  Cursor = { reverse = true },
  vCursor = { reverse = true },
  iCursor = { reverse = true },
  lCursor = { reverse = true },
  CursorIM = { reverse = true },
  CursorColumn = { bg = colors.bg1 },
  CursorLine = { bg = colors.bg1 },
  ColorColumn = { bg = colors.bg1 },
  CursorLineNr = { fg = colors.fg },
  LineNr = { fg = colors.bg4 },
  Conceal = { fg = colors.grey, bg = colors.bg1 },
  DiffAdd = { fg = colors.none, bg = colors.diff_add },
  DiffChange = { fg = colors.none, bg = colors.diff_change },
  DiffDelete = { fg = colors.none, bg = colors.diff_delete },
  DiffText = { fg = colors.none, bg = colors.diff_text },
  Directory = { fg = colors.bright_green },
  ErrorMsg = { fg = colors.normal_red, underline = true },
  WarningMsg = { fg = colors.normal_yellow },
  MoreMsg = { fg = colors.normal_blue, },
  IncSearch = { fg = colors.bg0, bg = colors.bright_red },
  Search = { fg = colors.bg0, bg = colors.normal_yellow },
  CurSearch = { fg = colors.bg0, bg = colors.bright_red },
  MatchParen = { fg = colors.none, bg = colors.bg4 },
  NonText = { fg = colors.bg4 },
  Whitespace = { fg = colors.bg4 },
  SpecialKey = { fg = colors.bg4 },
  Pmenu = { fg = colors.fg, bg = colors.bg0 },
  PmenuSbar = { fg = colors.none, bg = colors.bg0 },
  PmenuSel = { fg = colors.bg0, bg = colors.normal_yellow },
  PmenuThumb = { fg = colors.none, bg = colors.bg2 },
  WildMenu = { fg = colors.bg0, bg = colors.normal_blue },
  Question = { fg = colors.normal_yellow },
  SpellBad = { fg = colors.normal_red, underline = true, sp = colors.normal_red },
  SpellCap = { fg = colors.normal_yellow, underline = true, sp = colors.normal_yellow },
  SpellLocal = { fg = colors.normal_blue, underline = true, sp = colors.normal_blue },
  SpellRare = { fg = colors.normal_magenta, underline = true, sp = colors.normal_magenta },
  StatusLine = { fg = colors.fg, bg = colors.bg2 },
  StatusLineTerm = { fg = colors.fg, bg = colors.bg2 },
  StatusLineNC = { fg = colors.grey, bg = colors.bg1 },
  StatusLineTermNC = { fg = colors.grey, bg = colors.bg1 },
  TabLine = { fg = colors.fg, bg = colors.bg4 },
  TabLineFill = { fg = colors.grey, bg = colors.bg1 },
  TabLineSel = { fg = colors.bg0, bg = colors.bright_red },
  WinSeparator = { fg = colors.bg5 },
  VertSplit = { fg = colors.bg5 },
  Visual = { bg = colors.bg2 },
  VisualNOS = { fg = colors.none, bg = colors.bg2, underline = true },
  QuickFixLine = { fg = colors.normal_blue, underline = true },
  Debug = { fg = colors.normal_yellow },
  debugPC = { fg = colors.bg0, bg = colors.bright_green },
  debugBreakpoint = { fg = colors.bg0, bg = colors.normal_red },
  ToolbarButton = { fg = colors.bg0, bg = colors.normal_blue },
  FocusedSymbol = { bg = colors.bg3 },
  FloatBorder = { fg = colors.bg4 },
  FloatTitle = { fg = colors.normal_blue },

  Type = { fg = colors.bright_white },
  TypeBulitin = { fg = colors.light_grey },
  Structure = { fg = colors.bright_green },
  StorageClass = { fg = colors.none },
  Identifier = { fg = colors.light_ligth_grey },
  Constant = { fg = colors.light_ligth_grey },
  PreProc = { fg = colors.none },
  PreCondit = { fg = colors.none },
  Include = { fg = colors.none },
  Keyword = { fg = colors.light_grey },
  Define = { fg = colors.none },
  Typedef = { fg = colors.none },
  Exception = { fg = colors.none },
  Conditional = { fg = colors.light_grey },
  Repeat = { fg = colors.light_grey },
  Statement = { fg = colors.light_grey },
  Macro = { fg = colors.none },
  Error = { fg = colors.none },
  Label = { fg = colors.none },
  Special = { fg = colors.light_grey },
  SpecialChar = { fg = colors.normal_green },
  Boolean = { fg = colors.normal_green },
  String = { fg = colors.normal_green },
  Character = { fg = colors.none },
  Number = { fg = colors.normal_green },
  Float = { fg = colors.normal_green },
  Function = { fg = colors.bright_green },
  Method = { fg = colors.bright_green },
  Operator = { fg = colors.bright_white },
  Title = { fg = colors.none },
  Tag = { fg = colors.none },
  Delimiter = { fg = colors.none },
  Comment = { fg = colors.light_ligth_grey },
  SpecialComment = { fg = colors.none },
  Todo = { fg = colors.none },

  -- blankline
  Blankline = { fg = colors.bg1 },

  -- diffview
  DiffviewFilePanelTitle = { fg = colors.normal_blue },
  DiffviewFilePanelCounter = { fg = colors.normal_magenta },
  DiffviewFilePanelFileName = { fg = colors.fg },
  DiffviewNormal = { link = "Normal" },
  DiffviewCursorLine = { link = "CursorLine" },
  DiffviewVertSplit = { link = "VertSplit" },
  DiffviewSignColumn = { link = "SignColumn" },
  DiffviewStatusLine = { link = "StatusLine" },
  DiffviewStatusLineNC = { link = "StatusLineNC" },
  DiffviewEndOfBuffer = { link = "EndOfBuffer" },
  DiffviewFilePanelRootPath = { fg = colors.grey },
  DiffviewFilePanelPath = { fg = colors.grey },
  DiffviewFilePanelInsertions = { fg = colors.bright_green },
  DiffviewFilePanelDeletions = { fg = colors.normal_red },
  DiffviewStatusAdded = { fg = colors.bright_green },
  DiffviewStatusUntracked = { fg = colors.normal_blue },
  DiffviewStatusModified = { fg = colors.normal_blue },
  DiffviewStatusRenamed = { fg = colors.normal_blue },
  DiffviewStatusCopied = { fg = colors.normal_blue },
  DiffviewStatusTypeChange = { fg = colors.normal_blue },
  DiffviewStatusUnmerged = { fg = colors.normal_blue },
  DiffviewStatusUnknown = { fg = colors.normal_red },
  DiffviewStatusDeleted = { fg = colors.normal_red },
  DiffviewStatusBroken = { fg = colors.normal_red },

  -- comments
  commentTSDanger = { fg = colors.normal_red },
  commentTSNote = { fg = colors.normal_blue },
  commentTSWarning = { fg = colors.normal_yellow },

  -- lsp
  LspDiagnosticsDefaultError = { fg = colors.normal_red },
  LspDiagnosticsDefaultHint = { fg = colors.normal_magenta },
  LspDiagnosticsDefaultInformation = { fg = colors.normal_blue },
  LspDiagnosticsDefaultWarning = { fg = colors.normal_yellow },
  LspDiagnosticsUnderlineError = { underline = true, sp = colors.normal_red },
  LspDiagnosticsUnderlineHint = {
    underline = true,
    sp = colors.normal_magenta,
  },
  LspDiagnosticsUnderlineInformation = {
    underline = true,
    sp = colors.normal_blue,
  },
  LspDiagnosticsUnderlineWarning = {
    underline = true,
    sp = colors.normal_yellow,
  },
  DiagnosticSignError = { fg = colors.normal_red },
  DiagnosticSignHint = { fg = colors.normal_magenta },
  DiagnosticSignInfo = { fg = colors.normal_blue },
  DiagnosticSignWarn = { fg = colors.normal_yellow },
  LspReferenceRead = { bg = colors.bg3 },
  LspReferenceWrite = { bg = colors.bg3 },
  LspReferenceText = { bg = colors.bg3 },
  LspInfoBorder = { fg = colors.bg4 },

  -- lsp semantic tokens
  LspNamespace = { link = "@namespace" },
  LspType = { link = "@type" },
  LspClass = { link = "@type" },
  LspEnum = { link = "@constant" },
  LspInterface = { link = "@constant" },
  LspStruct = { link = "@constant" },
  LspTypeParameter = { link = "@type" },
  LspParameter = { link = "@parameter" },
  LspVariable = { link = "@variable" },
  LspProperty = { link = "@property" },
  LspEnumMember = { link = "@constant" },
  LspEvent = { link = "@constant" },
  LspFunction = { link = "@function" },
  LspMethod = { link = "@method" },
  LspMacro = { link = "@constant.macro" },
  LspKeyword = { link = "@keyword" },
  LspModifier = { link = "TSModifier" },
  LspComment = { link = "@comment" },
  LspString = { link = "@string" },
  LspNumber = { link = "@number" },
  LspRegexp = { link = "@string.regex" },
  LspOperator = { link = "@operator" },
  LspDecorator = { link = "@symbol" },
  LspDeprecated = { link = "@text.strike" },
  ["@lscolors.type.namespace"] = { link = "@namespace", default = true },
  ["@lscolors.type.type"] = { link = "@type", default = true },
  ["@lscolors.type.class"] = { link = "@type", default = true },
  ["@lscolors.type.enum"] = { link = "@type", default = true },
  ["@lscolors.type.interface"] = { link = "@type", default = true },
  ["@lscolors.type.struct"] = { link = "@structure", default = true },
  ["@lscolors.type.parameter"] = { link = "@parameter", default = true },
  ["@lscolors.type.variable"] = { link = "@variable", default = true },
  ["@lscolors.type.property"] = { link = "@property", default = true },
  ["@lscolors.type.enumMember"] = { link = "@constant", default = true },
  ["@lscolors.type.function"] = { link = "@function", default = true },
  ["@lscolors.type.method"] = { link = "@method", default = true },
  ["@lscolors.type.macro"] = { link = "@macro", default = true },
  ["@lscolors.type.decorator"] = { link = "@function", default = true },

  -- gitsigns
  GitSignsAdd = { fg = colors.bright_green },
  GitSignsAddLn = { fg = colors.bright_green },
  GitSignsAddNr = { fg = colors.bright_green },
  GitSignsChange = { fg = colors.normal_blue },
  GitSignsChangeLn = { fg = colors.normal_blue },
  GitSignsChangeNr = { fg = colors.normal_blue },
  GitSignsDelete = { fg = colors.normal_red },
  GitSignsDeleteLn = { fg = colors.normal_red },
  GitSignsDeleteNr = { fg = colors.normal_red },

  --nvim-tree
  NvimTreeGitNewIcon = { fg = colors.normal_blue },
  NvimTreeGitIdnoreIcon = { fg = colors.light_ligth_grey },
  NvimTreeGitStagedIcon = { fg = colors.normal_magenta },
  NvimTreeGitMergeIcon = { fg = colors.orange },
  NvimTreeGitChangedIcon = { fg = colors.normal_yellow },
  NvimTreeGitDirtyIcon = { fg = colors.normal_red },
  NvimTreeGitDeletedIcon = { fg = colors.normal_red },

  -- telescope
  TelescopeBorder = { link = "FloatBorder" },
  TelescopePreviewBorder = { fg = colors.bg4 },
  TelescopePreviewTitle = { fg = colors.normal_blue },
  TelescopePromptBorder = { fg = colors.bg4 },
  TelescopePromptTitle = { fg = colors.normal_blue },
  TelescopeResultsBorder = { fg = colors.bg4 },
  TelescopeResultsTitle = { fg = colors.normal_blue },

  -- markdown
  markdownBlockquote = { fg = colors.grey },
  markdownBold = { fg = colors.none, bold = true },
  markdownBoldDelimiter = { fg = colors.grey },
  markdownCode = { fg = colors.normal_yellow },
  markdownCodeBlock = { fg = colors.normal_yellow },
  markdownCodeDelimiter = { fg = colors.grey },
  markdownH1 = { fg = colors.normal_yellow, bold = true },
  markdownH2 = { fg = colors.normal_yellow, bold = true },
  markdownH3 = { fg = colors.normal_yellow, bold = true },
  markdownH4 = { fg = colors.normal_yellow, bold = true },
  markdownH5 = { fg = colors.normal_yellow, bold = true },
  markdownH6 = { fg = colors.normal_yellow, bold = true },
  markdownHeadingDelimiter = { fg = colors.grey },
  markdownHeadingRule = { fg = colors.grey },
  markdownId = { fg = colors.normal_yellow },
  markdownIdDeclaration = { fg = colors.normal_yellow },
  markdownItalic = { fg = colors.none, italic = true },
  markdownItalicDelimiter = { fg = colors.grey, italic = true },
  markdownLinkDelimiter = { fg = colors.grey },
  markdownLinkText = { fg = colors.normal_magenta, underline = true },
  markdownLinkTextDelimiter = { fg = colors.grey },
  markdownListMarker = { fg = colors.normal_magenta },
  markdownOrderedListMarker = { fg = colors.normal_magenta },
  markdownRule = { fg = colors.normal_magenta },
  markdownUrl = { fg = colors.normal_blue, underline = true },
  markdownUrlDelimiter = { fg = colors.grey },
  markdownUrlTitleDelimiter = { fg = colors.normal_magenta },
  ["@markup"] = { link = "@none" },
  ["@markucolors.heading"] = { fg = colors.normal_yellow, bold = true },
  ["@markucolors.link.label"] = { fg = colors.normal_magenta, underline = true },
  ["@markucolors.link.url"] = { fg = colors.normal_blue, underline = true },
  ["@markucolors.list"] = { fg = colors.normal_magenta },
  ["@markucolors.list.checked"] = { fg = colors.normal_blue },
  ["@markucolors.list.unchecked"] = { fg = colors.normal_blue },
  ["@markucolors.strikethrough"] = { strikethrough = true },
  ["@markucolors.strong"] = { bold = true },
  ["@markucolors.italic"] = { italic = true },
  ["@markucolors.underline"] = { underline = true },
}

local function load_highlights()
  for group_name, group_settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group_name, group_settings)
  end

  vim.g.terminal_color_0 = colors.black
  vim.g.terminal_color_8 = colors.bg2

  vim.g.terminal_color_7 = colors.fg
  vim.g.terminal_color_15 = colors.fg

  vim.g.terminal_color_1 = colors.normal_red
  vim.g.terminal_color_9 = colors.bright_red

  vim.g.terminal_color_2 = colors.normal_green
  vim.g.terminal_color_10 = colors.normal_green

  vim.g.terminal_color_3 = colors.normal_yellow
  vim.g.terminal_color_11 = colors.normal_yellow

  vim.g.terminal_color_4 = colors.normal_blue
  vim.g.terminal_color_12 = colors.normal_blue

  vim.g.terminal_color_5 = colors.normal_magenta
  vim.g.terminal_color_13 = colors.normal_magenta

  vim.g.terminal_color_6 = colors.bright_green
  vim.g.terminal_color_14 = colors.bright_green
end

local M = {}
M.setup = function()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "custom"
  if vim.g.neovide then
    vim.o.guifont = "Monaco:h10"
    vim.g.neovide_position_animation_length = 0.1
    vim.g.neovide_scroll_animation_length = 0.1
    vim.g.neovide_refresh_rate = 120
  end
  load_highlights()
end
return M
