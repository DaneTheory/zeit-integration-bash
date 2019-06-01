# ZEIT Integration Bash server
> Illustrating how simple a ZEIT Integration can be

Should work on most unix-like systems without the need to install any dependencies.

Complete source code below

```bash
#!/usr/bin/env bash
PORT=${1:-5005}
RESPONSE_CONTENT=${2:-"<Page><H1>Hello from bash</H1></Page>"}
echo "Starting server at http://localhost:$PORT"
RESPONSE=$(cat <<-END
HTTP/1.1 200 OK
access-control-allow-headers: Authorization, Accept, Content-Type
access-control-allow-methods: GET, POST, DELETE, OPTIONS
access-control-allow-origin: *
Connection: close

$RESPONSE_CONTENT

END
)
while { echo -en "$RESPONSE"; } | nc -lN "${PORT}"; do
  echo "==================="
done
```

## Usage 
```bash
./server.sh 
# or define your own port and response content
./server.sh 5005 '<Page><H1>Custom response</H1></Page>'
```

## Screenshots
Access from a curl request:
![screenshot](http://cdn-j320vcgn8.now.sh/zeit-integration-bash-curl.png "screenshot")

From within the Integrations dashboard:
![screenshot](http://cdn-kenqks4kx.now.sh/zeit-integration-bash-dashboard.png
 "screenshot")

Adapted from https://github.com/benrady/shinatra

