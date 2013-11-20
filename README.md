vimcfg
======

Personal vim configuration stuff.

usage
-----

```sh
$ cd ~ && git clone https://github.com/oldsharp/vimcfg.git
$ cd vimcfg && git submodule update --init --recursive
$ ln -sf ~/vimcfg/.vimrc ~/.vimrc
$ ln -sf ~/vimcfg/.vim ~/.vim
```

dependency
----------

 - cmake v2.8 or later: http://www.cmake.org/
 - flake8: https://pypi.python.org/pypi/flake8/

build vim7.4 from source
------------------------

```sh
# on debain-like distros:
$ sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
                       libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
                       libcairo2-dev libx11-dev libxpm-dev libxt-dev \
                       python-dev ruby-dev mercurial
$ sudo apt-get remove vim vim-runtime gvim \
                      vim-tiny vim-common vim-gui-common

# on fedora/CentOS:
$ sudo yum install libncurses-devel libgnome-devel libx11-devel \
                   perl-devel python-devel ruby-devel \
                   perl-ExtUtils-Embed mercurial
$ sudo yum erase vim-common vim-enhanced

$ cd ~ && hg clone https://vim.googlecode.com/hg/ vim && cd vim
$ ./configure --with-features=huge \
              --enable-rubyinterp \
              --enable-pythoninterp \
              # depend on your system configuration
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
# install cmake v2.8 or later
$ cd ~ && mkdir ycm_build && cd ycm_build
$ cmake -G 'Unix Makefiles' . ~/.vim/bundle/YouCompleteMe/cpp
$ make ycm_support_libs
```
