### lang.sh -- Use 8 bits encodings in the cons25 console

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

if ( $?TERM ) then
    if ( "$TERM" == "cons25" ) then
	setenv LANG 'en_US.ISO8859-15'
	setenv CHARSET 'ISO8859-15'
    endif
endif
