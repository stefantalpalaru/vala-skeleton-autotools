#!/bin/sh

[ -z "$1" ] && { echo "usage: `basename $0` project_name"; exit 1; }
[ -d "$1" ] && { echo "the directory \"$1\" already exists. delete it and run the script again"; exit 1; }

old_name="vala-skeleton"
old_name_spaces="`echo $old_name | tr '-' ' '`"
old_name_underscores="`echo $old_name | tr '-' '_'`"
new_name="$1"
new_name_spaces="`echo $new_name | tr '-' ' '`"
new_name_underscores="`echo $new_name | tr '-' '_'`"

cp -a "$old_name" "$new_name"
git clean -fXdq "${new_name}/"
git clean -fXdq "${new_name}/src/"
mv "${new_name}/data/${old_name}.svg" "${new_name}/data/${new_name}.svg"
mv "${new_name}/${old_name}-9999.ebuild" "${new_name}/${new_name}-9999.ebuild"
sed -i -e "s/$old_name/$new_name/g" "${new_name}/.gitignore"
sed -i -e "s/$old_name/$new_name/g" -e "s/$old_name_spaces/$new_name_spaces/g" "${new_name}/configure.ac"
sed -i -e "s/$old_name/$new_name/g" -e "s/$old_name_underscores/$new_name_underscores/g" "${new_name}/Makefile.am"

cat <<END

The "$new_name" directory was created. You can now move it somewhere else.
Edit the first line of "${new_name}/configure.ac" according to
http://www.gnu.org/software/autoconf/manual/autoconf.html#Initializing-configure ,
change the icon in "${new_name}/data/${new_name}.svg" to something original
and put the license of your choice in "${new_name}/COPYING".
END

[ -f /etc/gentoo-release ] && cat <<END

To use the ebuild during development, copy it to your local overlay, create a git repo for your new
project directory and put its full path in the EGIT_REPO_URI variable. Remember to add the new package to
/etc/portage/package.keywords .
END

