#!/bin/bash

CURRENT_DIRECTORY=`pwd`
cd ~/

echo "downloading bashmarks"
git clone git://github.com/huyng/bashmarks.git bashmarks
cd bashmarks
echo "installing bashmarks"
make install
cd ~/
rm -rf bashmarks

echo "removing old bash_profile"
rm .bash_profile
cp $CURRENT_DIRECTORY/.bash_profile .bash_profile
echo "linking $CURRENT_DIRECTORY/.bash_profile"

#rm .gvimrc
#ln -s $CURRENT_DIRECTORY/gvim.rc .gvimrc

#rm -rf .vim
#ln -s $CURRENT_DIRECTORY/vim .vim

#rm .vimrc
#ln -s $CURRENT_DIRECTORY/vim.rc .vimrc

for file in bashrc bash_prompt exports aliases functions extra; do
  filepath="$CURRENT_DIRECTORY/.$file"
  echo "removing .$file and symlinking $filepath to .$file"
  rm .$file
  [ -e "$filepath" ] && cp $filepath ".$file"
done

cd $CURRENT_DIRECTORY
source ~/.bash_profile
echo "My my, what a nice looking shell you have."
echo "All done"
