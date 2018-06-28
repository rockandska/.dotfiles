#!/usr/bin/env bash
set -eo pipefail

# Which version of perl is installed ?
PERL_MAJOR_VERSION=$(	perl -e 'print $];' \
			| sed 's/\..*//' 2> /dev/null ) \
				|| { >&2 echo "Error while getting Perl version"; exit 1; }

# Init  with default values or args
BOOTSTRAP_MRCONFIG_URL="${1:-https://raw.githubusercontent.com/rockandska/.dotfiles/master/.mrconfig}"
BOOTSTRAP_PERL_LIBPATH_URL="${2:-https://raw.githubusercontent.com/rockandska/.dotfiles/master/.config/bash/conf.d/00perl.sh}"

MYREPOS_REPO='git://myrepos.branchable.com/'
MYREPOS_BRANCH='master'

if [ -e ~/.mrconfig ] || [ -h ~/.mrconfig ];then
	>&2 echo "#########################################################################################"
	>&2 echo "#                                                                                       #"
	>&2 echo "# ~/.mrconfig already exist on your system. Please remove it before running this script #"
	>&2 echo "#                                                                                       #"
	>&2 echo "#########################################################################################"
	exit 1
fi


######
# Prepare tmp directory for myrepos
######
TMP_MYREPOS_DIR=$(mktemp -d --suffix=_myrepos)
if [[ ! -d "${TMP_MYREPOS_DIR:?}" ]]; then
	echo "Could not create temp dir"
	exit 1
fi
function cleanup {      
	echo "Deleting temp working directory ${TMP_MYREPOS_DIR:?}"
	rm -rf "${TMP_MYREPOS_DIR:?}"
trap cleanup EXIT ERR

cd ${HOME:?\$HOME not defined}

######
# Init Perl config
######
wget -q -O - ${BOOTSTRAP_PERL_LIBPATH_URL} | bash

######
# MYREPOS TMP INSTALL
######
echo "Cloning MyRepos from ${MYREPOS_REPO}"
git clone -q -b ${MYREPOS_BRANCH} ${MYREPOS_REPO} ${TMP_MYREPOS_DIR}

######
# BOOTSTRAP FROM URL
######
echo "Bootstraping from ${BOOTSTRAP_MRCONFIG_URL:?} (could take some minutes...)"
wget -q -O - ${BOOTSTRAP_MRCONFIG_URL:?} | ${TMP_MYREPOS_DIR}/mr --quiet --force --trust-all -d ~/ bootstrap - ~/

#####
# BACKUP FILES ALREADY PRESENT AND STOW NEW ONES
#####
mr -m misstowed --backup-and-stow

#####
# RESTART BASH
#####

exec bash

#####
# CHECKOUT AGAIN NOW WE HAVE OUR DEFAULT CONFIG FILES
#####
mr -m checkout



#####
# EXIT
#####
echo -e "###############################################################"
echo -e "#                                                             #"
echo -e "# Please restart bash to take into account the new parameters #"
echo -e "#                                                             #"
echo -e "###############################################################"
