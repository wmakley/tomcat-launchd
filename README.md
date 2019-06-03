# Tools to help run Tomcat under launchd

The .plist file needs to be edited with the correct path to tomcat in numerous places. It is possible that the WorkingDirectory setting means that not all paths need to be absolute, but I didn’t test it. It should also be renamed; I anonymized it since I made it public.

The shell script needs to go in the tomcat "bin" directory. It is necessary to wrap tomcat, since tomcat's default startup script forks itself into the background and launchd would continuously try to restart it.


## Installation

1. Copy the .plist file to ~/Library/LaunchAgents/ and modify the paths, labels, and environment variables as needed. Every "path/to/tomcat" should be changed and JAVA_HOME should be set correctly (the example is for [AdoptOpenJDK](https://adoptopenjdk.net/)).
2. Copy launchd\_wrapper.sh to your Tomcat "bin" folder and make sure it is executable (`chmod +x launchd_wrapper.sh`).
3. `launchctl load ~/Library/LaunchAgents/mysite.tomcat.plist`

To stop/disable the service:

`launchctl unload ~/Library/LaunchAgents/mysite.tomcat.plist`

## Running tomcat as another user

1. Copy the .plist file to /Library/LaunchAgents/ instead.
2. Add the following key/value to it, replacing "tomcat" with your desired user:
    ```xml
    <key>UserName</key>
    <string>tomcat</string>
    ```
3. `sudo launchctl load /Library/LaunchAgents/mysite.tomcat.plist`

Disabling is the same as above:

`sudo launchctl unload /Library/LaunchAgents/mysite.tomcat.plist`

## References:
* https://confluence.atlassian.com/display/CONF32/Start+Confluence+automatically+on+OS+X+using+launchd
* https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html
* https://www.manpagez.com/man/5/launchd.plist/
