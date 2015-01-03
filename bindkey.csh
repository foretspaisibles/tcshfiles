### csh.bindkey -- Laisons des fonctions de TCSH au clavier

# Author: Michael Grünewald
# Date: Fri Jan 18 21:16:42 CET 2008

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

# Ce fichier ananlyse la variable OSTYPE pour déteminer le fichier de
# définitions à ingurgiter. Il paraît plus pertinent de tester la
# valeur du terminal, mais ce code adapte le fichier distribué par
# Simos Xenitellis.

# Enveloppe originale:
#
#   .tcshrc.bindkey 12Aug2004, Simos Xenitellis (simos74 at gmx dot net)
#
#   This is the .tcshrc.bindkey file, part of the TCSHRC project
#   at http://tcshrc.sourceforge.net

if ( $?TERM ) then
    switch ( $TERM )
    case "linux":
	set csh_bindkey='bindkey.linux'
	breaksw;

    case "cons25":
	set csh_bindkey='bindkey.cons25'
	breaksw;

    case "xterm*":
	set csh_bindkey='bindkey.xterm'
	breaksw;

    default:
	set csh_bindkey='bindkey.unsupported'
	breaksw;

    endsw
else
    set csh_bindkey='bindkey.inexistant'
endif

if ( -e /etc/csh/bindkey.d/$csh_bindkey ) then
  source /etc/csh/bindkey.d/$csh_bindkey
endif

unset csh_bindkey

### End of file `csh.bindkey'
