local colors = {
  black = "#000000",

  bg0 = "#000000",
  bg1 = "#111111",
  bg2 = "#222222",
  bg3 = "#333333",
  bg4 = "#444444",
  bg5 = "#282C34",

  bg_red = "#FE6D85",
  bg_green = "#98C379",
  bg_blue = "#9FBBF3",

  diff_red = "#FE6D85",
  diff_green = "#587738",
  diff_blue = "#2A3A5A",
  diff_add = "#1E2326",
  diff_change = "#262B3D",
  diff_delete = "#281B27",
  diff_text = "#1C4474",

  -- fg = "#A2AACE",
  fg = "#ABABAB",
  red = "#EE6D85",
  orange = "#F6955B",
  yellow = "#D7A65F",
  light_green = "#C6DE41",
  green = "#95C561",
  dark_green = "#608030",
  blue = "#7199EE",
  cyan = "#38A89D",
  teal = "#00A0A9",
  purple = "#A485DD",
  grey = "#4A5057",
  light_grey = "#6C727A",
  light_ligth_grey = "#AAAAAA",
  white = "#F0F0F0",
  none = "NONE",
}

local highlights = {
  Fg = { fg = colors.fg },
  Grey = { fg = colors.grey },
  Red = { fg = colors.red },
  Orange = { fg = colors.orange },
  Yellow = { fg = colors.yellow },
  Green = { fg = colors.green },
  Blue = { fg = colors.blue },
  Purple = { fg = colors.purple },
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
  Directory = { fg = colors.green },
  ErrorMsg = { fg = colors.red, underline = true },
  WarningMsg = { fg = colors.yellow },
  MoreMsg = { fg = colors.blue, },
  IncSearch = { fg = colors.bg0, bg = colors.bg_red },
  Search = { fg = colors.bg0, bg = colors.bg_green },
  CurSearch = { fg = colors.bg0, bg = colors.bg_red },
  MatchParen = { fg = colors.none, bg = colors.bg4 },
  NonText = { fg = colors.bg4 },
  Whitespace = { fg = colors.bg4 },
  SpecialKey = { fg = colors.bg4 },
  Pmenu = { fg = colors.fg, bg = colors.bg0 },
  PmenuSbar = { fg = colors.none, bg = colors.bg0 },
  PmenuSel = { fg = colors.bg0, bg = colors.bg_green },
  PmenuThumb = { fg = colors.none, bg = colors.bg2 },
  WildMenu = { fg = colors.bg0, bg = colors.blue },
  Question = { fg = colors.yellow },
  SpellBad = { fg = colors.red, underline = true, sp = colors.red },
  SpellCap = { fg = colors.yellow, underline = true, sp = colors.yellow },
  SpellLocal = { fg = colors.blue, underline = true, sp = colors.blue },
  SpellRare = { fg = colors.purple, underline = true, sp = colors.purple },
  StatusLine = { fg = colors.fg, bg = colors.bg2 },
  StatusLineTerm = { fg = colors.fg, bg = colors.bg2 },
  StatusLineNC = { fg = colors.grey, bg = colors.bg1 },
  StatusLineTermNC = { fg = colors.grey, bg = colors.bg1 },
  TabLine = { fg = colors.fg, bg = colors.bg4 },
  TabLineFill = { fg = colors.grey, bg = colors.bg1 },
  TabLineSel = { fg = colors.bg0, bg = colors.bg_red },
  WinSeparator = { fg = colors.bg5 },
  VertSplit = { fg = colors.bg5 },
  Visual = { bg = colors.bg2 },
  VisualNOS = { fg = colors.none, bg = colors.bg2, underline = true },
  QuickFixLine = { fg = colors.blue, underline = true },
  Debug = { fg = colors.yellow },
  debugPC = { fg = colors.bg0, bg = colors.green },
  debugBreakpoint = { fg = colors.bg0, bg = colors.red },
  ToolbarButton = { fg = colors.bg0, bg = colors.bg_blue },
  FocusedSymbol = { bg = colors.bg3 },
  FloatBorder = { fg = colors.bg4 },
  FloatTitle = { fg = colors.blue },

  Type = { fg = colors.white },
  TypeBulitin = { fg = colors.light_grey },
  Structure = { fg = colors.green },
  StorageClass = { fg = colors.none },
  Identifier = { fg = colors.none },
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
  SpecialChar = { fg = colors.dark_green },
  Boolean = { fg = colors.dark_green },
  String = { fg = colors.dark_green },
  Character = { fg = colors.none },
  Number = { fg = colors.dark_green },
  Float = { fg = colors.dark_green },
  Function = { fg = colors.green },
  Operator = { fg = colors.white },
  Title = { fg = colors.none },
  Tag = { fg = colors.none },
  Delimiter = { fg = colors.none },
  Comment = { fg = colors.light_ligth_grey },
  SpecialComment = { fg = colors.none },
  Todo = { fg = colors.none },

  -- blankline
  Blankline = { fg = colors.bg1 },

  -- diffview
  DiffviewFilePanelTitle = { fg = colors.blue },
  DiffviewFilePanelCounter = { fg = colors.purple },
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
  DiffviewFilePanelInsertions = { fg = colors.green },
  DiffviewFilePanelDeletions = { fg = colors.red },
  DiffviewStatusAdded = { fg = colors.green },
  DiffviewStatusUntracked = { fg = colors.blue },
  DiffviewStatusModified = { fg = colors.blue },
  DiffviewStatusRenamed = { fg = colors.blue },
  DiffviewStatusCopied = { fg = colors.blue },
  DiffviewStatusTypeChange = { fg = colors.blue },
  DiffviewStatusUnmerged = { fg = colors.blue },
  DiffviewStatusUnknown = { fg = colors.red },
  DiffviewStatusDeleted = { fg = colors.red },
  DiffviewStatusBroken = { fg = colors.red },

  -- comments
  commentTSDanger = { fg = colors.red },
  commentTSNote = { fg = colors.blue },
  commentTSWarning = { fg = colors.yellow },

  -- lsp
  LspCxxHlGroupEnumConstant = { fg = colors.orange },
  LspCxxHlGroupMemberVariable = { fg = colors.orange },
  LspCxxHlGroupNamespace = { fg = colors.blue },
  LspCxxHlSkippedRegion = { fg = colors.grey },
  LspCxxHlSkippedRegionBeginEnd = { fg = colors.red },
  LspDiagnosticsDefaultError = { fg = colors.red },
  LspDiagnosticsDefaultHint = { fg = colors.purple },
  LspDiagnosticsDefaultInformation = { fg = colors.blue },
  LspDiagnosticsDefaultWarning = { fg = colors.yellow },
  LspDiagnosticsUnderlineError = { underline = true, sp = colors.red },
  LspDiagnosticsUnderlineHint = {
    underline = true,
    sp = colors.purple,
  },
  LspDiagnosticsUnderlineInformation = {
    underline = true,
    sp = colors.blue,
  },
  LspDiagnosticsUnderlineWarning = {
    underline = true,
    sp = colors.yellow,
  },
  DiagnosticSignError = { fg = colors.red },
  DiagnosticSignHint = { fg = colors.purple },
  DiagnosticSignInfo = { fg = colors.blue },
  DiagnosticSignWarn = { fg = colors.yellow },
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
  GitSignsAdd = { fg = colors.green },
  GitSignsAddLn = { fg = colors.green },
  GitSignsAddNr = { fg = colors.green },
  GitSignsChange = { fg = colors.blue },
  GitSignsChangeLn = { fg = colors.blue },
  GitSignsChangeNr = { fg = colors.blue },
  GitSignsDelete = { fg = colors.red },
  GitSignsDeleteLn = { fg = colors.red },
  GitSignsDeleteNr = { fg = colors.red },

  --nvim-tree
  NvimTreeGitNewIcon = { fg = colors.blue },
  NvimTreeGitIdnoreIcon = { fg = colors.light_ligth_grey },
  NvimTreeGitStagedIcon = { fg = colors.purple },
  NvimTreeGitMergeIcon = { fg = colors.orange },
  NvimTreeGitChangedIcon = { fg = colors.yellow },
  NvimTreeGitDirtyIcon = { fg = colors.red },
  NvimTreeGitDeletedIcon = { fg = colors.red },

  -- telescope
  TelescopeBorder = { link = "FloatBorder" },
  TelescopePreviewBorder = { fg = colors.bg4 },
  TelescopePreviewTitle = { fg = colors.blue },
  TelescopePromptBorder = { fg = colors.bg4 },
  TelescopePromptTitle = { fg = colors.blue },
  TelescopeResultsBorder = { fg = colors.bg4 },
  TelescopeResultsTitle = { fg = colors.blue },

  -- markdown
  markdownBlockquote = { fg = colors.grey },
  markdownBold = { fg = colors.none, bold = true },
  markdownBoldDelimiter = { fg = colors.grey },
  markdownCode = { fg = colors.yellow },
  markdownCodeBlock = { fg = colors.yellow },
  markdownCodeDelimiter = { fg = colors.grey },
  markdownH1 = { fg = colors.yellow, bold = true },
  markdownH2 = { fg = colors.yellow, bold = true },
  markdownH3 = { fg = colors.yellow, bold = true },
  markdownH4 = { fg = colors.yellow, bold = true },
  markdownH5 = { fg = colors.yellow, bold = true },
  markdownH6 = { fg = colors.yellow, bold = true },
  markdownHeadingDelimiter = { fg = colors.grey },
  markdownHeadingRule = { fg = colors.grey },
  markdownId = { fg = colors.yellow },
  markdownIdDeclaration = { fg = colors.yellow },
  markdownItalic = { fg = colors.none, italic = true },
  markdownItalicDelimiter = { fg = colors.grey, italic = true },
  markdownLinkDelimiter = { fg = colors.grey },
  markdownLinkText = { fg = colors.purple, underline = true },
  markdownLinkTextDelimiter = { fg = colors.grey },
  markdownListMarker = { fg = colors.purple },
  markdownOrderedListMarker = { fg = colors.purple },
  markdownRule = { fg = colors.purple },
  markdownUrl = { fg = colors.blue, underline = true },
  markdownUrlDelimiter = { fg = colors.grey },
  markdownUrlTitleDelimiter = { fg = colors.purple },
  ["@markup"] = { link = "@none" },
  ["@markucolors.heading"] = { fg = colors.yellow, bold = true },
  ["@markucolors.link.label"] = { fg = colors.purple, underline = true },
  ["@markucolors.link.url"] = { fg = colors.blue, underline = true },
  ["@markucolors.list"] = { fg = colors.purple },
  ["@markucolors.list.checked"] = { fg = colors.blue },
  ["@markucolors.list.unchecked"] = { fg = colors.blue },
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

  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_9 = colors.red

  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_10 = colors.green

  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_11 = colors.yellow

  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_12 = colors.blue

  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_13 = colors.purple

  vim.g.terminal_color_6 = colors.orange
  vim.g.terminal_color_14 = colors.orange
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
