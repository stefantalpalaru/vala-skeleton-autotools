##About##

Vala project skeleton using autotools. Released under the Creative Commons 0 Public Domain Dedication so you can use it in free or commercial projects.

##Usage##

```sh
./new_project.sh my-new-project
```

##Tips##

# on Gentoo there is no 'valac' so we need to do something like this in order to build it manually:
VALAC=$(type -P valac-0.22) ./configure
make

# install in a local dir during development
./configure --prefix="`realpath ../usr`"
make install
