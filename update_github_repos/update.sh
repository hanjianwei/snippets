#!/usr/bin/env zsh

all_orgs=(hanjianwei kconf)

list_org_projects() {
  gh repo list $1 --json name | jq '.[].name' | tr -d '"'
}

update_repo() {
  local org=$1
  echo "Update repos for $org"
  mkdir -p $org
  pushd $org
  repos=($(list_org_projects $org))
  for repo in $repos; do
    if [[ -d $repo ]]; then
      echo "Update repo $repo"
      pushd $repo
      git pull
      popd
    else
      echo "Init repo $repo"
      gh repo clone $org/$repo
    fi
  done
  popd
}

update_repos() {
  local orgs=$@
  for org in $orgs; do
    update_repo $org
  done
}

if [[ $# == 0 ]]; then
  update_repos $all_orgs
else
  update_repos $@
fi
