#!/bin/bash
echo "#!/bin/bash

# Filling the text.txt file.
echo \"ab3ca
This is a duplicate line.
This is a duplicate line.
This is an unique line.
This is not an unique line.
This is not an unique line.
Bla bla bla bla
abc abcd abcdef
dummy dummy text text text\" >text.txt


# Prints from third to seventh line from the text.txt file.
printf \"Prints from third to seventh line from text.txt\n\n\"
head -n 7 text.txt | tail -n +3

# Deletes the  duplicate rows from text.txt and copy the result in text1.txt file.
uniq -u <text.txt >text1.txt

# Prints the number of users that are registed in the system.
printf \"\n\nNumber of users in the system:\n\n\"
cat /etc/passwd | cut -d: -f1 | wc -l

# Prints all users that have an ID greater than 99.
printf \"\n\nPrints the users with an id greater than 99:\n\n\"
awk -F: '{if (\$3 > 99) { print \$1 } }' /etc/passwd

# Prints all users that have a shell \"/bin/false\", also separetes each field with a tabulator and add numbering to the lines.
printf \"\n\nPrints all users that have a shell /bin/false:\n\n\"
awk -F: '{if (\$7 == \"/bin/false\") { print ++i \"\t\" \$1 \"\t\" \$2 \"\t\" \$3 \"\t\" \$4 \"\t\" \$5 \"\t\" \$6 \"\t\" \$7 } }' /etc/passwd

# Prints all shells in system and the number of users that uses it, sorted by the frequency of use.
printf \"\n\nPrints the number of users for different shells sorted by frequency of use\n\n\"
awk -F: '{ print \$7 }' /etc/passwd | sort | uniq -c | sort -nr" >razno.sh

chmod +x razno.sh

./razno.sh


echo "#!/bin/bash

# The line begins with an 'a' character. 
printf \"\n\nThe line begins with an 'a' character.\n\n\"
egrep '^a' text.txt

# The word begins with an 'a' character.
printf \"\n\nThe word begins with an 'a' character.\n\n\"
egrep '(\ba)\w+\b' text.txt

# The word have a length of 3.
printf \"\n\nThe word have a length of 3.\n\n\"
egrep '\b[a-zA-Z]{3}\b' text.txt

# The word begins with 'a' or 'b' and have a length of 3.
printf \"\n\nThe word begins with 'a' or 'b' and have a length of 3.\n\n\"
egrep '\b[ab][a-zA-Z]{2}\b' text.txt 

# The line have maximum one number. 
printf \"\n\nThe line have maximum one number.\n\n\"
egrep '^[0-9]{0,1}$' text.txt" >regex.sh

chmod +x regex.sh

./regex.sh