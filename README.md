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

Next time you emerge --sync or eix-sync, this repo will be 
picked-up/updated.

Note that I am working with the new audio-overlay team and that the 
audio-overlay overlay could eventually replace this one as the official 
overlay for Gentoo Studio.

Also note that a number of ebuilds in this repo do nothing more than 
bump to EAPI 6 and use virtual/jack instead of 
jack-audio-connection-kit. This means that ideally, these ebuilds will 
get bumped in Portage with these fixes and therefore disappear from this 
repo.
