### admin.files.mk -- Install administration files

ADMINDIR = /etc
ADMINMODE = 444
ADMINOWN = root
ADMINGRP = wheel

FILESGROUPS+= ADMIN

.include "bps.init.mk"
.include "bps.credentials.mk"
.include "bps.clean.mk"
.include "bps.files.mk"
.include "bps.usertarget.mk"

### End of file `admin.files.mk'
