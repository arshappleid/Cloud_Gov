setfacl -m g:admin:rwx /app
setfacl -d -m g:groupname:rwx /app ## -d sets default acls (inherited) for the target dir
setfacl -R -m g:groupname:rwx /app ## -R recursively applies to all files and directories
getfacl /app ## view permissions