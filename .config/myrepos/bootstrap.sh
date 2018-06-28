#!/usr/bin/env bash
set -eo pipefail
function cleanup {      
	echo "Deleting temp working ${TMP_MYREPOS_DIR:?}"
	rm -rf "${TMP_MYREPOS_DIR:?}"
}
trap cleanup EXIT ERR

# Init  with default values or args
BOOTSTRAP_MRCONFIG_URL="${1:-https://raw.githubusercontent.com/rockandska/.dotfiles/master/.mrconfig}"
BOOTSTRAP_PERL_LIBPATH_URL="${2:-https://raw.githubusercontent.com/rockandska/.dotfiles/master/.config/bash/conf.d/00perl.sh}"

MYREPOS_REPO='git://myrepos.branchable.com/'
MYREPOS_BRANCH='master'

cd ${HOME:?\$HOME not defined}

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
TMP_MYREPOS_DIR=$(mktemp -d --suffix=_dotfiles_bootstrap)
if [[ ! -d "${TMP_MYREPOS_DIR:?}" ]]; then
	echo "Could not create temp dir"
	exit 1
fi

######
# Init Perl config
######
wget -q -O ${TMP_MYREPOS_DIR:?}/perl_config.sh ${BOOTSTRAP_PERL_LIBPATH_URL}
source ${TMP_MYREPOS_DIR:?}/perl_config.sh

######
# MYREPOS TMP INSTALL
######
echo "Cloning MyRepos from ${MYREPOS_REPO}"
git clone -q -b ${MYREPOS_BRANCH} ${MYREPOS_REPO} ${TMP_MYREPOS_DIR}/myrepos

######
# BOOTSTRAP FROM URL
######
echo "Bootstraping from ${BOOTSTRAP_MRCONFIG_URL:?} (could take some minutes...)"
wget -q -O - ${BOOTSTRAP_MRCONFIG_URL:?} | ${TMP_MYREPOS_DIR}/myrepos/mr --quiet --force --trust-all -d ~/ bootstrap - ~/

#####
# BACKUP FILES ALREADY PRESENT AND STOW NEW ONES
#####
${TMP_MYREPOS_DIR}/myrepos/mr -m misstowed --backup-and-stow

#####
# RESTART BASH
#####

exec bash

#####
# CHECKOUT AGAIN NOW WE HAVE OUR DEFAULT CONFIG FILES
#####
mr -m checkout

#####
# RESTART BASH
#####

exec bash

#####
# EXIT
#####

echo -e "###############################################################"
echo -e "#                                                             #"
echo -e "# Please restart bash to take into account the new parameters #"
echo -e "#                                                             #"
echo -e "###############################################################"
