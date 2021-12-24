# `save`s logs

Prepend `save` to the command whose logs you want to save:

```shell script
$ save echo Hello!                                                                                                                        ─╯
Saving logs in /Users/marcomicera/.logs/2021-12-24/17:52:17__\\\'echo\\\ Hello\\\!\\\'.log
-------------
Hello!
```

Here's the generated log file:

```shell script
$ cat /Users/marcomicera/.logs/2021-12-24/17:52:17__\\\'echo\\\ Hello\\\!\\\'.log                                                         ─╯
Command:	echo Hello!
Date:		Fri Dec 24 17:52:17 CET 2021
PWD:		/Users/marcomicera/git/save
Git branch:	* main

Command logs:
-------------

Hello!
```
