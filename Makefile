OS:=$(shell uname)

ifeq ($(OS),Darwin)
install: python3
	ln -fs $(PWD)/vimrc ~/.vimrc
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall +PlugClean! +qall
python3:
	pip3 install --user pynvim
else
install: python3
	ln -fs $(PWD)/vimrc ~/.vimrc
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# TODO: windows
	#iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |` ni $HOME/vimfiles/autoload/plug.vim -Force
	vim +PlugInstall +PlugClean! +qall

python3:
	sudo apt install python3-pip
	pip3 install --user pynvim
endif
