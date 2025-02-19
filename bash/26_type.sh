#!/bin/sh

# bash: 1.type ss > /dev/null 2>&1
# bash: 2.command -v ss > /dev/null 2>&1
# 3.hash ss > /dev/null 2>&1
# 4.which ss > /dev/null 2>&1
# zsh only: 5.(( $+commands[ss]))

if type "ss" > /dev/null 2>&1; then
  echo "ss installed"
elif type "lsof" > /dev/null 2>&1; then
  echo "lsof installed"
elif type "netstat" > /dev/null 2>&1; then
  echo "netstat installed"
else
  echo "there is no tool to investigate sockets."
fi

#command -v ss

