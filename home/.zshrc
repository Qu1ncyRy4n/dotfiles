# neofetch
PS1="%4~ 💐 "
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

# if [[ $0 == "-zsh" ]]; then
#     exec /run/current-system/sw/bin/zsh
# fi


export PATH="$PATH:$HOME/.local/bin"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background. ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh # support for TTYs 
cat /Users/q/.cache/wal/sequences

# 
eval "$(rbenv init -)"
