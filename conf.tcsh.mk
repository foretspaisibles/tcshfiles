### admin.files.mk -- Install administration files

# Author: Michael Grünewald
# Date: Thu Feb 27 18:21:27 CET 2014

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

PREFIX?=

CSHDIR = ${PREFIX}/etc
CSHMODE = 444
CSHOWN = ${_BPS_SYSTEMOWN}
CSHGRP = ${_BPS_SYSTEMGRP}

CSHRCDIR?= ${CSHDIR}/csh/rc.d
CSHRCMODE?= ${CSHMODE}
CSHRCOWN?= ${CSHOWN}
CSHRCGRP?= ${CSHGRP}

CSHLOGINDIR?= ${CSHDIR}/csh/login.d
CSHLOGINMODE?= ${CSHMODE}
CSHLOGINOWN?= ${CSHOWN}
CSHLOGINGRP?= ${CSHGRP}

CSHLOGOUTDIR?= ${CSHDIR}/csh/logout.d
CSHLOGOUTMODE?= ${CSHMODE}
CSHLOGOUTOWN?= ${CSHOWN}
CSHLOGOUTGRP?= ${CSHGRP}

CSHBINDKEYDIR?= ${CSHDIR}/csh/bindkey.d
CSHBINDKEYMODE?= ${CSHMODE}
CSHBINDKEYOWN?= ${CSHOWN}
CSHBINDKEYGRP?= ${CSHGRP}

CSHTOOLDIR?= ${CSHDIR}/csh/tool.d
CSHTOOLMODE?= ${CSHMODE}
CSHTOOLOWN?= ${CSHOWN}
CSHTOOLGRP?= ${CSHGRP}

FILESGROUPS+= CSH
FILESGROUPS+= CSHRC
FILESGROUPS+= CSHLOGIN
FILESGROUPS+= CSHLOGOUT
FILESGROUPS+= CSHBINDKEY
FILESGROUPS+= CSHTOOL

.include "conf.freebsd.mk"

### End of file `admin.files.mk'
