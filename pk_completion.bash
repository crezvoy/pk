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
                        _completion_loader dnf
                        COMP_WORDS=(dnf install "${COMP_WORDS[@]:2}")
                        _dnf
                        ;;
                    r|remove)
                        _completion_loader dnf
                        COMP_WORDS=(dnf remove "${COMP_WORDS[@]:2}")
                        _dnf
                        ;;
                    s|search)
                        _completion_loader dnf
                        COMP_WORDS=(dnf search "${COMP_WORDS[@]:2}")
                        _dnf
                        ;;
                    u|update)
                        _completion_loader dnf
                        COMP_WORDS=(dnf check-update "${COMP_WORDS[@]:2}")
                        _dnf
                        ;;
                    g|upgrade)
                        _completion_loader dnf
                        COMP_WORDS=(dnf upgrade "${COMP_WORDS[@]:2}")
                        _dnf
                        ;;
                    o|owner)
                        _completion_loader rpm 
                        COMP_WORDS=(rpm -qf "${COMP_WORDS[@]:2}")
                        _rpm
                        ;;
                esac
                ;;
            apt)
                case "$action" in
                    i|install)
                        _completion_loader apt
                        COMP_WORDS=(apt install "${COMP_WORDS[@]:2}")
                        _apt
                        ;;
                    r|remove)
                        _completion_loader apt
                        COMP_WORDS=(apt remove "${COMP_WORDS[@]:2}")
                        _apt
                        ;;
                    s|search)
                        _completion_loader apt
                        COMP_WORDS=(apt search "${COMP_WORDS[@]:2}")
                        _apt
                        ;;
                    u|update)
                        _completion_loader apt
                        COMP_WORDS=(apt update "${COMP_WORDS[@]:2}")
                        _apt
                        ;;
                    g|upgrade)
                        _completion_loader apt
                        COMP_WORDS=(apt upgrade "${COMP_WORDS[@]:2}")
                        _apt
                        ;;
                    o|owner)
                        _completion_loader dpkg
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
