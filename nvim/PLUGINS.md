# Neovim 插件列表

本文档列出了所有已安装的 Neovim 插件、功能说明以及常用快捷键。

## 基本快捷键

### 通用快捷键
| 按键 | 功能 |
|------|------|
| `<Esc>` | 清除搜索高亮 |
| `<leader>q` | 打开诊断 Quickfix 列表 |
| `<C-h>` / `<C-l>` / `<C-j>` / `<C-k>` | 在窗口之间移动（左/右/下/上） |

### 终端模式
| 按键 | 功能 |
|------|------|
| `<Esc><Esc>` | 退出终端模式 |

## 核心插件

### 插件管理器
- **lazy.nvim** - 现代化的 Neovim 插件管理器，提供高效的插件加载和管理功能

**常用命令：**
| 命令 | 功能 |
|------|------|
| `:Lazy` | 打开插件管理界面 |
| `:Lazy update` | 更新所有插件 |
| `:Lazy clean` | 清理未使用的插件 |
| `:Lazy sync` | 同步插件状态 |
| `:Lazy health` | 检查插件健康状态 |

## 代码编辑增强

### 语法高亮和解析
- **nvim-treesitter/nvim-treesitter**
  - 基于解析器的语法高亮，提供更精确的代码着色
  - 支持增量选择、缩进改进等功能
  - 自动安装和更新语言解析器

**常用命令：**
| 命令 | 功能 |
|------|------|
| `:TSUpdate` | 更新所有已安装的语言解析器 |
| `:TSInstallInfo` | 查看已安装的语言 |
| `:TSInstall <language>` | 安装指定语言的解析器 |
| `:TSUninstall <language>` | 卸载指定语言的解析器 |

### 自动完成
- **saghen/blink.cmp**
  - 快速的补全引擎，提供智能代码补全
  - 支持 LSP、路径、片段等多种补全源
  - 包含签名帮助窗口显示函数参数

**快捷键（在补全菜单中）：**
| 按键 | 功能 |
|------|------|
| `<C-n>` / `<C-p>` | 选择下一个/上一个项目 |
| `<Up>` / `<Down>` | 选择下一个/上一个项目 |
| `<Tab>` / `<S-Tab>` | 在片段占位符之间移动 |
| `<C-e>` | 关闭补全菜单 |
| `<C-space>` | 打开菜单或显示文档 |
| `<C-k>` | 切换签名帮助 |

- **L3MON4D3/LuaSnip**
  - 强大的代码片段引擎
  - 支持复杂的片段扩展和选择功能
  - 可加载 VS Code 风格的片段

**快捷键：**
| 按键 | 功能 |
|------|------|
| `<Tab>` | 跳转到下一个片段占位符 |
| `<S-Tab>` | 跳转到上一个片段占位符 |
| `<C-l>` | 选择片段选项 |

### 自动格式化
- **stevearc/conform.nvim**
  - 统一的代码格式化插件
  - 支持在保存时自动格式化
  - 可配置的格式化器选择和优先级

**快捷键：**
| 按键 | 功能 |
|------|------|
| `<leader>f` | 格式化当前缓冲区 |

**命令：**
| 命令 | 功能 |
|------|------|
| `:ConformInfo` | 查看格式化器信息 |

## 代码导航和搜索

### 文件浏览器
- **stevearc/oil.nvim**
  - 以 vim 方式浏览和编辑文件系统
  - 可以像编辑普通文本一样操作文件和目录
  - 支持创建、删除、重命名、移动文件等操作

**快捷键：**
| 按键 | 功能 |
|------|------|
| `-` | 打开父目录 |

**命令：**
| 命令 | 功能 |
|------|------|
| `:Oil` | 打开当前文件的父目录 |
| `:Oil <path>` | 打开指定路径 |

**在 Oil 窗口中：**
| 按键 | 功能 |
|------|------|
| `<CR>` | 进入目录或打开文件 |
| `-` | 返回上一级目录 |
| `~` | 进入 home 目录 |
| `/` | 进入根目录 |
| `g.` | 切换显示隐藏文件 |
| `g~` | 在文件类型图标和默认图标间切换 |
| `g?` | 显示帮助 |
| `<C-v>` | 垂直分割打开文件 |
| `<C-x>` | 水平分割打开文件 |
| `<C-t>` | 新标签页打开文件 |
| `q` | 关闭 Oil 窗口 |



### 模糊查找
- **nvim-telescope/telescope.nvim**
  - 强大的模糊查找器，支持搜索文件、缓冲区、帮助文档等
  - 可扩展的架构，支持多种主题和界面

**快捷键：**
| 按键 | 功能 |
|------|------|
| `<leader>sh` | 搜索帮助文档 |
| `<leader>sk` | 搜索快捷键 |
| `<leader>sf` | 搜索文件 |
| `<leader>ss` | 搜索 Telescope 内置功能 |
| `<leader>sw` | 搜索当前光标下的单词 |
| `<leader>sg` | 实时 Grep 搜索 |
| `<leader>sd` | 搜索诊断信息 |
| `<leader>sr` | 恢复上一次搜索 |
| `<leader>s.` | 搜索最近打开的文件 |
| `<leader><leader>` | 搜索缓冲区 |
| `<leader>/` | 在当前缓冲区中模糊搜索 |
| `<leader>s/` | 在打开的文件中进行 Grep 搜索 |
| `<leader>sn` | 搜索 Neovim 配置文件 |

**在 Telescope 窗口中：**
| 按键 | 功能 |
|------|------|
| `<C-/>` | 显示快捷键帮助 |
| `?` | 显示快捷键帮助（普通模式） |
| `<Esc>` / `<C-c>` | 关闭窗口 |
| `<CR>` | 选择项目 |
| `<Tab>` | 预览项目 |

**相关扩展：**
- `plenary.nvim` - Telescope 依赖的实用函数库
- `telescope-fzf-native.nvim` - FZF 原生算法扩展，提升搜索性能
- `telescope-ui-select.nvim` - 为 nvim.ui 选择提供 Telescope 界面
- `nvim-web-devicons` - 文件图标支持（需要 Nerd Font）

## Git 集成

- **lewis6991/gitsigns.nvim**
  - 在侧边栏显示 Git 变更标记（添加、修改、删除等）
  - 支持 Git hunks 的导航、暂存和预览
  - 提供 blames、diff 等实用功能

**标准快捷键（需自行配置）：**
| 按键 | 功能 |
|------|------|
| `]c` / `[c` | 跳转到下一个/上一个 hunk |
| `<leader>hs` | 暂存 hunk |
| `<leader>hr` | 重置 hunk |
| `<leader>hp` | 预览 hunk |
| `<leader>hb` | 查看 blame 信息 |
| `<leader>hd` | 显示 diff |

**命令：**
| 命令 | 功能 |
|------|------|
| `:Gitsigns` | 查看插件信息和命令 |

## LSP（语言服务器协议）

### LSP 配置
- **neovim/nvim-lspconfig**
  - 简化 LSP 服务器的配置
  - 支持几乎所有主流语言的 LSP 服务器
  - 提供统一的 LSP 功能接口

**LSP 快捷键（在 LSP 附加的缓冲区中可用）：**
| 按键 | 功能 |
|------|------|
| `grn` | 重命名光标下的符号 |
| `gra` | 显示可用的代码操作（普通/可视模式） |
| `grr` | 查找符号的所有引用（通过 Telescope） |
| `gri` | 跳转到实现（通过 Telescope） |
| `grd` | 跳转到定义（通过 Telescope） |
| `grD` | 跳转到声明 |
| `gO` | 查找当前文档的所有符号 |
| `gW` | 查找工作区的所有符号 |
| `grt` | 跳转到类型定义 |
| `<leader>th` | 切换内联提示显示（如果支持） |

**命令：**
| 命令 | 功能 |
|------|------|
| `:LspInfo` | 查看 LSP 服务器信息 |
| `:LspRestart` | 重启 LSP 服务器 |
| `:LspStart` | 启动 LSP 服务器 |
| `:LspStop` | 停止 LSP 服务器 |

### LSP 工具安装
- **mason-org/mason.nvim**
  - LSP、DAP、Linter 和 Formatter 的包管理器
  - 提供图形界面管理和安装语言工具

**命令：**
| 命令 | 功能 |
|------|------|
| `:Mason` | 打开 Mason 界面 |

**在 Mason 窗口中：**
| 按键 | 功能 |
|------|------|
| `g?` | 显示帮助 |

- **mason-org/mason-lspconfig.nvim**
  - Mason 和 lspconfig 之间的桥梁
  - 自动配置 Mason 安装的 LSP 服务器

- **WhoIsSethDaniel/mason-tool-installer.nvim**
  - 自动安装指定的 LSP 工具
  - 确保开发环境的一致性

### LSP 辅助工具
- **j-hui/fidget.nvim**
  - 显示 LSP 进度通知
  - 在状态栏或通知区域显示服务器状态

- **folke/lazydev.nvim**
  - 为 Neovim 配置和插件提供 Lua LSP 支持
  - 改进 Lua 代码的补全和类型提示

## 用户界面和主题

### 配色方案
- **shaunsingh/nord.nvim**
  - 基于 Arctic 北极光主题
  - 温和的蓝灰色调，适合长时间编程
  - 支持自定义对比度和边框

**命令：**
| 命令 | 功能 |
|------|------|
| `:Telescope colorscheme` | 浏览并应用配色方案 |

**配置选项（在 init.lua 中修改）：**
| 选项 | 功能 |
|------|------|
| `vim.g.nord_borders = true` | 启用边框 |
| `vim.g.nord_contrast = true` | 启用高对比度 |
| `vim.g.nord_disable_background = false` | 启用背景色 |

### 状态增强
- **echasnovski/mini.nvim**
  - 多个实用插件的集合

**包含模块：**
  - `mini.ai` - 改进的文本对象（如 around/inside 括号、引号等）

**快捷键（文本对象）：**
| 文本对象 | 功能 |
|----------|------|
| `a)` / `i)` | Around/Inside 括号 |
| `a'` / `i'` | Around/Inside 单引号 |
| `a"` / `i"` | Around/Inside 双引号 |
| `a]` / `i]` | Around/Inside 方括号 |
| `a}` / `i}` | Around/Inside 花括号 |
| `at` / `it` | Around/Inside 标签（如 HTML/XML） |
| `af` / `if` | Around/Inside 函数调用 |
| `aa` / `ia` | Around/Inside 参数 |

  - `mini.surround` - 添加、删除和替换包围字符

**快捷键：**
| 按键 | 功能 |
|------|------|
| `sa` | 添加包围符（如 `saiw)` 在单词周围添加括号） |
| `sd` | 删除包围符（如 `sd'` 删除引号） |
| `sr` | 替换包围符（如 `sr)'` 将括号替换为引号） |

  - `mini.statusline` - 简洁的状态栏显示
    - 显示模式、文件信息、Git 分支、诊断信息
    - 显示光标位置（行号:列号）
    - 可自定义各个显示部分的内容和格式

### 图标支持
- **nvim-tree/nvim-web-devicons**
  - 提供文件类型图标（需要 Nerd Font）
  - 用于 Telescope、状态栏等插件的图标显示

## 代码注释和标记

- **folke/todo-comments.nvim**
  - 高亮显示代码中的 TODO、FIXME、NOTE 等注释
  - 支持搜索和跳转到这些标记
  - 可自定义关键字和样式

**快捷键（需自行配置）：**
| 按键 | 功能 |
|------|------|
| `]t` / `[t` | 跳转到下一个/上一个 TODO |
| `<leader>st` | 搜索所有 TODO 注释 |

**命令：**
| 命令 | 功能 |
|------|------|
| `:TodoQuickfix` | 在 Quickfix 中显示所有 TODO |
| `:TodoLocList` | 在 Location List 中显示所有 TODO |
| `:TodoTelescope` | 在 Telescope 中搜索 TODO |

## 代码缩进检测

- **NMAC427/guess-indent.nvim**
  - 自动检测文件的缩进风格（tab 或 space）
  - 根据文件内容自动调整 tabstop 和 shiftwidth
  - 减少缩进不一致的问题

**命令：**
| 命令 | 功能 |
|------|------|
| `:GuessIndent` | 手动检测并应用缩进 |

## 键盘快捷键帮助

- **folke/which-key.nvim**
  - 显示未完成键盘序列的可用选项
  - 帮助发现和使用快捷键
  - 支持分组和描述自定义键绑定

**快捷键组（已配置）：**
| 按键 | 分组 |
|------|------|
| `<leader>s` | [S]earch 搜索 |
| `<leader>t` | [T]oggle 切换 |
| `<leader>h` | Git [H]unk Git 变更 |

**使用方法：**
- 按 `<leader>` 后暂停，会显示可用的选项
- 继续输入按键以查看更多选项
- 按 `<Esc>` 取消

## 插件开发辅助

- **folke/lazydev.nvim**
  - 为 Neovim 配置和插件开发提供 Lua LSP
  - 包含 Neovim API 的类型定义和文档
  - 提高配置和插件开发的体验

## 总结

### 主要快捷键映射表

| 分类 | 前缀 | 功能 |
|------|------|------|
| 搜索 | `<leader>s` | 所有搜索相关功能 |
| 切换 | `<leader>t` | 切换功能（如内联提示） |
| Git | `<leader>h` | Git 变更操作 |
| 格式化 | `<leader>f` | 格式化代码 |
| Git Hunks | `<leader>h` | Git 变更块操作 |

### LSP 映射表

| 前缀 | 功能 |
|------|------|
| `grn` | 重命名 |
| `gra` | 代码操作 |
| `grr` | 查找引用 |
| `gri` | 跳转实现 |
| `grd` | 跳转定义 |
| `grD` | 跳转声明 |
| `gO` | 文档符号 |
| `gW` | 工作区符号 |
| `grt` | 类型定义 |

### 窗口导航

| 按键 | 功能 |
|------|------|
| `<C-h>` | 左侧窗口 |
| `<C-l>` | 右侧窗口 |
| `<C-j>` | 下方窗口 |
| `<C-k>` | 上方窗口 |

当前配置提供了完整的代码编辑环境，包括：
- 🎨 语法高亮和代码着色
- 🔍 强大的搜索和导航
- ✨ 智能代码补全
- 📝 Git 集成
- 🔧 LSP 和自动格式化
- 🎯 用户界面优化
- 📚 代码注释管理

所有插件都通过 lazy.nvim 进行懒加载，确保快速的启动时间。
