# W3Schools.com JS Tutorial

## Table of Contents

<!-- TOC -->

- [W3Schools.com JS Tutorial](#w3schoolscom-js-tutorial)
    - [Table of Contents](#table-of-contents)
    - [Conventions](#conventions)
    - [Object](#object)
        - [Methods](#methods)
    - [String](#string)
        - [Methods](#methods-1)
    - [Numbers](#numbers)
        - [Methods and properties](#methods-and-properties)
    - [Arrays](#arrays)
        - [Methods](#methods-2)
    - [Scope](#scope)
    - [Best practices and Style Guide](#best-practices-and-style-guide)
        - [Best Practices](#best-practices)
        - [Style](#style)
    - [Debug](#debug)
    - [Performance](#performance)

<!-- /TOC -->

## Conventions

1. camelCase

## Object

1. In JS, `obj1 == obj2` will always return `false`, since they are different objects.

### Methods

1. Sorting: provide sorting function `newObj.sort(function)`, refer to [sorting in Array](#arrays)

## String

### Methods

```js
var strA = "ABCDEFGHABCDEFGH";
```

1. Length `strA.length`

1. Find the index of a substring, returns -1 if not found.
    - `strA.indexOf("ABC", arg1)` return the index of FIRST occurrence, starting from `arg1` forward.
    - `strA.lastIndexOf("ABC", arg2)` return the index of LAST occurrence, starting from `arg2` backward.
    - `strA.seartch("ABC")` can take regular expressions.

1. Slicing, omit second parameter will slice forward from first index
    - `strA.slice(start, end)` can accept negative args like (-12, -6), end not included.
    - `strA.substring(start, end)` cannot accept negative args, end not included.
    - `strA.substr(start, length)` f the first parameter is negative, starting index will be counted backward.

1. Extract characters
    - `strA.charAt(position)` return the character, if not found returns an empty string.
    - `strA.charCodeAt(position)` return the UTF-16 code of the character.
    - `strA[position]` ES5(ECMAScript 5) cannot work in IE 7 or earlier, if not found returns undefined, and is READ ONLY as below:

        ```js
        var str = "HELLO WORLD";
        str[0] = "A";             // Gives no error, but does not work
        str[0];                   // returns H
        ```

1. Replacing string content
    - Specific value: `strA.replace("ABC", "DEF")` replaces only the first match, and is case sensitive.
    - Regular expression
    - `strA.toUpperCase()` convert the string to upper case.
    - `strA.toLowerCase()` convert the string to lower case.
    - `strA.concat(" ", "XYZ")` is the same to `strA + " " + "XYZ"`.
    - `strA.trim()` removes whitespace from beginning and end of a string, IE 8 or earlier can be added a `trim()` to `String.prototype` as follows using regular expression:

        ```js
        if (!String.prototype.trim) {
        String.prototype.trim = function () {
            return this.replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, '');
        };
        ```

1. Converting a string to an array
    - `strA.split(",")` split on commas.
    - `strA.split("|")` split on pipe.
    - `strA.split(" ")` split on spaces.
    - `strA.split("")` every character will be split.
    - `strA.split()` the returned array will contain the whole string in index [0].

## Numbers

1. Always 64-bit floating point, 1 sign + 52 mantissa + 11 exponent
    - Integers are accurate up to 15 digits.
    - The maximum number of decimals is 17, but floating point arithmetic is not always accurate, converting to integer to calculate, then convert back.

        ```js
        var x = 0.2 + 0.1;                  // x will be 0.30000000000000004
        var x = (0.2 * 10 + 0.1 * 10) / 10; // x will be 0.3
        ```

1. Addition and concatenation
    - `Num + Str` or `Str + Num` will result in  string concatenation, JS works from left to right:

        ```JS
        var x = 10, y = 20, z = "30";
        var res = x + y + z // result is "3030"
        var res = z + x + y // result is "301020"
        ```

    - JavaScript will try to convert strings to numbers in numeric operations except for `+` :

        ```JS
        var x = "100", y = "10";
        var z = x - y   // z will be 90
        var z = x * y   // z will be 1000.
        var z = x / y   // z will be 10
        var z = x + y   // z will be 10010, workaround: use unary operators to convert x, y to numbers
        var z = (+x) + (+y)   // z will be 110, unary operator

        var x = + "100", y = + "10";    // unary operator, same as above
        var z = x + y   // z will be 110
        ```

### Methods and properties

1. `(123).toString()` returns a number as a string, all data types have a toString() method.

1. `(123).valueOf()` return a number as a number (a number can be a primitive value (typeof = number) or an object (typeof = object)), all data types have a valueOf() method.

1. Specific length and rounded
    - `(123).toExponential(arg)` exponential notation.

        ```js
        var x = 9.656;
        x.toExponential();      // returns 9.656e+0, not rounded
        x.toExponential(2);     // returns 9.66e+0
        x.toExponential(6);     // returns 9.656000e+0
        ```

    - `(123).toFixed(arg)` fixed decimal length.

        ```js
        var x = 9.656;
        x.toFixed();            // returns 10, same to arg = 0
        x.toFixed(2);           // returns 9.66
        x.toFixed(6);           // returns 9.656000
        ```

    - `(123).toPrecision(arg)` specific number length.

        ```js
        var x = 9.656;
        x.toPrecision();        // returns 9.656
        x.toPrecision(2);       // returns 9.7
        x.toPrecision(6);       // returns 9.65600
        ```

1. Converting to numbers
    - `Number(arg)` type conversion, same as Unary `+` operator
    - `parseInt(arg1, arg2)` parse to integer
    - `parseFloat(arg1, arg2)` parse to float

    ```js
    Number("20px");         // NaN
    parseInt("20px");       // 20

    Number("010")           // 10
    parseInt("010")         // 8, implicit octal
    parseInt("010", 10)     // 10

    Number("0xF")           // 15
    parseInt("0xF")         // 15
   
    Number("2e1");          // 20, exponential notation
    parseInt("2e1");        // 2

    Number(new Date("2017-09-30"))      // 1506729600000
    +(new Date("2017-09-30"))           // 1506729600000
    parseInt(new Date("2017-09-30"))    // NaN

    Number(true);           // returns 1
    parseInt(true);         // returns NaN
    ```

1. Properties, can only be accessed from obj wrapper, while from variable like `(6).MAX_VALUE` will return `undefined`.
    - `Number.MAX_VALUE` Returns the largest number possible in JavaScript
    - `Number.MIN_VALUE` Returns the smallest number possible in JavaScript
    - `Number.POSITIVE_INFINITY` Represents infinity (returned on overflow)
    - `Number.NEGATIVE_INFINITY` Represents negative infinity (returned on overflow)
    - `Number.NaN` Represents a "Not-a-Number" value, `var x = 100 / "Apple";`

## Arrays

1. Manipulate
    - Creating an array: `var name = [item1, item2, ...]` and `var name = new Array(item1, item2, ...)` are exactly the same.
    - Accessing and modifying an element: `name[n] = newVal`.

1. Comparing with Python
    - JS array ==> Python list, create by `[item1, item2, ...]`, access and modify through `name[index]`.
    - JS object ==> Python dictionary, create by `{key1:val1, key2:val2, ...}`, access and modify through `name[key]`
    - JS array cannot be accessed by negative index.

1. Properties
    - `arrNew.length`

1. Associative arrays (hashes)
    - JavaScript does not support arrays with named indexes.
    - use named indexed will cause the array be redefined as an object

    ```js
    var person = [];
    person[0] = "John";
    person[1] = "Doe";
    person[2] = 46;
    var x = person.length;          // person.length will return 3
    var y = person[0];              // person[0] will return "John"

    var person = [];
    person["firstName"] = "John";   // used name index cause it redefined as an object
    person["lastName"] = "Doe";
    person["age"] = 46;
    var x = person.length;          // person.length will return 0 (tip: use Object.keys(obj).length getting obj length)
    var y = person[0];              // person[0] will return undefined
    ```

1. Avoid `new Array()`
    - Use `[]` instead, because new keyword only complicates the code. It can also produce some unexpected results.

    ```js
    var points = new Array(40, 100);    // Creates an array with two elements (40 and 100)

    // Remove one of the elements, it creates an array with 40 undefined elements !!!!!
    var points = new Array(40);
    ```

1. Recognize an Array
    - The problem is that the JavaScript operator typeof returns "object"
    - `Array.isArray(arr)` --> true.
    - `arr instanceof Array` --> true, the `instanceof` operator returns true if an object is created by a given constructor.
    - Create `isArray()` function

        ```js
        function isArray(arr) {
        return arr.constructor.toString().indexOf("Array") > -1;
        }
        ```

### Methods

1.  `arrNew.sort()` sorting values as strings, can be use to sort numbers by providing a compare function `arrNew.sort(function(a, b){return a - b});`.
    - If the result is negative a is sorted before b.
    - If the result is positive b is sorted before a.
    - If the result is 0 no changes is done with the sort order of the two values.
    - Randomly: `arrNew.sort(function(a, b){return 0.5 - Math.random()})`

1. Get maximum / minimum
    - Get fringe value after sorting => inefficient
    - `Math.max.apply(null, arrNew)` / `Math.min.apply(null, arrNew)` equvilent to `Math.max(arrNew[0], arrNew[1], ...)`
    - Fastest: home made

        ```js
        function myArrayMax(arr) {
            var len = arr.length
            var max = -Infinity;
            while (len--) {
                if (arr[len] > max) {
                max = arr[len];
                }
            }
            return max;
        }
        ```

1. `arrNew.reverse()`
1. `arrNew.forEach(function)` calls the function once for each element, provide (item, index, arr) params. Also can be used to replace for loops.

    ```js
    <p>Multiply with: <input type="number" id="multiplyWith" value="10">
    <button onclick="numbers.forEach(myFunction)">Try it</button></p>

    <p>Updated array: <span id="demo"></span></p>

    <script>
    var numbers = [65, 44, 12, 4];

    function myFunction(item, index, arr) {
    arr[index] = item * document.getElementById("multiplyWith").value;
    demo.innerHTML = numbers;
    }
    </script>
    ```

    ```js
    // for loops
    var fruits, text, fLen, i;
    fruits = ["Banana", "Orange", "Apple", "Mango"];
    fLen = fruits.length;

    text = "<ul>";
    for (i = 0; i < fLen; i++) {
    text += "<li>" + fruits[i] + "</li>";
    }
    text += "</ul>";

    // .forEach()
    var fruits, text;
    fruits = ["Banana", "Orange", "Apple", "Mango"];

    text = "<ul>";
    fruits.forEach(myFunction(item){
        text += "<li>" + value + "</li>";
    });
    text += "</ul>";
    ```

1. `arrNew.concat(arr2, arr3)` merging arrays.
1. `arrNew.slice(arg1, arg2)` same as `arrNew[arg1:arg2]` in Python, not modify original array.
1. Converting an array to a string
    - `arrNew.toString()` (comma separated) array values, automatically converted when a primitive value is expected.
    - `arrNew.join(arg)` (`arg` separated) array values.
1. Adding
    - `arrNew.push(newItem)` add at the end, returns new length.
    - `arrNew.shift()` add at the beginning, returns new length.
    - `arrNew[arrNew.length] = newItem`, WARNING index higher than length can create undefined "holes".
    - `arrNew.splice(arg1, arg2, newItem1, ...)` add new items at index `arg1` and delete `arg2` number of elements
1. Deleting
    - `arrNew.pop()` remove the last element, returns the element removed.
    - `arrNew.shift()` remove the first element, returns the element removed.
    - `delete arrNew[i]` remove element at the index, WARNING may leave undefined holes.
    - `arrNew.splice(arg1, arg2)` delete `arg2` number of elements at `arg1` position, preferred coz no undefined holes will be created.

1. Iteration
    - `.forEach(function(value, index, arr))` calls a function (a callback function) once for each array element.
    - `.map(function(value, index, arr))` creates a new array by performing a function on each array element.
    - `.filter(function(value, index, arr))` creates a new array with array elements that passes a test.
    - `.reduce(function(total, value, index, arr), init)` runs a function on each element from left to right to produce a single value. `init` is optional, total will initialized with `func(arr[0])` w/o it.

        ```js
        var numbers1 = [45, 4, 9, 16, 25];
        var sum = numbers1.reduce(myFunction, 100);

        function myFunction(total, value) {
        return total + value;
        }
        ```

    - `.reduceRight(function(total, value, index, arr), init)` same as `.reduce`, expect for running from right to left
    - `.every(function(value, index, arr))` check if all array values pass a test, return a boolean.
    - `.some(function(value, index, arr))` check if any array values pass a test, return a boolean.

1. Searching
    - `.indexOf(item, start)` returns the position of the first occurrence, returns -1 if the item is not found.
    - `.lastIndexOf(item, start)` returns the position of the last occurrence, returns -1 if the item is not found.
    - `.find(myFunction(value, index, array))` returns the value of the first array element that passes a test function.
    - `.findIndex(myFunction(value, index, array))` returns the index of the first array element that passes a test function.

## Scope

1. Local scope
    - Variables declared within a JavaScript function.

1. Global scope
    - A variable declared outside a function.
    - Assign a value to an undeclared variable, it will automatically become a GLOBAL variable. To avoid this, use `"strict mode"`
    - WARNING Do NOT create global variables unless you intend to.
    - Global variables declared by `var` belong to the window object, while `let` not:

        ```js
        var car1 = "Volvo";  // code here can use window.car1
        let car2 = "Volvo";  // code here can't use window.car2
        ```

1. Block scope (>= ES6)
    - `let` variables isolated from outside the block {}.
    - `const` like `let`, cannot be re-declared, and must be assigned a value when they are declared.
        - It does NOT define a constant value. It defines a constant reference to a value.
        - If we assign a primitive value to a constant, we cannot change the primitive value.

            ```js
            const PI = 3.141592653589793;
            PI = 3.14;      // This will give an error
            ```

        - Constant objects can be changed, but you can NOT reassign a constant object

            ```js
            const car = {type:"Fiat", model:"500", color:"white"};

            car.color = "red";      // You can change a property:
            car.owner = "Johnson";  // You can add a property:
            ```

    - Variables declared with `var` keyword do not isolated from outside the block.

1. Hoisting
    - JavaScript will move declarations (not assigning) to the top of the scope. Below are the same. WARNING Declare Your Variables At the Top !

        ```js
        x = 5; // Assign 5 to x

        elem = document.getElementById("demo"); // Find an element 
        elem.innerHTML = x;                     // Display x in the element

        var x; // Declare x
        ```

        ```js
        var x; // Declare x
        x = 5; // Assign 5 to x

        elem = document.getElementById("demo"); // Find an element 
        elem.innerHTML = x;                     // Display x in the element
        ```

## Best practices and Style Guide

### Best Practices

    - Avoid Global Variables.
    - Avoid automatic global variable, always declare local variables.
    - Do not rely on hoisting, always declare variables on top, initializing when declaring is also a good practice.
    - Never declare Number, String, or Boolean as objects with `new` methods, treat them as primitive values. Otherwise it slows down execution speed and can have unanticipated effects:

        ```js
        var x = new String("John");
        var y = new String("John");
        (x == y) // is false because you cannot compare objects.
        ```

    - Don't use `new object()`
        - Use `{}` instead of `new Object()`
        - Use `""` instead of `new String()`
        - Use `0` instead of `new Number()`
        - Use `false` instead of `new Boolean()`
        - Use `[]` instead of `new Array()`
        - Use `/()/` instead of `new RegExp()`
        - Use `function() {}` instead of `new Function()`
    - Beware of dynamic type, JavaScript is loosely typed. 
        - A variable can contain different data types, and a variable can change its data type when assigned.
        - Subtracting a string from a string, does not generate an error but returns NaN (Not a Number)
    - Use `===` for comparison, `==` always converts before comparison.

        ```js
        0 == "";        // true
        1 == "1";       // true
        1 == true;      // true

        0 === "";       // false
        1 === "1";      // false
        1 === true;     // false
        ```
    - User params defaults
        - Missing arguments are set to `undefined`.

            ```js
            function myFunction(x, y) {
                if (y === undefined) {
                    y = 0;
                }
            }
            ```

        - ES6 allows default parameters in the function call.
    - End switches with defaults.
    - Determine an object is `undefined` or `null`, just test if an object exists by testing if the type is `undefined`.

        ```js
        if (typeof myObj !== "undefined" && myObj !== null);
        ```

### Style

1. Indentation: 2 spaces.

1. Statements
    - End a simple statement with a semicolon.

        ```js
        var values = ["Volvo", "Saab", "Fiat"];

        var person = {
        firstName: "John"
        };
        ```

    - Do not end a complex statement with a semicolon.

        ```js
        // function
        function toCelsius(fahrenheit) {
        return (5 / 9) * (fahrenheit - 32);
        }

        // loops
        for (i = 0; i < 5; i++) {
        x += i;
        }

        //conditionals
        if (time < 20) {
        greeting = "Good day";
        } else {
        greeting = "Good evening";
        }
        ```

1. Line length < 80.

1. Naming Conventions
    - Variable and function name use camelCase.
    - Global variables and constants use UPPERCASE.

## Debug

1. Display to console: `console.log()`.
1. Breakpoints
    - At each breakpoint, JavaScript will stop executing, and let you examine JavaScript values.
    - The debugger keyword stops the execution of JavaScript, and calls (if available) the debugging function. This has the same function as setting a breakpoint in the debugger.

        ```js
        var x = 15 * 5;
        debugger;
        document.getElementById("demo").innerHTML = x;
        ```

## Performance

1. Reduce activity in loops
    - Statements or assignments that can be placed outside the loop will make the loop run faster.

        ```js
        // bad
        var i;
        for (i = 0; i < arr.length; i++) {

        // better
        var i;
        var l = arr.length;
        for (i = 0; i < l; i++) {
        ```

1. Reduce DOM access
    - It's slow.
    - If you expect to access a DOM element several times, access it once, and use it as a local variable.

    - Delay javaScript loading. If possible, you can add your script to the page by code, after the page has loaded:

        ```html
        <script>
        window.onload = function() {
        var element = document.createElement("script");
        element.src = "myScript.js";
        document.body.appendChild(element);
        };
        </script>
        ```

1. Reduce DOM size

1. Delay JS loading.

    ```html
    <script>
    window.onload = function() {
    var element = document.createElement("script");
    element.src = "myScript.js";
    document.body.appendChild(element);
    };
    </script>
    ```

