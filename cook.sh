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

# Select the role or exit if the role (dish) is not available.
role="roles/"$1".json"

if [[ "$#" != 1 ]] || [[ ! -f $role ]]; then
  wrong_usage
fi

# Install chef if it is not installed yet
if [ ! $(which chef-solo) ]; then
  echo "Your personal chef is not here yet..."
  echo "Inviting your personal chef first"

  installed=$(gem install chef 2>/dev/null)
  if [[ ! $installed ]]; then
    echo "It looks like I need more rights to install chef."

    if [[ ! $(sudo gem install chef) ]]; then
      die "Could not install chef."
    fi
  fi
fi

echo "Begin cooking..."

sudo chef-solo -c config.rb -j $role
