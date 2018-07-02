# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

for file in $(find ${HOME}/.config/bash/conf.d -maxdepth 1 -name '*.sh' -print);do
	source "$file"
done
