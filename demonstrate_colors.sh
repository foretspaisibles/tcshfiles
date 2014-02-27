### demonstrate_colors -- Demonstrate shell's colors

# Author: Michael Grünewald
# Date: Thu Feb 27 18:21:27 CET 2014

# TCSH Files (https://bitbucket.org/michipili/tcshfiles)
# This file is part of TCSH Files
#
# Copyright (C) 2008-2014 Michael Grünewald
#
# This file must be used under the terms of the CeCILL-B.
# This source file is licensed as described in the file COPYING, which
# you should have received as part of this distribution. The terms
# are also available at
# http://www.cecill.info/licences/Licence_CeCILL-B_V1-en.txt

effect_db()
{
    cat <<EOF
0 	Normal
1 	Bright or Bold
2 	Faint
3 	Italic
4 	Underline
5 	Blink (Slow)
6 	Blink (Rapid)
7 	Reverse
8 	Conceal
9 	Crossed-out
EOF
}

effect_short_db()
{
    cat <<EOF
1 	Bright or Bold
2 	Faint
3 	Italic
EOF
}


font_db()
{
    cat <<EOF
10	Primary font
11	Alt font #1
12	Alt font #2
13	Alt font #3
14	Alt font #4
15	Alt font #5
16	Alt font #6
17	Alt font #7
18	Alt font #8
19	Alt font #9
20	Fraktur
EOF
}

color_db()
{
    cat <<EOF
0	Black
1	Red
2 	Green
3 	Yellow
4 	Blue
5 	Magenta
6 	Cyan
7 	White
9	Default
EOF
}

demonstrate()
{
    sgr_normal=`printf '\033[m'`
    color_db | while read bgcolor bgname; do
	color_db | while read fgcolor fgname; do
	    sgr_set_color=`printf '\033[3%s;4%sm' $fgcolor $bgcolor`
	    printf '%s%7s on %7s%s' \
		"$sgr_set_color" \
		"$fgname" \
		"$bgname" \
		"$sgr_normal"
	    effect_short_db | while read fxcode fxname; do
		printf '%s Normal%s' \
		    "$sgr_set_color" \
		    "$sgr_normal"
		printf '%s \033[%sm%s%s' \
		    "$sgr_set_color" \
		    "$fxcode" \
		    "$fxname" \
		    "$sgr_normal"
	    done
	    printf '\n'
	done
    done
}

demonstrate
