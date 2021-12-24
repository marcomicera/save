# `save`s logs

Prepend `save` to the command whose logs you want to save:

```shell script
save echo hello
```

Here's the generated log file under `~/.logs/$(date +%F)/`:

```
Command:	echo hello
Date:		Fri Dec 24 17:52:17 CET 2021
PWD:		/Users/marcomicera/git/save
Git branch:	* main

Command logs:
-------------

hello
```
