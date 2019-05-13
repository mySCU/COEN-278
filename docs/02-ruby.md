# Ruby

## History and fundamentals

1. Ruby
    - Parent: [Yukihiro "Matz" Matsumoto][matz]
    - Age: 1995 - now
    - Used in
        - System Admin: automation script
        - Web programming

1. Programming paradigm: Ruby can do all (need further explanation)
    - Procedural: data and functions not associated
    - Functional: anonymous functions
    - Object oriented: data and algorithms are associated
        - class based: instantiate
        - prototype based: clone

## Installation

### Method 1: Docker

Download [THIS Dockerfile][df] and run the following script. `[tag]` is the tag name for image, whose format is `name:version`, eg. `ruby:2.5.1`

    ```sh
    docker build -f ruby.dockerfile -t [tag] .
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

## Data Structure

Everything is a object

### Numeric

1. Integer
    - `1.even?`, `1.odd?`, `1.zero?`, `1.abs`: `?` belongs to methods names.
    - `23456.chr(Encoding::UTF_8)` default encoding in ASCII
    - `.next`, `.succ` same.
    - `to_s(system)` to string, default in decimal system
    - Iterate methods
        - `#!ruby 5.times {|x| p x}`: transfer 0-4 into block as `x`
        - `#!ruby 5.upto(10) {|x| p x}`: transfer 5-10 into block as `x`
        - `#!ruby 5.downto(1) {|x| p x}`: transfer 5-1 into block as `x`

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

    ``` ruby
    # Decimal
    0.123e2     # 12.3
    123e-1      # 12.3
    ```

1. Rational
1. Complex
1. Get class

    ``` ruby
    # Decimal
    p "".class
    p 1.class
    ```

### Range

1. Format: 
    - `(1..5)` or `Range.new(1, 5, false)`: include the end value
    - `(1...5)` or `Range.new(1, 5, true)` not include the end value

1. Method
    - `(1..5).end == (1...5).end`, `(1..5).begin == (1...5).begin`: although the later not include the end point.
    - `(1...5).exclude_end?` => true
    - `.cover?(e)` or `.include?(e)`, return true if e INCLUDED IN RANGE (no need to be explicit)
        - `(1..5).cover?(2.5)` => `true`
        - `(‘car’..’cat’).include?(‘cas’)` => `true`
    - `.first(n)`, `.last(n)`
    - Element number
        - `.count`
        - `.size` not work for non integer sequence.
    - `(..).step(n)`: same as `range(start, end, step)` in Python.
    - `.min`, `.max`

1. Iterative: provides each element to iterative blocks

    ```ruby
    (1..10).each {|x| p x, '-'}
    ```

    or

    ```ruby
    (1..10).each do |x|
        p x, '-'
    end
    ```

    is the same to

    ```ruby
    for x in (1..10) do
        p x, '-'
    end
    ```

### String

1. Format: 
    - Quote: only double quoted string will be parsed
    - `%`
        - Followed by `Q{}` or one in `{}, ( ), < >, [ ], / /, * *, # #, ! !, @@, &&, ^^, ++, - -,| |, : :, ; ; % %` will be parse.
        - Followed by a pair of `q{}` won't be parsed.
        - Convenient when contents includes quote marks.

    ``` ruby
    str1 = 'a string \n'        # => "1 + 1 is \#{1+1}"
    str2 = '1 + 1 is #{1+1}'    # => "1 + 1 is \#{1+1}"
    str2 = %q{1 + 1 is #{1+1}}  # => "1 + 1 is \#{1+1}"
    str3 = "a string \n"        # => "1 + 1 is 2"
    str4 = '1 + 1 is #{1+1}'    # => "1 + 1 is 2"
    str2 = %Q{1 + 1 is #{1+1}}  # => "1 + 1 is 2"
    str5 = String.new("another string")
    ```

1. Here document (show as it is)

    ``` ruby
    x = <<END_MARK
    Contents
        Contents
    END_MARK
    ```

    ??? note "`puts` vs. `p`"

1. Methods
    - Concatenation
        - `<<`: same as `+`.

        ``` ruby
        "i love you " + "forever"       # "i love you forever"
        "i love you ""forever"          # "i love you forever"
        "over " * 3 + " again"          # "over over over again"
        a = "i love you"
        a << "r money"                  # "i love your money"
        ```

    - `<=>` operator: returns -1, 0, or 1 for `<`, `=`, and `>` correspondingly.

        ``` ruby
        "1" < "2"       # -1
        "1" < "1"       # 0
        "2" < "1"       # 1
        ```

    - Slicing

        ``` ruby
        a = "0123456"
        a[0]            # "0"
        a[2, 5]         # start from 2, 5 elements
        a[2..5]         # "2345"
        a[2...5]        # "234"
        a.length        # 7
        ```

1. Iterative: provides each character to iterative blocks

    ```ruby
    "iloveyou".each_char {|x| print x, '-'}     # i-l-o-v-e-y-o-u-
    ```

### Symbol

1. Hash:

``` ruby
person[:name]  = 'yuan'
person['name'] = 'yuan'     # NOT same as above
```

1. Method arg

``` ruby
class Test
    def tmp
        puts "symbol method"
    end
end

myObj = Test.new()
m = :tmp
obj.method(m).call      # => "symbol method"
```

### Containers

#### Array

1. Similar to Python `list`, can have diff types of element.

## Wired

1. Week 1-2 slide 11 `a[2, 5]`
1. Week 1-2 slide 22 `[:name]` and `['name']`

## TBD

- <code>include</code>: add everything __belongs to__ the included class/module (class var, inst method, module const)
- <code>extend</code>: add inst method as class method (extend it to single subclass)

<!-- footnotes -->
[^1]:
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa.

<!-- links -->
[matz]:https://github.com/matz
[rb]:https://www.ruby-lang.org/en/downloads/
[df]:res/ruby.dockerfile