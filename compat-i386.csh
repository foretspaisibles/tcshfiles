### compat-i386.sh -- Support for a compat i386 environment

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

set compat_i386_dir="/compat/i386"

if ( -d "$compat_i386_dir" ) then
    set	compat_i386_env="env LD_32_LIBRARY_PATH=${compat_i386_dir}/usr/local/lib PATH=${compat_i386_dir}/usr/local/bin:"'$PATH'

    if ( -x "$compat_i386_dir/usr/local/bin/wine" ) then
	foreach winetool (\
	    wine winecfg winedbg wineg++ winemine wineboot wineconsole	\
	    winedump winegcc winepath winebuild winecpp winefile	\
	    winemaker wineserver\
	)
	alias "$winetool" "$compat_i386_env $compat_i386_dir/usr/local/bin/$winetool"
	end
	unset winetool
    endif

    if ( -x "$compat_i386_dir/usr/local/bin/HandbrakeCLI" ) then
	alias "handbrake" "$compat_i386_env /usr/compat/i386/usr/local/bin/HandbrakeCLI"
    endif

endif
