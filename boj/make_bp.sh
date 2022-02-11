#!bin/bash

print_usage()
{
echo Usage:
echo ${0} [PROBLEM NUMBER]
exit 1
}

if [ $# -ne 1 ]; then
	print_usage
fi

PROBLEM_NO=${1}

echo =============================================
echo MAKE INITIAL SETTING PROBLEM_NO : ${1}
echo =============================================

if [ ! -d $PROBLEM_NO ];then
	echo make directory $PROBLEM_NO
	mkdir -p $PROBLEM_NO
else
	echo directory $PROBLEM_NO already exists
fi

if [ ! -e $PROBLEM_NO/$PROBLEM_NO.cpp ]; then
	echo make sample src file
	cp boilerPlate.cpp $PROBLEM_NO/$PROBLEM_NO.cpp
else
	echo $PROBLEM_NO/$PROBLEM_NO.cpp already exists
fi

cd $PROBLEM_NO
