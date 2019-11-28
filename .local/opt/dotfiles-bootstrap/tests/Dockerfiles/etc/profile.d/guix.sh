if [ "${GUIX_ENV_LOADED:=0}" -eq 0 ];then
	export USER=root
	export GUIX_ENV_LOADED=1

	if [ -r /root/.guix-profile/etc/profile ];then
		source /root/.guix-profile/etc/profile
	fi

	export PATH="$HOME/.config/guix/current/bin:$PATH"
	export INFOPATH="/root/.config/guix/current/share/info${INFOPATH:+:${INFOPATH}}"

	hash guix
fi
