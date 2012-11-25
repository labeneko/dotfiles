# 環境変数
export LANG=ja_JP.UTF-8         # 日本語環境(ja_JP.UTF-8)
export EDITOR=vim               # デフォルトエディタ指定
export PAGER=less               # デフォルトページャ指定
export PATH=$PATH:/usr/local/bin:/usr/local/sbin

# Builtin Commands
bindkey -v    # viキーバインド
umask 022     # umask

# カラー表示
# LSCOLORSの設定は man ls 参照
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export GREP_OPTIONS='--color=auto'
case "${OSTYPE}" in
  freebsd*|darwin*)
    alias ls="ls -G"        # BSD系lsのカラー表示
    ;;
  linux*)
    alias ls="ls --color"   # GNU系lsのカラー表示
    ;;
esac
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # 補完候補もカラー表示

# エイリアス設定
alias ll='ls -la'           # 詳細一覧表示の簡易版
alias rm='rm -i'            # rm 要確認
alias mv='mv -i'            # mv 要確認
alias cp='cp -i'            # cp 要確認
alias ..='cd ..'            # 上位ディレクトリへ簡易版
alias vi='vim'              # viでvim起動
# F 画面内で表示可能であれば終了
# R 制御文字をエスケープせずに出力
# S 改行しない
# X 終了時に画面クリアしない
alias less='less -FRSX'

# ディレクトリ関連
setopt auto_cd            # ディレクトリ名入力で自動cd
setopt auto_pushd         # ディレクトリ移動時に自動pushd
setopt cdable_vars        # 変数展開する
setopt pushd_ignore_dups  # 同じディレクトリを重複pushしない

# 補完
autoload -U compinit && compinit  # 補完有効化
setopt always_last_prompt         # 補完時にカーソル位置(行)を移動しない
setopt auto_list                  # 補完候補をリスト表示
setopt auto_menu                  # 補完キー連打で候補から自動補完
setopt auto_param_keys            # 括弧の対応などを自動補完
setopt auto_remove_slash          # 補完された/が不要の場合に自動削除
setopt complete_in_word           # ?
setopt complete_aliases           # 補完時にエイリアスを展開しない
setopt magic_equal_subst          # =以降も補完する
setopt list_types                 # 補完候補にファイル種別を表示
setopt list_packed                # 補完候補を詰めて表示
setopt no_list_beep               # 補完時にbeep鳴らさない
setopt correct                    # コマンドのスペルチェック有効化
setopt correct_all                # コマンドライン全てでスペルチェック有効化
setopt print_eight_bit            # 出力時に8bitを通す(日本語ファイル名表示対応)
zstyle ':completion:*:default' menu select=1          # タブ連打で矢印キーでの選択可
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'   # 補完時は大文字/小文字区別しない
zstyle ':completion:*:processes' command 'ps x'       # killで補完

# コマンド履歴
export HISTFILE=~/.zsh_history  # 履歴保存先パス
export HISTSIZE=10000           # 履歴保存件数(メモリ内)
export SAVEHIST=10000           # 履歴保存件数
setopt append_history           # 履歴を追記する
setopt extended_history         # 履歴に時刻を追加
setopt hist_ignore_dups         # 直前と同じコマンドは記録しない
setopt hist_ignore_space        # 先頭がspaceの場合は記録しない
setopt hist_no_store            # historyコマンドは履歴に残さない
setopt share_history            # 履歴を共有する

# その他
setopt numeric_glob_sort        # ファイル名展開で数値順ソート
setopt extended_glob            # glob拡張有効化
setopt brace_ccl                # {}内の文字をASCIIコード順に展開
setopt no_flow_control          # Ctrl+S/Qのフロー制御無効化
setopt ignore_eof               # Ctrl+Dでログアウトしない
setopt no_beep                  # beep音鳴らさない

# 環境個別設定を読み込む (.zshrc.mine)
if [[ -s $HOME/.zshrc.mine ]] ; then source $HOME/.zshrc.mine ]] ; fi

# Prompt
# See: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
autoload -U colors && colors
setopt prompt_subst   # PROMPT内の変数を展開
unsetopt promptcr
if [ "$TERM" != "dumb" ] ; then
    # 通常時プロンプト
    # %B, %b    太字開始/終了
    # %n        ユーザ名
    # %m        ホスト名(最初の.まで)
    PROMPT="[%B%n%b@%m] $ "
    # 右側プロンプト
    # %d        カレントディレクトリ
    RPROMPT="%d"
fi

# Show last command on status line
preexec () {
  [ ${STY} ] && echo -ne "\ek${1%% *}\e\\"
}

# Startup screen on login
[ ${STY} ] || screen -D -RR -U
