[root@rhel8test DEV]# cat path.sh
#!/bin/bash
# Remove any invalid file or directory name from the PATH variable as per CIS Control ID#10506
for DIR in $(echo $PATH | tr ':' ' ') ; do
[ -d $DIR ] && NEW_PATH=$NEW_PATH:$DIR
done
export NEW_PATH
echo New Path: $NEW_PATH
[root@rhel8test DEV]#



