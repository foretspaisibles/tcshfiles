#! /bin/csh -f
### csh.bindkey -- Laisons des focntions de TCSDH au clavier

# Author: Micha�l Gr�newald
# Date: Ven 18 jan 2008 21:16:42 CET
# Lang: fr_FR.ISO8859-15

# $Id$

# Ce fichier ananlyse la variable OSTYPE pour d�teminer le fichier de
# d�finitions � ingurgiter. Il para�t plus pertinent de tester la
# valeur du terminal, mais ce code adapte le fichier distribu� par
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
