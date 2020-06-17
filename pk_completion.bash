if declare -F _completion_loader > /dev/null
then
    _completion_loader $(pk backend)
fi

_pk() {
    if [ $COMP_CWORD -lt 2 ]; then
        COMPREPLY=($(compgen -W "install remove search update upgrade owner completion backend" -- "${COMP_WORDS[COMP_CWORD]}"))
    else
        local action="${COMP_WORDS[1]}"
        local backend="$(pk backend)"
        case "$backend" in
            dnf)
                case "$action" in
                    i|install)
                        COMP_WORDS=(dnf install "${COMP_WORDS[@]:2}")
                        _dnf
                        ;;
                    r|remove)
                        COMP_WORDS=(dnf remove "${COMP_WORDS[@]:2}")
                        _dnf
                        ;;
                    s|search)
                        COMP_WORDS=(dnf search "${COMP_WORDS[@]:2}")
                        _dnf
                        ;;
                    u|update)
                        COMP_WORDS=(dnf check-update "${COMP_WORDS[@]:2}")
                        _dnf
                        ;;
                    g|upgrade)
                        COMP_WORDS=(dnf upgrade "${COMP_WORDS[@]:2}")
                        _dnf
                        ;;
                    o|owner)
                        COMP_WORDS=(rpm -qf "${COMP_WORDS[@]:2}")
                        _rpm
                        ;;
                esac
                ;;
            apt)
                case "$action" in
                    i|install)
                        COMP_WORDS=(apt install "${COMP_WORDS[@]:2}")
                        _apt
                        ;;
                    r|remove)
                        COMP_WORDS=(apt remove "${COMP_WORDS[@]:2}")
                        _apt
                        ;;
                    s|search)
                        COMP_WORDS=(apt search "${COMP_WORDS[@]:2}")
                        _apt
                        ;;
                    u|update)
                        COMP_WORDS=(apt update "${COMP_WORDS[@]:2}")
                        _apt
                        ;;
                    g|upgrade)
                        COMP_WORDS=(apt upgrade "${COMP_WORDS[@]:2}")
                        _apt
                        ;;
                    o|owner)
                        COMP_WORDS=(apt -S "${COMP_WORDS[@]:2}")
                        _dpkg
                        ;;
                esac
                ;;
            apk)
                # TODO add completion for apk
                ;;
        esac
    fi
}

complete -F _pk pk
