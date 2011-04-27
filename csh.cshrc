### csh.cshrc -- TCSH Resource Configuration Script

# Author: Michaël Grünewald
# Date: Ven 26 jan 2007 19:32:47 CET
# Lang: fr_FR.ISO8859-15

# $Id$


# Le shell TCSH lit plusieurs fichiers d'initialisation dans le
# répertoire de l'utilisateur. Le mécanisme complet est détaillé dans
# la page de manuel tcsh(1), dans la section ``Startup and shutdown''.
#
# Parmi ces fichiers d'initialisation figure le fichier `dot.tcsh'. Ce
# fichier est lu par tous les processus shell, les shells de connexion
# comme les shells crées ultérieurement (par exemple dans une session
# X).
#
# SeeAlso: tcsh(1), environ(7).

# Remarque: une grande partie du matériel apparaissant dans ce fichier
#  est adapté des propositions du projet TCSHRC publiées sur
#  `http://tcshrc.sourceforge.net'. On peut consulter cette URL pour y
#  trouver de nombreuses autres propositions pour la configuration du
#  c-shell.


#
# Echo style
#

# La primitive `echo' du c-shell peut être paramétrée pour simuler la
# commande `echo' de quelques systèmes. Le paramètre `echo_style'
# indique au c-shell quel doit être le comportement de la primitive
# `echo'.
#
# Les valeurs possibles sont discutées dans le manuel du c-shell, il
# peut s'agir de
#
#   both, bsd, sysv, etc.
#
# Nous utilisons la valeur `both' de sorte que la commande `echo'
# interprète les séquences d'échappement.
#
# D'autres paramètres d'initialisation du c-shell font l'hypothèse que
# les séquences d'échappement sont interprétés par la primitive
# `echo'. C'est notamment le cas des paramètres modifiant le titre du
# shell.

set echo_style=both


#
# Path
#

# La variable spéciale `path' est utilisée par le shell pour
# rechercher les programmes dont l'éxécution est commandée par
# l'utilisateur.
#
# Pour initialiser cette variable, on utilise les formes `set -l'
# (last) et `set -f' (first) de la primitive `set'. Les modificateurs
# `l' et `f' demandent la suppression des doublons dans la valeur
# affectée. Lors de la suppression des doublons, la première occurence
# est conservée lorsque le modificateur `-f' est utilisé, la dernière
# occurence est conservée lorsque le mdoificateur `-l' est utilisé.

# Les modifications suivantes concernent uniquement le compte `root'.
# Après évaluation des commandes suivantes, les dossiers $HOME/bin,
# /sbin, /usr/sbin, /usr/local/sbin sont examinés dans cet
# ordre. Ainsi les programmes dans `/root/bin' peuvent cacher les
# programmes du système mais les programmes installé par les ports ou
# d'autres sources, vers la racine `/usr/local', ne masquent jamais
# les utilitaires du système.
 
if ($LOGNAME == "root") then
	set -f path = ( $path $HOME/bin )
	set -f path = ( $path /sbin )
	set -f path = ( $path /usr/sbin )
	foreach path_elt ( \
		/opt/local/sbin \
		/usr/local/sbin \
        /sbin \
	)
		if ( -d $path_elt ) then
			set -f path = ( $path_elt $path )
		endif
	end
endif

# Les modifications suivantes concernent tous les comptes du système.
# Du point de vue du masquage des programmes, la logique est la même
# que pour les utilitaires du système.

set -f path = ( $path $HOME/bin )
set -f path = ( $path /bin )
set -f path = ( $path /usr/bin )

# On termine en ajoutant divers points d'installation de programmes.
# Ces points sont rejetés à la fin du `path' et leur contenu ne masque
# donc pas celui des autres points du `path'.

foreach path_elt ( \
	/usr/local/ssl/bin \
	/usr/local/samba/bin \
	/usr/local/java/bin \
	/usr/texlive/bin \
	/usr/games \
    /usr/local/bin \
	/usr/local/sbin \
    /opt/local/bin \
	/opt/local/sbin \
	/usr/X11R6/bin \
)
	if ( -d $path_elt ) then
		set -l path = ( $path $path_elt )
	endif
end

unset path_elt


#
# Prompt
#

# Cette section paramètre les indicateurs de la ligne de commande et
# le titre du terminal. Le titre est notamment utilisé par les
# émulateurs de terminaux du système X Windows.

# On modifie les indicateurs de demande de commande. L'indicateur
# principal ressemble à:
#
#  [13] (host) pwd_tail >
#
# Le caractère `>' est remplacé par `#' pour 'utilisateur root, et
# `pwd_tail' fait apparaître le dernier élément du ``path to working
# directory''. 

set prompt = "%B[%h]%b (%m) %c %B%#%b "


# Lorsque le shell attend le contenu de boucles `for' `while' etc., il
# utilise un indicateur 'for?', 'while?', etc.

set prompt2="%R?"


# Lorsque le shell attend un élément de correction pour une commande
# mal tapée, il utilise un indicateur 'XXX'.
#
# Correct????
# 	y: yes, n: no, e: edit
# 	<SPACE>: yes
# 	<ENTER>: no

set prompt3="Correct > %B%R%b (y|n|e)?"


#
# Historique des commandes
#

# La taille de l'historique est controlée par la valeur de
# `history'. Les mécanismes de l'historique des commandes peuvent être
# utilisés pour utiliser les commandes précédentes comme paramètres de
# nouvelles commandes.
#
# L'utilisation la plus simple de l'historique est le simple rappel
# des commandes précédentes.

set history=999


# La variable `histfile' contrôle le nom du fichier enregistré pour
# l'historique. Si cette variable n'est pas définie, aucun fichier
# d'historique n'est enregistré.
#
# Si vous ne souhaitez pas que soit enregistrée l'historique d'une
# session, faites apparaître la commande suivante dans le fichier
# d'initialisation.
#
# unset histfile


#
# Interaction avec le C-shell
#

# De nombreux paramètres permettent de modifier le comportement du
# C-shell. On passe ici en revue une partie de ces paramètres avec une
# courte explication.
#
# La liste complète de ces paramètes et des explications plus
# détaillées figurent dans la page de manuel tcsh(1).

# Le c-shell peut vous informer des connexions et des déconnexions des
# utilisateurs du système.
#
# Deux variables du shell sont mises en jeu dans ce mécanisme:
#  - la variable `watch' qui spécifie quelles utilisateurs et quelles
#    consoles surveiller;
#  - la variable `who' qui contrôle le format des rapports.
#
# La variable `who' doit être modifiée pour tenir compte de la
# langue, pour chaque utilisateur (le mot `%a' est un paramètre
# régional).
#
# De plus amples détails sont donnés dans la section `Special shell
# variables' du manuel tcsh(1).
#
#set watch=(0 any any)
#set who="%n has %a %l from %M."

# Le c-shell propose plusieurs modes d'insertion: insert et
# overwrite. On peut utiliser la touche `insert' pour changer de mode
# (cf. XXX).

set inputmode=insert


# On demande au c-shell d'afficher les possibilités de complétion de
# la ligne de commande lorque plusieurs d'entre elles sont
# possibles. Il est donc facile de voir combien de caractères sont
# nécessaires pour lever toute ambiguité sur la commande en cours de
# saisie.
#
# Ce réglage épargne de nombreuses utilisations de `^D'.

set autolist


# Le c-shell a des capacités dans le domaine de l'autocorrection et de
# la complétion automatique. Ces capcités sont limitées et marquées
# par l'empreinte de la stupidité artificielle. Nous les activons
# toutes ci-dessous, l'effet particulier de chacun de ces règlages est
# décrit dans le manuel tcsh(1), à la section ``Special shell
# variables''.

set autocorrect
set autoexpand
set complete=enhance
set correct=all
set symlinks=chase


# On peut demander au c-shell de terminer automatiquement la session
# en cas d'inactivité prolongée.
#
# La liaison `set autologout=3' termine automatiquement la session
# après trois minutes d'inactivité.
#
# Nous désactivons cette fonctionnalité.

unset autologout


# Après l'envoi du signal SIGSTOP (^Z) à un processus, le c-shell
# affiche autmatiquement la liste des travaux suspendus. Cette
# information est utile au ``job-management''.

set listjobs


# Nous demandons au c-shell d'afficher les codes de terminaison des
# processus.
#
# C'est un règlage appréicable lors de la mise au point de scripts
# shell.

set printexitvalue


# Demande confirmation avant de valider la commande `rm *'. C'est un
# filet de sécurité parfois apprécié.

set rmstar


# La liste `fignore' a pour membres des ``globbing patterns'' servant
# à filtrer les fichiers inintéressants du point de vue de la
# complétion automatique.
#
# En règle générale les fichiers impertinents pour la complétion sont
# des fichiers objet, produits par un compilateur. 
#
# set fignore=(.o)


# La variable `time' peut être utilisée pour afficher des statistiques
# sur les commandes dont le temps d'éxécution est important.
#
# Remarques:
#
#  1. Ici important signifie plus de 8 secondes.
#  2. Les ``page faults'' font partie des mécanismes de gestion de
#     mémoire virtuelle, une ``page fault'' est normalement suivie
#     d'un accès à la mémoire ``swappée'' sur le disque.
#  3. Le manuel tcsh(1) décrit les valeurs que peut prendre la
#     variable spéciale `time'.

set time=(8 "\
Time spent in user mode   (CPU seconds) : %Us\
Time spent in kernel mode (CPU seconds) : %Ss\
Total time                              : %Es\
CPU utilisation (percentage)            : %P\
Times the process was swapped           : %W\
Times of major page faults              : %F\
Times of minor page faults              : %R")


# Si la variable `mail' pointe vers votre boîte à lettre, le c-shell
# vous informe de l'arrivée de nouveaux courriers.

set mail = (/var/mail/$USER)


# La commande d'aide `helpcommand' est appelée sur le mot courant
# lorsque `F1' est pressée.
#
# Exemple:
#
#   alias helpcommand whatis

alias helpcommand man


#
# Éxécution automatique de commandes
#

# Le c-shell propose plusieurs mécanismes permettant l'éxécution
# automatique de commandes.

# Le premier de ces mécanismes est l'alias spécial `precmd'. Lorsque
# celui-ci est défini, le texte de remplacement de `precmd' est évalué
# avant chaque affichage du prompt.
#
# Exemple:
#
#   alias precmd date

unalias precmd


# Le deuxième de ces mécanismes permet l'éxécution périodique d'une
# commande. La période est déterminée par la variable `tperiod' et
# l'action périodique par l'alias `periodic'.
#
# Exemple:
#
#  set period 2s # une période de 2 secondes
#  alias periodic 'tput bel'

unset tperiod
unalias periodic


# Le dernier de ces mécanismes est un planifacteur qui permet
# l'éxécution différée de commandes.
#
# On peut utiliser ce planificateur pour rappeler des rendez-vous,
# etc.
#
# Remarque:
#
#  Le démon `atd' peut être utilisé pour planifier l'éxécution de
#  taches à une date particulière (cf. at(1)). Le démon `crond' peut
#  être utilisé pour planifier l'éxécution périodique de taches
#  (cf. crontab(1)).
#
# Exemple:
#
#  sched 5pm set prompt 'It\'s after 5pm, go home %# '
#  sched +8:00 set prompt='Has trabajado mucho. Llama la novia\! :> '


#
# Alias de commandes
#

# Les alias suivants modifient les commandes `cp' et `mv' pour
# qu'elles demandent confirmation avant de détruire des fichiers.
# Cette protection contre l'effacement de fichiers peut aussi être
# activée pour la commande `rm' mais certains la trouvent ennuyeuse
# car `rm' sert précisément à effacer des fichiers.

alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'

# Des variantes de la commande `ls' qui permettent de gagner du
# temps sur la ligne de commande.

alias la	ls -a
alias lf	ls -FA
alias ll	ls -lA
alias lh    ls -lAh


# Pratique: saisissez `ff test.c' pour trouver le fichier `test.c'. 
# Si la base de donnée de `locate' est suffisamment récente, il est en
# général plus rapide d'utiliser `locate test.c'.

alias ff    	'find . -name $*'


# Derniers regrets.

alias h		history 25
alias j		jobs -l


#
# Masque de permission pour les nouveaux fichiers
#

# Masque de permissions pour la création de fichiers. Le paramètre
# `umask' de l'utilisateur est utilisé lors de chaque création de
# fichier, les bits de permission présents dans le paramètre sont
# effacés dans les permissions du fichier. Pour un utilisateur
# ordinaire, un attribut `umask' de 027 interdit l'accès à tous les
# fichiers ainsi qu'aux répertoires pour les utilisateurs `others',
# autorise la lecture des fichiers et le parcours des répertoires pour
# les membres du groupe propriétaire du fichier et autorise
# l'utilisateur à lire et écrire ses propres fichiers, ainsi qu'à
# parcourir ses répertoires. Un attribut `umask' 022 est préconisé
# pour l'utilisateur root, du moins pendant l'installation des
# logiciles, autrement les utilisateurs pourraient ne plus pouvoir
# utiliser certains programmes.
#
# Confer: chmod(1), chmod(2), chown(1), chgrp(1), install(1).

if ( $USER == root ) then
    umask 22
else
    umask 27
endif

setenv EDITOR vi
setenv PAGER less
setenv BLOCKSIZE K
setenv CLICOLOR yes

#
# CSH RC Repository
#

if ( -d /etc/tcshrc.d ) then
	foreach csh_file ( /etc/tcshrc.d/*.csh )
		source $csh_file
	end
	unset csh_file
endif

# Local Variables:
# mode: shell-script
# eval: (sh-set-shell "/bin/tcsh")
# tab-width: 4
# End:

### End of file `csh.cshrc'
