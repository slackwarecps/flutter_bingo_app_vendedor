# como usar o server

$  json-server --watch --host 192.168.1.104 db.json

## para o emulador forward a conexao para o localhost
$ adb reverse tcp:3000 tcp:3000

## JSON SERVER AUTH
$ npm install -g express
$ npm install -g json-server-auth
$ json-server-auth --watch --host 192.168.1.104 db.json

https://www.npmjs.com/package/json-server-auth

$ json-server-auth --watch --host 192.168.1.104 db.json -r routes.json