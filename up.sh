#!/bin/bash
set -eo pipefail
##################################################################################################################
# Author    : Erik Dubois
# Website   : https://www.erikdubois.be
# Youtube   : https://youtube.com/erikdubois
# Github    : https://github.com/erikdubois
# Github    : https://github.com/kirodubes
# Github    : https://github.com/buildra
# SF        : https://sourceforge.net/projects/kiro/files/
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

# variables and functions
workdir=$(pwd)

# Colors
cyan=$(tput setaf 6)
green=$(tput setaf 2)
red=$(tput setaf 1)
reset=$(tput sgr0)

echo "${cyan}1. Cleaning up build folders and old files...${reset}"

[[ -d calamares/pkgbuild/src ]] && {
    echo "${green}Removing src folder...${reset}"
    rm -r calamares/pkgbuild/src
}

[[ -d calamares/pkgbuild/pkg ]] && {
    echo "${green}Removing pkg folder...${reset}"
    rm -r calamares/pkgbuild/pkg
}

for file in calamares/pkgbuild/calamares-3*; do
    [[ -f "$file" ]] && {
        echo "${green}Removing $file...${reset}"
        rm "$file"
    }
done

echo
echo "${cyan}2. Backing up changes with Git...${reset}"

git add --all .

echo "${green}Staging complete. Committing changes...${reset}"
git commit -m "update"

# Push the local files to github

branch=$(git rev-parse --abbrev-ref HEAD)
git push -u origin "$branch"

echo
tput setaf 6
echo "##############################################################"
echo "###################  $(basename $0) done"
echo "##############################################################"
tput sgr0
echo
