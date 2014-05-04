#!/usr/bin/env bash

# Helper function to kill this if something went wrong
die () {
  echo >&2 "$@"
  exit
}

# This helper function displays the available dishes
wrong_usage () {
  available_roles=`ls roles/ | sed -e 's/\.[a-zA-Z]*$/,/'`
  available_roles="${available_roles%?}"
  msg="usage: cook.sh DISH\navailable dishes: $available_roles"
  die -e $msg
}

role="roles/"$1".json"

if [[ "$#" != 1 ]] || [[! -f $role ]]; then
  wrong_usage
fi

echo "Begin cooking..."

sudo chef-solo -c config.rb -j $role
