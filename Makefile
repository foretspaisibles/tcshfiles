### Makefile

PROJECT = tcshfiles
VERSION = 1.0
AUTHOR = Michaël Grünewald

CSH = csh.cshrc
CSH+= csh.login
CSH+= csh.logout

CSHRC+= bindkey.csh
CSHRC+= complete.csh
CSHRC+= gnustep.csh
CSHRC+= compat-i386.csh
CSHRC+= lang.csh

CSHBINDKEY+= bindkey.xterm
CSHBINDKEY+= bindkey.cons25
CSHBINDKEY+= bindkey.linux

CSHTOOL+= scm_prompt_make.sh

.include "conf.tcsh.mk"

### End of file `Makefile'
