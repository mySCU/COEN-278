# Web Server

## Socket

1. Hierarchy: 
    - Web app -> HTTP -> TCP/IP (Layer 4 -> transport layer)
    - Ruby `socket`(std-lib) -> standard socket API (Berkeley/POSIX Sockets)
    - Inheritance: `TCPSocket` -> `IPSocket` -> `Socket` -> `BasicSocket` -> `IO`

1. Server (Listener)
    - <details><summary>Structure: `Create` -> `Bind` -> `Listen` -> `Accept` -> `Close` -> `Listen`</summary>

        ``` ruby
        require 'socket'    # include socket in standard library

        # Step 1: Create
        sock_serv = Socket.new(
            domain,     # :INET => IPv4, :INET6 => IPv6, :UNIX => Unix Socket
            socket_type # :STREAM => TCP, DGRAM => UDP, RAW => ?
        )

        # Step 2: Bind
        addr = Socket.pack_sockaddr_in{
            port,   # int, (1025..48999)
            ip_addr # str, host machine
        }
        sock_serv.bind(addr)

        # Step 3: Listen (only for stream-oriented mode)
        sock_serv.listen(n)    # int, max num of conn, default 5, (1..Socket::SOMAXCONN)
        puts "Listening from host #{ip_addr} at port #{port} ..."

        # Step 4: Accept -> Close loop
        loop do
            conn = sock_serv.accept
            conn.close
        end
        ```
        </details>

    - Syntax sugar
        - <details><summary>Combine `Create` -> `Bind` -> `Listen`</summary>

            ``` ruby
            require 'socket'            # include socket in standard library

            sock_serv = TCPServer.new(  # TCPServer.listen(n) to chang conn, default 5
                ip_addr                 # str, host machine, default "127.0.0.1"
                port,                   # int, (1025..48999)
            )
            # server = Socket.tcp_server_sockets(port)    # same, default at localhost

            Socket.accept_loop(sock_serv) do |conn|
                conn.close              # next conn won't accepted until the block returns.
            end                         # Use Thread for multiple clients
            ```
            </details>

        - <details><summary>√ Wrap all steps</summary>

            ``` ruby
            require 'socket'

            Socket.tcp_server_sockets(host=nil, port) do |conn|
                conn.close
            end
            ```
            </details>

1. Client (Initate)
    - <details><summary>Structure: `Create` -> `Connect` -> `Close`</summary>

        ``` ruby
        require 'socket'    # include socket in standard library

        # Step 1: Create (same as server)
        sock_clnt = Socket.new(
            domain,     # :INET => IPv4, :INET6 => IPv6, :UNIX => Unix Socket
            socket_type # :STREAM => TCP, DGRAM => UDP, RAW => ?
        )

        # Step 2: Connect
        serv_addr = sock_clnt.pack_sockaddr_in{
            port,   # int, (1025..48999)
            ip_addr # str, host machine
        }
        sock_clnt.connect(serv_addr)
        ```
        </summary>

    - <details><summary>Syntax sugar: wrap all steps</summary>

        ``` ruby
        require 'socket'

        sock_clnt = TCPSocket.new(
            ip_addr                 # str, target server
            port,                   # int, (1025..48999)
        )
        ```
    </details>

## Create Web Server

1. Socket connection -> file
    - <details><summary>"Read" socket</summary>

        ```ruby
        require 'socket'

        Socket.tcp_server_loop(1234) do |conn|
            puts conn.gets
            conn.close
        end
        ```
        </details>

    - <details><summary>"Write" socket</summary>

        ```ruby
        require 'socket'

        sock_clnt = TCPSocket.new("localhost", 1234)
        sock_clnt.write(str)
        ```
        </details>

1. <details><Summary>HTTP request Header</Summary>

    ``` http
    GET /hello.htm HTTP/1.1
    User-Agent: Mozilla/4.0 (compatible; MSIE5.0; Windows NT)
    Host: www.tutorialpoint.com
    Accept-Language: en-us
    Accept-Encoding: gzip, deflate
    Connection: Keep-Alive
    ```

    </details>

1. <details><Summary>HTTP Response Header</Summary>

    ``` http
    GET /hello.htm HTTP/1.1
    User-Agent: Mozilla/4.0 (compatible; MSIE5.0; Windows NT)
    Host: www.tutorialpoint.com
    Accept-Language: en-us
    Accept-Encoding: gzip, deflate
    Connection: Keep-Alive
    ```

    </details>