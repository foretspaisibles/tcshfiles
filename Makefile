### Makefile

# Author: Michael Grünewald
# Date: Thu Feb 27 18:21:27 CET 2014

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

PROJECT = tcshfiles
AUTHOR = Michael Grünewald
VERSION = 1.0

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
