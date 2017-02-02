#!/bin/zsh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ~="cd ~"                              # ~:            Go Home
alias gh="cd ~"                             # ~:            Go Home
alias agenda='gcalcli agenda'
alias c='clear'
alias cal='gcalcli --monday --military --calendar "KTH"#cyan --calendar "Kurs"#yellow --calendar "Privat"#green --calendar "TripIt*"#magenta --calendar "Helgdagar i Sverige"#red --calendar "Helgdagar i USA"#red --calendar "Dashboard"#white --calendar "Week numbers"#white '
alias calw='gcalcli -w $((COLUMNS/8)) calw'
alias calm='gcalcli -w $((COLUMNS/8)) calm'
alias calq='gcalcli quick --cal'
cd() { builtin cd "$@"; exa -la; }               # Always list directory contents upon 'cd'
# cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias j='autojump'
alias nb='LANG=en_US newsbeuter'
# alias subl='open -a "Sublime Text.app"'   # Not necessary, ST comes w/ it's own CLI tool (subl)
alias t='todo.sh -d $HOME/Dropbox/Documents/txt-files/.todo.cfg'
# alias tap='t add pri A'
alias tap='t add pri'
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias vd='vim /Volumes/DATA/Users/euclide/Dropbox/Documents/Markdown/DailyPhrases.md'
alias vt='vim /Volumes/DATA/Users/euclide/Dropbox/Documents/PROJECTS/RMisc/TrainData.txt'
alias cfg-zsh-alias='vim /Volumes/DATA/Users/euclide/.oh-my-zsh/custom/or_aliases.zsh'
alias cfg-vifmrc='vim /Volumes/DATA/Users/euclide/.vifm/vifmrc'
alias cfg-vimrc='vim /Volumes/DATA/Users/euclide/.vimrc'
alias cfg-zshrc=' vim /Volumes/DATA/Users/euclide/.zshrc'
alias cfg-muttrc=' vim /Volumes/DATA/Users/euclide/.muttrc'
alias ssh="TERM=xterm-256color ssh"
alias sqlite3='/Volumes/Macintosh\ HD/usr/local/Cellar/sqlite/3.13.0/bin/sqlite3'

#   ---------------------------
#   NETWORKING
#   ---------------------------

alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias ipInfo2='ipconfig getpacket en2'              # ipInfo1:      Get info on connections for en1
alias ipInfo3='ipconfig getpacket en3'              # ipInfo1:      Get info on connections for en1
alias ipInfo4='ipconfig getpacket en4'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

#   ---------------------------
#   SEARCHING
#   ---------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
sl  () { mdfind "kMDItemDisplayName == '$@'wc"; }
sln () { mdfind "kMDItemDisplayName == '$@'wc"; }

# reduce pdf file size
pdfred() {gs  -q -dNOPAUSE -dBATCH -dSAFER \
    -sDEVICE=pdfwrite \
    -dCompatibilityLevel=1.3 \
    -dPDFSETTINGS=/screen \
    -dEmbedAllFonts=true \
    -dSubsetFonts=true \
    -dColorImageDownsampleType=/Bicubic \
    -dColorImageResolution=72 \
    -dGrayImageDownsampleType=/Bicubic \
    -dGrayImageResolution=72 \
    -dMonoImageDownsampleType=/Bicubic \
    -dMonoImageResolution=72 \
    -sOutputFile=out.pdf \
     $1; }

pdfmerge() { /System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py -o "$1".pdf "$@"; } # First file is the output file; the other files need .pdf extension
# pdfmerge() { /System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py -o "$1".pdf "$2".pdf "$3".pdf ; }

pdfjoin() gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=merged.pdf "$@" 

# autojump - a faster way to navigate your filesystem
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh


#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
ii() {
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditional information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date:$NC " ; date
    echo -e "\n${RED}Machine stats:$NC " ; uptime
    echo -e "\n${RED}Current network location:$NC " ; scselect
    echo -e "\n${RED}Public facing IP Address:$NC " ; curl ipinfo.io
    #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
    echo
}

Rc() {
    R --slave -e $1 | awk '!($1="")'
}

Rcr() {
    R --slave -e 'round('$2', digits='$1')' | awk '!($1="")'
}

Rcs() {
    R --slave -e 'signif('$2', digits='$1')' | awk '!($1="")'
}

