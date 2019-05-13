# CGI - Common Gateway Interface

## Apache2 Server Docker Ruby CGI Image

1. Download [cgi-ruby.dockerfile][df] and run the following script in the same folder. `cgi-ruby` is the name for the image, change it if you want to.

    ```sh
    docker build -f cgi-ruby.dockerfile -t cgi-ruby .
    ```

1. Start Apache2 server and load current directory in docker as `cgi-bin` folder

    - <details><summary>Windows CMD</summary>

        ```sh
        docker run -dit -p 80:80 -v "%cd%":/usr/lib/cgi-bin -w /usr/lib/cgi-bin cgi-ruby
        ```

    </details>

    - <details><summary>Linux & Windows PowerShell</summary>

        ```sh
        docker run -dit -p 80:80 -v ${pwd}:/usr/lib/cgi-bin -w /usr/lib/cgi-bin cgi-ruby
        ```

    </details>

    - <details><summary>OS X</summary>

        ```sh
        docker run -dit -p 80:80 -v $PWD:/usr/lib/cgi-bin -w /usr/lib/cgi-bin cgi-ruby
        ```

    </details>

1. Now you can access `.rb` script by access `http://localhost/cgi-bin/[filename].rb`, the page will be rendered dynamically at the moment you modify the `.rb` script.

<!-- links -->
[df]: res/cgi-cgi-ruby.dockerfile