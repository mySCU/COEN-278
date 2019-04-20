# Ruby

## History and fundamentals

1. Ruby
    - Parent: [Yukihiro "Matz" Matsumoto][matz]
    - Age: 1995 - now
    - Used in
        - System Admin: automation script
        - Web programming

1. Programming paradigm: Ruby can do all (need further explaination)
    - Procedural
    - Functional
    - Object oriented

## Installation

### Method 1: Docker

Download this dockerfile and run the following script. `[tag]` is the tag name for image, whose format is `name:version`, eg. `ruby:2.5.1`

```sh
docker build -f ruby.dockerfile -t [tag]
docker run -it tag
```

### Method 2: installation in the system

### Environment

1. `irb`: interactive Ruby
1. `.rb`: Ruby program

## Basics



Reference: [official Ruby website][rb]

<!-- links -->
[matz]:https://github.com/matz
[rb]:https://www.ruby-lang.org/en/downloads/