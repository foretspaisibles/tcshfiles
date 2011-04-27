### admin.files.mk -- Install administration files

PREFIX?=
TCSHDIR = ${PREFIX}/etc/tcshrc.d
TCSHMODE = 444
TCSHOWN = root
TCSHGRP = wheel

TCSHDIR.csh.cshrc = ${PREFIX}/etc
TCSHDIR.csh.login = ${PREFIX}/etc
TCSHDIR.csh.logout = ${PREFIX}/etc

FILESGROUPS+= TCSH

.include "conf.freebsd.mk"

### End of file `admin.files.mk'
