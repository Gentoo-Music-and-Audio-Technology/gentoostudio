# gentoostudio
Ebuild overlay for Gentoo Studio (http://gentoostudio.org)

All ebuilds:
* use EAPI7 or higher
* are either not in the main portage tree or differ from the main portage tree version in some significant way

To use this repo, edit /etc/portage/repos.conf/gentoostudio.conf:

[GentooStudio]
location = /usr/local/portage
sync-type = git
sync-uri = https://github.com/audiodef/gentoostudio.git
auto-sync = yes

Next time you emerge --sync or eix-sync, this repo will be picked-up/updated.
