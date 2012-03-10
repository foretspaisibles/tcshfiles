has_program()
{
    command -v "$1" 1>&- 2>&-
    return $?
}

if has_program git; then
    git status 2>&- | sed -n '1s/^# On branch //p'
fi
