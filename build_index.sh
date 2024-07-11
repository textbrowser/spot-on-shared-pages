#!/usr/bin/env sh
# Alexis Megas.

base="https://htmlpreview.github.io/?https://github.com/textbrowser/"
base=$base"spot-on-shared-pages/blob/main"

rm -f index.html
echo "<html>" >> index.html
echo "<body>" >> index.html

for directory in $(ls -p | grep '/')
do
    echo "<b>$directory</b>" >> index.html
    echo "<br><br>" >> index.html

    for file in $(ls $directory*_title 2>/dev/null)
    do
	link=$(echo $file | sed -e 's/_title$//' | sed -e 's/%/%25/g')

	echo -n "<a href=\"$base/$link\">" >> index.html
	cat $file >> index.html
	echo "</a><br>" >> index.html
    done

    echo "<br>" >> index.html
done

echo "</body>" >> index.html
echo "</html>" >> index.html
