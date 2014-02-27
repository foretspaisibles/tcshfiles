### csh.cshrc -- TCSH Resource Configuration Script

# Author: Micha�l Gr�newald
# Date: Ven 26 jan 2007 19:32:47 CET
# Lang: fr_FR.ISO8859-15

# $Id$


# Le shell TCSH lit plusieurs fichiers d'initialisation dans le
# r�pertoire de l'utilisateur. Le m�canisme complet est d�taill� dans
# la page de manuel tcsh(1), dans la section ``Startup and shutdown''.
#
# Parmi ces fichiers d'initialisation figure le fichier `dot.tcsh'. Ce
# fichier est lu par tous les processus shell, les shells de connexion
# comme les shells cr�es ult�rieurement (par exemple dans une session
# X).
#
# SeeAlso: tcsh(1), environ(7).

# Remarque: une grande partie du mat�riel apparaissant dans ce fichier
#  est adapt� des propositions du projet TCSHRC publi�es sur
#  `http://tcshrc.sourceforge.net'. On peut consulter cette URL pour y
#  trouver de nombreuses autres propositions pour la configuration du
#  c-shell.


#
# Echo style
#

# La primitive `echo' du c-shell peut �tre param�tr�e pour simuler la
# commande `echo' de quelques syst�mes. Le param�tre `echo_style'
# indique au c-shell quel doit �tre le comportement de la primitive
# `echo'.
#
# Les valeurs possibles sont discut�es dans le manuel du c-shell, il
# peut s'agir de
#
#   both, bsd, sysv, etc.
#
# Nous utilisons la valeur `both' de sorte que la commande `echo'
# interpr�te les s�quences d'�chappement.
#
# D'autres param�tres d'initialisation du c-shell font l'hypoth�se que
# les s�quences d'�chappement sont interpr�t�s par la primitive
# `echo'. C'est notamment le cas des param�tres modifiant le titre du
# shell.

set echo_style=both


#
# Path
#

# La variable sp�ciale `path' est utilis�e par le shell pour
# rechercher les programmes dont l'�x�cution est command�e par
# l'utilisateur.
#
# Pour initialiser cette variable, on utilise les formes `set -l'
# (last) et `set -f' (first) de la primitive `set'. Les modificateurs
# `l' et `f' demandent la suppression des doublons dans la valeur
# affect�e. Lors de la suppression des doublons, la premi�re occurence
# est conserv�e lorsque le modificateur `-f' est utilis�, la derni�re
# occurence est conserv�e lorsque le mdoificateur `-l' est utilis�.

# Les modifications suivantes concernent uniquement le compte `root'.
# Apr�s �valuation des commandes suivantes, les dossiers $HOME/bin,
# /sbin, /usr/sbin, /usr/local/sbin sont examin�s dans cet
# ordre. Ainsi les programmes dans `/root/bin' peuvent cacher les
# programmes du syst�me mais les programmes install� par les ports ou
# d'autres sources, vers la racine `/usr/local', ne masquent jamais
# les utilitaires du syst�me.
 
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

# Les modifications suivantes concernent tous les comptes du syst�me.
# Du point de vue du masquage des programmes, la logique est la m�me
# que pour les utilitaires du syst�me.

set -f path = ( $path $HOME/bin )
set -f path = ( $path /bin )
set -f path = ( $path /usr/bin )

# On termine en ajoutant divers points d'installation de programmes.
# Ces points sont rejet�s � la fin du `path' et leur contenu ne masque
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

# Cette section param�tre les indicateurs de la ligne de commande et
# le titre du terminal. Le titre est notamment utilis� par les
# �mulateurs de terminaux du syst�me X Windows.

# On modifie les indicateurs de demande de commande. L'indicateur
# principal ressemble �:
#
#  [13] (host) pwd_tail >
#
# Le caract�re `>' est remplac� par `#' pour 'utilisateur root, et
# `pwd_tail' fait appara�tre le dernier �l�ment du ``path to working
# directory''. 

set prompt = "%B[%h]%b (%m) %c %B%#%b "


# Lorsque le shell attend le contenu de boucles `for' `while' etc., il
# utilise un indicateur 'for?', 'while?', etc.

set prompt2="%R?"


# Lorsque le shell attend un �l�ment de correction pour une commande
# mal tap�e, il utilise un indicateur 'XXX'.
#
# Correct????
# 	y: yes, n: no, e: edit
# 	<SPACE>: yes
# 	<ENTER>: no

set prompt3="Correct > %B%R%b (y|n|e)?"


#
# Historique des commandes
#

# La taille de l'historique est control�e par la valeur de
# `history'. Les m�canismes de l'historique des commandes peuvent �tre
# utilis�s pour utiliser les commandes pr�c�dentes comme param�tres de
# nouvelles commandes.
#
# L'utilisation la plus simple de l'historique est le simple rappel
# des commandes pr�c�dentes.

set history=999


# La variable `histfile' contr�le le nom du fichier enregistr� pour
# l'historique. Si cette variable n'est pas d�finie, aucun fichier
# d'historique n'est enregistr�.
#
# Si vous ne souhaitez pas que soit enregistr�e l'historique d'une
# session, faites appara�tre la commande suivante dans le fichier
# d'initialisation.
#
# unset histfile


#
# Interaction avec le C-shell
#

# De nombreux param�tres permettent de modifier le comportement du
# C-shell. On passe ici en revue une partie de ces param�tres avec une
# courte explication.
#
# La liste compl�te de ces param�tes et des explications plus
# d�taill�es figurent dans la page de manuel tcsh(1).

# Le c-shell peut vous informer des connexions et des d�connexions des
# utilisateurs du syst�me.
#
# Deux variables du shell sont mises en jeu dans ce m�canisme:
#  - la variable `watch' qui sp�cifie quelles utilisateurs et quelles
#    consoles surveiller;
#  - la variable `who' qui contr�le le format des rapports.
#
# La variable `who' doit �tre modifi�e pour tenir compte de la
# langue, pour chaque utilisateur (le mot `%a' est un param�tre
# r�gional).
#
# De plus amples d�tails sont donn�s dans la section `Special shell
# variables' du manuel tcsh(1).
#
#set watch=(0 any any)
#set who="%n has %a %l from %M."

# Le c-shell propose plusieurs modes d'insertion: insert et
# overwrite. On peut utiliser la touche `insert' pour changer de mode
# (cf. XXX).

set inputmode=insert


# On demande au c-shell d'afficher les possibilit�s de compl�tion de
# la ligne de commande lorque plusieurs d'entre elles sont
# possibles. Il est donc facile de voir combien de caract�res sont
# n�cessaires pour lever toute ambiguit� sur la commande en cours de
# saisie.
#
# Ce r�glage �pargne de nombreuses utilisations de `^D'.

set autolist


# Le c-shell a des capacit�s dans le domaine de l'autocorrection et de
# la compl�tion automatique. Ces capcit�s sont limit�es et marqu�es
# par l'empreinte de la stupidit� artificielle. Nous les activons
# toutes ci-dessous, l'effet particulier de chacun de ces r�glages est
# d�crit dans le manuel tcsh(1), � la section ``Special shell
# variables''.

set autocorrect
set autoexpand
set complete=enhance
set correct=all
set symlinks=chase


# On peut demander au c-shell de terminer automatiquement la session
# en cas d'inactivit� prolong�e.
#
# La liaison `set autologout=3' termine automatiquement la session
# apr�s trois minutes d'inactivit�.
#
# Nous d�sactivons cette fonctionnalit�.

unset autologout


# Apr�s l'envoi du signal SIGSTOP (^Z) � un processus, le c-shell
# affiche autmatiquement la liste des travaux suspendus. Cette
# information est utile au ``job-management''.

set listjobs


# Nous demandons au c-shell d'afficher les codes de terminaison des
# processus.
#
# C'est un r�glage appr�icable lors de la mise au point de scripts
# shell.

set printexitvalue


# Demande confirmation avant de valider la commande `rm *'. C'est un
# filet de s�curit� parfois appr�ci�.

set rmstar


# La liste `fignore' a pour membres des ``globbing patterns'' servant
# � filtrer les fichiers inint�ressants du point de vue de la
# compl�tion automatique.
#
# En r�gle g�n�rale les fichiers impertinents pour la compl�tion sont
# des fichiers objet, produits par un compilateur. 
#
# set fignore=(.o)


# La variable `time' peut �tre utilis�e pour afficher des statistiques
# sur les commandes dont le temps d'�x�cution est important.
#
# Remarques:
#
#  1. Ici important signifie plus de 8 secondes.
#  2. Les ``page faults'' font partie des m�canismes de gestion de
#     m�moire virtuelle, une ``page fault'' est normalement suivie
#     d'un acc�s � la m�moire ``swapp�e'' sur le disque.
#  3. Le manuel tcsh(1) d�crit les valeurs que peut prendre la
#     variable sp�ciale `time'.

set time=(8 "\
Time spent in user mode   (CPU seconds) : %Us\
Time spent in kernel mode (CPU seconds) : %Ss\
Total time                              : %Es\
CPU utilisation (percentage)            : %P\
Times the process was swapped           : %W\
Times of major page faults              : %F\
Times of minor page faults              : %R")


# Si la variable `mail' pointe vers votre bo�te � lettre, le c-shell
# vous informe de l'arriv�e de nouveaux courriers.

set mail = (/var/mail/$USER)


# La commande d'aide `helpcommand' est appel�e sur le mot courant
# lorsque `F1' est press�e.
#
# Exemple:
#
#   alias helpcommand whatis

alias helpcommand man


#
# �x�cution automatique de commandes
#

# Le c-shell propose plusieurs m�canismes permettant l'�x�cution
# automatique de commandes.

# Le premier de ces m�canismes est l'alias sp�cial `precmd'. Lorsque
# celui-ci est d�fini, le texte de remplacement de `precmd' est �valu�
# avant chaque affichage du prompt.
#
# Exemple:
#
#   alias precmd date

unalias precmd


# Le deuxi�me de ces m�canismes permet l'�x�cution p�riodique d'une
# commande. La p�riode est d�termin�e par la variable `tperiod' et
# l'action p�riodique par l'alias `periodic'.
#
# Exemple:
#
#  set period 2s # une p�riode de 2 secondes
#  alias periodic 'tput bel'

unset tperiod
unalias periodic


# Le dernier de ces m�canismes est un planifacteur qui permet
# l'�x�cution diff�r�e de commandes.
#
# On peut utiliser ce planificateur pour rappeler des rendez-vous,
# etc.
#
# Remarque:
#
#  Le d�mon `atd' peut �tre utilis� pour planifier l'�x�cution de
#  taches � une date particuli�re (cf. at(1)). Le d�mon `crond' peut
#  �tre utilis� pour planifier l'�x�cution p�riodique de taches
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
# qu'elles demandent confirmation avant de d�truire des fichiers.
# Cette protection contre l'effacement de fichiers peut aussi �tre
# activ�e pour la commande `rm' mais certains la trouvent ennuyeuse
# car `rm' sert pr�cis�ment � effacer des fichiers.

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
# Si la base de donn�e de `locate' est suffisamment r�cente, il est en
# g�n�ral plus rapide d'utiliser `locate test.c'.

alias ff    	'find . -name $*'


# Derniers regrets.

alias h		history 25
alias j		jobs -l


#
# Masque de permission pour les nouveaux fichiers
#

# Masque de permissions pour la cr�ation de fichiers. Le param�tre
# `umask' de l'utilisateur est utilis� lors de chaque cr�ation de
# fichier, les bits de permission pr�sents dans le param�tre sont
# effac�s dans les permissions du fichier. Pour un utilisateur
# ordinaire, un attribut `umask' de 027 interdit l'acc�s � tous les
# fichiers ainsi qu'aux r�pertoires pour les utilisateurs `others',
# autorise la lecture des fichiers et le parcours des r�pertoires pour
# les membres du groupe propri�taire du fichier et autorise
# l'utilisateur � lire et �crire ses propres fichiers, ainsi qu'�
# parcourir ses r�pertoires. Un attribut `umask' 022 est pr�conis�
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
