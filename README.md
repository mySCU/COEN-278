# COEN 278 Advanced Web Programming

## Browse Website

[![Build Status](https://travis-ci.org/EICamino/COEN-278.svg?branch=master)](https://travis-ci.org/EICamino/COEN-278)

[COEN 278 - Advanced Web Programming - Santa Clara University](https://ruby.mzhao.page/)

## Information

- Code: COEN 278
- Term: 2019 Spring
- Instructor: [Yuan Wang][yw]
- Textbook: [_Agile Web Development with Rails 6_][tb]
- Prerequisite:

## Syllabus

1. High level structure
    - Web application development overall
    - Server side programming using Ruby to create web related applications for example, we will use Ruby to write web server
    - Using frameworks to create web applications We will be using two: Sinatra, Ruby on Rails
    - Other issues (i.e. security)
    - Other languages and frameworks.

## Docker Ruby CGI server image

[A docker image for Ruby CGI server.](docs/04-cgi.md)

## Sinatra

1. Initiate container and mount the current directory

    ``` sh
    docker run -it -p 80:80 -v ${pwd}:/pwd -w /pwd ruby
    ```

1. Run sinatra on 0.0.0.0:80

    ``` sh
    # w/  shebang
    [name].rb -o 0.0.0.0 -p 80

    # w/o shabang
    ruby [name].rb -o 0.0.0.0 -p 80
    ```

## Debug

1. `/usr/bin/env: 'ruby\r': No such file or directory`: change EOF from CRLF(\r\n) to LF(\n)

## Todo

1. Ruby application server comparison: https://ruby-china.org/topics/25276

<!-- link -->
[yw]:https://www.linkedin.com/in/yuan-wang-ba5a31a8/
[tb]:https://www.amazon.com/Agile-Web-Development-Rails-6/dp/1680506706/