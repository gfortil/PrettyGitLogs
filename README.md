# PrettyGitLogs
This perl script outputs Git Logs with JIRA specified components 

Requirements: 
 - perl
 - perl JIRA Client module

Notes:
- The script relies on the HPCC-Platform repository to be in this directory
  ~/builds/HPCC-Platform
- If your repository is located elsewhere, please edit this line in the script before running.

Useage:

  perl organizedLog.pl

This script relies on the following git log format:
git log --oneline --max-parents=1 beginningtag...endingtag

Therefore, the user will need to enter the Build Tag that they want the logs for first, then the user will have to enter the point at which they want the logs to go all the way back to.

User will be prompted to input their information like this:

```
  Please enter the Build Tag you want to start from: community_5.2.4-rc2
  Please enter the Build Tag you want your log to go back to: community_5.2.2-1
  Please type your JIRA username: 
  Please type your JIRA password:

```

Password will not be echoed out onto the screen.
