return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- so packer can update itself
  use { -- nice interface for LSP functions (among other things)
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'},
                 {'BurntSushi/ripgrep'}}
  }
  use 'neovim/nvim-lspconfig' -- native LSP support
  use 'hrsh7th/nvim-cmp' -- autocompletion framework
  use 'hrsh7th/cmp-nvim-lsp' -- LSP autocompletion provider
  use 'hrsh7th/cmp-buffer' -- Buffer autocompletion provider
  use 'hrsh7th/cmp-path' -- Buffer autocompletion provider
  use 'scrooloose/nerdcommenter' -- Nerd commenter, to comment / uncomment code easily
  use 'scrooloose/nerdtree' -- A browsable tree view of the working directory
  use 'guns/xterm-color-table.vim' -- To have a view of vim 256 colors
  use 'vim-airline/vim-airline' -- Airline, a better status line
  use 'tpope/vim-markdown' -- Markdown files
  use 'embear/vim-localvimrc' -- local vimrc .lvimrc
  use 'ntpeters/vim-better-whitespace' -- trailing whitespace highlight and remove
  use 'Yggdroot/indentLine' -- show indentation
  use 'wgwoods/vim-systemd-syntax' -- systemd syntax
  use 'cespare/vim-toml' -- toml syntax hithlighting
  use 'ray-x/lsp_signature.nvim' -- show type signatures when typing
  use 'tpope/vim-fugitive' -- feature rich git integration
  use 'simrat39/rust-tools.nvim' -- more Rust niceness
  --use 'vim-python/python-syntax' -- Better Python syntax highlighting
  use 'wookayin/semshi' -- Better Python syntax highlighting

  use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      -- tag = 'release' -- To use the latest release
  }

  -- autocomplete config
  local cmp = require 'cmp'
  cmp.setup {
    mapping = {
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      })
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'path' },
    }
  }

  -- omnisharp lsp config
  require'lspconfig'.omnisharp.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(_, bufnr)
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      require "lsp_signature".on_attach({
          bind = true, -- This is mandatory, otherwise border config won't get registered.
          handler_opts = {
              border = "single"
          }
    }, bufnr)
    end,
    flags = {
        debounce_text_changes = 150,
    },
    --cmd = { "/home/yoann/bin/omnisharp-roslyn/run", "--languageserver" , "--hostPID", tostring(pid) },
    cmd = { "/home/yoann/bin/omnisharp-roslyn/OmniSharp", "--languageserver" , "--hostPID", tostring(pid) },
  }


  -- rust lsp config, mostly automated by rust-tools
  require('rust-tools').setup({})

  -- Python lsp config using Microsoft's Pyright static analyzer
  require'lspconfig'.pyright.setup{}

end)
