# Plugins and settings for neovim
{ config, pkgs, ... }:
{
  # Keeping lunarvim enabled broke my config so I'm disabling it for now

  # environment.systemPackages = with pkgs; [
  #   lunarvim
  #
  #   # Language Servers
  #   # nodePackages.typescript-language-server
  #   # rust-analyzer
  #   # cmake-language-server
  #   # luajitPackages.lua-lsp
  #   # pyright
  # ]; 
  
  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
        source ~/.config/nvim/init.lua
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          packer-nvim
#           luasnip
#           catppuccin-nvim
#           cmp-nvim-lsp
#           lsp-zero-nvim
#           nvim-cmp
#           nvim-lspconfig
#           nvim-treesitter
#           packer-nvim
#           playground
#           plenary-nvim
#           mason-nvim
#           mason-lspconfig-nvim
#           harpoon2
#           telescope-nvim
#           undotree
#           vim-fugitive
	];
      };
#       packages.myVimPackage = with pkgs.vimPlugins; {
#         start = [
# 	        # CoC and language support
# 	        coc-nvim
# 	        coc-clangd
# 	        coc-python
# 	        vim-fugitive
# 	      ];
#       };
    };
  };
}
