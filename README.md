# Tools to help run Tomcat under launchd

The .plist file needs to be edited with the correct path to tomcat in numerous places. It is possible that the WorkingDirectory setting means that not all paths need to be absolute, but I didn’t test it. It should also be renamed to something like “com.mysite.tomcat.plist”, I anonymized it since I made it public.

The shell script needs to go in the tomcat "bin" directory. It is necessary to wrap tomcat, since tomcat's default startup script forks itself into the background and launchd would continuously try to restart it.

See:
* https://confluence.atlassian.com/display/CONF32/Start+Confluence+automatically+on+OS+X+using+launchd
* https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html
* https://www.manpagez.com/man/5/launchd.plist/
