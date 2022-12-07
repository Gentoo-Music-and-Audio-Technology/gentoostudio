# gentoostudio
Ebuild overlay for Gentoo Studio (http://gentoostudio.org)

All ebuilds:
* use EAPI6 or higher
* have the amd64 or ~amd64 keyword, unless it is a live ebuild. x86 is not supported by Gentoo Studio
* pass repoman full (or equivalent)

To use this repo, edit /etc/portage/repos.conf/GentooStudio.conf:

[GentooStudio]
location = /usr/local/portage
sync-type = git
sync-uri = https://github.com/audiodef/gentoostudio.git
auto-sync = yes

Next time you emerge --sync or eix-sync, this repo will be 
picked-up/updated.

December 2022: After a long time away I am actively working on Gentoo Studio. Test installs and comments are welcome. 
