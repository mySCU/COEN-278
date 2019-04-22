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
    - Object oriented[^1]

## Installation

### Method 1: Docker

Download [this dockerfile][df] and run the following script. `[tag]` is the tag name for image, whose format is `name:version`, eg. `ruby:2.5.1`

??? note "Build the image and run the container"

    ```sh
    docker build -f ruby.dockerfile -t [tag]
    docker run -it tag
    ```

### Method 2: installation in the system

Reference: [official Ruby website][rb]

### Environment

1. `irb`: interactive Ruby
1. `.rb`: Ruby program

## Basics

### Glance of Ruby

1. Structure
    - Methods definitions
    - Statements that call methods
    - Classes with methods
    - Statements that create objects
    - Other statements

??? example "MyClass.rb"

    ``` ruby tab="Ruby"
    class MyClass           # define a class
        def initialize(var) # constructor method
            @var=var
        end

        def my_method       # instance method
            p "instance var is #{@var}"
        end
    end

    obj = MyClass.new(3)
    obj.my_method
    ```

### Data Structure

Everything is a object

#### Numeric

1. Integer
    - `1.even?`, `1.odd?`, `1.zero?`, `1.abs`: `?` belongs to methods names.
    - `23456.chr(Encoding::UTF_8)` default encoding in ASCII
    - `.next`, `.succ` same.
    - `to_s(system)` to string, default in decimal system
    - Iterate methods
        - `#!ruby 5.times {|x| p x}`: transfer 0-4 into block as `x`
        - `#!ruby 5.upto(10) {|x| p x}`: transfer 5-10 into block as `x`
        - `#!ruby 5.downto(1) {|x| p x}`: transfer 5-1 into block as `x`

    ??? note "Systems"

        ``` ruby
        # Decimal
        123, 0d123, 408_345_6789

        # binary
        0b100111

        # octal
        0123m 0o123

        # hex
        0x7B
        ```

1. Float

    ??? note "Scientific otation"

        ``` ruby
        # Decimal
        0.123e2     # 12.3
        123e-1      # 12.3
        ```

1. Rational
1. Complex
1. Get class

    ??? note "Get class name"

        ``` ruby
        # Decimal
        p "".class
        p 1.class
        ```

#### Range

1. Format
    - `1..5` or `Range.new(1, 5, false)`: include the end value
    - `1...5` or `Range.new(1, 5, true)` not include the end value

#### String

<!-- footnotes -->
[^1]:
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa.

<!-- links -->
[matz]:https://github.com/matz
[rb]:https://www.ruby-lang.org/en/downloads/
[df]:res/ruby.Dockerfile