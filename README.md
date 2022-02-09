# cli-package_maker
##########################################################
<bR>                          DECRIPTION
##########################################################

make a .deb of any programme you want to transport

cli-package_maker will create a file.deb of any programme you want to install/transport in any UNIX plateforme.

##########################################################
                          How TO USE
##########################################################
to use this proced since:

1- run the programme whith this arguements:
the first arguement is your script like "my_script.sh"
the second arguement is the man page of your "my_script.man"

./cli-package_maker my_script.sh my_script.man

congrats!

you will have a new file named : "my_script.deb" 

to install them run the following command:

 sudo dpkg -i my_script.deb
 
 this will install your package and your programme to /bin and /usr/bin, so to run your script you just have to run the following command in terminal ($) :
 $ my_script.sh
 so if you doesn't want .sh in your command remember to remove the .sh from the name of your script before running cli-package_maker.

###########################################################
                          OPTION EXPLAINED
###########################################################

Package : is the name of your futur file.deb
Version : is the number of your version, if the version of your package is older than systeme package version the new version will replace the older
Section : This field specifies an application area into which the package has been classified. See Sections.
Priority : This field represents how important it is that the user have the package installed. the value possibles ares: {required,standard,optional,extra}
Architecture : what type of architecture is supported by package
Depends : The dependancies of this packages, 
Maintainer : the name of the maintainer of this programme
Description : the description of this package
Homepage : homepage of your package web-site
