# gentoostudio
Ebuild overlay for Gentoo Studio (http://gentoostudio.org)

All ebuilds:
* use EAPI6
* have the amd64 or ~amd64 keyword, unless it is a live ebuild. x86 is not supported by Gentoo Studio
* pass repoman full

To use this repo, edit /etc/portage/repos.conf/GentooStudio.conf:

[GentooStudio]
location = /usr/local/portage
sync-type = git
sync-uri = https://github.com/audiodef/gentoostudio.git
auto-sync = yes

Note that I am working with the new audio-overlay team and that the 
audio-overlay overlay could eventually replace this one as the official 
overlay for Gentoo Studio.
