# algorithm
algorithm

# INSTALL
### COMMON
```bash
./init.sh [rc file path]
# rc file example : ~/.bashrc, ~/.zshrc, ~/.cshrc etc...
```
### FOR  MAC OS
```bash
brew install coreutils
sudo ln -s /usr/local/bin/gtimeout /usr/local/bin/timeout
```

# HOW TO TEST
#init.sh 실행이 선행되어야 한다.
```bash
cd boj
./make_bp.sh [boj num]
cd [boj num]
# create input[n].dat
# edit [boj num].cpp
bojTest
```

