# Site configuration files for TCSH

This collection of configuration files can be used to improve the
interactive experience of TCSH users under FreeBSD, Max OS X or
Linux. Its most important features are:

- Useful key bindings, including a call to `man(1)` upon `F1`.
- Customised clean and lean prompt.
- Completion patterns for some FreeBSD commands.
- Support for development with git.
- Support for several terminal types.


# Installation

The installation procedures uses
[BSD Make Pallàs Scripts](https://bitbucket.org/michipili/bsdmakepscripts).
It will overwrite the system scripts `csh.login`, `csh.logout` and
`csh.cshrc`.

To install these scripts, download the latest tarball, explode it and
issue a `make install` in the toplevel directory.

**Supported terminal types**
We support the terminal types `xterm`, `cons25`, and `linux`. Under
X11 or Quartz, graphical terminal advertises themselves as `xterm`.
The types `cons25` and `xterm` are made for virtual consoles under
FreeBSD and Linux-based operating systems.


# Key bindings

Please note that graphical environments can intercept some of these
keystrokes and interpret them differently.

These key bindings are borrowed from [the tcshrc project][1].

* `INSERT`: toggles overwrite or insert mode
* `DELETE`: delete char at cursor position
* `HOME`: go to the beginning of the line
* `END`: go to the end of the line
* `PAGE UP`: search in history backwards for line beginning as current
* `PAGE DOWN`: search in history forwards for line beginning as current
* `ESC-left-arrow`: go to beginning of left word
* `ESC-right-arrow`: go to beginning of right word
* `F1`: help on command currently typed
* `F2`: set the mark command to cursor position
* `F3`: move cursor to the marked position
* `F4`: unbound
* `F5`: check line for spelling and make changes
* `F6`: check current word for spelling and make changes
* `F7`: do a ala-csh completion
* `F8`: insert last item of previous command
* `F9`: unbound
* `F10`: do an 'ls -l'
* `F11`: display load average and current process status
* `F12`: clear-screen
* `Ctrl-X p`: Edit path (thanks to Carlos Duarte `<cgd@teleweb.pt>`)
* `Ctrl-X *`: Expand glob
* `Ctrl-X $`: Expand variables


# Command-line completion

Command-line completion patterns are provided to support the use of
the following commands:

- Shell internals `cd`, `alias`, `set`
- `rm`, which ignores usual precious files
- `man`
- `make`, which understands typical words such as `install` or
  `distclean`
- `dd` which understands the `-if=` and `-of=` syntax
- `growisofs` which understands the `-M=` and `-Z=` syntax
- `tex`, `latex`, `mf` and `mpost` understand their most common
  options such as `-output-directory` or `-jobname`
- `xdvi`, `evince`, `gv`, `xpdf` and `acroread` select files they can
  render
- `svn` is aware of its subcommands
- `git` is aware of its subcommands and branch names
- FreeBSD commands `mount`, `atacontrol` and `cdcontrol` are handled


# Prompt

We use a simple prompt displaying the command line number, the
hostname and the last part of the current working directory, as in:

    [123] (pointyhat) ports >

Within a git repository, the current branch is displayed, as in

    [123] (pointyhat) ports/master >

Note that the branch name is rendered with a lighter color.


# Expanding

Files under `/etc/csh/login.d`, `/etc/csh/rc.d` and
`/etc/csh/logout.d` are sourced by the shell at the corresponding
occasions.  This provides system administrators with an easy way to
add additional features during login, initialisation and logout
phases.


Michael Grünewald in Bonn, on  April 25, 2014

  [1]: http://sourceforge.net/projects/tcshrc/
