### gnustep.csh -- Support for the GNUSTEP environment

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

# Information for gnustep-1.13.0:
#  (pkg_info -D gnustep-1.13.0)

if ( -e /usr/local/GNUstep/System/Library/Makefiles/GNUstep.csh ) then
	source /usr/local/GNUstep/System/Library/Makefiles/GNUstep.csh
endif
