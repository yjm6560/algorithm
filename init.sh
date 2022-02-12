set -e

print_usage()
{
	echo USAGE: ./init.sh [rc file path]
	echo 'rc file example : ~/.bashrc, ~/.zshrc, ~/.cshrc etc...'

	exit 1
}
# 테스트 스크립트 [zsh, bash, csh ...]rc에 추가
if [ $# -lt 1 ]; then
	print_usage
fi
TEST_SCRIPT="'${PWD}/boj/test.sh'"
TARGET=${1}
ALIAS_BASE_CMD="alias bojTest="

ALIAS_COUNT=$(grep "$ALIAS_BASE_CMD" $TARGET | wc -l)
if [ $ALIAS_COUNT -gt 0 ]; then
	echo ERROR: bojTest is already in $TARGET file
	exit 1
fi

echo $ALIAS_BASE_CMD$TEST_SCRIPT >> $TARGET
. $TARGET

