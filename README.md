This is my Vim configuration



### Installed plugins:

* [dwm](http://onethingwell.org/post/30032313633/dwm-vim)
* [Fugitive](https://github.com/tpope/vim-fugitive)
* [Gundo](https://github.com/sjl/gundo.vim)
* [l9](https://github.com/vim-scripts/L9)
* [Markdown](https://github.com/tpope/vim-markdown)
* [NERDCommenter](https://github.com/scrooloose/nerdcommenter)
* [NERDTree](https://github.com/scrooloose/nerdtree)
* [NERDTreeTabs](https://github.com/jistr/vim-nerdtree-tabs)
* [Pathogen](https://github.com/tpope/vim-pathogen)
* [Powerline](https://github.com/Lokaltog/vim-powerline)
* [Supertab](https://github.com/scrooloose/nerdtree)
* [UltiSnips](https://github.com/SirVer/ultisnips)
* [Vimoutliner](https://github.com/vimoutliner/vimoutliner)
* [YankRing](https://github.com/vim-scripts/YankRing.vim)

### Setup:

* [Synchronizing plugins with git submodules and pathogen](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)

### Notes to self:

#### Adding a new plugin

* `git submodule add https://git.repo.of.plugin bundle/pluginname`
* `git commit -a -m "Added plugin"`
* On other machines after pull: `git submodule update --init bundle/pluginname`

#### Updating plugins

* `git submodule foreach git pull`
* `git commit -a -m "Updated plugins"`

#### Removing plugins

* Remove references to submodule in `.gitmodules`, `.git/config`
* `git rm --cached bundle/bundle-dir`
* rm -r bundle/bundle-dir
* git commit -a -m "Removed plugin"

#### Installing on a new machine

* `git clone git@github.com:mottram/dotvim.git ~/.vim`
* `cd ~/.vim`
* `git submodule update --init`
* `mkdir backup temp undo view ~/.yr`
* `ln -s vimrc ~/.vimrc`
