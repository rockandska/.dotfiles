#!/usr/bin/env bash
set -eEo pipefail
trap "trap - EXIT ERR;cleanup" EXIT ERR

cleanup() {      
	echo "Deleting temp working ${TMP_MYREPOS_DIR:?}"
	rm -rf "${TMP_MYREPOS_DIR:?}"
}

get() {
	local destination=${1:?}
	local src=${2:?}
	local branch=${3:-master}
	case ${src} in
		git://*|*.git)
			git clone -q -b ${branch} ${src} ${destination}
			;;
		http://*|https://*|ftp://*)
			wget -q -O ${destination} ${src}
			;;
		*)
			mkdir -p $(dirname ${destination})
			cp -r ${src} ${destination}
			;;
	esac
}

mkdir_tmpdir() {
	######
	# Prepare tmp directory for myrepos
	######
	echo "Prepare tmp directory for myrepos"
	TMP_MYREPOS_DIR=$(mktemp -d --suffix=_dotfiles_bootstrap)
	if [[ ! -d "${TMP_MYREPOS_DIR:?}" ]]; then
		echo "Could not create temp dir"
		exit 1
	fi
	cd ${TMP_MYREPOS_DIR:?}

}

init_perl() {
	######
	# Init Perl config
	######
	echo "Init Perl config"
	get ${TMP_MYREPOS_DIR:?}/perl_config.sh ${BOOTSTRAP_PERL_LIBPATH}
	source ${TMP_MYREPOS_DIR:?}/perl_config.sh
}

init_mr() {
	######
	# MYREPOS TMP INSTALL
	######
	echo "Cloning MyRepos from ${MYREPOS_REPO}"
	get ${TMP_MYREPOS_DIR}/myrepos ${MYREPOS_REPO} ${MYREPOS_BRANCH}
}

bootstrap_mr() {
	######
	# BOOTSTRAP FROM MRCONFIG FILE
	######
	echo "Bootstraping from ${BOOTSTRAP_MRCONFIG:?} (could take some minutes...)"
	get ${TMP_MYREPOS_DIR}/mrconfig ${BOOTSTRAP_MRCONFIG:?}
	${TMP_MYREPOS_DIR}/myrepos/mr -q --force --trust-all -d ~/ bootstrap ${TMP_MYREPOS_DIR}/mrconfig ~/
}

backup() {
	#####
	# BACKUP FILES ALREADY PRESENT AND STOW NEW ONES
	#####
	cd ${HOME:?}
	echo "Backup files already present and stow new ones"
	${TMP_MYREPOS_DIR}/myrepos/mr -m backupstowover
}

main() {
	if [ -e ~/.mrconfig ] || [ -h ~/.mrconfig ];then
		>&2 echo "#########################################################################################"
		>&2 echo "#                                                                                       #"
		>&2 echo "# ~/.mrconfig already exist on your system. Please remove it before running this script #"
		>&2 echo "#                                                                                       #"
		>&2 echo "#########################################################################################"
		exit 1
	fi

	# Init  with default values or args
	export BOOTSTRAP_MRCONFIG="${1:-https://raw.githubusercontent.com/rockandska/.dotfiles/master/.mrconfig}"
	export BOOTSTRAP_PERL_LIBPATH="${2:-https://raw.githubusercontent.com/rockandska/.dotfiles/master/.config/bash/conf.d/00perl.sh}"
	export DOTFILES_REPO="${3:-https://github.com/rockandska/.dotfiles.git}"
	export DOTFILES_REPO_CHECKOUT="${4:-master}"

	export MYREPOS_REPO="${5:-git://myrepos.branchable.com/}"
	export MYREPOS_REPO_CHECKOUT="${6:-1.20171231}"

	export CPANM_REPO="${7:-https://github.com/miyagawa/cpanminus.git}"
	export CPANM_REPO_CHECKOUT='App-cpanminus-1.7907'

	export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

	mkdir_tmpdir
	init_perl
	init_mr
	bootstrap_mr
	backup

	#####
	# CHECKOUT AGAIN NOW WE HAVE 
	# OUR DEFAULT CONFIG FILES
	# AND ENV INIT
	#####
	echo "Checkout again with mr"
	mr -q checkout

	#####
	# EXIT
	#####
	echo -e "###############################################################"
	echo -e "#                                                             #"
	echo -e "# Please restart bash to take into account the new parameters #"
	echo -e "#                                                             #"
	echo -e "###############################################################"
}

main "$@"
