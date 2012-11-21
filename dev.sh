
mkdir -p src
mkdir -p lib
mkdir -p bin
mkdir -p test

touch src/script.ls
touch src/goose.ls
touch bin/index.js
touch test/demo1.gos
touch test/demo2.gos

chmod +x bin/index.js

livescript -o lib/ -wbc src/*ls &
node-dev ./bin/index.js ./test/*.gos &

read

pkill -f 'livescript'
pkill -f 'node-dev'