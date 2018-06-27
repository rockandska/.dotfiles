#!/usr/bin/env bash
set -eo pipefail

# Which version of perl is installed ?
PERL_MAJOR_VERSION=$(perl -e 'print $];' \
			| sed 's/\..*//' 2> /dev/null \
			|| >&2 echo "Error while getting Perl version")

# Init  with default values or args
BOOTSTRAP_MRCONFIG_URL="${1:-https://raw.githubusercontent.com/rockandska/.dotfiles/master/.mrconfig}"
PERL_LIBPATH="${2:-${HOME:?}/.local/opt/perl${PERL_MAJOR_VERSION}}"

MYREPOS_REPO='git://myrepos.branchable.com/'
MYREPOS_BRANCH='master'

cd ${HOME:?\$HOME not defined}

# Configure perl locallib variables
read -r -d '' PERL_CONFIG <<- EOF || true
	PERL${PERL_MAJOR_VERSION}LIB="${PERL_LIBPATH:?}/lib/perl${PERL_MAJOR_VERSION}${PERL5LIB:+:${PERL5LIB}}"; export PERL${PERL_MAJOR_VERSION}LIB
	PERL_LOCAL_LIB_ROOT="${PERL_LIBPATH:?}${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT
	PERL_MB_OPT="--install_base \"${PERL_LIBPATH:?}\""; export PERL_MB_OPT
	PERL_MM_OPT="INSTALL_BASE=${PERL_LIBPATH:?}"; export PERL_MM_OPT
	PATH="${PERL_LIBPATH:?}/bin:${PATH:?}"; export PATH
EOF

eval ${PERL_CONFIG}

######
# MYREPOS TMP INSTALL
######
rm -rf /tmp/myrepos || echo >&2 "Can't delete /tmp/myrepos"
echo "Cloning MyRepos from ${MYREPOS_REPO}"
git clone -q -b ${MYREPOS_BRANCH} ${MYREPOS_REPO} /tmp/myrepos

######
# BOOTSTRAP FROM URL
######
rm -rf ~/.mrconfig || echo >&2 "Can't delete ~/.mrconfig"
echo "Bootstrap from ${BOOTSTRAP_MRCONFIG_URL:?} (could take some minutes...)"
wget -q -O - ${BOOTSTRAP_MRCONFIG_URL:?} | /tmp/myrepos/mr --quiet --force --trust-all -d ~/ bootstrap - ~/

#####
# BACKUP FILES ALREADY PRESENT
#####
mr -m misstowed --backup-and-stow

#####
# CHECKOUT AGAIN NOW WE HAVE OUR DEFAULT CONFIG FILES
#####
mr -m checkout
