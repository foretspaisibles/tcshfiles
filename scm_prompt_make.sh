has_program()
{
    command -v "$1" 1>&- 2>&-
    return $?
}

prompt()
{
    if has_program git; then
	git status 2>&- | sed -n '1s/^# On branch //p'
    fi
}

decorate()
{
    if [ -n "$1" ]; then
	printf '/%s' "$1"
    fi
}

decorate `prompt`
