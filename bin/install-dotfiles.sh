#!/bin/bash
# based on the install script from http://github.com/adamv

function relink() {
  if [ -e $1 ] ; then rm -i $1; fi
  ln -sn $2 $1
}

cd ~
relink ~/.bash_profile ~/dotfiles/bash_profile
relink ~/.bashrc ~/dotfiles/bashrc
relink ~/.gitconfig ~/dotfiles/gitconfig
relink ~/.gitignore ~/dotfiles/global-git-ignore
relink ~/.vim ~/dotfiles/vim
relink ~/.vimrc ~/dotfiles/vimrc
relink ~/.gvimrc ~/dotfiles/gvimrc
relink ~/.profile ~/dotfiles/profile
relink /usr/local/bin/man2pdf ~/dotfiles/bin/man2pdf.sh
