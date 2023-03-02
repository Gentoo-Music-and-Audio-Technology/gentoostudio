# gentoostudio
Ebuild overlay for Gentoo Studio (http://gentoostudio.org)

All ebuilds:
* use EAPI7 or higher
* are any of: 
	* not in the main Portage repo
	* differ from the main portage tree version in some significant way
	* a later version than in Portage

Some ebuilds may have been copied from other overlays, such as audio-overlay or nedko's LADI overlay.
The reason for this is catalyst (the software used to build the install tarball) can only have one overlay.

To use this repo, edit /etc/portage/repos.conf/gentoostudio.conf:

[GentooStudio]

location = /var/db/repos

sync-type = git

sync-uri = https://github.com/Gentoo-Music-and-Audio-Technology/gentoostudio.git

auto-sync = yes

Next time you emerge --sync or eix-sync, this repo will be picked-up/updated.
To update only this repo: emaint sync -r GentooStudio

test
