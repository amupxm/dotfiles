#!/bin/bash
# In The Name of God
# ========================================
# [] File Name : owghat.sh
#
# [] Creation Date : 03-11-2020
#
# [] Created By : Parham Alvani <parham.alvani@gmail.com>
# =======================================

url="https://api.keybit.ir/owghat/?city=%D8%AA%D9%87%D8%B1%D8%A7%D9%86"

curl -Ls "$url" | jq '.result | .azan_sobh, .azan_zohr, .azan_maghreb' -r | xargs printf ' %s  %s  %s\n'
