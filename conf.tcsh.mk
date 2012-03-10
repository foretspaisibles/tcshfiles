### admin.files.mk — Install administration files

PREFIX?=

CSHDIR = ${PREFIX}/etc
CSHMODE = 444
CSHOWN = root
CSHGRP = wheel

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

FILESGROUPS+= CSH
FILESGROUPS+= CSHRC
FILESGROUPS+= CSHLOGIN
FILESGROUPS+= CSHLOGOUT
FILESGROUPS+= CSHBINDKEY

.include "conf.freebsd.mk"

### End of file `admin.files.mk'
