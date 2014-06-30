##About##

Vala project skeleton using autotools (a "hello world" GTK3 desktop application). Released under the Creative Commons 0 Public Domain Dedication so you can use it in free or commercial projects.

##Usage##

```sh
./new_project.sh my-new-project
```

##Tips##

- on Gentoo there is no 'valac' so we need to do something like this in order to build it manually:
```sh
VALAC=$(type -P valac-0.24) ./configure
make
```

- install in a local directory during development
```sh
./configure --prefix="`realpath ../usr`"
make install
```

- internationalization and localization - creating an Italian translation
```sh
cd po
# edit LINGUAS and add 'it' on a single line
make update-po
msginit --locale=it
# edit it.po and change the charset to 'UTF-8'
make update-po

```

- if you're looking for a similar project, but for CMake and with more bells and whistles, check out [Autovala][1]


[1]: https://github.com/rastersoft/autovala

