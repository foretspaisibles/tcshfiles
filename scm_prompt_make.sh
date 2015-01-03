# TCSH Files (https://github.com/michipili/tcshfiles)
# This file is part of TCSH Files
#
# Copyright © 2008–2015 Michael Grünewald
#
# This file must be used under the terms of the CeCILL-B.
# This source file is licensed as described in the file COPYING, which
# you should have received as part of this distribution. The terms
# are also available at
# http://www.cecill.info/licences/Licence_CeCILL-B_V1-en.txt

has_program()
{
    command -v "$1" 2>&- > /dev/null
    return $?
}

prompt()
{
    if has_program git; then
	git status 2>&- | sed -n '1s/^.*On branch //p'
    fi
}

decorate()
{
    if [ -n "$1" ]; then
	printf '/%s' "$1"
    fi
}

decorate `prompt`
