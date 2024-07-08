# Terminal
git config --global --list > git-settings.txt

# import
while read line; do
git config --global ${line}
done < git-settings.txt

# verify settings
git config --global --list
