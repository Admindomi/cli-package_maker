#!/bin/bash
###################################################################################
#Author       : Schnellbach Tanguy
#Name         : cli-package_maker
#Description  : permet de crée un pacquet .deb d'autoinstallation de son programme
#Date         : 20200506
###################################################################################

[ $# -lt 2 ] && echo "veuillez indiquer le nom du fichier ainsi que la page de man comme suit: "$'\n'"./apt-package_maker <script> <script man page>" && exit 1
CHEMIN=${1%%.*}

Package="Schnellbach-cli-package-maker"
Version="1.0"
Section="base"
Priority="optional"
#required', 'standard', 'optional', 'extra' 
Architecture="all"
Depends="bash"
Maintainer="outadoc<tanguyschnellbach@gmail.com>"
Description="make by cli-package_maker"
Homepage="https://domotrix.fr"



mkdir -p $CHEMIN/{DEBIAN,usr/{bin,share/{doc,man/man1}}}
echo "#!/bin/bash "$'\n'" printf '[ \033[1;32;32mok\033[0m ] ' && echo \"postinst\"" > $CHEMIN/DEBIAN/postinst
echo "#!/bin/bash "$'\n'"printf '[ \033[1;32;32mok\033[0m ] ' && echo \"postrm\"" > $CHEMIN/DEBIAN/postrm
echo "#!/bin/bash "$'\n'"printf '[ \033[1;32;32mok\033[0m ] ' && echo \"preinst\"" > $CHEMIN/DEBIAN/preinst
echo "#!/bin/bash "$'\n'"printf '[ \033[1;32;32mok\033[0m ] ' && echo \"prerm\"" > $CHEMIN/DEBIAN/prerm

echo "Package Name : [$Package]"
read a
[ "$a" != "" ] && Package=$a
echo "Version number : [$Version]"
read b
[ "$b" != "" ] && Version=$b
echo "Section : [$Section] "
read c
[ "$c" != "" ] && Section=$c
echo "Priority : {required,standard,optional,extra} [$Priority]"
read d
[ "$d" ==  "required" ] || [ "$d" == "standard"  ] || [ "$d" ==  "optional" ] ||[ "$d" ==  "extra" ] && Priority=$d
echo "Architecture : [$Architecture]"
read e
[ "$e" != "" ] && Architecture=$e
echo "Depends : [$Depends]"
read f
[ "$f" != "" ] && Depends=$f
echo "Maintainer : [$Maintainer]"
read g
[ "$f" != "" ] && Maintainer=$g
echo "Description : [$Description]"
read h
[ "$h" != "" ] && Description=$h
echo "Homepage : [$Homepage]"
read i
[ "$i" != "" ] && Homepage=$i


echo "Package :$Package"$'\n'"Version :$Version"$'\n'"Section :$Section"$'\n'"Priority :$Priority"$'\n'"Architecture :$Architecture"$'\n'"Depends :$Depends"$'\n'"Maintainer :$Maintainer"$'\n'"Description :$Description"$'\n'"Homepage :$Homepage"> $CHEMIN/DEBIAN/control

cp $1 $CHEMIN/usr/bin
echo " Files: *" $'\n'\
"Copyright: 2020 Schnellbach tanguy <tanguys.schnellbach@etud.u-picardie.fr> " $'\n'\
"This program is a non-free software; "$'\n' \
"" $'\n'\
"This program is distributed in the hope that it will be" $'\n'\
"useful, but WITHOUT ANY WARRANTY; without even the implied" $'\n'\
"warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR" $'\n'\
"PURPOSE.  See the GNU General Public License for more"$'\n' \
"details." $'\n'\
"" $'\n'\
"You should have received a copy of the GNU General Public" $'\n'\
"License along with this package; if not, write to the Free" $'\n'\
"Software Foundation, Inc., 51 Franklin St, Fifth Floor," $'\n'\
"Boston, MA  02110-1301 USA" $'\n'\
"" $'\n'\
"On Debian systems, the full text of the GNU General Public" $'\n'\
"License version 2 can be found in the file" $'\n' \
"/usr/share/common-licenses/GPL-2." > $CHEMIN/usr/share/doc/copyright
cp $2 $CHEMIN/usr/share/doc/README
tar zcvf $CHEMIN/usr/share/man/man1/$2.gz $2
chmod 755 $CHEMIN/DEBIAN/pre*
chmod 755 $CHEMIN/DEBIAN/post*
dpkg-deb --build $CHEMIN



