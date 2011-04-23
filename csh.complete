### csh.complete

# Author: Michaël Grünewald
# Date: Ven 18 jan 2008 23:30:17 CET
# Lang: fr_FR.ISO8859-15

# $Id$

#
# Shell commands
#

complete cd \
    'p/1/d/'

complete alias \
    'p/1/a/'

complete set \
    'p/1/s/'

complete rm \
    'p/*/f:^*.{c,h,cc,C,tex,latex,ltx,man,y,ml,mli,mly,mll,text}/'

#
# Developper
#

complete man \
    'p/*/c/'

complete make \
    'p/*/(all depend build install clean realclean distclean dist)/'


#
# Operator
#

set complete_growisofs_dvdrom='/dev/dvdrom'

complete dd \
    'c/if=/f/' \
    'c/of=/f/'

complete growisofs \
    'c/-/(M Z)/' \
    'c/*=/f/' \
    'n/-[ZM]/$complete_growisofs_dvdrom/=/'

#
# Subversion
#


#
# TeX and friends
#

complete {,la}tex \
    'c/-/(\
       ini interaction output-comment output-directory \
       parse-first-line no-parse-first-line progname \
       jobname translate-file)/' \
    'n/-interaction/(batchmode nonstopmode scrollmode errorstopmode)/' \
    'p/*/f:*.{tex,latex,ltx}/'

complete mf \
    'n/*/f:*.mf/'

complete mpost \
    'n/*/f:*.{mp,mpost,mf}/'


#
# Viewers
#

complete xdvi		'n/*/f:*.dvi/'
complete {gv,evince}	'n/*/f:*.{ps,pdf,eps}/'
complete {xpdf,acroread} \
			'n/*/f:*.pdf/'
complete acroread	'n/*/f:*.pdf/'


#
# Subversion
#

set complete_svn_words=(\
	add blame praise annotate ann cat checkout co cleanup commit	\
	ci copy cp delete del remove rm diff di export help import	\
	info list ls lock log merge mkdir move mv rename ren propdel	\
	pdel pd propedit pedit pe propget pget pg proplist plist pl	\
	propset pset ps resolved revert status stat st switch sw	\
	unlock update up	\
	)

complete svn \
	'p/1/$complete_svn_words/'	\
	'n/help/$complete_svn_words/'


#
# FreeBSD specific
#

set complete_cdcontrol_words=( \
    close debug open eject help info next previous pause stop cdid )

set complete_atacontrol_words=( \
    list info attach detach reinit create delete addspare rebuild\
    status mode cap )

alias complete_atacontrol_devices \
    'find /dev -maxdepth 1 -and \( -name "acd[0-9]*" -or -name "ad[0-9]*" \)'

alias complete_mount_points \
    'awk '\''/^#/ { next } { print $2 }'\'' /etc/fstab'

set complete_mount_fstype=( \
    ufs nfs nullfs devfs procfs linprocfs ext2fs msdosfs ntfs cd9660 )

alias complete_list_packages \
    'if ( -d /var/db/pkg) then; ls /var/db/pkg; endif'

alias complete_list_rc \
    'ls /etc/rc.d /usr/local/etc/rc.d'

complete {pkg_{delete,deinstall,info,glob},portupgrade} \
    'C/*/`complete_list_packages`/'

complete cdcontrol \
    'p/1/$complete_cdcontrol_words/'

complete atacontrol \
    'p/1/$complete_atacontrol_words/' \
    'c/ata/(0 1 2 3 4 5 6 7 8 9)/' \
    'n/{info,attach,detach,reinit}/(ata)/' \
    'n/{mode,cap}/`complete_atacontrol_devices`/'

complete mount \
    'n/-t/$complete_mount_fstype/' \
    'p/*/`complete_mount_points`/' 

# Local Variables:
# mode: shell-script
# End:

### End of file `csh.complete'
