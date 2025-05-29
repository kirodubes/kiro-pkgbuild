#!/bin/bash
#set -e

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

echo
echo "${cyan}3. Pushing to GitHub...${reset}"

if grep -q main .git/config; then
    echo "${green}Branch: main${reset}"
    git push -u origin main
elif grep -q master .git/config; then
    echo "${green}Branch: master${reset}"
    git push -u origin master
else
    echo "${red}No main or master branch found in .git/config${reset}"
fi

echo
echo "${cyan}4. Script complete:${reset}"
echo "${cyan}##############################################################${reset}"
echo "${cyan}###################  $(basename "$0") done${reset}"
echo "${cyan}##############################################################${reset}"
echo
