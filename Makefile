### Makefile

PROJECT = tcshfiles
VERSION = 1.0
AUTHOR = Michaël Grünewald

TCSH = csh.cshrc
TCSH+= csh.login
TCSH+= csh.logout
TCSH+= bindkey.csh
TCSH+= bindkey.xterm
TCSH+= bindkey.cons25
TCSH+= bindkey.linux
TCSH+= complete.csh
TCSH+= gnustep.csh
TCSH+= compat-i386.csh

.include "conf.tcsh.mk"

### End of file `Makefile'
