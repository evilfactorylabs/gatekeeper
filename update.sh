#!/usr/bin/env bash

abpindo_repo="https://github.com/ABPindo/indonesianadblockrules.git"
steven_black_hosts_repo="https://github.com/StevenBlack/hosts.git"

pprint() {
  echo
  echo "> $1"
  echo
}

pprint "updating ABPIndo filter lists..."

git subtree pull --prefix ABPIndo $abpindo_repo master --squash

pprint "updating steven-black-hosts filter lists..."

git subtree pull --prefix steven-black-hosts $steven_black_hosts_repo master --squash

pprint "done"
