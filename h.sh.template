#! /bin/sh

# this script is called after each git command, after 
# the 'bundle' and 'remove' command which have no git equivalent, and after the
# extraction of a bundle.
# The following environment variables are set:
#     - HSH_ROOT: current hsh root;
#     - HSH_REPOSITORY: current repository name;
#     - HSH_ACTION: current git or hsh action, for "bundle" command, HSH_ACTION
#       is set to 'bundle-in', when extracting a bundle the action is set to
#       'bundle-out'.
# Additionally, for bundle-in and bundle-out actions the HSH_BUNDLE_ROOT is set
# to the bundle content root.
