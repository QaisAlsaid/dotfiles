#
# ~/.zprofile
#

[[ -f ~/.zshrc ]] && . ~/.zshrc
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec Hyprland >/dev/null
fi

source ~/vulkan/1.4.304.0/setup-env.sh
