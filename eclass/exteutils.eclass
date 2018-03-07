# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

#
# Original Author: evermind
# extend eutils eclass

# gives back 1 if useflag set, 0 if not
# syntax: scons_use_enable flag [option]
scons_use_enable() {
	[ ! -z "${2}" ] && local option="$2" || local option=$1
	use ${1} && echo " ${option}=1" || echo " ${option}=0"
}

escons() {
	$(type -P scons) ${MAKEOPTS} "$@"
}

# returns true/false if pkg is installed or not
# syntax: is_pkg_installed <category/pkgname>
# DEPRICATED: use has_version instead
is_pkg_installed() {
	local missing_action="die"
	if [[ $1 == "--missing" ]] ; then
		missing_action=$2
		shift ; shift
		case ${missing_action} in
			true|false|die) ;;
			*) die "unknown action '${missing_action}'";;
		esac
	fi

	# check if package is installed
	local PKG=$(best_version $1)
	[[ -z ${PKG} ]] && return 1 || return 0
}

# returns true if all pkg are installed or false if not
# syntax: has_all-pkg "<category/pkgname_0> <category/pkgname_n>"
has_all-pkg() {
	local retval="0"
	for p in ${@};do
		if ! ( has_version "$p" && [ "$retval" == "0" ] );then
			return "1"
		fi
	done
	return "$retval"
}

# returns true if one of the given pkg is installed or false if none
# syntax: has_any-pkg "<category/pkgname_0> <category/pkgname_n>"
has_any-pkg() {
	for p in ${@};do
		has_version "$p" && return 0
	done
	return "1"
}

# use like normal sed but set environment to C
esed() {
	LC_ALL=C sed "$@"
}

# using sed and test if sed changed the file
# WARNING: don't pass the same file twice while using the same regexp
# syntax same as sed
# ESED=1 emerge pkg # will show the differences produced whith esed_check
# and placed the pkg in ${S}/esed_patches
ESED_CHECK_ONLY_WARN=0
CNT="0"
esed_check() {
#	set -x
	die_msg() {
		local l_act="$([ "$ESED_CHECK_ONLY_WARN" = 1 ] && echo ewarn || echo eerror)"

		$l_act "esed_check: Failed to patch: ${1}"
		$l_act "esed_check: Sed argument:"
		$l_act "esed_check: sed ${new_args[@]}"

		[ "$ESED_CHECK_ONLY_WARN" = 0 ] && die "sed patching failed"
	}

	local uniq_backup="esed_bac${RANDOM}" # needed to find modified files
	local cnt=0
	## begin debugin
	if [ ! -z "$ESED_DBG" ];then
		for arg in "$@";do
			ewarn "DBG:old_arg $cnt is ->${arg}<-"
			let "cnt+=1"
		done
		cnt=0
	fi
	## end debugin

	# alter the cmdline (add a backup file -- later needed to verify patching)
	local new_args
	for arg in "$@";do
		if [ "${arg::2}" == "-i" ];then
			new_args[$cnt]="-i${uniq_backup}"

			# eg if a switch like -ie is passed we've to separate em
			if [ ! -z "${arg:2}" ];then
				let "cnt+=1"
				new_args[$cnt]=-${arg:2}
			fi
		else
			new_args[$cnt]=${arg}
		fi
		let "cnt+=1"
		###
	done
	## begin debugin
	if [ ! -z "$ESED_DBG" ];then
		cnt=0
		for arg in "${new_args[@]}";do
			ewarn "DBG:new_arg $cnt is ->${arg}<-"
			let "cnt+=1"
		done
		ewarn "sed ${new_args[@]}" 
	fi
	## end debugin

	# call sed to do the work
	LC_ALL=C sed "${new_args[@]}"
	
	if [ "${?}" -ne "0" ] ;then
		die_msg "retval not zero"
	fi

	local old_ifs="$IFS"
IFS="
"
	local patch_file_exists="0"
	local patch_name=""
	local patch_dir="${S}/esed_patches"

	# find backup'd files
	for backup in $(find -name "*${uniq_backup}");do
		local patched="${backup/${uniq_backup}/}"
		einfo "Patched with esed: ${patched#*/}"
		if diff --brief "${patched}" "${backup}" &>/dev/null;then
			die_msg "while diff ${patched}"
		fi

		# check the differences produces with esed_check
		if [ "${ESED}" == "1" ];then
			# display diff 
			einfo "In file ${patched} esed changed:"
			diff -u "${backup}" "${patched}"

			# save the sed geneated patches to $patch_dir
			[ ! -e "${patch_dir}" ] && mkdir -p "${patch_dir}" &>/dev/null
			if [ "${patch_file_exists}" == "0" ];then
				patch_name="$(printf "%.4d" $CNT)-esed_${patched##*/}"
				patch_file_exists="1"
				echo -e"\nesed generated patch for ${patch_name##/*}\n" \
					> "${patch_dir}/${patch_name}.patch"
			fi
			diff -u "${backup}" "${patched}" \
				>> "${patch_dir}/${patch_name}.patch"
		fi

		rm -f "${backup}"
	done
	
	IFS="$old_ifs"
	patch_file_exists="0"
	let CNT+=1
	if [ "${ESED}" == "1" ];then
		einfo
		einfo "esed_check generated patches are located in:"
		einfo "${patch_dir}"
		einfo
	fi
}
