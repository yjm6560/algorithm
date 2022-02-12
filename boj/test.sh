set -e

do_test_with_no_input()
{
	echo === RESULT ===
	echo TEST WITH NO INPUT FILES
	./a.out
}
do_test_with_input()
{
	INPUT=${1}
	TEST_NUM=`expr "${INPUT}" : 'input\([0-9]\).dat'`
	echo '########### TEST' $TEST_NUM '###########'
	echo === INPUT ====
	cat $INPUT
	echo === RESULT ===
	./a.out < $INPUT
	echo
}

export -f do_test_with_no_input
export -f do_test_with_input

SRC_FILE="${PWD##*/}.cpp" INPUT_FILES=($(ls | grep '^input' | grep '.dat$'))

# SRC_FILE CHECK
if [ ! -e $SRC_FILE ]; then
	echo ERROR : SOURCE CODE DOES NOT EXIST
	exit 1
fi

if [ $# -lt 1 ]; then
	TIME_OUT=2s
else
	TIME_OUT=${1}
fi

echo TIME OUT = $TIME_OUT
echo '!!!! COMPILE START !!!!'
g++ $SRC_FILE -std=c++17

echo '!!! COMPILE SUCCESS !!!'
echo '!!!   TEST START   !!!!'

# INPUT_FILES CHECK
if [ ${#INPUT_FILES[@]} -lt 1 ]; then
	# NO INPUT
	timeout $TIME_OUT bash -c 'do_test_with_no_input'
	TIMEOUT_STATUS=$?
	if [ $TIMEOUT_STATUS -eq 124 ]; then
		echo TIME OUT OCCURED !!!
		exit 1
	fi
else
	# INPUT EXISTS
	for INPUT in "${INPUT_FILES[@]}";
	do
		cmd='do_test_with_input '$INPUT
		timeout $TIME_OUT bash -c 'do_test_with_input '$INPUT;
		TIMEOUT_STATUS=$?
		if [ $TIMEOUT_STATUS -eq 124 ]; then
			echo TIME OUT OCCURED !!!
			exit 1
		fi
	done
fi

echo '!!!   TEST FINISH   !!!!'
