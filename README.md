# ~ sweet ~ , a dotfile manager

hsh is a git wrapper, mainly useful to manage dotfiles.
Its most salient features are:

 - hsh is a simple shell script, most of the heavy lifting is carried out by git;
 - hsh can create modular configurations by splitting dotfiles into separate repos (/e.g./ work/personal, headless/gui, gihub/private/offline...);
 - hsh simplifies setting up a new machine by creating a bundle of your current config, that can then be installed elsewhere;
 - hsh is not a link farm, files are checked out directly from git directories and conflicts on common files are handled by sparse-checkout settings. 

# Install

    cd
    curl -sSL https://raw.githubusercontent.com/crezvoy/hsh/master/install-script.sh | sh

The install script creates a `.hsh` directory in the current working directory,
in this directories, all the `.git` repositories are stored, including hsh
itself. The install script also checks out the hsh script in the `bin`
subdirectory.

Available options:
 - `-C <path>` act as if the install script was called from `<path>`
 - `-b, --bin <path>` check out the hsh script in `<path>`

# Synopsis

    # create a repository 
    hsh init vim
    # most git command are simply passed onto the corresponding git repo
    hsh remote vim add git@github.com/myself/hsh-vim
    # add file to the repo
    hsh add vim .vimrc
    # you can also apply a command to all repository at once
    hsh -a commit -m "syncing dotfiles"
    # by default hsh repositories configured to rebase on pull
    hsh -a pull
    hsh -a push

# Roadmap

 - [ ] dependencies
 - [ ] hooks (install update /etc./)
 - [ ] portability tests
 - [ ] bash completion
 - [ ] CI
 - [ ] github/gitlab url shortening

# License

hsh is licensed under the terms of the MIT license.
