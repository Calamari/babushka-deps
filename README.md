babushka-deps
=============

My babushka deps, only for Mac. Currently containing (some of) my working environment.

## What is Babushka?

You can find the docs at [http://babushka.me][Babushka]. In short, it is a simple and test driven way to write automatisms for installing and managing your software.

## How to install?

### babushka

~~~ bash
sh -c "`curl https://babushka.me/up`"
~~~

### This babushka deps

~~~ bash
babushka sources -a calamari git@github.com:Calamari/babushka-deps.git
~~~

## What was installed?

To know what was installed, just type in:

~~~ bash
babushka list calamari
~~~

## How to update?

~~~ bash
babushka sources -u
~~~

[Babushka]: http://babushka.me/


## TODOs

- Install sublime packages
- Shell scripts?
- GitX or GitTower?
