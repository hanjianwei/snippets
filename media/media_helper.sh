#!/usr/bin/env zsh

print_media_info() {
	echo "$(du -sh $1)"
}

comp_media() {
	local t=$1
	local f=$2

	print_media_info "data/$t/$f"
	print_media_info "Media/$t/$f"
}

comp_movie() {
	comp_media Movies $1
}

comp_tv() {
	comp_media TVs $1
}

common_media() {
	local t=$1
	comm -12 <(command ls data/$t) <(command ls Media/$t)
}

common_movies() {
	common_media Movies
}

common_tvs() {
	common_media TVs
}

compare_common_media() {
	local IFS=$'\n'
	local t=$1
	local cms=
	for m in $(common_media $t); do
		comp_media $t $m
	done
}

compare_common_movies() {
	compare_common_media Movies
}

compare_common_tvs() {
	compare_common_media TVs
}
