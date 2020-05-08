alias gr="git reset";
alias grh="git reset HEAD";
alias ga="git add";
alias gcm="git commit -m";
alias gc="git commit";
alias go="git checkout";
alias gnb="git checkout -b";
alias ac='git add . && git commit -m';
alias wip="ac wip";
alias gs='git status';
alias gb="git branch";
alias grmc="git rm --cached -r";
alias glo="git log --pretty=oneline --abbrev-commit";
alias delb='git branch -d';
alias delbf='git branch -D';
alias gmours="git merge -s ours"; # must supply branch name
gmtheirs(){ git merge -X theirs $1; } # $1 is name of branch
#git checkout --patch branch2 file.py

addAlias(){
  if [[ -z $1 ]]; then echo "Supply a name for the alias"; return; fi;
  if [[ -z $2 ]]; then echo "Supply a comand for the alias in quotes"; return; fi;
  echo "alias $1=\"$2\";" | cat - $ALIASES_PATH  > temp && mv temp $ALIASES_PATH;
}

# Nginx
alias wng="sudo vim /etc/nginx/sites-available/default";
alias ngr="sudo service nginx restart";

# Docker
alias drmi="sudo docker rmi";
alias ds="sudo docker service"
alias dd="sudo docker stack deploy -c docker-compose.yml"
alias db="sudo docker build -t"
alias dp="sudo docker pull"
alias dps="sudo docker ps"
alias dim="sudo docker images"
alias dst="sudo docker stop"
alias drm="sudo docker rm"
alias dprun="sudo docker system prune";
alias dcls="sudo docker container ls";

# Navigation
alias la='ls -a';
alias u='cd .. && superls';
alias uu='cd ../../ && superls';
alias r='clear && superls';
superls() { clear && printf "Directory Contents:\n\n" && ls && printf "\n" ; }
alias l='superls';
supercd() { clear && printf "Directory Contents:\n\n" && cd "$1" && ls && printf "\n" ; }
alias c='supercd';
cmk(){ mkdir -p "$1" && cd "$1"; }

# Meta
alias wb="vim $ALIASES_PATH";
alias lb='source ~/.bashrc';
gal(){ grep -i $1 $ALIASES_PATH; }

# Tunnel
###alias killtun="sudo lsof -i | grep sshd | awk {'print $2 " " $9'} | grep 3946 | awk {'print $1'} | xargs kill"
alias ttrun="sudo docker container run --restart=always -d -p 3002:3002 hayden321/tomato:1.0"
alias tun="sudo lsof -i | grep sshd "

scut () { #shortcut
    if [ $# -eq 0 ]
    then
        echo "Please supply name for alias";
        return;
    fi;
    workingDir="$(pwd)";
    aliasToAdd="alias $1=\"cd $(pwd) && l\"";
    echo "$aliasToAdd" >> "$ALIASES_PATH";
    source $ALIASES_PATH;
    echo "Added new alias $1 for $ALIASES_PATH";
}

alias pf="cd /home/ubuntu/portfolio && l"
alias pcs="cd /home/ubuntu/portfolio/postgres-pcbflow/api && l"
alias pts="cd /home/ubuntu/portfolio/postgres-pomtracker && l"
