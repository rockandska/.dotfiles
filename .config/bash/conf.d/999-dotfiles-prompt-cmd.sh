_check_dotfiles_gitdir() {
	local dotfiles_gitdir="${HOME}/.local/opt/dotfiles"
	local dotfiles_bootstrap="${HOME}/.local/opt/dotfiles-bootstrap"
	if [[ "${PWD}" == "${HOME}" ]] \
		|| [[ "${PWD}" == "${dotfiles_gitdir}" ]] || [[ "${PWD}" ==	"${dotfiles_gitdir}"/* ]] \
		|| [[ "${PWD}" == "${dotfiles_bootstrap}" ]] || [[ "${PWD}" == "${dotfiles_bootstrap}"/* ]];then
		export GIT_DIR="${dotfiles_gitdir}"
		export GIT_WORK_TREE="${HOME}"
	else
		[[ "${GIT_DIR}" == "${dotfiles_gitdir}" ]] && unset GIT_DIR || true
		[[ "${GIT_WORK_TREE}" == "${HOME}" ]] && unset GIT_WORK_TREE || true
	fi
}

if ! [[ "$PROMPT_COMMAND" =~ _check_dotfiles_gitdir ]]; then
	PROMPT_COMMAND="_check_dotfiles_gitdir;$PROMPT_COMMAND";
fi
