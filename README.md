Personal Vim Configuration
==========================


Usage
-----

**WARNING**: Init all submodules at once can be *extremely* slow; see section "[A Note for YouCompleteMe](#a-note-for-youcompleteme)" below.

```sh
$ git clone https://github.com/oldsharp/vimrc.git
$ cd vimrc && git submodule update --init --recursive
$ ln -sf /path/to/vimrc/vimrc ~/.vimrc
$ ln -sf /path/to/vimrc/vim ~/.vim
# Optional: You can then run ':Helptags' inside Vim to generating help tags.
```


Dependency
----------

 - [flake8](https://pypi.python.org/pypi/flake8/) (for vim-flake8).


A Note for YouCompleteMe
------------------------

Running `git submodule update --init --recursive vim/bundle/YouCompleteMe` can be *extremely* slow if the network is poor, since YCM itself contains a large submodule set.

A possible workaround: list all the submodules by `git submodule status`, then run `git submodule update --init --recursive <path-to-submodule>` manually - excepting the YCM submodule.  You can then init YCM later whenever you get ready.

To update YCM, do *not* update with the `--recursive` option first; a possible (and safe) way:

  1. Unregister YCM by running `git submodule deinit --force vim/bundle/YouCompleteMe` if necessary.
  2. Update YCM by `git submodule update vim/bundle/YouCompleteMe` if we only want to catch up the superprojcet; or we can use the `--remote` option to fetch changes from remote side (the original YCM project).  Set the `--init` option if necessary.
  3. Commit changes made in step 2 if necessary.
  4. Run `git submodule update --init --recursive vim/bundle/YouCompleteMe` to register and checkout all submodules inside YCM recursively.

To build/install YCM, refer to the [official doc](https://github.com/Valloric/YouCompleteMe/blob/master/README.md#installation).


A Note for vim-airline Fancy Fonts
----------------------------------

Refer to the [official instruction](https://github.com/bling/vim-airline#integrating-with-powerline-fonts).


A Note for vim-flake8 Configure
-------------------------------

Refer to flake8's [official doc](https://flake8.readthedocs.org/en/latest/config.html).


License
-------

This work has been placed in the public domain.
