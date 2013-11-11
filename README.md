vimcfg
======

Personal vim configuration stuff.

usage
-----

```sh
$ cd ~ && git clone https://github.com/oldsharp/vimcfg.git
$ ln -sf ~/vimcfg/.vimrc ~/.vimrc
$ ln -sf ~/vimcfg/.vim ~/.vim
```

build vim7.4 from source
------------------------

```sh
$ sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
                       libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
                       libcairo2-dev libx11-dev libxpm-dev libxt-dev \
                       python-dev ruby-dev mercurial
$ sudo apt-get remove vim vim-runtime gvim \
                      vim-tiny vim-common vim-gui-common
$ cd ~ && hg clone https://vim.googlecode.com/hg/ vim && cd vim
$ ./configure --with-features=huge \
              --enable-rubyinterp \
              --enable-pythoninterp \
              --with-python-config-dir=/usr/lib/python2.7/config \
              --enable-perlinterp \
              --enable-luainterp \
              --enable-gui=gnome2 --enable-cscope --prefix=/usr
$ make VIMRUNTIMEDIR=/usr/share/vim/vim74
$ sudo make install

$ sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
$ sudo update-alternatives --set editor /usr/bin/vim
$ sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
$ sudo update-alternatives --set vi /usr/bin/vim
```

build ycm_support_lib
---------------------

```sh
$ cd ~ && mkdir ycm_build && cd ycm_build
$ cmake -G 'Unix Makefiles' . ~/.vim/bundle/YouCompleteMe/cpp
$ make ycm_support_lib
```
