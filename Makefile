### Makefile

ADMIN = csh.cshrc
ADMIN+= csh.login
ADMIN+= csh.logout
ADMIN+= csh.bindkey
ADMIN+= csh.bindkey.xterm
ADMIN+= csh.bindkey.bsd
ADMIN+= csh.bindkey.linux
ADMIN+= csh.complete

.include "admin.files.mk"

### End of file `Makefile'
