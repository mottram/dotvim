This is my Vim configuration

### Installed plugins:

* [Fugitive](https://github.com/tpope/vim-fugitive)
* [Fuzzyfinder](https://github.com/vim-scripts/FuzzyFinder)
* [Gundo](https://github.com/sjl/gundo.vim)
* [Hammer](https://github.com/robgleeson/hammer.vim) (NB: requires Ruby support)
* [Jekyll](https://github.com/mottram/jekyll.vim.mottram) (My fork of an old version of csetxon's [original](https://github.com/csexton/jekyll.vim)
* [l9](https://github.com/vim-scripts/L9)
* [Markdown](https://github.com/tpope/vim-markdown)
* [NERDCommenter](https://github.com/scrooloose/nerdcommenter)
* [NERDTree](https://github.com/scrooloose/nerdtree)
* [Pathogen](https://github.com/tpope/vim-pathogen)
* [Snipmate](git@github.com:mottram/snipmate.vim.git) (link goes to my fork)
* [Supertab](https://github.com/scrooloose/nerdtree)
* [Vimoutliner](https://github.com/vimoutliner/vimoutliner)
* [YankRing](https://github.com/vim-scripts/YankRing.vim)

### Setup:

* [Synchronizing plugins with git submodules and pathogen](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)

### Notes to self:

#### Adding a new plugin

* `git submodule add https://git.repo.of.plugin bundle/pluginname`
* `git commit -a -m "Added plugin"`

#### Updating plugins

* `git submodule foreach git checkout master`
* `git submodule foreach git pull`
* `git commit -a -m "Updated plugins"`

#### Installing on a new machine

* `git clone git@github.com:mottram/dotvim.git ~/.vim`
* `cd ~/.vim`
* `git submodule update --init`
* `mkdir backup temp view`
* `ln -s vimrc ~/.vimrc`
