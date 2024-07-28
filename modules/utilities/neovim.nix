# Plugins and settings for neovim
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    lunarvim
  ]; 
  
  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
        source ~/.config/nvim/init.vim
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
	        # CoC and language support
	        coc-nvim
	        coc-clangd
	        coc-python
	        vim-fugitive
	      ];
      };
    };
  };
}
