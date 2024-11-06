#!/bin/sh

_CTRL_Z_=$'\cZ'

{
    IFS=$'\n'"${_CTRL_Z_}" read -r -d "${_CTRL_Z_}" CAPTURED_STDERR;
    IFS=$'\n'"${_CTRL_Z_}" read -r -d "${_CTRL_Z_}" CAPTURED_STDOUT;
    (IFS=$'\n'"${_CTRL_Z_}" read -r -d "${_CTRL_Z_}" _ERRNO_; exit ${_ERRNO_});
} <<EOF
$((printf "${_CTRL_Z_}%s${_CTRL_Z_}%d${_CTRL_Z_}" "$(ls ipp.pcap asdf)" "${?}" 1>&2) 2>&1)
EOF
code=$?

echo stdout ${CAPTURED_STDOUT}
echo stderr ${CAPTURED_STDERR}
echo exit code "${_ERRNO_}"
echo exit code: "${code}"




_CTRL_Z_=$'\cZ'

# SYNTAX:
#     catch_posix STDOUT_VARIABLE STDERR_VARIABLE COMMAND
catch_posix() {
    {
        IFS=$'\n'"${_CTRL_Z_}" read -r -d "${_CTRL_Z_}" "${1}";
        IFS=$'\n'"${_CTRL_Z_}" read -r -d "${_CTRL_Z_}" "${2}";
        (IFS=$'\n'"${_CTRL_Z_}" read -r -d "${_CTRL_Z_}" _ERRNO_; return ${_ERRNO_});
    } <<EOF
$((printf "${_CTRL_Z_}%s${_CTRL_Z_}%d${_CTRL_Z_}" "$(((({ ${3}; echo "${?}" 1>&3-; } | cut -z -d"${_CTRL_Z_}" -f1 | tr -d '\0' 1>&4-) 4>&2- 2>&1- | cut -z -d"${_CTRL_Z_}" -f1 | tr -d '\0' 1>&4-) 3>&1- | exit "$(cat)") 4>&1-)" "${?}" 1>&2) 2>&1)
EOF
}
catch_posix MY_STDOUT MY_STDERR 'ls test.sh asfdkl ipp.pcap'
echo "The \`ls\` program exited with code ${?}"
echo

echo 'Here is the captured stdout:'
echo "${MY_STDOUT}"
echo

echo 'And here is the captured stderr:'
echo "${MY_STDERR}"
echo
