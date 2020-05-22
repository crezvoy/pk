# pk, a package manager wrapper 📦

`pk` is a wrapper around various package managers. I'm adding use cases and package managers as I encounter them, feel free to submit more.

## Install

Clone this repository somewhere convienent and either put the resulting directory in your `$PATH` or link the pk script into a directory already in it

## Usage

    usage pk <action> [parameters]
    
    actions:
       i, install <package>...  install new package(s)
       r, remove <package>..    uninstall package(s)
       s, search <needle>...    query the package database
       u, update                update the package database
       g, upgrade               upgrade the pakcages
       o, owner <path>          search the package owning a given file
       completion               setup bash completion for pk
       backend                  print the backend detected by pk

## License

`pk` is licensed under the MIT license. For more information report to the LICENSE file.
