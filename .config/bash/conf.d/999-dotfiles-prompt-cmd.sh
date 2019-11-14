_check_dotfiles_gitdir() {
	local dotfiles_gitdir="${HOME}/.local/opt/dotfiles/.git"
	if [[ "${PWD}" == "${HOME}" ]];then
		export GIT_DIR="${dotfiles_gitdir}"
		export GIT_WORKTREE="${HOME}"
	else
		[[ "${GIT_DIR}" == "${dotfiles_gitdir}" ]] && unset GIT_DIR
		[[ "${GIT_WORKTREE}" == "${HOME}" ]] && unset GIT_WORKTREE
	fi
}

if ! [[ "$PROMPT_COMMAND" =~ _check_dotfiles_gitdir ]]; then
	PROMPT_COMMAND="_check_dotfiles_gitdir;$PROMPT_COMMAND";
fi
