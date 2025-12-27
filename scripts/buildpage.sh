#!/bin/bash

function buildpage {
	PAGE="$1"
    FILE="${PAGE#pages/}"  

  
    TITLE=$(head -n 1 "$PAGE")

  
    DATE=$(date "+%d/%m/%Y")

   
    cat layout/before.html \
        | sed "s~{{TITLE}}~$TITLE~" \
        | sed "s~href=\"$FILE\"~& class=\"current\"~"

  
    tail -n +2 "$PAGE"

 
    cat layout/after.html \
        | sed "s~{{DATE}}~$DATE~"
}


if [[ "${1}" = "" ]]; then 
echo "Usage: ${0} PAGE" >&2
exit 1
elif test ! -f "${1}"; then 
echo "${0}: error: ${1}: no such file" >&2
exit 1
else 
FILE="${1#pages/}"
buildpage "${1}" > "public/${FILE}"
fi