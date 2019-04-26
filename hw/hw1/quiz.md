# Assignment

<!-- TOC -->

- [Assignment](#assignment)
    - [Question 1](#question-1)
    - [Question 2](#question-2)
    - [Question 3](#question-3)
    - [Question 4](#question-4)
    - [Question 5](#question-5)
    - [Question 6](#question-6)
    - [Requirement](#requirement)

<!-- /TOC -->

## Question 1

Define a string using either literal or “here document”, for example, the following variable “str” is defined with a “here document”

``` ruby
str1 = <<EOS

Facebook and its founder must release documents and electronic correspondence to a defense lawyer whose client has fled from criminal charges that he falsely claimed a majority ownership in the social media giant, a federal judge said Friday.

EOS
```

(you can also use %{ } to define string)

then open String class, add a method to calculate number of occurrence of any given word. if you pass a string parameter, then it will return number of occurrences of the string in str, if you just nothing, then it will return number of occurrences for every word in a hash

for example:  

``` ruby
str1.count_word(“and”)       # => 2

str2 = %{three, three, three}
str2.count_word()        # => {"three"=>3}
```

## Question 2

Define an array of student record, for example,

``` ruby
students = [
      {:firstname => "John", :lastname => "LastnameJohn",  :phonenumber => 123456789},
      {:firstname => "Ken", :lastname => "Lastnameken",  :phonenumber => 456734244},
      {:firstname => "Marisa", :lastname => "lastnamemarisa",  :phonenumber => 443234567},
      {:firstname => "Ken", :lastname => "Kenlastname",  :phonenumber => 456734244}
]
```

write a Search class, the instance method of its object is able to query student,

for example find all the record with first firstname being “ken”:

`obj.search_students(students, firstname: “ken”)`, it will print:

``` text
First Name        Last Name         Phone#

Ken               Lastnameken       456734244
Ken               Kenlastname       456734244
```

## Question 3

write a class for compressing a string. when you create an object of this class, you provide a string, then the object save the compressed result (no duplicate words) as the state of the  object. the compressed result will have two arrays:  an array for strings and an array for index.

for example:  assuming the name of your class is Compress

to create an object, you can call like this:

           obj = Compress.new(“i love you but do you love me”)

then there will be two instance variables created inside the object to hold two values:

```ruby
[“i”, “love”, “you”, “but”, “do”, “me”]   # no duplicate word (compressed)

[0, 1, 2, 3, 4, 2, 1, 5]                  # index to the original array to  represent original string
```

you can check these two variables using getter method

## Question 4

one of the method in Hash class is Hash#merge, it will merge two hashes.
it's format is like this:

merge(second_hash) → new hash

merge(second_hash){ | key, val1, val2 | newvalue} → new hash

if no block is given, it merge two hashes, if there is duplicate key, the value of the "other_hash" will be used. if a block is given, the value for the duplicate key is determined by calling the block with the duplicate key, the value in first hash (val1), and the value in second hash (val2)

for example:

``` ruby
h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 254, "c" => 300 }

h1.merge(h2)                        #=> {"a"=>100, "b"=>254, "c"=>300}
h1.merge(h2){|key, val1, val2|      #=> {"a"=>100, "b"=>54,  "c"=>300}
    val2 - val1
}
h1                                  #=> {"a"=>100, "b"=>200}
```

merge!() is the "dangerous" version of merge(), which will change the h1 to be the merged hash.

re-open the class Hash, re-implement these two methods.

## Question 5

REDO!

A template is a HTML file with Ruby code inside. The Ruby code is marked by `<% %>`, or if a line start with `%`, then the whole line is ruby code

For example, the following is an template file:

``` html
<%= simple_form_for @project do |f| %>
    <%= f.input :name %>
    <%= f.input :description %>

    <h3>Tasks</h3>

    <div id='tasks'>

        <%= f.simple_fields_for :tasks do |task| %>

        <%= render 'task_fields', :f => task %>

        <% end %>

        <div class='links'>

        <%= link_to_add_association 'add task', f, :tasks %>

        </div>

    </div>

    <%= f.submit 'Save' %>

<% end %>
```

write a class, the object of this class has a template attribute and an instance method to "filter" its template, so that all ruby code are removed and filtered string is return.

you can define your string using either here document or normal string quotation %{ }

create the object, then filter the template and return the filtered string.

## Question 6

Following is a conversation between ADVISOR and STUDENT in a text file,  each line either starts with ADVISOR or STUDENT or 5 spaces.

 write a program to read this file and print out only the lines by ADVISOR

(including all text between ADVISOR and STUDENT)

<details><summary>dialog.txt</summary>

    ADVISOR: Now, then, Mr., uh, Vickstad. How can I help you?

    STUDENT: Well, I'm thinking about transferring, but I'm, I'm not sure ...I was hoping you could help me make a decision.

    ADVISOR: I'll try. Where are you thinking of transferring to? And why do you want to leave Kryptos U?

    STUDENT: Um...I'm thinking of going to Central University, because it's in my hometown. I've uh, been kind of homesick here this year, and I haven't made many friends...I just feel so lonely. So, I thought that uh, maybe, it'd be better to be closer to my parents and friends and all.

    ADVISOR: I see. And would you keep the same major if you transferred? What is it…business administration?

    STUDENT: Yeah, I would. The credits I've earned here will transfer to Central. I've already checked.

    ADVISOR: May I ask why you chose to come to Kryptos University in the first place?

    STUDENT: Sure. Um, well, the main reason is you have a great business school. And the second reason is that I...I wanted to get away from home.

    ADVISOR: You're right, Mr. Vickstad, we do have an excellent business school. But, so does Central. The thing is, you've got almost a year under your belt here now. At Central, you'll be starting from scratch.

    STUDENT: Yeah, I know that. But I'm a little bit familiar with Central, 'cuz I had older friends who went there, and I visited it before I came here.

    ADVISOR: You know, freshman year is usually the hardest. I remember how homesick I was my first year. I'll tell you, I was ready to pack it in after the first two weeks. But the longer I stayed, the more comfortable I felt. By senior year, I was glad I chose to stay.

    STUDENT: Really? Did it get a lot better your sophomore year?

    ADVISOR: Yes, it did. You might well find the same is true for you. Also, even though your credits here will transfer, you will have to take extra courses, because Central has different requirements. You'll probably have to go to school for an extra year.

    STUDENT: Hmm...I hadn't thought about that. I'll have to check into it. Maybe I should give it one more year. I mean, it's probably good for me to learn to live away from my family and friends, right? It'll make me stronger in the future.

    ADVISOR: You can always move back there after you graduate. Of course, by that time you may not want to!

    STUDENT: Thank you for all your help. I guess I'll find out the exact transfer requirements. You've given me a lot to think about.

    ADVISOR: Don't mention it. If you feel like you want to talk more, don't hesitate to come back and see me.

</details>

## Requirement

1. Define your classes in separate .rb files
1. write a main .rb file to require these .rb files (use require_relative), and write code to create object and call method  and output results.
1. write comment
1. your program should do some data check, for example, in question 1, check if parameter is string. in question 2, if no match, print out “no match is found”.
1. use #!  to make your main .rb program be able to run directly.