# CGI - Common Gateway Interface

## Apache2 Server Docker Ruby CGI Image

1. Download [THIS Dockerfile][df] and run the following script. `[tag]` is the tag name for image, eg. `cgi-ruby`

    ```sh
    docker build -f ruby.dockerfile -t [tag] .
    ```

1. Start Apache2 server and load current directory in docker as `cgi-bin` folder

    - <details><summary>Windows CMD</summary>

        ```sh
        docker run -dit -p 80:80 -v "%cd%":/usr/lib/cgi-bin cgi-ruby
        ```
        </details>

    - <details><summary>Linux & Windows PowerShell</summary>

        ```sh
        docker run -dit -p 80:80 -v ${pwd}:/usr/lib/cgi-bin cgi-ruby
        ```
        </details>

1. Now you can access `.rb` script by access `http://localhost/cgi-bin/[filename].rb`, the page will be rendered dynamically at the moment you modify the `.rb` script.

<!-- links -->
[df]: res/cgi-ruby.dockerfile