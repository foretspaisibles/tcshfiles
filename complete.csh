### csh.complete -- Completion for TCSH

# Author: Michael Grünewald
# Date: Ven 18 jan 2008 23:30:17 CET

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

set _complete_make_words=( \
    all depend build install clean realclean distclean dist \
    subshell \
    )

alias _complete_make \
    'echo $_complete_make_words; ls'

complete make \
    'n/-f/f/' \
    'p/*/`_complete_make`/' \


#
# Operator
#

set _complete_growisofs_dvdrom='/dev/dvdrom'

complete dd \
    'c/if=/f/' \
    'c/of=/f/'

complete growisofs \
    'c/-/(M Z)/' \
    'c@*=@F:/dev@' \
    'n/-[ZM]/$_complete_growisofs_dvdrom/=/'


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

set _complete_svn_words=(\
    add blame praise annotate ann cat checkout co cleanup commit	\
    ci copy cp delete del remove rm diff di export help import		\
    info list ls lock log merge mkdir move mv rename ren propdel	\
    pdel pd propedit pedit pe propget pget pg proplist plist pl		\
    propset pset ps resolved revert status stat st switch sw		\
    unlock update up	\
    )

complete svn \
    'p/1/$_complete_svn_words/'	\
    'n/help/$_complete_svn_words/'


#
# GIT
#

set _complete_git_words=(\
    add am archive bisect branch bundle checkout cherry-pick citool	\
    clean clone commit config describe diff fetch format-patch gc grep	\
    gui	init log merge mv notes pull push rebase reset revert rm	\
    shortlog show stash status submodule svn tag			\
    )

set _complete_git_svn_words=(\
    init fetch clone rebase dcommit branch log blame find-rev		\
    set-tree create-ignore show-ignore mkdirs commit-diff info		\
    proplist propget show-externals gc reset				\
    )

alias _complete_git_alias \
    'git config --get-regexp "alias.*" | sed -n "s@alias\.\([^ ]*\).*@\1@p"'

alias _complete_git_branch \
    'git for-each-ref --format="%(refname)" refs/heads refs/remotes | sed -e "s@refs/remotes/@@" -e "s@refs/heads/@@"'

alias _complete_git_origin_branch \
    'git for-each-ref --format="%(refname)" refs/remotes/origin | sed -n -e "/HEAD/d" -e "s@refs/remotes/origin/@@"'

alias _complete_git_command \
    '_complete_git_alias | xargs echo $_complete_git_words'

complete git \
    'p/1/$_complete_git_words/' \
    'n/svn/$_complete_git_svn_words/' \
    'n/help/$_complete_git_words/' \
    'n/branch/`_complete_git_branch | xargs echo -m -d`/' \
    'n/config/(--global --get-regexp --list)/' \
    'n/diff/`_complete_git_branch | xargs echo --check --staged --stat -- *`/' \
    'n/difftool/`_complete_git_branch | xargs echo --no-prompt --staged -- *`/' \
    'n/fetch/`git remote`/' \
    'n/merge/`_complete_git_branch`/' \
    'n/log/`_complete_git_branch | xargs echo -- --name-only --name-status --reverse --committer= --no-color --relative --ignore-space-change --ignore-space-at-eol --format=medium --format=full --format=fuller`/' \
    'n/stash/(apply list save pop clear)/' \
    'n/push/`git remote`/' \
    'N/push/`_complete_git_origin_branch`/' \
    'n/pull/`git remote | xargs echo --rebase`/' \
    'n/--rebase/`git remote`/' \
    'N/--rebase/`_complete_git_origin_branch`/' \
    'N/pull/`_complete_git_origin_branch`/' \
    'n/rebase/`_complete_git_branch | xargs echo --continue --abort --onto --skip --interactive`/' \
    'N/rebase/`_complete_git_branch`/' \
    'n/remote/(show add rm prune update)/' \
    'N/remote/`git remote`/' \
    'n/checkout/`_complete_git_branch | xargs echo -b --`/' \
    'N/-b/`_complete_git_branch`/'


#
# FreeBSD specific
#

set _complete_cdcontrol_words=( \
    close debug open eject help info next previous pause stop cdid )

set _complete_atacontrol_words=( \
    list info attach detach reinit create delete addspare rebuild\
    status mode cap )

alias _complete_atacontrol_devices \
    'find /dev -maxdepth 1 -and \( -name "acd[0-9]*" -or -name "ad[0-9]*" \)'

alias _complete_mount_points \
    'awk '\''/^#/ { next } { print $2 }'\'' /etc/fstab'

set _complete_mount_fstype=( \
    ufs nfs nullfs devfs procfs linprocfs ext2fs msdosfs ntfs cd9660 )

alias _complete_list_packages \
    'if ( -d /var/db/pkg) then; ls /var/db/pkg; endif'

alias _complete_list_rc \
    'ls /etc/rc.d /usr/local/etc/rc.d'

complete {pkg_{delete,deinstall,info,glob},portupgrade} \
    'C/*/`_complete_list_packages`/'

complete cdcontrol \
    'p/1/$_complete_cdcontrol_words/'

complete atacontrol \
    'p/1/$_complete_atacontrol_words/' \
    'c/ata/(0 1 2 3 4 5 6 7 8 9)/' \
    'n/{info,attach,detach,reinit}/(ata)/' \
    'n/{mode,cap}/`_complete_atacontrol_devices`/'

complete mount \
    'n/-t/$_complete_mount_fstype/' \
    'C@/dev@f@' \
    'p/1/`_complete_mount_points`/' \
    'p/*/f/'


# Local Variables:
# mode: shell-script
# End:

### End of file `csh.complete'
