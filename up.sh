#!/bin/bash
#set -e

workdir=$(pwd)

#!/bin/bash

[[ -d calamares/pkgbuild/src ]] && rm -r calamares/pkgbuild/src
[[ -d calamares/pkgbuild/pkg ]] && rm -r calamares/pkgbuild/pkg

for file in calamares/pkgbuild/calamares-3*; do
    [[ -f "$file" ]] && rm "$file"
done


# Below command will backup everything inside the project folder
git add --all .

# Committing to the local repository with a message containing the time details and commit text

git commit -m "update"

# Push the local files to github

if grep -q main .git/config; then
	echo "Using main"
		git push -u origin main
fi

if grep -q master .git/config; then
	echo "Using master"
		git push -u origin master
fi

echo
tput setaf 6
echo "##############################################################"
echo "###################  $(basename $0) done"
echo "##############################################################"
tput sgr0
echo
