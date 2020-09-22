alias scode="sudo code --user-data-dir=/home/sigsve/.vscode $@"
alias reboot-bios="sudo systemctl reboot --firmware-setup"
alias wsens="watch -n 1 sensors \"it8620-isa-0a60\""
alias winxi="watch --color -n 1 inxi -F"

alias keyd-start="sudo service xkeysnail start"
alias keyd-stop="sudo service xkeysnail stop"
alias keyd-restart="sudo service xkeysnail restart"
alias keyd-status="sudo service xkeysnail status"

keyd-watch() {
    sudo service xkeysnail stop
    sleep 1
    sudo /home/sigsve/.config/xkeysnail/xkeystart.sh
    sudo service xkeysnail start
}