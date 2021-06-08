#!/bin/bash

if [[ ! -f $1 ]]
then
    echo "$1 does not exist"
    exit 1
fi

echo -e "#\n" >> notes.md

echo -e "## Exploitation Notes\n" >> notes.md

echo -e "- Network Services:" >> notes.md
grep . $1 | sed 's/\.$//' | awk '{ print "  - " $5 " " $2 }' >> notes.md
echo "" >> notes.md

echo -e "## Exploitation Summary\n" >> notes.md

echo -e "## Post-Exploitation Notes\n" >> notes.md

echo -e "## Post-Exploitation Summary\n" >> notes.md

echo -e "## Credentials\n" >> notes.md

cat notes.md

read -p "Looks good? Delete $1? [y/N]" delete

if [[ $delete = y* ]]
then
    rm $1
    echo 'Deleted'
fi

