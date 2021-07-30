# Power-Robocopy
A powershell script to manage/control multiple Robocopy automated tasks.

Features:
- Easily track all of your infrastructure's Robocopy results
- Did it succeed or fail? Find out in seconds
- Designed to be used with Windows Task Scheduler for automation
- Customisable reporting of Robocopy Results in txt and csv
- Centralise multiple server's Robocopy job variables

Guide for use:
-  Validate your batch file FIRST. Work on your batch file and make sure it runs in Task Scheduler as desired.
-  Choose a share on the network that all your Robocopy-active servers are able to access.
-  Document your share names and variables
-  main.ps1 is heavily commented to help understand the way it works
