# installvim for mac os x lion

CURRENT_DIRECTORY=`pwd`
cd ~/

# remove any remnants of what .vim might have been and start new
echo "removing all traces of your old vim settings"
rm ~/.vimrc

echo "copying over the new hotness"
cp -R $CURRENT_DIRECTORY/.vim .vim
mkdir ~/.vim/sessions

echo "Installing exuberant ctags for tagbar. if this fails, please comment out tagbar in .vimrc, or just fix it"
# exuberant ctags is needed for tagbar.
brew install ctags-exuberant

echo "installing command-t. if this fails, manually find it here: git.wincent.com/command-t.git"
# git clone git://git.wincent.com/command-t.git $CURRENT_DIRECTORY/.vim/bundle/command-t
cd ~/.vim/bundle/command-t/ruby/command-t/
ruby extconf.rb
make

echo "Setting alias 'v' to point to your new vim"
echo "#Setting alias 'v' to point to your new vim" >> ~/.bash_profile
echo "alias v='~/.vim/vim'" >> ~/.bash_profile
source ~/.bash_profile
