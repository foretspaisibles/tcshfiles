#
# Compat i386
#

set compat_i386_dir="/compat/i386"

if ( -d "$compat_i386_dir" ) then
    set	compat_i386_env="env LD_32_LIBRARY_PATH=${compat_i386_dir}/usr/local/lib PATH=${compat_i386_dir}/usr/local/bin:"'$PATH'

    if ( -x "$compat_i386_dir/usr/local/bin/wine" ) then
    foreach winetool ( wine winecfg winedbg wineg++ winemine wineboot wineconsole winedump winegcc winepath winebuild winecpp winefile winemaker wineserver )
	alias "$winetool" "$compat_i386_env $compat_i386_dir/usr/local/bin/$winetool"
    end
    unset winetool

    if ( -x "$compat_i386_dir/usr/local/bin/HandbrakeCLI" ) then
	alias "handbrake" "$compat_i386_env /usr/compat/i386/usr/local/bin/HandbrakeCLI"
    endif
endif
