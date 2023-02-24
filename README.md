# gentoostudio
Ebuild overlay for Gentoo Studio (http://gentoostudio.org)

All ebuilds:
* use EAPI7 or higher
* are any of: not in the main portage tree, differ from the main portage tree version in some significant way, a later version than in Portage

To use this repo, edit /etc/portage/repos.conf/gentoostudio.conf:

[GentooStudio]
location = /usr/local/portage
sync-type = git
sync-uri = https://github.com/Gentoo-Music-and-Audio-Technology/gentoostudio.git
auto-sync = yes

Next time you emerge --sync or eix-sync, this repo will be picked-up/updated.
To update only this repo: emaint sync -r GentooStudio
