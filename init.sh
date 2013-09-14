echo "Cloning all packages..."

cd ..

PACKAGES=(
    https://github.com/SublimeCodeIntel/SublimeCodeIntel
    https://github.com/SublimeLinter/SublimeLinter.git
    https://github.com/titoBouzout/SideBarEnhancements.git
    https://github.com/sergeche/emmet-sublime.git
    https://github.com/fbzhong/sublime-jslint.git
    https://github.com/mrmartineau/jQuery.git
)

size=${#PACKAGES[@]}
for ((i=0;i<$size;i++)); do
    folder=`echo ${PACKAGES[${i}]} | rev | cut -d'/' -f1 | rev | cut -d'.' -f1`

    if [ -d $folder ]; then
        cd $folder
        git pull origin master
    else
        git clone ${PACKAGES[${i}]}
    fi
done

echo "Packages were successfully updated."
