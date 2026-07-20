# Serialize HTTP/1 requests per connection

Ploof will allow at most one active HTTP/1 request on each connection. A client
may pipeline later requests, but Ploof preserves their bytes in bounded
connection or kernel buffers and does not parse and dispatch the next request
until the current Response is complete. When those buffers fill, socket
backpressure bounds further input instead of allocating a request queue.

Keep-alive remains supported, and separate connections remain concurrent across
worker shards. Concurrent pipelined handlers would require multiple request
slots per connection, ordered response buffering, and more complex failure
semantics while offering little benefit behind edge proxies that already pool
connections. Version one therefore chooses bounded memory and deterministic
ordering over per-connection pipelining concurrency.

Ploof will not impose a default requests-per-connection count. Gin with Go and
Express with Node also default to unlimited reuse, and Ploof reinitializes the
same fixed request slot instead of accumulating per-request connection memory.
Idle and progress timeouts, protocol failures, graceful shutdown, and explicit
`Connection: close` still end a connection. A count cap would add reconnect
work without creating a missing memory bound, so applications should place one
at the edge proxy only when their deployment needs it.
