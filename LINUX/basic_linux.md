# LINUX

### PWD & HISTORY

> It prints the present working directory. It prints the full path (absolute path).</br>
> History keeps most recent 1000 used commands.

```bash
pwd
# /home/
```

### HELP

> We have multiple ways to get help about the command line.

```bash
whatis cal
# It gives a short info about what it does.
```

### LS

> It list all the files and directories in the present working direntory.</br>
> `-a` will list everythingincluding hidden files.</br>
> `-l` will show list with longer information about those files and dir.

### CD

> This commad is changing the directory.</br>

```bash
cd              # go to /home/
cd ~            # go to /home/
cd ..           # go upwards one times
cd ../..        # go upwards two times
cd Downloads/   # go to Downloads
```

#### PUSHD & POPD

> `pushd` works like `cd` but when we use `popd` it returns to the previous dir we were.

```bash
# /home
cd Downloads/dir1
# Downloads
pushd /Documents/dir2/dir3
# /Documents/dir2/dir3
popd
# Downloads/
```

### FILE

> Linux Doesn't need file extensions. So to make sure what kind of file are we deeling with we use file `command`.

```bash
file me.you_dont_know
# JPEG
```

### LOCATE

> `locate` takes file name or parts of file name to find that in the system & it will show all the files that includes that name.</br>
> It uses linux database so it might not work the day we installed linux.</br>
> I have to update the `db` & `sudo updatedb` does that.

### WHICH

> It checks something is installed in teh system and shows where its installed.

```bash
which cal
# /user/bin/cal
# BTW cal shows the calender on hte terminal.
```

