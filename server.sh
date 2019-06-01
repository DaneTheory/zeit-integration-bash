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
