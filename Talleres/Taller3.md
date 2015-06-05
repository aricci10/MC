#Taller 3 5-Jun-2015

##Punto 1

Se implementó el siguiente código:

```
#!/bin/bash

rm arch.sh

for file in $(ls *.c)
do
echo "#$file" >>arch.md
printf "%s\n" "\`\`\`" >>arch.md
cat "$file">>arch.md
printf "%s\n" "\`\`\`" >>arch.md
done
```

##Punto 2 

Se implementó el siguiente código:

```
#!/bin/bash


for file in $(ls *.c)
do
gcc "$file"
grep -A 1 'Example' $file
./a.out
read -n 1 -s
done
```

