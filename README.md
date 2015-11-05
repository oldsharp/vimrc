Personal Vim Configuration
==========================


Usage
-----

```sh
$ cd ~ && git clone https://github.com/oldsharp/vimcfg.git
# WARNING: Init all submodules at once can be _extremely_ slow; see
# section 'A Note for YouCompleteMe' below.
$ cd vimcfg && git submodule update --init --recursive
$ ln -sf ~/vimcfg/.vimrc ~/.vimrc
$ ln -sf ~/vimcfg/.vim ~/.vim
# Optional: You can then run ':Helptags' in Vim to generate help tags
```


Dependency
----------

 - flake8 (for vim-flake8): https://pypi.python.org/pypi/flake8/


Build Vim 7.4 from Source
-------------------------

```sh
# A possibly progress:

# on debain-like distros:
$ sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev \
    python-dev ruby-dev
$ sudo apt-get remove vim vim-runtime gvim \
    vim-tiny vim-common vim-gui-common

# on fedora/CentOS:
$ sudo yum install libncurses-devel libgnome-devel libx11-devel \
    perl-devel python-devel ruby-devel \
    perl-ExtUtils-Embed
$ sudo yum erase vim-common vim-enhanced

$ cd /path/to/vim-7.4-src
$ ./configure --prefix=/usr \
    --with-features=huge \
    --with-python-config-dir=/usr/lib/python2.7/config \
    --enable-rubyinterp \
    --enable-pythoninterp \
    --enable-perlinterp \
    --enable-luainterp \
    --enable-gui=gnome2 \
    --enable-cscope
$ make VIMRUNTIMEDIR=/usr/share/vim/vim74
$ sudo make install

$ sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
$ sudo update-alternatives --set editor /usr/bin/vim
$ sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
$ sudo update-alternatives --set vi /usr/bin/vim
```


A Note for YouCompleteMe
------------------------

Running `git submodule update --init --recursive .vim/bundle/YouCompleteMe` can be _extremely_ slow if the network is poor, since YCM itself contains a large submodule set.

A workaround: list all the submodules by `git submodule status`, then run `git submodule update --init --recursive <path-to-submodule>` manually - excepting the YCM submodule.  You can then init YCM later whenever you get ready.

To build/install YCM, refer to https://github.com/Valloric/YouCompleteMe#installation


A Note for vim-airline Fancy Fonts
----------------------------------

Refer to https://github.com/bling/vim-airline#integrating-with-powerline-fonts


A Note for vim-flake8 Configure
-------------------------------

Refer to https://flake8.readthedocs.org/en/latest/config.html


Italic Font for Vim Terminal
----------------------------
This feature is _experimental_; use with caution.
Note this feature is heavily rely on the type of terminal you choose.
Also I tested it under gnu-screen v4.03.01 and after some ugly hacking, finally it worked (with restrictions, though).
Check https://www.reddit.com/r/vim/comments/24g8r8/italics_in_terminal_vim_and_tmux/ and https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/ for additional info.


LICENSE
-------

This work has been placed in the public domain.
