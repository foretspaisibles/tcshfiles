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

Michael Grünewald in Bonn, on  Thursday 27, 2014
