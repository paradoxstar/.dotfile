# .dotfile
personal dotfile








Some Important Issues:
===================================================
Install openssl@3: Can't locate IPC/Cmd.pm in @INC

---------------------------------------------------------------------------------------------------
First, install openssl@3 with debug option;
brew install --verbose --debug openssl@3

Even though errors occur just ignore them and finish the installation.

Then, download the source code and manually install:
(you must set $HOMEBREW_DIR)
./Configure --prefix=$HOMEBREW_DIR/Cellar/openssl@3/3.1.0 --openssldir=$HOMEBREW_DIR/etc/openssl@3  --libdir=$HOMEBREW_DIR/lib/

make -j8 && make install
