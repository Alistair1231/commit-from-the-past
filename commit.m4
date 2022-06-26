#!/bin/bash

# generate actual script using argbash (https://github.com/matejak/argbash)
# https://argbash.io/send_template#generator

# m4_ignore(
echo "This is just a script template, not the script (yet) - pass it to 'argbash' to fix this." >&2
exit 11  #)Created by argbash-init v2.10.0
# ARG_OPTIONAL_SINGLE([hours],[H],[commit time difference in hours],[0])
# ARG_OPTIONAL_SINGLE([days],[d],[commit time difference] in days,[0])
# ARG_OPTIONAL_SINGLE([message],[m],[commit message, when used with --amend leave empty to keep message as is])
# ARG_OPTIONAL_BOOLEAN([amend],[a],[apply time shift to last commit, or to specific commit using --amend-commit])
# ARG_OPTIONAL_BOOLEAN([test],,[only test, don't actually run])
# ARGBASH_SET_DELIM([ =])
# ARG_OPTION_STACKING([getopt])
# ARG_RESTRICT_VALUES([no-local-options])
# ARG_HELP()
# ARGBASH_GO

# [ <-- needed because of Argbash

# vvv  PLACE YOUR CODE HERE  vvv
# if amend on
# if amend on
if [[ $_arg_amend == 'on' ]] ;then
    printf 'Commit will be amended\n'
    amend="--amend --no-edit"
fi


# if hours or days is not empty
if ( [[ $_arg_hours != 0 ]] || [[ $_arg_days != 0 ]] ) ;then
    if [[ $_arg_hours != 0 ]] ;then
        printf 'Commit will be %s hours shifted\n' "$_arg_hours"
    fi
    if [[ $_arg_days != 0 ]] ;then
        printf 'Commit will be %s days shifted\n' "$_arg_days"
    fi
    date=$(LC_TIME="en_US.utf8" date -d "$_arg_days days $_arg_hours hours")
    echo "RESULTING DATE: $date"
    echo;
else
    date=$(LC_TIME="en_US.utf8" date)
fi

# amend off, but commit message is empty
if ( [[ $_arg_amend == 'off' ]] && [[ -z $_arg_message ]] ) ;then
    echo;
    echo "========================================================="
    echo "--message is required when --amend is off"
    echo "========================================================="
    echo;
    show_help=1;
fi
# commit message not empty
if [[ ! -z $_arg_message ]] ;then
    printf 'COMMIT MESSAGE: %s\n' "$_arg_message"
	
    msg="-m \"$_arg_message\""
fi

if [[ $show_help == 1 ]];then
    echo;
    eval $0 --help
    exit 1;
fi

arg1='GIT_COMMITTER_DATE="'$date'";'
arg2='git commit '$amend' --date "'$date'" '$msg
echo;
echo "FINAL COMMAND:";
echo $arg1;
echo $arg2;
echo;

if [[ $_arg_test == 'on' ]]; then
    exit 0;
else
	read -r -p "Are you sure? [Y/n]" response
	response=${response,,} # tolower
	if [[ $response =~ ^(yes|y|Y| ) ]] || [[ -z $response ]]; then
    	eval $arg1
    	eval $arg2
	fi

fi

# ^^^  TERMINATE YOUR CODE BEFORE THE BOTTOM ARGBASH MARKER  ^^^

# ] <-- needed because of Argbash