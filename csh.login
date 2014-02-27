### csh.login -- TCSH Login Script

# Author: Michael Grünewald
# Date: Ven 26 jan 2007 19:32:47 CET

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
