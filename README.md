# PrettyGitLogs
This perl script outputs Git Logs with JIRA specified components 

Requirements: 
 - perl
 - perl JIRA Client module

Usage:
```
  perl organizedLog.pl -h
  
  Usage: perl prettyLogs.pl -bt <val> -et <val> [output options]



  -bt      This is the beginning tag to be used.
           It should be the most recent tag you want to use.
  -et      This is the ending tag.
           It should be the tag you want the logs to go back to.
  -o       Name of your output file.  Example: outputfile.txt
  -html    Outputs in html format.  Two files are generated.
           1st file is htmoutname.htm.out  This file is for use on the portal.
           2nd file is htmoutname.html  This file is for use to open in a browser.
 ```


Therefore, the user will need to enter the Build Tag that they want the logs for first, then the user will have to enter the point at which they want the logs to go all the way back to.

User should enter their credentials into the prettylogs.conf file.  


