### csh.login -- TCSH Login Script

# Author: Michaël Grünewald
# Date: Ven 26 jan 2007 19:32:47 CET
# Lang: fr_FR.ISO8859-15

# $Id$

# Les commandes figurant dans ce fichier sont évaluées par tcsh(1) au
# début d'une session de login, après après le fichier
# `/etc/csh.cshrc'.

#
# CSH Login Repository
#

if (-d /etc/csh/login.d) then
  if (`ls /etc/csh/login.d` != "") then
	foreach csh_file (/etc/csh/login.d/*)
		source $csh_file
	end
	unset csh_file
  endif
endif

# Local Variables:
# mode: shell-script
# eval: (sh-set-shell "/bin/tcsh")
# tab-width: 4
# End:

### End of file `csh.login'
