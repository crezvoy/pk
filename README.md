# ~ sweet ~ , a dotfile manager

hsh is a git wrapper, mainly useful to manage dotfiles.
Its most salient features are:

 - hsh is a simple shell script, most of the heavy lifting is carried out by git;
 - hsh can create modular configurations by splitting dotfiles into separate
   repos (*e.g.* work/personal, headless/gui, gihub/private/offline...);
 - hsh simplifies setting up a new machine by creating a bundle of your current
   config, that can then be installed elsewhere;
 - hsh is not a link farm, files are checked out directly from git directories
   and conflicts on common files are handled by sparse-checkout settings. 

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

# Commands

All hsh commands adhere to the following syntax; either the command is applied
to a sigle repository as such:
    
    hsh [-C <dir>] <git command> <repository name> <git arguments>

or, you apply the same command to all the repositories:

    hsh [-C <dir>] <-a|-all> <git command> <git arguments>

in that form, the hsh command fails if all the git commands fail.  By default
hsh will act on the nearest .hsh directory up the directory tree but all
commands accept a `-C` argument to change the current directory before any
action. `hsh` do however add new commands or override git ones.

## Init

The `init` command creates a new repository `<name>` in `hsh`:

    hsh [-C <dir>] init <name>


## Clone

The syntax of the clone command is as follows:

    hsh [-C <dir>] clone <url|url-ish>

The clone command clone an existing repository by putting the `.git` directory
in the `.hsh` directory and checkng out the default branch. The command does not
accept any parameters other than `-C`.

## Bundle

The bundle goes as follows:

    hsh [-C <dir>] bundle [-f | --force] [[-n | --name] <dir>]

This commands creates a self-extractible archive of your current repositories
to be replicated into another location. When run, the bundle will recreate a
`.hsh` directory as well as copy the worktree of all your repositories in the
current directory. The bundle extraction does not require `git` so that it is
an appropriate method for a new setup. The bundle itself as the following
options:

    hsh_bundle [-C <dir>] [[-b | --bin] <dir>]

As for other command, `-C` changes the current directory. one of the repo that
are extracted by the bundle is `hsh` itself, the `--bin` option allow you to
customize the path to where ths hsh script is extracted and defaults to `./bin`.

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
 - [ ] hooks (install update *etc.*)
 - [ ] portability tests
 - [ ] bash completion
 - [ ] CI
 - [ ] github/gitlab url shortening

# License

hsh is licensed under the terms of the MIT license.
