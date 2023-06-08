# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# mcfly
eval "$(mcfly init zsh)"
# mcfly配色
if [[ "$(defaults read -g AppleInterfaceStyle 2&>/dev/null)" != "Dark" ]]; then
    export MCFLY_LIGHT=TRUE
fi

# exa配置
alias es="exa -F" #更改别名

# fzf配置
# 使用 fd ( https://github.com/sharkdp/fd )代替默认的 find
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
# 使用 fd 生成目录完成的列表
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
# 设置参数
export FZF_DEFAULT_OPTS='--height 40% --layout reverse --info inline --border --preview "bat --style=numbers --color=always --line-range :500 {}" --color=bg+:#293739,bg:#1B1D1E,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672'

# PATH配置

# python
export PATH=$PATH:~/.local/bin

# cargo PATH (rust)
export PATH=$PATH:~/.cargo/bin

#历史纪录条目数量
export HISTSIZE=10000
#注销后保存的历史纪录条目数量
export SAVEHIST=10000
#历史纪录文件
export HISTFILE=~/.histfile
#以附加的方式写入历史纪录
setopt INC_APPEND_HISTORY
#如果连续输入的命令相同，历史纪录中只保留一个
setopt HIST_IGNORE_DUPS
#为历史纪录中的命令添加时间戳
setopt EXTENDED_HISTORY      
#启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
setopt AUTO_PUSHD
#相同的历史路径只保留一个
setopt PUSHD_IGNORE_DUPS
#在命令前添加空格，不将此命令添加到纪录文件中
setopt HIST_IGNORE_SPACE
# 不保留重复的历史记录项
setopt hist_ignore_all_dups
# 在命令前添加空格，不将此命令添加到记录文件中
setopt hist_ignore_space
# zsh 4.3.6 doesn't have this option
setopt hist_fcntl_lock 2>/dev/null
setopt hist_reduce_blanks
# 共享历史记录
setopt SHARE_HISTORY

eval "$(starship init zsh)"
