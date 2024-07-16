#!/usr/bin/env sh
# Alexis Megas.

base="https://htmlpreview.github.io/?https://github.com/textbrowser/"
base=$base"spot-on-shared-pages/blob/main"

rm -f index.html
/bin/echo "<html>" >> index.html
/bin/echo "<body>" >> index.html

for directory in $(ls -p | grep '/' | sed -e 's/\///')
do
    /bin/echo -n "<b>" >> index.html
    /bin/echo -n $directory | tr '[:lower:]' '[:upper:]' >> index.html
    /bin/echo "</b>" >> index.html
    /bin/echo "<br>" >> index.html
    /bin/echo "<ul>" >> index.html

    for file in $(find $directory -name '*_title' -type f)
    do
	link=$(/bin/echo $file | sed -e 's/_title$//' | sed -e 's/%/%25/g')

	/bin/echo -n "<li><a href=\"$base/$link\">" >> index.html
	cat $file >> index.html
	/bin/echo "</a></li>" >> index.html
    done

    /bin/echo "</ul>" >> index.html
done

/bin/echo "</body>" >> index.html
/bin/echo "</html>" >> index.html
