#! /bin/sh -ueC

usage() {
    cat << 'EOF'
usage: $0 [-C <path>] [--bin <path>]

    -C <path>  act as if the command was called from <path>
    -b, --bin  path to where hsh script is checked out, default: './bin'
EOF
}

die() {
	echo "$@" >&2
	exit 1
}

cleanup() {
    if [ -e "$1" ]
    then

        if [ -e "$(pwd)/.hsh" ]
        then
            rm -rf "$(pwd)/.hsh"
        fi
        rm -rf "$1"
    fi
}

dir="$(pwd)"

while [ $# -ne 0 ]
do
	case "$1" in
		-h|--help)
			usage
            exit 0
			;;
        -C)
            shift
            [ $# -eq 0 ] && die "missing value for parameter '-C'"
            dir="$1"
            ;;
		-b|--bin)
			shift
            [ $# -eq 0 ] && die "missing value for parameter --hsh-dir"
			bin_dir="$1"
			;;
        -t|--track)
			shift
            [ $# -eq 0 ] && die "missing value for parameter --track"
            track="$1" 
            ;;
		*)
			die "unknown option '$1'"
			;;
	esac
	shift
done

if [ -n "$dir" ]
then
    cd "$dir" || die "Failed to switch to '$dir'"
fi

hsh_dir="$(pwd)/.hsh"
bin_dir="${bin_dir:-$(pwd)/bin}"
tmp_dir="$(pwd)/.hsh_install_$$"

[ -e "$hsh_dir" ] && die "directory '$hsh_dir' already exists"
[ -e "$bin_dir" ] || die "directory '$bin_dir' does not exists"
mkdir "$(pwd)/.hsh_install_$$"
trap "cleanup \"$tmp_dir\"" EXIT HUP INT QUIT ABRT TERM
mkdir -p "$hsh_dir/repos"
git clone "https://github.com/crezvoy/hsh.git" "$tmp_dir/hsh"
cp -rfP "$(pwd)/.hsh_install_$$/hsh/.git" "$hsh_dir/repos/hsh"
git --git-dir "$hsh_dir/repos/hsh" config core.worktree "$bin_dir"
git --git-dir "$hsh_dir/repos/hsh" config core.sparseCheckout true
git --git-dir "$hsh_dir/repos/hsh" config pull.rebase true
git --git-dir "$hsh_dir/repos/hsh" config status.showUntrackedFiles no 
cat << 'EOF' > "$hsh_dir/repos/hsh/info/sparse-checkout" 
hsh
EOF
if [ -n "${track-}" ]
then
    git checkout "${track}"
fi
git --git-dir "$hsh_dir/repos/hsh" reset --hard HEAD
rm -rf "$tmp_dir"
