# Ruby
## [documentation](https://docs.ruby-lang.org/en/3.2/)
### [Unofficial Ruby Docs](https://rubyapi.org/)
### Arrays: https://docs.ruby-lang.org/en/3.2/Array.html    
![[notes/programming/programming.lang.ruby#^bilbbx]]
### Hashes: https://docs.ruby-lang.org/en/3.2/Hash.html
## resources
(stumbled on this site when I was looking for a resource that explained swapping two items in an array)
> I am a ruby lover,if you too love ruby then this blog is just for you.  
> After searching resources for learning algorithms and data-structures in ruby when i didn't find any good resource.  
> So, I took this initiative to build a platform for learning and discussing Algorithms and data-structures in ruby. This blog aims to be a platform where anyone can learn algorithms and data-structures in ruby. Please contribute on Github and share this platform with all other ruby lovers.

### [Ruby Algorithms](https://rubyalgo.github.io/algorithms/)
## log:
- I went through the set up outlined here: https://www.theodinproject.com/lessons/ruby-installing-ruby#additional-resources and I already had Ruby 3.2.2 installed as well as rbenv
- 
## notes:
### drawer
- We'll talk in more depth about `return` as we move on, but remember that _Ruby expressions always return a value_, even if that value is `nil` or an error.
- ![[notes/programming/programming.lang.ruby#^g0qoxc]]
### [puts vs return](https://launchschool.com/books/ruby/read/basics#putsvsreturn)    
It's common for new Ruby programmers with little experience to become confused with the difference between `puts` and `return`. The confusion arises from a misunderstanding of what both `puts` and `return` are. When we call the `puts` method, we're telling Ruby to print something to the screen. However, `puts` does not return what is printed to the screen. Expressions **do** something, but they also **return** something. The value returned is not necessarily the action that was performed. Let's take a look in irb.

```irb
irb :001 > puts 'stuff'
stuff
=> nil
```

You can see that the word `stuff` was printed to the console and then a `nil`, which is Ruby's way of saying 'nothing', was returned. It's important to understand that distinction. For example:

```ruby
a = puts "stuff"
puts a
```

What should we expect? `a` is assigned to the value returned by `puts "stuff"`, which is `nil`. Therefore, `puts a` is the same as `puts nil`, which prints out an empty string. We are going to go much farther into `puts` and `return` later when we talk about methods, but we had to show you `puts` because we are going to be using it in future examples.
### [objects]([[notes/programming/programming.lang.ruby#🌐 https codelikethis com lessons learn-to-code objects objects|objects]])    
#### Messages and Operators 
An object responds to MESSAGES. You send it messages using OPERATORS.

The most powerful operator is DOT.

On screen she looks like this...
```
.
```
#### Dot's job 
Dot can send any message she likes, by name, to any object.
```
"apple".upcase
```
The `upcase` message turns `"apple"` into `"APPLE"`.
#### Return Values 
Every time an object receives a message, it returns a response.

The response is also called the VALUE or the RETURN VALUE.

You can think of it as the answer to a question.
```
2 + 2    # Question: What is 2 + 2?
4        # Answer: 4

"apple".upcase  
# Q: What is the upcase of the string "apple"?

"APPLE"         
# A: the string "APPLE"
```
### irb    
`irb` can only run 1 command per line unless you use `;` between lines, then you can run multiple lines at ones. see: [[notes/programming/programming.lang.ruby#print vs puts|print vs puts]]

### variables    
#### naming variables 
![[notes/programming/programming.lang.ruby#^h1ihru]]
![[notes/programming/programming.lang.ruby#^1k1hwv]]
`can_swim = false`

Variables are references. They point to a particular slice of memory in your code. This may result in unexpected/unintuitive behavior.

remember that you should not use `$global_variables`. Additionally, `@@class_variables` are rarely needed and easily misused.
### blocks    
![[notes/programming/programming.lang.ruby#^2df960]]

![[notes/programming/programming.lang.ruby#^stnuvk]]


### logic/operators    
> _Note: When you are combining expressions as we are above, it is helpful to use parentheses to group expressions together. This is helpful for readability and also helps the computer more accurately understand your intention. The computer will evaluate parentheses in normal algebraic order._ ([source](https://arc.net/l/quote/cbopsjhk))

![[notes/programming/programming.lang.ruby#^bbd16q]]

![[notes/programming/programming.lang.ruby#^sybflb]]

![[notes/programming/programming.lang.ruby#^aak7q6]]

![[notes/programming/programming.lang.ruby#^4213hv]]

![[notes/programming/programming.lang.ruby#^tspsyp]]

![[notes/programming/programming.lang.ruby#^8gvh1p]]

![[notes/programming/programming.lang.ruby#^s0ixld]]

![[notes/programming/programming.lang.ruby#Ternary operator https www theodinproject com lessons ruby-conditional-logic ternary-operator]]

![[notes/programming/programming.lang.ruby#Case statements https www theodinproject com lessons ruby-conditional-logic case-statements]]

### loops    
![[notes/programming/programming.lang.ruby#^awl7bj]]
### arrays    
![[notes/programming/programming.lang.ruby#^xwwvex]]
### hashes    
![[notes/programming/programming.lang.ruby#^gv11h3]]![[notes/programming/programming.lang.ruby#^je8rz3]]
![[notes/programming/programming.lang.ruby#^fkafmi]]

![[notes/programming/programming.lang.ruby#^pk4xrj]]

### nested collections (arrays, hashes, etc)  
![[notes/programming/programming.lang.ruby#^y71655]]
### methods    
![[notes/programming/programming.lang.ruby#^2qa9jg]]

![[notes/programming/programming.lang.ruby#^j3zqfr]]
#### 💾 `#dig` 
The `dig` method in Ruby is a convenient way to access nested elements of nested objects, such as hashes and arrays, without raising an error if any intermediate element is `nil`. It was introduced in Ruby 2.3 as part of the `Hash` and `Array` classes.

Here's how `dig` works:
1. **For Hashes**: 
    - You can use `dig` to access nested values in a hash by providing a sequence of keys.
    - If any intermediate key in the sequence doesn't exist or the value associated with it is `nil`, `dig` will return `nil` instead of raising an error.
- Example:
```ruby
hash = { user: { name: "John", age: 30 } } 
puts hash.dig(:user, :name) # Outputs: "John"
puts hash.dig(:user, :address, :city)  # Outputs: nil (because :address doesn't exist)
```
2. **For Arrays**: 
    - You can also use `dig` to access nested elements in an array by providing a sequence of indices.
    - If any intermediate index in the sequence doesn't exist or the element at that index is `nil`, `dig` will return `nil` instead of raising an error.
- Example:
```ruby
array = [[1, 2, 3], [4, 5, 6]] puts array.dig(1, 1)  # Outputs: 5 
puts array.dig(1, 3)  # Outputs: nil (because index 3 doesn't exist)
``` 
3. **Chaining**: 
    - You can chain multiple `dig` calls together to access deeply nested elements in hashes or arrays.
- Example:
```ruby
hash = { user: { address: { city: "New York" } } }
puts hash.dig(:user, :address, :city)  # Outputs: "New York"
```
4. **Default Value**: 
    - You can provide a default value as a second argument to `dig`, which will be returned if the sequence of keys or indices is not found.
- Example:
```ruby
hash = { user: { name: "John", age: 30 } }
puts hash.dig(:user, :address, :city, default: "Unknown")  # Outputs: "Unknown"
```

In summary, the `dig` method provides a safe way to navigate through nested data structures in Ruby, especially when you're not sure if all intermediate elements exist or contain non-nil values.

![[notes/programming/programming.lang.ruby#dig method]]
### enumerable methods    
![[notes/programming/programming.lang.ruby#Enumerable Iterators Cheat Sheet https www eriktrautman com posts ruby-explained-map-select-and-other-enumerable-methods]]

### Making your own Classes Enumerable   
![[notes/programming/programming.lang.ruby#Making Your Own Classes Enumerable]]
### map vs each    
![[notes/programming/programming.lang.ruby#^d2zbfc]]

### debugging    
#### pry 
![[notes/programming/programming.lang.ruby#^yxjzwm]]
![[notes/programming/programming.lang.ruby#^0ts10l]]
#### `any?` 
![[notes/programming/programming.lang.ruby#^74u0aa]]
## glossary
### [🌐](https://launchschool.com/books/ruby/read/basics) literals    
A **literal** is any notation that lets you represent a fixed value in source code. For instance, all of the following are literals in Ruby:
```ruby
'Hello, world!'          # string literal
375                      # integer literal
3.141528                 # float literal
true                     # boolean literal
{ 'a' => 1, 'b' => 2 }   # hash literal
[ 1, 2, 3 ]              # array literal
:sym                     # symbol literal
nil                      # nil literal
```
### [🌐](https://launchschool.com/books/ruby/read/basics) strings    
A **string** is a list of characters in a specific sequence. In programming, we often have to work with text data like names, messages, and descriptions. Ruby uses strings to represent such data. You write string **literals** with either single quotes (`'hi there'`) or double quotes (`"hi there"`) on either side of the text; note that the quotes are syntactic components, not part of the value. Both single and double quote formats create a string. However, [[notes/programming/programming.lang.ruby#Double and single quotation marks|there are some subtle differences]].
### [🌐](https://launchschool.com/books/ruby/read/basics) symbols
Basically, a symbol is used when you want to reference something like a string but don't ever intend to print it to the screen or change it. It is often referred to as an immutable (i.e. unchangeable) string. While not 100% technically correct, it is a useful mnemonic device for now.

Ruby **symbols** are created by placing a colon (`:`) before a word.
```ruby
# Examples of symbols
:name
:a_symbol
:"surprisingly, this is also a symbol"
```
### [🌐](https://launchschool.com/books/ruby/read/basics) nil
In programming, we need a way to express "nothing", and in Ruby, we do this through something called `nil`. A variable with a value of `nil` could be described as having 'nothing' or being 'completely empty', or even just simply 'not any specific type'. A situation where this may occur is where output is expected but none is returned, such as:
```irb
irb :001 > puts "Hello, World!"
Hello, World!
=> nil
```

The `puts` method prints out a string and returns nothing, so we see `nil` being returned after the string is displayed:
```irb
irb :001 > puts "Hello, World!"
Hello, World!
=> nil
```

### [🌐](https://codelikethis.com/lessons/learn-to-code/objects) objects

### [🌐](https://launchschool.com/books/ruby/read/variables#whatisavariable) variables    
**Variables** are used to store information to be referenced and manipulated in a computer program. They also provide a way of labeling data with a descriptive name, so our programs can be understood more clearly by the reader and ourselves. It is helpful to think of variables as containers that hold information. Their sole purpose is to label and store data in memory. This data can then be used throughout your program.
### [🌐](https://launchschool.com/books/ruby/read/variables#variablescopeblocks) blocks    
A block is a piece of code that follows a method's invocation, delimited by either curly braces `{}` or `do/end`:

```ruby
total = 0
[1, 2, 3].each { |number| total += number }
puts total # 6
```

```ruby
total = 0
[1, 2, 3].each do |number| 
  total += number
end
puts total # 6
```

More [[notes/programming/programming.lang.ruby#Variable Scope and Blocks https launchschool com books ruby read variables variablescopeblocks|->]]
### 💾 procs    
Procs are objects that encapsulate blocks of code. They are similar to anonymous functions or closures in other languages. Procs can be passed around as arguments to methods, stored in variables, and executed at a later time. They provide a way to create reusable blocks of code that can be used in different contexts.
### 💾 lambdas    
Lambdas enforce strict argument checking and have different return semantics compared to Procs. They are more akin to anonymous functions with a specific signature. Lambdas are often used in functional programming contexts or when you need strict argument checking.
### [🌐](https://launchschool.com/books/ruby/read/hashes) hashes    
A **hash** is a data structure that stores items by associated keys. This is contrasted against arrays, which store items by an ordered index. Entries in a hash are often referred to as key-value pairs. This creates an associative representation of data.

Most commonly, a hash is created using symbols as _keys_ and any data types as _values_. All key-value pairs in a hash are surrounded by curly braces `{}` and comma separated.
### 💾 🌐 methods    
[There are four things that constitute a method](https://arc.net/l/quote/dtyemywz):
- a name
- a block of code
- (optionally) accepting input
- returning output

> [!ChatGPT]
> Imagine you have a toy robot. This robot can do different things, like walk, talk, and dance. In Ruby, we can think of the toy robot as an object, and each action it can perform as a method.
> 
> So, a method in Ruby is like a special button on the robot that you can press to make it do something. When you press the "walk" button, the robot starts walking. When you press the "talk" button, the robot starts talking. Each button (method) has its own special action that it triggers.
> 
> Methods help us organize and control what our objects (like the toy robot) can do. They allow us to give our objects specific abilities and behaviors, making our programs more flexible and powerful.

### 💾 namespace    
> a namespace is a way to organize code and prevent naming conflicts between different parts of a program. It is essentially a container that holds a set of constants, classes, and modules, providing a hierarchical structure for organizing code.

> Namespaces help developers avoid naming collisions by allowing them to define classes, modules, and other constructs within a specific context. This means that you can have multiple definitions of the same class or module name as long as they are defined within different namespaces.

> For example, consider the following Ruby code:
```ruby
module Math 
  class Calculator 
    def add(a, b) 
      a + b
    end
  end
end

module Physics 
  class Calculator 
    def calculate_force(mass, acceleration) 
      mass * acceleration
    end
  end
end
```

> In this code, `Math::Calculator` and `Physics::Calculator` are examples of namespaces. Each namespace provides a context in which classes and methods can be defined without conflicting with identically named classes and methods in other namespaces.

> To refer to a constant, class, or module within a namespace, you can use the double colon `::` operator to specify the namespace path. For example:
```ruby
puts Math::Calculator.new.add(2, 3) # Output: 5
puts Physics::Calculator.new.calculate_force(10, 2) # Output: 20
```

> This allows you to use classes and modules defined within different namespaces without ambiguity or conflicts.

### 💾 class    
A class is a blueprint or template for creating objects. It defines the properties (attributes) and behaviors (methods) that all objects of that type will have.

Class methods are defined at the class level and are associated with the class itself, rather than with instances of the class.

Class methods are used to perform operations that are related to the class as a whole, such as creating instances of the class, querying class-level data, or performing class-level operations.

Example:
```ruby
class MyClass 
  def self.class_method 
    puts "This is a class method"
  end
end

MyClass.class_method  # Output: This is a class method
```

#### [[notes/programming/programming.lang.ruby#Example Instance Methods vs Class Methods|Example Instance Methods vs Class Methods]] 
![[notes/programming/programming.lang.ruby#Example Instance Methods vs Class Methods]]


### 💾 instance    
An instance is a specific object created from a class. It represents a unique occurrence of that class and has its own set of attributes and behaviors.

Instance methods are defined within the class and are associated with individual instances of the class.

Instance methods operate on specific instances of the class and have access to the instance's data through the `self` keyword.

Instance methods are used to perform operations that are specific to individual instances of the class, such as modifying instance variables or interacting with other objects.

Example:
```ruby
class MyClass 
  def instance_method 
    puts "This is an instance method"
  end
end

obj = MyClass.new
obj.instance_method  # Output: This is an instance method
```

#### [[notes/programming/programming.lang.ruby#Example Instance Methods vs Class Methods|Example Instance Methods vs Class Methods]] 
![[notes/programming/programming.lang.ruby#Example Instance Methods vs Class Methods]]


An OBJECT is a location in computer memory where you can store DATA (aka VALUES).

There are many kinds of objects, including String, Number, Array, Hash, Time, ...

(The different kinds of objects are called CLASSES or TYPES. Some day soon you will create your own classes but for now, we will use the built-in ones.)


### 💾 attr_accessor   
In Ruby, `attr_accessor` is a Ruby method that defines both a getter and a setter method for an instance variable of a class. It's a convenient way to create simple read and write access to instance variables.

Here's a breakdown of what `attr_accessor` does:
1. **Getter Method**: 
    - `attr_accessor` creates a method that allows you to retrieve the current value of an instance variable from outside the class.
    - For example, if you have an instance variable `@name`, `attr_accessor :name` creates a method called `name` that returns the value of `@name`.
2. **Setter Method**: 
    - `attr_accessor` also creates a method that allows you to set the value of an instance variable from outside the class.
    - For example, if you have an instance variable `@name`, `attr_accessor :name` creates a method called `name=` that allows you to assign a new value to `@name`.

Here's how you would use `attr_accessor` in a class definition:
```ruby
class MyClass   attr_accessor :name end
```

After using `attr_accessor :name`, instances of `MyClass` will have both a `name` method to retrieve the value of `@name` and a `name=` method to set the value of `@name`. For example:
```ruby
obj = MyClass.new obj.name = "John"   # Sets the value of @name to "John" puts obj.name       # Outputs "John", retrieving the value of @name
```

In summary, `attr_accessor` provides a simple way to define getter and setter methods for instance variables in Ruby classes, reducing the need for boilerplate code.
## how to/syntax:
Mostly from [the odin project](https://www.theodinproject.com/lessons/ruby-basic-data-types).
### [Numbers](https://www.theodinproject.com/lessons/ruby-basic-data-types#numbers)

You probably already know what numbers are, so there’s no need to go into elaborate metaphors here. Ruby has all the typical math operators you would expect:
```ruby
# Addition
1 + 1   #=> 2

# Subtraction
2 - 1   #=> 1

# Multiplication
2 * 2   #=> 4

# Division
10 / 5  #=> 2

# Exponent
2 ** 2  #=> 4
3 ** 4  #=> 81

# Modulus (find the remainder of division)
8 % 2   #=> 0  (8 / 2 = 4; no remainder)
10 % 4  #=> 2  (10 / 4 = 2 with a remainder of 2)
```

#### Integers and floats 

There are two main types of numbers in Ruby. **Integers** are whole numbers, such as 10. **Floats** are numbers that contain a decimal point, such as 10.5, 10.0, or 0.25.

It’s important to keep in mind that when doing arithmetic with two integers in Ruby, _the result will always be an integer_.
```ruby
17 / 5    #=> 3, not 3.4
```

To obtain an accurate answer, just replace one of the integers in the expression with a float.
```ruby
17 / 5.0  #=> 3.4
```

#### Converting number types 

Ruby makes it very easy to convert floats to integers and vice versa.
```ruby
# To convert an integer to a float:
13.to_f   #=> 13.0

# To convert a float to an integer:
13.0.to_i #=> 13
13.9.to_i #=> 13
```

As shown in the last example above, when Ruby converts a float to an integer, the decimal places are cut off. Ruby doesn’t do any rounding in this conversion.

#### Some useful number methods 

There are many useful methods for numbers built into Ruby. For example,

**#even?**
```ruby
6.even? #=> true
7.even? #=> false
```

**#odd?**
```ruby
6.odd? #=> false
7.odd? #=> true
```

### [Strings](https://www.theodinproject.com/lessons/ruby-basic-data-types#strings)    

Strings, strings, wonderful things, use them well and…your app will…grow wings? Or something.

At first glance, you might think that strings are just a bunch of characters that aren’t very useful beyond getting user input and outputting some information to the screen, but like Burt Reynolds passing up the chance to play Han Solo, you’d be wrong. Very wrong. What were you thinking, Burt?

#### Double and single quotation marks 

Strings can be formed with either double `""` or single`''` quotation marks, also known as _string literals_. They are pretty similar, but there are some differences. Specifically, string interpolation and the escape characters that we’ll discuss soon both only work inside double quotation marks, not single quotation marks.

[Double quotes allow something called **string interpolation**.](https://arc.net/l/quote/qedjkhlz)

#### Concatenation 
In true Ruby style, there are plenty of ways to concatenate strings.
```ruby

# With the plus operator:
"Welcome " + "to " + "Odin!"    #=> "Welcome to Odin!"

# With the shovel operator:
"Welcome " << "to " << "Odin!"  #=> "Welcome to Odin!"

# With the concat method:
"Welcome ".concat("to ").concat("Odin!")  #=> "Welcome to Odin!"
```
Classic Ruby!

#### Substrings 
##### [🌐 more on substrings](https://www.delftstack.com/howto/ruby/substring-in-ruby/#the-ruby-include-method)
You can access strings inside strings. Stringception! It’s super easy, too.
```ruby

"hello"[0]      #=> "h"

"hello"[0..1]   #=> "he"

"hello"[0, 4]   #=> "hell"

"hello"[-1]     #=> "o"

```

In the above example we can access the individual characters of a string by referencing the index(es) of the character within the string using `[]`. For more information on the topic you can read the [method documentation](https://docs.ruby-lang.org/en/3.2/String.html#class-String-label-String+Slices).
#### Escape characters 
Escape characters allow you to type in representations of whitespace characters and to include quotation marks inside your string without accidentally ending it. As a reminder, escape characters only work inside double quotation marks.
```ruby

\\  #=> Need a backslash in your string?
\b  #=> Backspace
\r  #=> Carriage return, for those of you that love typewriters
\n  #=> Newline. You'll likely use this one the most.
\s  #=> Space
\t  #=> Tab
\"  #=> Double quotation mark
\'  #=> Single quotation mark
```

The best thing to do is play around with them in irb or a REPL.
```ruby
irb(main):001:0> puts "Hello \n\nHello"
Hello

Hello
=> nil
```

#### Interpolation 
String interpolation allows you to evaluate a string that contains placeholder variables. This is a very useful and common technique, so you will likely find yourself using this often. Be sure to use double quotes so that string interpolation will work!
```ruby
name = "Odin"

puts "Hello, #{name}" #=> "Hello, Odin"
puts 'Hello, #{name}' #=> "Hello, #{name}"
```

#### Common string methods
##### [🌐 Working With Strings In Ruby – All the Important Methods You Need to Know](https://dev.to/heyjoshlee/working-with-string-in-ruby-all-the-important-methods-you-need-to-know-1h71)

There are many useful string methods that are built into Ruby. You need to capitalize a word? No problem! Reverse a string? Easy peasy. Extract the binary subatomic algorithm from any regex grep? We don’t know, but since this is Ruby, let’s go with _YES_.

Just remember, strings have loads of methods provided to you for free, and you can find them all in the [Ruby docs](https://docs.ruby-lang.org/en/3.2/String.html). If you’re working with strings and need to do something, check the Ruby docs first and see if there’s a method that does it for you.

Below is a quick recap of the more common string methods you might find yourself using:

**#capitalize**
```ruby
"hello".capitalize #=> "Hello"
```

**#include?**
```ruby
"hello".include?("lo")  #=> true

"hello".include?("z")   #=> false
```

**#upcase**
```ruby
"hello".upcase  #=> "HELLO"
```

**#downcase**
```ruby
"Hello".downcase  #=> "hello"
```

**#empty?**
```ruby
"hello".empty?  #=> false

"".empty?       #=> true
```

**#length**
```ruby
"hello".length  #=> 5
```

**#reverse**
```ruby
"hello".reverse  #=> "olleh"
```

**#split** (string into array)
```ruby
"hello world".split  #=> ["hello", "world"]

"hello".split("")    #=> ["h", "e", "l", "l", "o"]
```

**#strip**
```ruby
" hello, world   ".strip  #=> "hello, world"
```

You’ll read more about these methods and others in the assignment. The examples below are just to get your creative juices flowing with some of the awesome ways you can modify strings.

```ruby
"he77o".sub("7", "l")           #=> "hel7o"

"he77o".gsub("7", "l")          #=> "hello"

"hello".insert(-1, " dude")     #=> "hello dude"

"hello world".delete("l")       #=> "heo word"

"!".prepend("hello, ", "world") #=> "hello, world!"
```

The assignments will go much deeper, so go through them thoroughly and be sure to play around in a REPL as you read.

#### Converting other objects to strings 

Using the `to_s` method, you can convert pretty much anything to a string. Here are some examples:
```ruby
5.to_s        #=> "5"

nil.to_s      #=> ""

:symbol.to_s  #=> "symbol"
```


### [Symbols](https://www.theodinproject.com/lessons/ruby-basic-data-types#symbols)    

Symbols are an interesting twist on the idea of a string. The full explanation can be a bit long, but here’s the short version:

Strings can be changed, so every time a string is used, Ruby has to store it in memory even if an existing string with the same value already exists. Symbols, on the other hand, are stored in memory only once, making them faster in certain situations.

One common application where symbols are preferred over strings are the keys in hashes. We’ll cover this in detail in the hashes lesson later in the course.

You won’t need to use symbols much in the beginning, but it’s good to get familiar with what they are and what they look like so that you can recognize them.

#### Create a symbol 

To create a symbol, put a colon at the beginning of some text:
```ruby
:my_symbol
```

#### Symbols vs. strings 

To get a better idea of how symbols are stored in memory, give this a whirl in irb or a REPL. The [`#object_id` method](https://docs.ruby-lang.org/en/3.2/Object.html#method-i-object_id) returns an integer identifier for an object. (And remember: in Ruby, _everything_ is an object!)

```ruby
"string" == "string"  #=> true

"string".object_id == "string".object_id  #=> false

:symbol.object_id == :symbol.object_id    #=> true
```

### [Booleans](https://www.theodinproject.com/lessons/ruby-basic-data-types#booleans)    

You will learn about these data types in more detail in the Conditional Logic lesson later in this course. The goal of this lesson is for you to get a basic understanding of what Booleans are.

#### True and false 

The Boolean values `true` and `false` represent exactly what you think they do: `true` represents something that is true, and `false` represents something that is false.

#### Nil 

In Ruby, `nil` represents “nothing”. Everything in Ruby has a return value. When a piece of code doesn’t have anything to return, it will return `nil`. This is pretty abstract, but it will make more sense as you learn and use Ruby more.

### [Variables](https://www.theodinproject.com/lessons/ruby-variables)     
#### [Declaring a variable](https://www.theodinproject.com/lessons/ruby-variables#declaring-a-variable)    

This is how to create a variable in Ruby:
```ruby
age = 18 #=> 18
```

You can also assign the result of an expression to a variable.
```ruby
age = 18 + 5 #=> 23
```

Variable names are reusable, so you can assign a new value to a variable at any point in your program. Naturally, doing so will override the original value.
```ruby
age = 18
age #=> 18
age = 33
age #=> 33
```

There will often be scenarios where you want to perform an operation on the original value of a variable and then reassign the result of that operation to the same variable.
```ruby
age = 18
age #=> 18
age = age + 4
age #=> 22
```

Because this is a common scenario, Ruby provides a nice shorthand assignment operator for doing this: `+=`.
```ruby
age = 18
age += 4 #=> 22
```

There are similar assignment operators for all the common math operators:
```ruby
age = 18
age -= 2  #=> 16

cash = 10
cash *= 2 #=> 20

temperature = 40
temperature /= 10 #=> 4
```

#### How to name variables     
Ruby is a language that aims to be natural to read and easy to write. Remember this when you’re naming your variables. The name should, as clearly as possible, describe what the value of the variable represents.

Naming variables clearly will pay dividends when you review your code months after you’ve written it, when you can no longer remember what that variable was designed to store. From now on, when naming your variables, remember the following quote by John Woods:

> Always code as if the person who ends up maintaining your code will be a violent psychopath who knows where you live.

^h1ihru

The most basic thing you can do to write clean, maintainable code is to name your variables properly. So get into this habit early to avoid psychopath programmers coming after you.

Variable names should always be lowercase, and multiple words that make up a variable name should be split by an underscore. This is known as **snake_case**. ^1k1hwv

```ruby
# bad
a = 19
string = "John"

# good
age = 19
name = "John"
can_swim = false
```

#### Variables are references    

The information you name with a variable is stored in memory on your computer, so a variable is effectively a reference or a pointer to that address in memory. This is important to know as it can sometimes be the cause of unexpected behavior from your code.

Let’s look at an example of this unexpected behavior, with two variables: `desired_location`, which is assigned to the string “Barcelona”, and `johns_location`, which is assigned to the `desired_location` variable. Both variables are pointing to where “Barcelona” is stored in memory.
```ruby
desired_location = "Barcelona"
johns_location = desired_location

desired_location  #=> "Barcelona"
johns_location    #=> "Barcelona"
```

Unexpected behavior happens if the string “Barcelona” that is stored in memory is modified. One way to modify a string is to use the `upcase!` method, instead of the safe `upcase` method. If the string is modified using `johns_location.upcase!` then `desired_location` will also reflect that change:
```ruby
johns_location.upcase!  #=> "BARCELONA"

desired_location        #=> "BARCELONA"
johns_location          #=> "BARCELONA"
```

This example may be hard to completely understand at this point in the lesson. The important concept is that assigning variables to other variables can have unintended side effects. Just because you can do it, doesn’t mean you should. You will have the opportunity to revisit this example in one of the following assignments.
#### [🌐](https://launchschool.com/books/ruby/read/variables#typesofvariables) Types of Variables    
Before we move on, you should be aware that there are five types of variables:
- [[notes/programming/programming.lang.ruby#^tqmjtr|constants]]
- [[notes/programming/programming.lang.ruby#^mufotf|global variables]]
- [[notes/programming/programming.lang.ruby#^84ndlt|class variables]]
- [[notes/programming/programming.lang.ruby#^w6razp|instance variables]]
- local variables
While you should not worry too much about these topics in depth yet, here is a brief description of each.

Constants are declared by capitalizing every letter in the variable's name, per Ruby convention. They are used for storing data that never needs to change. While most programming languages do not allow you to change the value assigned to a constant, Ruby does. It will however throw a warning letting you know that there was a previous definition for that variable. Just because you can, doesn't mean you should change the value. In fact, you should not. Constants cannot be declared in method definitions, and are available throughout your application's scopes. ^tqmjtr

Example of a constant declaration:
```ruby
MY_CONSTANT = 'I am available throughout your app.'
```

Global variables are declared by starting the variable name with the dollar sign (`$`). These variables are available throughout your entire app, overriding all scope boundaries. Rubyists tend to stay away from global variables as there can be unexpected complications when using them. ^mufotf

Example of a global variable declaration:
```ruby
$var = 'I am also available throughout your app.'
```

Class variables are declared by starting the variable name with two `@` signs. These variables are accessible by instances of your class, as well as the class itself. When you need to declare a variable that is related to a class, but each instance of that class does not need its own value for this variable, you use a class variable. Class variables must be initialized at the class level, outside of any method definitions. They can then be altered using class or instance method definitions. ^84ndlt

Example of a class variable declaration:
```ruby
@@instances = 0
```

Instance variables are declared by starting the variable name with one `@` sign. These variables are available throughout the current instance of the parent class. Instance variables can cross some scope boundaries, but not all of them. You will learn more about this when you get to OOP topics, and should not use instance variables until you know more about them. ^w6razp

Example of an instance variable declaration:
```ruby
@var = 'I am available throughout the current instance of this class.'
```

Local variables are the most common variables you will come across and obey all scope boundaries. These variables are declared by starting the variable name with neither `$` nor `@`, as well as not capitalizing the entire variable name.

Example of a local variable declaration:
```ruby
var = 'I must be passed around to cross scope boundaries.'
```
### [Scope](https://launchschool.com/books/ruby/read/variables#variablescope)     
In Ruby, variable scope is defined by a **method definition** or by a **block**. They have different behaviors when it comes to variable scope.

#### [Variable Scope and Method Definitions](https://launchschool.com/books/ruby/read/variables#variablescopemethods)    

We'll learn about methods in the next chapter. For now, you can think of methods as pieces of reusable code that your program can execute many times during its run. Method definitions look like this:
```ruby
name = 'Somebody Else'

def print_full_name(first_name, last_name) 
  name = first_name + ' ' + last_name
  puts name
end
```

Once we have the method defined, we can call it as many times as we need with different values for `first_name` and `last_name`:
```ruby
print_full_name 'Peter', 'Henry'   # prints Peter Henry
print_full_name 'Lynn', 'Blake'    # prints Lynn Blake
print_full_name 'Kim', 'Johansson' # prints Kim Johansson
puts name                          # prints Somebody Else
```

In terms of variable scope, methods have self-contained scope. That means that only variables initialized within the method's body can be referenced or modified from within the method's body. Additionally, variables initialized inside a method's body aren't available outside the method's body. It's a bit like an impenetrable bubble. Thus, in the above code, we can't use or change the `name` variable from line 1 from inside the `print_full_name` method. We can, however, create and use a _different_ `name` variable that is locally scoped to the method. That is why lines 4 and 5 work without changing the value of `name` from line 1.

#### [Variable Scope and Blocks](https://launchschool.com/books/ruby/read/variables#variablescopeblocks)     

A block is a piece of code that follows a method's invocation, delimited by either curly braces `{}` or `do/end`:
```ruby
total = 0
[1, 2, 3].each { |number| total += number }
puts total # 6
```

```ruby
total = 0
[1, 2, 3].each do |number| 
  total += number
end
puts total # 6
```

In the examples above, `{ |number| ... }` is a block, as is `do |number| ... end`. Though they look different, the behavior is identical. In both cases, the code can access and modify variables that are defined outside of the block. Thus, both blocks can access and modify `total`. However, any variables initialized inside the block (such as `number`) can't be accessed by the outer code.

With blocks, the one rule that we want to emphasize is that: **Inner scope can access variables initialized in an outer scope, but not vice versa.** ^2df960

Looking at some code will make this clearer. Let's say we have a file called `scope.rb`.
```ruby
# scope.rb

a = 5             # variable is initialized in the outer scope

3.times do |n|    # method invocation with a block 
  a = 3           # is a accessible here, in an inner scope?
end

puts a
```

What is the value of `a` when it is printed to the screen? Try it out.

The value of `a` is 3. This is because `a` is available to the inner scope created by `3.times do ... end`, which allowed the code to re-assign the value of `a`. In fact, it re-assigned it three times to 3.

> [!NOTE]
> Note that blocks can also be written with curly braces, though common practice is to only use them for one-liners: the method call and the block must fit on the same line. For instance, here's the `times` loop from above rewritten using braces:
> ```ruby
3.times { |n| a = 3 }
> ```
> Curly brace blocks are identical to `do...end` blocks in terms of scope.

Let's try something else. We'll modify the original `scope.rb` code:
```ruby
# scope.rb

a = 5

3.times do |n|    # method invocation with a block 
  a = 3
  b = 5           # b is initialized in the inner scope
end

puts a
puts b            # is b accessible here, in the outer scope?
```

What result did you get when running that program? You should have gotten an error to the tune of:
```irb
scope.rb:11:in `<main>': undefined local variable or method `b' for main:Object
(NameError)
```

This is because the variable `b` is not available outside of the method invocation with a block where it is initialized. When we call `puts b` it is not available within that outer scope.

> [!NOTE]
> Be aware that not all `do...end` pairs imply a block. We will explore this in much greater detail in later courses. In particular, a `do...end` on a `for` or `while` loop is not a block.
> 
> Put another way, the key distinguishing factor for deciding whether code delimited by `{}` or `do/end` is considered a block (and thereby creates a new scope for variables), is seeing if the `{}` or `do/end` immediately follows a method invocation. For example:
> ```ruby
arr = [1, 2, 3]
for i in arr do 
  a = 5      # a is initialized here
end
puts a       # is it accessible here?
> ```
> The answer is yes. The reason is because the `for...do/end` code did **not** create a new inner scope, since `for` is part of Ruby language and not a method invocation. When we use `each`, `times` and other method invocations, followed by `{}` or `do/end`, that's when a new block is created.

### [logic](https://www.theodinproject.com/lessons/ruby-conditional-logic)    
#### Truthy and falsy in Ruby 
You already know that conditional statements check expressions for a true or false value, so it follows that you need to understand what Ruby considers to be true or false. In typical Ruby fashion, it’s very simple. The only false values in Ruby are the values `nil` and `false` themselves. That’s it! Everything else is considered true. Even the string `"false"` is true in conditional expressions! If you have experience with other programming languages, you might be familiar with the number 0 or an empty string (“”) being equivalent to false. This isn’t the case with Ruby, so be careful when writing those expressions, or you’ll have more bugs than a decomposing body.
#### [Basic conditional statement](https://www.theodinproject.com/lessons/ruby-conditional-logic#basic-conditional-statement) 

The simplest way to control the flow of your code using conditionals is with the `if` statement.

The general syntax of an `if` statement is shown here:
```ruby
if statement_to_be_evaluated == true 
  # do something awesome...
end

if 1 < 2 
  puts "Hot diggity, 1 is less than 2!"
end
#=> Hot diggity, 1 is less than 2!
```

If there is only one line of code to be evaluated inside the block, then you can rewrite the code to be more succinct and take up only one line:
```ruby
puts "Hot diggity damn, 1 is less than 2" if 1 < 2
```

You don’t even need the `end` statement. Nice and concise!

The statement to be evaluated can be anything that returns true or false. It could be a mathematical expression, a variable value, or a call to a method. Only if the expression evaluates to true does the code inside the block run.

#### [Adding else and elsif](https://www.theodinproject.com/lessons/ruby-conditional-logic#adding-else-and-elsif) 

We often want to check a condition and run some code if it’s true but then run some other code if it’s false. This is done with an `if...else` statement.
```ruby
if attack_by_land == true 
  puts "release the goat"
else 
  puts "release the shark"
end
```

Oh yeah! Protected on land and sea.

But what about if we’re attacked by air? We need yet another conditional check. Enter the `if...elsif...else` statement!
```ruby
if attack_by_land == true 
  puts "release the goat"
elsif attack_by_sea == true 
  puts "release the shark"
else 
  puts "release Kevin the octopus"
end
```

Ain’t nobody pillaging our land!

You can have as many `elsif` expressions as you want. The `else` clause is optional, but you usually want to provide some default value in case none of the previous expressions evaluate to `true`.

#### [Boolean logic](https://www.theodinproject.com/lessons/ruby-conditional-logic#boolean-logic) 

To determine whether an expression evaluates to `true` or `false`, you’ll need a comparison operator. There are several provided by Ruby:

`\==` (equals) returns `true` if the values compared are equal.
```ruby
5 == 5 #=> true
5 == 6 #=> false
```

`!=` (not equal) returns `true` if the values compared are not equal.
```ruby
5 != 7 #=> true
5 != 5 #=> false
```

`>` (greater than) returns `true` if the value on the left of the operator is larger than the value on the right.
```ruby
7 > 5 #=> true
5 > 7 #=> false
```

`<` (less than) returns `true` if the value on the left of the operator is smaller than the value on the right.
```ruby
5 < 7 #=> true
7 < 5 #=> false
```

`>=` (greater than or equal to) returns `true` if the value on the left of the operator is larger than or equal to the value on the right.
```ruby
7 >= 7 #=> true
7 >= 5 #=> true
```

`<=` (less than or equal to) returns `true` if the value on the left of the operator is smaller than or equal to the value on the right.
```ruby
5 <= 5 #=> true
5 <= 7 #=> true
```

`#eql?` checks both the value type and the actual value it holds. ^bbd16q
```ruby
5.eql?(5.0) #=> false; although they are the same value, one is an integer and the other is a float
5.eql?(5)   #=> true
```

`#equal?` checks whether both values are the exact same object in memory. This can be slightly confusing because of the way computers store some values for efficiency. Two variables pointing to the same number will usually return `true`. ^sybflb
```ruby
a = 5
b = 5
a.equal?(b) #=> true
```

This expression is true because of the way computers store integers in memory. Although two different variables are holding the number 5, they point to the same object in memory. However, consider the next code example:
```ruby
a = "hello"
b = "hello"
a.equal?(b) #=> false
```

This happens because computers can’t store strings in the same efficient way they store numbers. Although the values of the variables are the same, the computer has created two separate string objects in memory.

In addition to the above operators, Ruby has a special operator that is affectionately referred to as the **spaceship operator**. Unlike the other comparison operators, which all return `true` or `false`, the spaceship operator returns one of three numerical values.

- `<=>` (spaceship operator) returns the following:   ^aak7q6
    - `-1` if the value on the left is less than the value on the right;
    - `0` if the value on the left is equal to the value on the right; and
    - `1` if the value on the left is greater than the value on the right.
```ruby
5 <=> 10    #=> -1
10 <=> 10   #=> 0
10 <=> 5    #=> 1
```
The spaceship operator is most commonly used in sorting functions, which we’ll cover more later. ([[notes/programming/programming.lang.ruby#^4j7tt7|more]])

All of the above operators also work on data types other than numbers, such as strings. Why not play around with this in a REPL?

#### [Logical operators](https://www.theodinproject.com/lessons/ruby-conditional-logic#logical-operators) 

Sometimes you’ll want to write an expression that contains more than one condition. In Ruby, this is accomplished with logical operators, which are `&&` (and), `||` (or) and `!` (not).

There are some differences between the word versions and their symbolic equivalents, particularly in the way they evaluate code. We recommend you read [this article](https://avdi.codes/how-to-use-rubys-english-andor-operators-without-going-nuts/) that explains the differences.

The `&&` operator returns `true` if **both** the left and right expressions return `true`.
```ruby
if 1 < 2 && 5 < 6 
  puts "Party at Kevin's!"
end

# This can also be written as
if 1 < 2 and 5 < 6 
  puts "Party at Kevin's!"
end
```

One thing to keep in mind with the `&&` and `||` operators is the order of logic. The expressions are always evaluated from left to right. ^4213hv

Using the `&&` operator, both expressions must return `true`. If the first expression encountered returns `false`, then the second expression is never checked. To the Ruby interpreter, it’s pointless to evaluate the second half as the overall expression can never return `true`.

With the `||` operator, if the first expression evaluates to `true`, then the second expression is never checked because the complete expression is already `true`, and the code in the block is run. ^tspsyp

This is known as **short circuit evaluation**.
```ruby
if 10 < 2 || 5 < 6 #=> although the left expression is false, there is a party at Kevin's because the right expression returns true 
  puts "Party at Kevin's!"
end

# This can also be written as
if 10 < 2 or 5 < 6 
  puts "Party at Kevin's!"
end
```

The `!` operator reverses the logic of the expression. Therefore, if the expression itself returns `false`, using the `!` operator makes the expression `true`, and the code inside the block will be executed.

```ruby
if !false     #=> true

if !(10 < 5)  #=> true
```

#### [Case statements](https://www.theodinproject.com/lessons/ruby-conditional-logic#case-statements) 

Case statements are a neat way of writing several conditional expressions that would normally result in a messy `if...elsif` statement. You can even assign the return value from a case statement to a variable for use later.

Case statements process each condition in turn, and if the condition returns `false`, it will move onto the next one until a match is found. An `else` clause can be provided to serve as a default if no match is found.
```ruby
grade = 'F'

did_i_pass = case grade #=> create a variable `did_i_pass` and assign the result of a call to case with the variable grade passed in 
  when 'A' then "Hell yeah!"
  when 'D' then "Don't tell your mother."
  else "'YOU SHALL NOT PASS!' -Gandalf"
end
```

As soon as a match is found, the value of that match is returned, and the case statement stops execution. Can you tell what the value of the `did_i_pass` variable is going to be after the case statement?

If you need to do some more complex code manipulation, you can remove the `then` keyword and instead place the code to be executed on the next line.

```ruby
grade = 'F'

case grade
when 'A' 
  puts "You're a genius"
  future_bank_account_balance = 5_000_000
when 'D' 
  puts "Better luck next time"
  can_i_retire_soon = false
else 
  puts "'YOU SHALL NOT PASS!' -Gandalf"
  fml = true
end
```

> Case statements use the reserved words `case`, `when`, `else`, and `end`. You create one by first defining a case and then evaluating the value of the case and what operation to complete if that case is true. ([source](https://arc.net/l/quote/kxtwpakf))

#### [Unless statements](https://www.theodinproject.com/lessons/ruby-conditional-logic#unless-statements) 

An `unless` statement works in the opposite way as an `if` statement: it only processes the code in the block if the expression evaluates to `false`. There isn’t much more to it.
```ruby
age = 19
unless age < 18 
  puts "Get a job."
end
```

Just like with `if` statements, you can write an `unless` statement on one line, and you can also add an `else` clause.
```ruby
age = 19
puts "Welcome to a life of debt." unless age < 18

unless age < 18 
  puts "Down with that sort of thing."
else 
  puts "Careful now!"
end
```

You should use an `unless` statement when you want to **not** do something if a condition is `true`, because it can make your code more readable than using `if !true`. ^8gvh1p

#### [Ternary operator](https://www.theodinproject.com/lessons/ruby-conditional-logic#ternary-operator) 

The ternary operator is a one-line `if...else` statement that can make your code much more concise.

Its syntax is `conditional statement ? <execute if true> : <execute if false>`. You can assign the return value of the expression to a variable.
```ruby
age = 19
response = age < 18 ? "You still have your entire life ahead of you." : "You're all grown up."
puts response #=> "You're all grown up."
```
Here, because the expression evaluated to `false`, the code after the `:` was assigned to the variable `response`.

Writing this as an `if...else` statement would be much more verbose:
```ruby
age = 19
if age < 18 
  response = "You still have your entire life ahead of you."
else 
  response = "You're all grown up."
end

puts response #=> "You're all grown up."
```

> Ternary expressions should usually be used to select between 2 values, not to choose between two actions. (An action would be something like printing a value or setting a variable to a new value.) The ternary expression's result should almost always be assigned to a variable, passed to a method as an argument, or returned by a method. If you're not doing one of those things, an `if/else` statement is a better choice. ([source](https://arc.net/l/quote/gvqpzktq))

However, if your conditional statements are complicated, then using an `if...else` statement can help to make your code more readable. Remember, **above all else, your code needs to be readable and understandable by other people**, especially in the development stage. You can always optimize your code for efficiency once it’s finished and you’re moving to a production environment where speed matters. ^g0qoxc
#### [True & False](https://launchschool.com/books/ruby/read/flow_control#trueandfalse) 
Notice that after `if` and `elsif` we have to put an expression that evaluates as either true or false. In Ruby, you could even write code like this:
```ruby
a = 5
if a 
  puts "how can this be true?"
else 
  puts "it is not true"
end
```

The output is "how can this be true?". **In Ruby, every expression evaluates as true when used in flow control, except for `false` and `nil`.** Try the code above and give `a` values of 0, ""(empty string) and even the string 'false' to see the result yourself!

Because of this, we could even write code like this:
```ruby
if x = 5 
  puts "how can this be true?"
else 
  puts "it is not true"
end
```

The above code is _not_ testing whether `x` is equal to "5". It's assigning the variable `x` the value of "5", which will _always_ evaluate to `true`. Unfortunately, that looks very similar to `if x == 5`, which is testing whether `x` is equal to "5". Be careful when reading or writing Ruby; its expressiveness can also be a source of many subtle bugs.

The `&&` and `||` logical operators, as you'll recall, use short-circuit evaluation. These operators work with truthy and falsy values too, and they can also return truthy values instead of boolean values. When using `&&` and `||`, the return value is always the value of the operand evaluated last:
```ruby
irb :001 > 3 || 'foo'     # last evaluated operand is 3
=> 3

irb :002 > 'foo' || 3     # last evaluated operand is 'foo'
=> 'foo'

irb :003 > nil || 'foo'   # last evaluated operand is 'foo'
=> 'foo'

irb :004 > nil && 'foo'   # last evaluated operand is nil
=> nil

irb :005 > 3 && 'foo'     # last evaluated operand is 'foo'
=> 'foo'

irb :006 > 'foo' && 3     # last evaluated operand is 3
=> 3
```

Suppose you have an expression of some kind that returns a value that is either truthy or falsy, but isn't a boolean value:
```ruby
foo = nil
bar = 'qux'
is_ok = foo || bar
```

In this code, `is_ok` gets set to a truthy value of `"qux"`. In most cases, you can use `"qux"` as though it were actually a boolean `true` value. However, using a string value as though it is a boolean isn't the clearest way to write your code. It may even look like a mistake to another programmer who is trying to track down a bug. In some strange cases, it may even be a mistake.

You can address this easily enough by using an `if` statement or a ternary expression:
```ruby
is_ok = (foo || bar) ? true : false
```

```ruby
is_ok
if (foo || bar)  
  is_ok = true;
else  
  is_ok = false;
end
```

Either of those snippets sets `is_ok` to an appropriate boolean value. However, they do so in a somewhat wordy manner. Many JavaScript programmers use a more concise coercion by using what looks like a `!!` operator:
```ruby
is_ok = !!(foo || bar)
```

In reality, `!!` isn't a separate operator in Ruby Instead, it's two consecutive `!` operators. The expression `!!a` is equivalent to writing `!(!a)`. The inner `!` converts the value of `a` to `false` if it is truthy, or `true` if `a` is falsy. The outer `!` then flips `true` to `false` or `false` to `true`. In the end, we end up with a boolean value instead of a truthiness value:
```ruby
irb :001 !!3    # 3 is truthy, !3 is false, !false is true
=> true

irb :002 !!nil   # nil is falsy, !nil is true, !true is false
=> false
```

#### [Flow Control](https://www.eriktrautman.com/posts/ruby-explained-conditionals-and-flow-control) 
You'll need to understand which types of things Ruby considers "true" and which ones it considers "false". **"Truthiness" and "Falsiness"** are ways of saying "what evaluates to true?"" and "what evaluates to false"? In many languages, there is some nuance to that question. In Ruby, it's simple: `nil` and `false` are false and that's it. Everything else is "truthy".

Want some more Ruby awesomeness? Put your `if` and `unless` statements in a single line, and in any order you want:
```ruby
if current_user.is_a?(Vampire) dispatch_vampire_hunters
```

...works just as well as:
```ruby
dispatch_vampire_hunters if current_user.is_a?(Vampire)
```

The **Spaceship Operator** `<=>` is a special one that comes up because it actually gives three different possible outputs depending on whether the left side is greater than, less than, or equal to the right side. ^4j7tt7
```ruby
> 1 <=> 1000
=> -1
> 1 <=> 1
=> 0
> 1 <=> -1000
=> 1
```

The Spaceship can be useful because, like basically everything else, it's actually a method and you can override it in your own classes. It's most commonly used in sorting methods. Imagine that you created a `Person` class and you wanted to sort an array of `Person` objects. You first have to teach Ruby how to compare two `Person`s by defining the `#<=>` method for the `Person` class:
```ruby
def Person 
  def <=> (other_person)  # to compare two people, use last names 
    self.last_name <=> other_person.last_name
  end
end                 # now we can run people_array.sort, woohoo!
```

"In the wild" you'll probably see some complex or odd looking `if` statements. The trick is to start breaking everything that looks like a conditional piece into what is evaluates to... either `true` or `false` So what do you evaluate first? Ruby logical expressions use a similar order of operations to normal math: left to right unless there are parentheses.

```ruby
> ( false || true ) && !(true && true ) 
=> false
```

**Ruby is Lazy** which means two things here:
1. It will only evaluate far enough to determine that the expression is definitively true or false.
2. It will return whatever is returned by the last part of the expression to get evaluated (instead of just a simple `true` or `false` it relies on that returned thing being truthy or falsey).

That's important because we can actually use methods as part of our logical chains. It means that methods on the left side of the expression get executed but the ones on the right may never get executed at all... a fact that many programmers (including you later) utilize to make their code nice and compact.
```ruby
> puts("this isn't important") && puts("THIS IS IMPORTANT!!!")
"this isn't important"
=> nil  
```

What happened? Ruby knows that it only needs one side of the `&&` to be false for the whole thing to be false, and since `puts` on the left already returned `nil` which is falsey, Ruby stopped evaluating the expression and the really important message never got displayed.

It returned `nil` instead of `false` because `&&` and `||` and the like don't just return `true` or `false`.. they return the result of the last expression to get evaluated, which was the `nil` from the `puts`. For another example, `7 || nil` returns `7` (which behaves truthy) instead of `true` and `7 && nil` returns `nil` (which behaves falsey) instead of `false` If this seems a bit much to swallow right off the bat, keep it in the back of your mind until you first see it in action then it will click.

`||=` is a sneaky expression that takes advantage of Ruby's natural laziness -- it basically expands to `thing_a || thing_a = thing_b`. So if `thing_a` hasn't been set to anything, it becomes `thing_b`, otherwise it keeps its original value. It's a bit complex and you don't need to know exactly why it works, but we'll go over it for completeness: ^s0ixld

If `thing_a` hasn't yet been assigned to anything, it is `nil` and Ruby then checks the right side of the `||` to see if that might be true, which involves running the expression to set `thing_a` = `thing_b`. If it has already been assigned a value, it just keeps that value like normal. This is another sneaky trick used by programmers in situations like when you don't want to override whatever's already been set, but you want something to be there (like which url originally referred the user to your site)
### [Loops](https://www.theodinproject.com/lessons/ruby-loops#loop)    

> The simplest way to create a loop in Ruby is using the `loop` method. `loop` takes a block, which is denoted by `{ ... }` or `do ... end`. A `loop` will execute any code within the block (again, that's just between the `{}` or `do ... end`) until you manually intervene with `Ctrl + c` or insert a `break` statement inside the block, which will force the loop to stop and the execution will continue after the loop. ([source](https://launchschool.com/books/ruby/read/loops_iterators#simpleloop))

#### [Loop](https://www.theodinproject.com/lessons/ruby-loops#loop) 

The `loop` loop (say what????) is Ruby’s loop that just won’t quit. It’s an infinite loop that will keep going unless you specifically request for it to stop, using the `break` command. Most commonly, `break` is used with a condition, as illustrated in the example below.
```ruby
i = 0
loop do 
  puts "i is #{i}"
  i += 1
  break if i == 10
end
```

You won’t see this loop used much in Ruby. If you find yourself using `loop`, know that there is probably a better loop for you out there, like one of the more specific loops below. ^awl7bj

##### [notes on loops](https://launchschool.com/books/ruby/read/loops_iterators#simpleloop) from Launch School 
We'll talk explicitly about using conditionals within a loop later. Similar to how we use `break` to exit a loop, we can use the keyword `next` to skip the rest of the current iteration and start executing the next iteration. We'll use the same example as before to demonstrate. This time we'll skip `4`.

```ruby
# next_loop.rb

i = 0
loop do 
  i = i + 2
  if i == 4 
    next        # skip rest of the code in this iteration
  end
  puts i
  if i == 10 
    break
  end
end
```

And here's the output when we run the file.
```terminal
$ ruby next_loop.rb
2
6
8
10
```

Notice that the above code did not print out `4`, because that was skipped over. Execution continued to the next iteration of the loop.

`break` and `next` are important loop control concepts that can be used with `loop` or any other loop construct in Ruby, which we'll cover one by one below. When combined with conditionals, you can start to build simple programs with interesting behavior.

#### [While loop](https://www.theodinproject.com/lessons/ruby-loops#while-loop) 

A `while` loop is similar to the `loop` loop except that you declare the condition that will break out of the loop up front.
```ruby
i = 0
while i < 10 do 
 puts "i is #{i}"
 i += 1
end
```

This is an example of using a `while` loop with a count. Because you declare the condition that breaks the loop up front, the intention of your code is much clearer, making this code easier to read than our `loop` loop above.

You can also use `while` loops to repeatedly ask a question of the user until they give the desired response:
```ruby
while gets.chomp != "yes" do
  puts "Are we there yet?"
end
```

This example shows the flexibility advantage of a `while` loop: it will run until its break condition is met, which could be for a variable number of loops or a number of loops that is initially unknown. Who knows if you’ve arrived at your destination the first, fourth, or seventy-ninth time you ask?

##### [Notes on while loops: from Launch School](https://arc.net/l/quote/ieuszfwt) 
One last note: unlike the `loop` method, `while` is not implemented as a method. One consequence of this difference is, that unlike `loop`, a `while` loop does not have its own scope -- the entire body of the loop is in the same scope as the code that contains the `while` loop:
```ruby
x = 0
while x < 5 
  y = x * x
  x += 1
end

puts y # 16
```

As you can see, even though `y` is initialized in the body of the `while` loop, it's still in scope after the loop finishes running.

#### [Until loop](https://www.theodinproject.com/lessons/ruby-loops#until-loop) 

The `until` loop is the opposite of the `while` loop. A `while` loop continues for as long as the condition is true, whereas an `until` loop continues for as long as the condition is false. These two loops can therefore be used pretty much interchangeably. Ultimately, what your break condition is will determine which one is more readable.

As much as possible, you should avoid negating your logical expressions using `!` (not). First, it can be difficult to actually notice the exclamation point in your code. Second, using negation makes the logic more difficult to reason through and therefore makes your code more difficult to understand. These situations are where `until` shines.

We can re-write our `while` loop examples using `until`.
```ruby
i = 0
until i >= 10 do 
 puts "i is #{i}"
 i += 1
end
```

You can see here that using `until` means that the loop will continue running until the condition i >= 10 is true.

The next example shows how you can use `until` to avoid the negation `!` that the above `while` loop had to use.
```ruby
until gets.chomp == "yes" do 
  puts "Do you like Pizza?"
end
```

Much more readable! And who doesn’t like Pizza.

#### [Ranges](https://www.theodinproject.com/lessons/ruby-loops#ranges) 

What if we know exactly how many times we want our loop to run? Ruby lets us use something called a [range](https://docs.ruby-lang.org/en/3.2/Range.html) to define an interval. All we need to do is give Ruby the starting value, the ending value, and whether we want the range to be inclusive or exclusive.
```ruby
(1..5)      # inclusive range: 1, 2, 3, 4, 5
(1...5)     # exclusive range: 1, 2, 3, 4

# We can make ranges of letters, too!
('a'..'d')  # a, b, c, d
```

#### [For loop](https://www.theodinproject.com/lessons/ruby-loops#for-loop) 

A `for` loop is used to iterate through a collection of information such as an array or range. These loops are useful if you need to do something a given number of times while also using an iterator.
```ruby
for i in 0..5 
  puts "#{i} zombies incoming!"
end
```

That’s really all there is to it.

#### [Times loop](https://www.theodinproject.com/lessons/ruby-loops#times-loop) 

If you need to run a loop for a specified number of times, then look no further than the trusty `#times` loop. It works by iterating through a loop a specified number of times and even throws in the bonus of accessing the number it’s currently iterating through.
```ruby
5.times do 
  puts "Hello, world!"
end
```

I’m sure you can guess what that code does. Ruby is easily readable that way!
```ruby
5.times do |number| 
  puts "Alternative fact number #{number}"
end
```

Remember, loops will start counting from a zero index unless specified otherwise, so the first loop iteration will output `Alternative fact number 0`.

#### [Upto and Downto loops](https://www.theodinproject.com/lessons/ruby-loops#upto-and-downto-loops) 

The Ruby methods `#upto` and `#downto` do exactly what you’d think they do from their names. You can use these methods to iterate from a starting number either up to or down to another number, respectively.
```ruby
5.upto(10) { |num| print "#{num} " }     #=> 5 6 7 8 9 10

10.downto(5) { |num| print "#{num} " }   #=> 10 9 8 7 6 5
```

If you need to step through a series of numbers (or even letters) within a specific range, then these are the loops for you.

#### [Iterators](https://launchschool.com/books/ruby/read/loops_iterators#iterators): Launch School 

**Iterators** are methods that naturally loop over a given set of data and allow you to operate on each element in the collection.

We said earlier that arrays are ordered lists. Let's say that you had an array of names and you wanted to print them to the screen. How could you do that? You could use the `each` method for arrays, like this:
```ruby
# practice_each.rb

names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']

names.each { |name| puts name }
```

Isn't that concise! We've got a lot of explaining to do with this one.

We have called the `each` method using the dot operator (`.`) on our array. What this method does is loop through each element in our array, in order, starting from `'Bob'`. Then it begins executing the code within the block. The block's starting and ending points are defined by the curly braces `{}`. Each time we iterate over the array, we need to assign the value of the element to a variable. In this example we have named the variable `name` and placed it in between two pipes `|`. After that, we write the logic that we want to use to operate on the variable, which represents the current array element. In this case it is simply printing to the screen using `puts`.

Run this program to see the output.

A **block** is just some lines of code ready to be executed. When working with blocks there are two styles you need to be aware of. By convention, we use the curly braces (`{}`) when everything can be contained in one line. We use the words `do` and `end` when we are performing multi-line operations. Let's add some functionality to our previous program to try out this `do/end` stuff. ^stnuvk
```ruby
# practice_each.rb

names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']
x = 1

names.each do |name| 
  puts "#{x}. #{name}"
  x += 1
end
```

We've added the counter `x` to add a number before each name, creating a numbered list output. The number `x` is incremented every time we go through the iteration.

Memorizing these small differences in syntax is one of the necessary tasks a Ruby programmer must go through. Ruby is a very expressive language. Part of what makes that possible is the ability to do things in more than one way.

There are many other iterator methods in Ruby, and over time, you'll get to use a lot of them. For now, know that most Rubyists prefer to use iterators, like the `each` method, to loop over a collection of elements.
### [Arrays](https://www.theodinproject.com/lessons/ruby-arrays#introduction)    
#### [Here is a small cheatsheet for you](https://www.rubyguides.com/2015/05/ruby-arrays/): 

| OPERATION  | METHODS               |
| ---------- | --------------------- |
| initialize | Array.new, [], %w     |
| read       | [0], first, last      |
| add        | push, <<, unshift     |
| remove     | pop, delete_at, shift |
#### [Creating arrays](https://www.theodinproject.com/lessons/ruby-arrays#creating-arrays) 

Here are two basic arrays:
```ruby
num_array = [1, 2, 3, 4, 5]
str_array = ["This", "is", "a", "small", "array"]
```

Both arrays have five elements separated by commas. The first array contains integers, while the second array contains strings.

Arrays are commonly created with an **array literal**, which is a special syntax used to create instances of an array object. To create a new array using an array literal, use square brackets (`[]`).

An array can also be created by calling the `Array.new` method. When you call this method, you can also include up to 2 optional arguments (initial size and default value):
```ruby
Array.new               #=> []
Array.new(3)            #=> [nil, nil, nil]
Array.new(3, 7)         #=> [7, 7, 7]
Array.new(3, true)      #=> [true, true, true]
```


#### [Accessing elements](https://www.theodinproject.com/lessons/ruby-arrays#accessing-elements) 

Every element in an array has an **index**, which is a numerical representation of the element’s position in the array. Like most other programming languages, Ruby arrays use **zero-based indexing**, which means that the index of the first element is 0, the index of the second element is 1, and so on. Accessing a specific element within an array is done by calling `my_array[x]`, where `x` is the index of the element you want. Calling an invalid position will result in `nil`. Ruby also allows the use of negative indices, which return elements starting from the _end_ of an array, starting at [-1].
```ruby
str_array = ["This", "is", "a", "small", "array"]

str_array[0]            #=> "This"
str_array[1]            #=> "is"
str_array[4]            #=> "array"
str_array[-1]           #=> "array"
str_array[-2]           #=> "small"
```

Finally, Ruby provides the `#first` and `#last` array methods, which should be self-explanatory. In addition, these methods can take an integer argument, e.g., `my_array.first(n)` or `my_array.last(n)`, which will return a new array that contains the first or last `n` elements of `my_array`, respectively.
```ruby
str_array = ["This", "is", "a", "small", "array"]

str_array.first         #=> "This"
str_array.first(2)      #=> ["This", "is"]
str_array.last(2)       #=> ["small", "array"]
```

#### [Adding and removing elements](https://www.theodinproject.com/lessons/ruby-arrays#adding-and-removing-elements) 

Adding an element to an existing array is done by using the `#push` method or the shovel operator `<<`. Both methods will add elements to the end of an array and return that array with the new elements. The `#pop` method will remove the element at the end of an array and return the element that was removed.
```ruby
num_array = [1, 2]

num_array.push(3, 4)      #=> [1, 2, 3, 4]
num_array << 5            #=> [1, 2, 3, 4, 5]
num_array.pop             #=> 5
num_array                 #=> [1, 2, 3, 4]
```

The methods `#shift` and `#unshift` are used to add and remove elements at the beginning of an array. The `#unshift` method adds elements to the beginning of an array and returns that array (much like `#push`). The `#shift` method removes the first element of an array and returns that element (much like `#pop`).
```ruby
num_array = [2, 3, 4]

num_array.unshift(1)      #=> [1, 2, 3, 4]
num_array.shift           #=> 1
num_array                 #=> [2, 3, 4]
```

It’s also useful to know that both `#pop` and `#shift` can take integer arguments:
```ruby
num_array = [1, 2, 3, 4, 5, 6]

num_array.pop(3)          #=> [4, 5, 6]
num_array.shift(2)        #=> [1, 2]
num_array                 #=> [3]
```

##### **[&](https://www.rubyguides.com/2015/05/ruby-arrays/)**  
Finally, you can get the elements that appear in two arrays at the same time:
```ruby
users & new_users
```

##### [**Mutating the Caller](https://launchschool.com/books/ruby/read/arrays#mutatingthecaller):** Launch School 
Note that when we called the `pop` method, the original `array` variable was modified (i.e., this is a method that **mutates the caller**), but the returned value is the popped element, as shown in the first line above. This is a critical distinction to understand. Make sure you distinguish between the value returned by an expression, and what the expression is actually doing.

> [!NOTE]
> Mutating the caller is similar to mutating arguments, but applies to the object used to call a method. For instance, in `array.pop`, the array specified by `array` is used to call the `pop` method. The difference is that mutating an argument alters the value of an object passed to a method as an argument, while mutating the caller modifies the object used to call the method.
> 

We talked about mutating the caller and mutating arguments earlier and showed examples to go along with it. This concept is so important that we wanted to cover it in even more depth. It's important to keep the concept in mind since it is possible that a method can unexpectedly change an object used as the caller or as an argument. This can be a major source of confusion which is why it's important to know what a method is doing to its arguments and calling object, and to know what that method returns.

We also wanted to revisit destructive methods within the context of using a method. Look at the two methods below and see if you can decipher why the first method mutates the argument, but the second one doesn't.
```ruby
def mutate(arr) 
  arr.pop
end

def not_mutate(arr) 
  arr.select { |i| i > 3 }
end

a = [1, 2, 3, 4, 5, 6]
mutate(a)
not_mutate(a)

puts a
```

The last line will output `1`, `2`, `3`, `4`, and `5`. The `mutate` method performed a destructive action (i.e., `pop`) on its argument, thereby modifying the `a` array, even though `a` was initialized outside of the method. Therefore, the `6` element was popped out of the original array. The `not_mutate` method performed a non-destructive action (i.e., `select`), and therefore the original variable was unmodified.

It's worth noting that inside `mutate`, `arr.pop` mutates its caller. That, in turn, mutates the argument passed to `mutate`. However, inside `not_mutate`, `arr.select` does not mutate its caller, so `not_mutate` doesn't mutate its argument either.

##### **map method**: Launch School  
The `map` method iterates over an array applying a block to each element of the array and returns a new array with those results. The irb session below shows how to use `map` to get the square of all numbers in an array. The `collect` method is an alias to `map` - they do the same thing.
```ruby
irb :001 > a = [1, 2, 3, 4]
=> [1, 2, 3, 4]
irb :002 > a.map { |num| num**2 }
=> [1, 4, 9, 16]
irb :003 > a.collect { |num| num**2 }
=> [1, 4, 9, 16]
irb :004 > a
=> [1, 2, 3, 4]
```

You'll notice that after performing these methods there is no change to the initial array. These methods are not destructive (i.e., they don't mutate the caller). How do you know which methods mutate the caller and which ones don't? You have to use the methods and pay attention to the output in irb; that is, you have to memorize or know through using it.

##### **uniq method:** launch school 
Another useful method is the `uniq` method. This iterates through an array, deletes any duplicate values that exist, then returns the result as a new array.
```irb
irb :010 > b = [1, 1, 2, 2, 3, 3, 4, 4]
=> [1, 1, 2, 2, 3, 3, 4, 4]
irb :011 > b.uniq
=> [1, 2, 3, 4]
irb :012 > b
=> [1, 1, 2, 2, 3, 3, 4, 4]
```

Once again, notice that the `uniq` method did not modify the original `b` array; it returned a new array with the duplicates removed.

If you add the bang suffix (`!`) to this method, you can perform the `uniq` method destructively. Much like the way the `delete` method works.
```irb
irb :013 > b = [1, 1, 2, 2, 3, 3, 4, 4]
=> [1, 1, 2, 2, 3, 3, 4, 4]
irb :014 > b.uniq!
=> [1, 2, 3, 4]
irb :015 > b
=> [1, 2, 3, 4]
```

##### **select method:** launch school 
We talked in the loop section about using `each` to iterate over an array. The Ruby standard library has many similar methods. Let's take a look at the `select` method. This method iterates over an array and returns a new array that includes any items that return `true` to the expression provided. That's a mouthful. As always, looking at code is more helpful than using a bunch of words.
```irb
irb :001 > numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
irb :002 > numbers.select { |number| number > 4 }
=> [5, 6, 7, 8, 9, 10]
irb :003 > numbers
=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
 
```

The `select` method selects all of the numbers that are greater than 4 and returns them in an array. It does not mutate the caller (the original `numbers` array is unmodified).

#### [Common Array Methods](https://launchschool.com/books/ruby/read/arrays#commonarraymethods): Launch School 

This section will introduce you to some common methods that Ruby has built-in to its [Array class](https://docs.ruby-lang.org/en/3.2/Array.html). You should bookmark that documentation page as it's probably something you'll want to refer to often. ^bilbbx

##### [include?](https://launchschool.com/books/ruby/read/arrays#include) 

The **include?** method checks to see if the argument given is included in the array. It has a question mark at the end of it which usually means that you should expect it to return a boolean value, `true` or `false`. (Such methods are called **predicates**.) Just like the methods that end in a "!", this is strictly by convention only and not a property of the language.
```irb
irb :001 > a = [1, 2, 3, 4, 5]
=> [1, 2, 3, 4, 5]
irb :002 > a.include?(3)
=> true
irb :003 > a.include?(6)
=> false
```

##### [flatten](https://launchschool.com/books/ruby/read/arrays#flatten) 

The **flatten** method can be used to take an array that contains nested arrays and create a one-dimensional array.
```irb
irb: 001 > a = [1, 2, [3, 4, 5], [6, 7]]
=> [1, 2, [3, 4, 5], [6, 7]]
irb: 002 > a.flatten
=> [1, 2, 3, 4, 5, 6, 7]
```

Is the flatten method destructive? Find out for yourself in either irb, or by consulting the Array documentation.

##### [each_index](https://launchschool.com/books/ruby/read/arrays#each_index) 

The **each_index** method iterates through the array much like the **each** method, however the variable represents the index number as opposed to the value at each index. It passes the index of the element into the block and you may do as you please with it. The original array is returned.
```irb
irb: 001 > a = [1, 2, 3, 4, 5]
=> [1, 2, 3, 4, 5]
irb: 002 > a.each_index { |i| puts "This is index #{i}" }
This is index 0
This is index 1
This is index 2
This is index 3
This is index 4
=> [1, 2, 3, 4, 5]
```

##### [each_with_index](https://launchschool.com/books/ruby/read/arrays#each_with_index) 

Another useful method that works in a similar way to `each_index` is **each_with_index**
```irb
irb: 001 > a = [1, 2, 3, 4, 5]
=> [1, 2, 3, 4, 5]
irb: 002 > a.each_with_index { |val, idx| puts "#{idx+1}. #{val}" }
1. 1
2. 2
3. 3
4. 4
5. 5
=> [1, 2, 3, 4, 5]
```

`each_with_index` gives us the ability to manipulate both the value and the index by passing in two parameters to the block of code. The first is the value and the second is the index. You can then use them in the block.

##### [sort](https://launchschool.com/books/ruby/read/arrays#sort) 

The **sort** method is a handy way to order an array. It returns a sorted array.
```irb
irb :001 > a = [5, 3, 8, 2, 4, 1]
=> [5, 3, 8, 2, 4, 1]
irb :002 > a.sort
=> [1, 2, 3, 4, 5, 8]
```

Once again, test in irb to see if the `sort` method is destructive. (It's not, but test it out for yourself.) We won't remind you to test this in the future, but when you see methods like this in the future, ask yourself "is this method returning new data, or is the original data being modified?".

##### [product](https://launchschool.com/books/ruby/read/arrays#product) 

The **product** method can be used to combine two arrays in an interesting way. It returns an array that is a combination of all elements from all arrays.
```irb
irb :001 > [1, 2, 3].product([4, 5])
=> [[1, 4], [1, 5], [2, 4], [2, 5], [3, 4], [3, 5]]
```

There are too many interesting methods to cover, but we wanted to give you a taste of the power of Ruby arrays and the many handy methods that come built-in with Ruby. If you ever think "I want my array to...", there is probably a method that already does this. First, check the documentation.

##### [each](https://launchschool.com/books/ruby/read/arrays#eachvsmap) - each vs map 

`each` provides a simple way of iterating over a collection in Ruby and is preferred to using the `for` loop. The `each` method works on objects that allow for iteration and is commonly used along with a block. If given a block, `each` runs the code in the block once for each element in the collection and returns the collection it was invoked on. If no block is given, it returns an [Enumerator](https://docs.ruby-lang.org/en/3.2/Enumerator.html). Let's look at some simple examples:
```irb
irb :001 > a = [1, 2, 3]
irb :002 > a.each { |e| puts e }
1
2
3
=> [1, 2, 3]
```

The above shows the most common way of using `each`. We're iterating over each element on the array `a` and printing it out. Finally it returns `[1, 2, 3]`.

We can also modify the elements in `a` and print them out:
```irb
irb :003 > a = [1, 2, 3]
irb :004 > a.each { |e| puts e + 2 }
3
4
5
=> [1, 2, 3]
```

Again, we print out the modified values and return the original collection `a`.

In this chapter, so far, we've been using curly brace blocks exclusively. Don't forget that you can also use `do...end` as well:
```irb
irb :005 > a = [1, 2, 3]
irb :006 > a.each do |e|
irb :007 *   puts e + 2
irb :008 * end
3
4
5
=> [1, 2, 3]
```

Here is a final example with no block; an [Enumerator](https://docs.ruby-lang.org/en/3.2/Enumerator.html) is returned:
```irb
irb :009 > a = [1, 2, 3]
irb :010 > a.each
=> #<Enumerator: ...>
```

##### [map](https://launchschool.com/books/ruby/read/arrays#eachvsmap) 

`map` also works on objects that allow for iteration. Like `each`, when given a block it invokes the given block once for each element in the collection. Where it really differs from `each` is the returned value. `map` creates and returns a new array containing the values returned by the block. Let's see it in action:
```irb
irb :011 > a = [1, 2, 3]
irb :012 > a.map { |x| x**2 }
=> [1, 4, 9]
```

We square each element in the block and create a new array containing the returned values by the block. Finally the new array is returned.

To really examine that `map` creates a new array consisting of the returned value of the block, let's see an example with `map` and `puts`:
```irb
irb :013 > a = [1, 2, 3]
irb :014 > a.map { |x| puts x**2 }
1
4
9
=> [nil, nil, nil]
```

Because `puts` returns `nil` every time the block is invoked `nil` is returned which makes up the values in the newly created returned array.

Finally, if no block is given, `map` returns an [Enumerator](https://docs.ruby-lang.org/en/3.2/Enumerator.html):
```irb
irb :015 > a = [1, 2, 3]
irb :016 > a.map
=> #<Enumerator: ...>
```

`each` and `map` are important methods to know but can be quite confusing in the beginning. Another way to remember these methods: use `each` for iteration and `map` for transformation. ^d2zbfc

#### [Adding and subtracting arrays](https://www.theodinproject.com/lessons/ruby-arrays#adding-and-subtracting-arrays) 

What do you think will be the outcome of `[1, 2, 3] + [3, 4, 5]`?

If you guessed `[1, 2, 3, 3, 4, 5]`, congratulations! Adding two arrays will return a new array built by concatenating them, similar to string concatenation. The `concat` method works the same way.
```ruby
a = [1, 2, 3]
b = [3, 4, 5]

a + b         #=> [1, 2, 3, 3, 4, 5]
a.concat(b)   #=> [1, 2, 3, 3, 4, 5]
```

To find the difference between two arrays, you can subtract them using `-`. This method returns a copy of the first array, removing any elements that appear in the second array.  ^xwwvex
```ruby
[1, 1, 1, 2, 2, 3, 4] - [1, 4]  #=> [2, 2, 3]
```

### [Hashes](https://www.theodinproject.com/lessons/ruby-hashes)    
#### [Arrays vs. hashes](https://www.theodinproject.com/lessons/ruby-hashes#arrays-vs-hashes) 

You’re sitting in your cubicle, diligently working away (because you would never dream of slacking off at work), when lunch time rolls around. You need to grab a bite to eat, but how are you going to go about requesting food? For the purposes of this parable, you have two options: a vending machine or a nice restaurant.

If you were to go to the vending machine, you would see nice, orderly rows of food where each option is labeled with a number. These labels are the indices of the vending machine array. It’s important to note that the indices are not interchangeable: “12” will always come before “13” and after “11”. You request your food by using an index to tell the vending machine what you want. It understands the index and returns whatever lives in that spot. Mmmmm, nothing like a lunch of Flamin’ Hot Cheetos and Diet Coke! You are a programmer, after all.

Your other option is to sit yourself down at a table covered with a nice white tablecloth, where a pleasant waiter will see to your every need. The first thing they will do is bring you a menu, which for those of you that have only been eating out of vending machines so far in your life, lists out all of your dining options labeled with the name of the dish, such as [“sublimated artichoke frittata” or “whole pork belly, market acorns, and activated shell bean”](http://www.brooklynbarmenus.com/). In this menu hash, the dish names are called **keys**: they are the labels that are used to identify your dining options. The food that those dish names represent are the **values** that the keys point to. To order your food, you give your waiter the key (you tell him the name of the dish you want), and he returns the value of that key (food that matches the description on the menu). Mmmmm, nothing like a lunch of free-range bison with corn and peach compote and an IPA! You are a programmer, after all.

There are two important differences to note between the vending machine array and the menu hash. First, it’s far easier for us to use the names of things to find what we’re looking for than to have to translate what we want into numerical indices. This is a huge advantage of using a hash: no more having to count out array elements to request what we want! Second, the items on a menu can appear in any order, and we’ll still get exactly what we want as long as we use the correct name. This unordered aspect of hashes isn’t true for arrays, which are highly dependent on order.

#### [Creating hashes](https://www.theodinproject.com/lessons/ruby-hashes#creating-hashes) 

Let’s dive in and create a hash!
```ruby
my_hash = {
  "a random word" => "ahoy",
  "Dorothy's math test score" => 94,
  "an array" => [1, 2, 3],
  "an empty hash within a hash" => {}
}
```

This example shows the most basic way to create a hash, which is to use the hash literal of curly braces (`{}`).

The above hash has four keys that point to four different values. For example, the first key, `"a random word"`, points to the value `"ahoy"`. As you can see, the values of a hash can be a number, a string, an array, or even another hash. Keys and values are associated with a special operator called a **hash rocket**: `\=>`.

Just like with an array, you can also create a new hash by calling the good old `::new` method on the `Hash` class.
```ruby
my_hash = Hash.new
my_hash               #=> {}
```

Of course, hashes don’t only take strings as keys and values. Ruby is a pretty flexible language, so you can jam any old thing in there and it’ll work just fine.
```ruby
hash = { 9 => "nine", :six => 6 }
```
> [!NOTE]
> The `:six` here is a symbol in Ruby. They are like pointers that can't be changed and are used as unique identifiers.

#### [Accessing values](https://www.theodinproject.com/lessons/ruby-hashes#accessing-values) 

You can access values in a hash the same way that you access elements in an array. When you call a hash’s value by key, the key goes inside a pair of brackets, just like when you’re calling an array by index.
```ruby
shoes = { 
  "summer" => "sandals",
  "winter" => "boots"
}

shoes["summer"]   #=> "sandals"
```

If you try to access a key that doesn’t exist in the hash, it will return `nil`:
```ruby
shoes["hiking"]   #=> nil
```

Sometimes, this behavior can be problematic for you if silently returning a `nil` value could potentially wreak havoc in your program. Luckily, hashes have a `fetch` method that will raise an error when you try to access a key that is not in your hash.  ^gv11h3
```ruby
shoes.fetch("hiking")   #=> KeyError: key not found: "hiking"
```

Alternatively, this method can return a default value instead of raising an error if the given key is not found. ^je8rz3
```ruby
shoes.fetch("hiking", "hiking boots") #=> "hiking boots"
```

#### [Adding and changing data](https://www.theodinproject.com/lessons/ruby-hashes#adding-and-changing-data) (hashes) 

You can add a key-value pair to a hash by calling the key and setting the value, just like you would with any other variable.
```ruby
shoes["fall"] = "sneakers"

shoes     #=> {"summer"=>"sandals", "winter"=>"boots", "fall"=>"sneakers"}
```

You can also use this approach to change the value of an existing key.
```ruby
shoes["summer"] = "flip-flops"
shoes     #=> {"summer"=>"flip-flops", "winter"=>"boots", "fall"=>"sneakers"}
```

#### [Removing data](https://www.theodinproject.com/lessons/ruby-hashes#removing-data) 

Deleting data from a hash is done with the hash’s `#delete` method, which provides the cool functionality of returning the value of the key-value pair that was deleted from the hash.  ^fkafmi
```ruby
shoes.delete("summer")    #=> "flip-flops"
shoes                     #=> {"winter"=>"boots", "fall"=>"sneakers"}
```

#### [Methods](https://www.theodinproject.com/lessons/ruby-hashes#methods) 

Hashes respond to many of the same methods as arrays do since they both employ Ruby’s **Enumerable** module. In the next lesson, we’ll go into far more detail on the Enumerable module, including the differences in how the Enumerable methods behave for arrays and hashes.

A couple of useful methods that are specific to hashes are the `#keys` and `#values` methods, which very unsurprisingly return the keys and values of a hash, respectively. Note that both of these methods return _arrays_.

```ruby
books = { 
  "Infinite Jest" => "David Foster Wallace",
  "Into the Wild" => "Jon Krakauer"
}

books.keys      #=> ["Infinite Jest", "Into the Wild"]
books.values    #=> ["David Foster Wallace", "Jon Krakauer"]
```

#### [Merging two hashes](https://www.theodinproject.com/lessons/ruby-hashes#merging-two-hashes) 

Occasionally, you’ll come across a situation where two hashes wish to come together in holy union. Luckily, there’s a method for that. (No ordained minister required!)
```ruby
hash1 = { "a" => 100, "b" => 200 }
hash2 = { "b" => 254, "c" => 300 }
hash1.merge(hash2)      #=> { "a" => 100, "b" => 254, "c" => 300 }
```

Notice that the values from the hash getting merged in (in this case, the values in `hash2`) overwrite the values of the hash getting… uh, merged _at_ (`hash1` here) when the two hashes have a key that’s the same.

For a full list of the methods that work on hashes, check out the [Ruby Docs](https://docs.ruby-lang.org/en/3.2/Hash.html)

#### [Symbols as hash keys](https://www.theodinproject.com/lessons/ruby-hashes#symbols-as-hash-keys) 

In this lesson, we mostly used strings for hash keys, but in the real world, you’ll almost always see symbols (like `:this_guy`) used as keys. This is predominantly because symbols are far more performant than strings in Ruby, but they also allow for a much cleaner syntax when defining hashes. Behold the beauty:
```ruby
# 'Rocket' syntax
american_cars = { 
  :chevrolet => "Corvette",
  :ford => "Mustang",
  :dodge => "Ram"
}
# 'Symbols' syntax
japanese_cars = { 
  honda: "Accord",
  toyota: "Corolla",
  nissan: "Altima"
}
```

That last example brings a tear to the eye, doesn’t it? Notice that the hash rocket and the colon that represents a symbol have been mashed together. This unfortunately only works for symbols, though, so don’t try `{ 9: "value" }` or you’ll get a syntax error.

When you use the cleaner ‘symbols’ syntax to create a hash, you’ll still need to use the standard symbol syntax when you’re trying to access a value. In other words, regardless of which of the above two syntax options you use when creating a hash, they both create symbol keys that are accessed the same way.
```ruby
american_cars[:ford]    #=> "Mustang"
japanese_cars[:honda]   #=> "Accord"
```
#### [Iterating Over Hashes](https://launchschool.com/books/ruby/read/hashes#iteratingoverhashes) 
Because hashes can have multiple elements in them, there will be times when you'll want to iterate over a hash to do something with each element. Iterating over hashes is similar to iterating over arrays with some small differences. We'll use the `each` method again and this time we'll create a new file to test this out.
```ruby
# iterating_over_hashes.rb

person = {name: 'bob', height: '6 ft', weight: '160 lbs', hair: 'brown'}

person.each do |key, value| 
  puts "Bob's #{key} is #{value}"
end
```

We use the `each` method like before, but this time we assign a variable to both the key and the value. In this example we are setting the key to the `key` variable and the value to the `value` variable. Run this program at the command line with `ruby iterating_over_hashes.rb` to see the results. The output is:
```irb
Bob's name is bob
Bob's height is 6 ft
Bob's weight is 160 lbs
Bob's hair is brown
```
#### [Hashes as Optional Parameters](https://launchschool.com/books/ruby/read/hashes#hashesasoptionalparameters) 
You may recall in chapter three on methods, we talked about the ability to assign default parameters to your methods so that the output is always consistent. You can use a hash to accept optional parameters when you are creating methods as well. This can be helpful when you want to give your methods some more flexibility and expressivity. More options, if you will! Let's create a method that does just that.

Copy Code

```ruby
# optional_parameters.rb

def greeting(name, options = {}) 
  if options.empty? 
    puts "Hi, my name is #{name}"
  else 
    puts "Hi, my name is #{name} and I'm #{options[:age]}" + 
         " years old and I live in #{options[:city]}."
  end
end

greeting("Bob")
greeting("Bob", {age: 62, city: "New York City"})
```

We used Ruby hash's `empty?` method to detect whether the options parameter, which is a hash, had anything passed into it. You haven't seen this method yet but you can infer what it does. You could also check out the [Ruby Docs](https://docs.ruby-lang.org/en/3.2/Hash.html#method-i-empty-3F) to look up the method as well. At the end we called the method twice. Once using no optional parameters, and a second time using a hash to send the optional parameters. You can see how using this feature could make your methods much more expressive and dynamic.

And finally, to add a small twist, you can also pass in arguments to the `greeting` method like this:
```ruby
greeting("Bob", age: 62, city: "New York City")
```

Notice the curly braces, `{ }`, are not required when a hash is the last argument, and the effect is identical to the previous example. This convention is commonly used by Rails developers. Understanding this concept alone should help you decipher some previously cryptic Rails code! ^pk4xrj
#### [Common Hash Methods](https://launchschool.com/books/ruby/read/hashes#commonhashmethods)

##### [key?](https://launchschool.com/books/ruby/read/hashes#key) 

The `key?` method allows you to check if a hash contains a specific key. It returns a boolean value.
```irb
irb :001 > name_and_age = { "Bob" => 42, "Steve" => 31, "Joe" => 19}
=> {"Bob"=>42, "Steve"=>31, "Joe"=>19}
irb :002 > name_and_age.key?("Steve")
=> true
irb :003 > name_and_age.key?("Larry")
=> false
```

##### [select](https://launchschool.com/books/ruby/read/hashes#select)

The `select` method allows you to pass a block and will return any key-value pairs that evaluate to true when passed to the block.
```ruby
irb :004 > name_and_age.select { |k,v| k == "Bob" }
=> {"Bob"=>42}
irb :005 > name_and_age.select { |k,v| (k == "Bob") || (v == 19) }
=> {"Bob"=>42, "Joe"=>19}
```

##### [fetch](https://launchschool.com/books/ruby/read/hashes#fetch) 

The `fetch` method allows you to pass a given key and it will return the value for that key if it exists. You can also specify an option for return if that key is not present. Take a look at the Ruby docs [here](https://docs.ruby-lang.org/en/3.2/Hash.html#method-i-fetch) to see what else is possible.
```irb
irb :006 > name_and_age.fetch("Steve")
=> 31
irb :007 > name_and_age.fetch("Larry")
=> KeyError: key not found: "Larry" 
     from (irb):32:in `fetch'
     from (irb):32
     from /usr/local/rvm/rubies/ruby-2.5.3/bin/irb:16:in `<main>'
irb :008 > name_and_age.fetch("Larry", "Larry isn't in this hash")
=> "Larry isn't in this hash"
```

##### [to_a](https://launchschool.com/books/ruby/read/hashes#to_a) 

The `to_a` method returns an array version of your hash when called. Let's see it in action. It doesn't modify the hash permanently though.

```irb
irb :009 > name_and_age.to_a
=> [["Bob", 42], ["Steve", 31], ["Joe", 19]]
irb :010 > name_and_age
=> {"Bob"=>42, "Steve"=>31, "Joe"=>19}
```

##### [keys and values](https://launchschool.com/books/ruby/read/hashes#keysandvalues) 

Finally, if you want to just retrieve all the keys or all the values out of a hash, you can do so very easily:
```irb
irb :0011 > name_and_age.keys
=> ["Bob", "Steve", "Joe"]
irb :0012 > name_and_age.values
=> [42, 31, 19]
```

Notice that the returned values are in array format. Because it's returning an array, you can do interesting things like printing out all the keys in a hash: `name_and_age.keys.each { |k| puts k }`.
### [Methods](https://www.theodinproject.com/lessons/ruby-methods)    
As you read more about Ruby methods, you’ll notice that the terms “methods” and “functions” are often used interchangeably. What’s the difference? According to [The Ruby Programming Language](https://www.amazon.com/dp/0596516177/?tag=stackoverfl08-20) book:

> Many languages distinguish between functions, which have no associated object, and methods, which are invoked on a receiver object. Because Ruby is a purely object-oriented language, all methods are true methods and are associated with at least one object.

Basically, because everything in Ruby is an object, Ruby only has methods, not functions. With that established, we know that when we’re talking about Ruby, “methods” and “functions” refer to the same thing.

#### [Ruby’s built-in methods](https://www.theodinproject.com/lessons/ruby-methods#rubys-built-in-methods) 

One of Ruby’s great advantages for new programmers is its large number of built-in methods. You’ve been using many of them already, probably without even realizing it. Over the course of your learning so far, you have modified strings and other objects in various ways. For example, the [`#times`](https://docs.ruby-lang.org/en/3.2/Integer.html#method-i-times) and [`#upto`](https://docs.ruby-lang.org/en/3.2/Integer.html#method-i-upto) loops that you learned about in the Loops lesson are both methods that are included as part of Ruby’s [`Integer`](https://docs.ruby-lang.org/en/3.2/Integer.html) class.

If you’re wondering about all of the pound signs (`#`), they’re just [the convention](https://stackoverflow.com/questions/736120/why-are-methods-in-ruby-documentation-preceded-by-a-hash-sign) for writing out Ruby instance methods. We can use them to write out the full name of an instance method, e.g., `Integer#upto`, or just the method name, e.g., `#upto`, depending on the context. Note that in the development world, you shouldn’t call these [“hashtags”](https://help.x.com/en/using-twitter/how-to-use-hashtags). If you want to be super awesome, though, you can call them [“octothorpes”](https://en.wiktionary.org/wiki/octothorpe). That word is totally trending.

Methods are typically called by adding `.method_name` after an instance of the object that contains that method.
```ruby
"anything".reverse
```

In this case, [`#reverse`](https://docs.ruby-lang.org/en/3.2/String.html#method-i-reverse) is a built-in method for [String](https://docs.ruby-lang.org/en/3.2/String.html) objects.

However, there are also some built-in methods that Ruby makes globally accessible, such as `print` and `puts`. These methods are called with just their name and any arguments. (If you’re super curious, these methods are made globally available by the [Kernel module](https://docs.ruby-lang.org/en/3.2/Kernel.html) through the [Object class](https://docs.ruby-lang.org/en/3.2/Object.html), but that’s far more than you need to know right now.)
```ruby
puts "anything" #=> anything
```

It’s worth noting that in most languages, arguments are passed to methods by wrapping them in parentheses `()`. In Ruby, however, the parentheses are _generally_ optional. We could rewrite the above code as `puts("anything")`, which Ruby would interpret in the same way.

#### [Creating a method](https://www.theodinproject.com/lessons/ruby-methods#creating-a-method)  

You can create your own custom methods in Ruby using the following syntax:
```ruby
def my_name 
  "Joe Smith"
end

puts my_name    #=> "Joe Smith"
```

Let’s break this example down:
- `def` is a built-in keyword that tells Ruby that this is the start of a method definition.
- `my_name` is the name of your new method. You can name your methods almost anything you want, but there are some constraints and conventions, which are described in the next section.
- `"Joe Smith"` is the code inside the method body. All of the logic for your method is contained in the indented lines of the method body. This particular method returns a string when the method is called.
- `end` is a built-in keyword that tells Ruby that this is the end of the method definition.
- To call the method, you need to use its name, as shown in the last line of the example.

#### [Method names](https://www.theodinproject.com/lessons/ruby-methods#method-names)  

As mentioned above, you can name your methods almost anything you want, but you shouldn’t pick names haphazardly. There are certain conventions that are recommended in order to improve the readability and maintainability of your code.

Your method names can use numbers, capital letters, lowercase letters, and the special characters `_`, `?`, `!`, and `\=`. Just like with variable names in Ruby, the convention for a method name with multiple words is to use **snake_case**, separating words with underscores.

It’s good practice to start the method name with a lower-case character, because names that start with capital letters are constants in Ruby. Check [here](https://stackoverflow.com/questions/10542354/what-are-the-restrictions-for-method-names-in-ruby) for more details.

Here are some things you are not allowed to do with your method names:

- You cannot name your method one of Ruby’s approximately 40 reserved words, such as `end`, `while`, or `for`. Checkout the full list [here](http://www.java2s.com/Code/Ruby/Language-Basics/Rubysreservedwords.htm).
- You cannot use any symbols other than `_`, `?`, `!`, and `\=`.
- You cannot use `?`, `!`, or `\=` anywhere other than at the end of the name.
- You cannot begin a method name with a number.

Here are some examples of valid and invalid method names:
```ruby
method_name      # valid
_name_of_method  # valid
1_method_name    # invalid
method_27        # valid
method?_name     # invalid
method_name!     # valid
begin            # invalid (Ruby reserved word)
begin_count      # valid
```

Can you tell why some of these names are invalid?

In general, short but descriptive is the name of the naming game. You want to be able to tell what a method is expected to do based on its name, so please don’t name your method `do_stuff`.

If your method does so many things that you feel it requires a very long name, then your method should probably be broken up into several smaller and simpler methods. Ideally, each method should do only one thing. This practice will pay dividends down the road in terms of readability, scalability, and maintainability. (It also makes testing your code a lot easier, which will be covered in a later lesson.)

#### [Parameters and arguments](https://www.theodinproject.com/lessons/ruby-methods#parameters-and-arguments)  

Of course, not all methods are as basic as the `my_name` example method above. After all, what good are methods if you can’t interact with them? When you want to return something other than a fixed result, you need to give your methods parameters. **Parameters** are variables that your method will receive when it is called. You can have more meaningful and useful interactions with your methods by using parameters to make them more versatile.
```ruby
def greet(name) 
  "Hello, " + name + "!"
end

puts greet("John") #=> Hello, John!
```

In this example, `name` is a parameter that the `greet` method uses to return a more specific greeting. The method was called with the argument `"John"`, which returns the string “Hello John!”

If you’re wondering what the differences are between an argument and a parameter, **parameters** act as placeholder variables in the template of your method, whereas **arguments** are the actual variables that get passed to the method when it is called. Thus, in the example above, `name` is a parameter and `"John"` is an argument. The two terms are commonly used interchangeably, though, so don’t worry too much about this distinction.

##### **Default parameters** 

What if you don’t always want to provide arguments for each parameter that your method accepts? That’s where default parameters can be useful. Going back to our example above, what happens if we don’t know the person’s name? We can change our `greet` method to use a default `name` of “stranger”:
```ruby
def greet(name = "stranger") 
  "Hello, " + name + "!"
end

puts greet("Jane") #=> Hello, Jane!
puts greet #=> Hello, stranger!
```

#### [What methods return](https://www.theodinproject.com/lessons/ruby-methods#what-methods-return)  

An important detail that a programmer must learn is understanding what your methods **return**. Having a good understanding of what your methods are returning is an important part of debugging your code when things don’t behave as expected.

How do we tell our methods what to return? Let’s revisit our `my_name` example method:
```ruby
def my_name 
  "Joe Smith"
end

puts my_name #=> "Joe Smith"
```

Our `my_name` method returns “Joe Smith”. This may seem obvious because it’s the only thing inside the method. In most languages, however, such a method would not return anything because it does not have an **explicit return** statement, which is a statement that starts with the `return` keyword. The above example could just as easily be written with an explicit return:
```ruby
def my_name 
  return "Joe Smith"
end

puts my_name #=> "Joe Smith"
```

Ruby is one of the few languages that offers **implicit return** for methods, which means that a Ruby method will return the last expression that was evaluated even without the `return` keyword. The last expression that was evaluated may or may not be the last line in the code, as you can see in the following example:
```ruby
def even_odd(number) 
  if number % 2 == 0 
    "That is an even number."
  else 
    "That is an odd number."
  end
end

puts even_odd(16) #=>  That is an even number.
puts even_odd(17) #=>  That is an odd number.
```

Here, the method’s return is dependent on the result of the `if` condition. If the argument is an even number, the expression inside the `else` statement never gets evaluated, so the `even_odd` method returns `"That is an even number."`

Even though Ruby offers the ease of using implicit returns, explicit returns still have a place in Ruby code. An explicit return (using the keyword `return`) essentially tells Ruby, “This is the last expression you should evaluate.” This example shows how using `return` stops the method from continuing:
```ruby
def my_name 
  return "Joe Smith"
  "Jane Doe"
end

puts my_name #=> "Joe Smith"
```

For example, an explicit return can be useful when you want to write a method that checks for input errors before continuing.
```ruby
def even_odd(number) 
  unless number.is_a? Numeric 
    return "A number was not entered."
  end

  if number % 2 == 0 
    "That is an even number."
  else 
    "That is an odd number."
  end
end

puts even_odd(20) #=>  That is an even number.
puts even_odd("Ruby") #=>  A number was not entered.
```

Now, try removing the explicit `return` from the method above. Does the method return what you expected?

##### **Difference between `puts` and `return`** 

A common source of confusion for new programmers is the difference between `puts` and `return`.

- `puts` is a method that prints whatever argument you pass it to the console.
- `return` is the final output of a method that you can use in other places throughout your code.

For example, we can write a method that calculates the square of a number and then `puts` the output to the console.
```ruby
def puts_squared(number) 
  puts number * number
end
```

This method only prints the value that it calculated to the console, but it doesn’t return that value. If we then write `x = puts_squared(20)`, the method will print `400` in the console, but the variable `x` will be assigned a value of `nil`. (If you need a refresher on this, go back and review the Ruby Input and Output lesson.)

Now, let’s write the same method but with an implicit return instead of `puts`. (Using an explicit return will act exactly the same in this example.)
```ruby
def return_squared(number) 
  number * number
end
```

When we run the `return_squared` method, it won’t print any output to the console. Instead, it will `return` the result in a way that allows it to be used in the rest of your code. We can save the output of running this method in a variable (`x` in the code below) and use that variable in a variety of ways. If we would still like to see the result of the method in the console, we can `puts` that variable to the console using string interpolation.
```ruby
x = return_squared(20) #=> 400
y = 100
sum = x + y #=> 500

puts "The sum of #{x} and #{y} is #{sum}."
#=> The sum of 400 and 100 is 500.
```

#### [Chaining methods](https://www.theodinproject.com/lessons/ruby-methods#chaining-methods)  

One of the magical properties of methods that allows you to write very concise code is being able to **chain methods** together. This can be done using Ruby’s built-in methods or with methods that you create.
```ruby
phrase = ["be", "to", "not", "or", "be", "to"]

puts phrase.reverse.join(" ").capitalize
#=> "To be or not to be"
```

Chaining methods together like this effectively has each method call build off of the outcome of the previous method in the chain. The process that takes place essentially produces the following steps:
```ruby
["be", "to", "not", "or", "be", "to"].reverse
= ["to", "be", "or", "not", "to", "be"].join(" ")
= "to be or not to be".capitalize
= "To be or not to be"
```

##### [Chaining, puts vs. return](https://launchschool.com/books/ruby/read/methods#chainingmethods) 
```irb
8                # This is the output
=> nil           # This is the return value!
```

Notice that it prints the incremented value as expected, but the _return_ value is `nil`. It turns out that `puts` always returns `nil`. Since `puts n + 3` is the last expression in the method definition, `add_three` returns `nil` . We can now no longer use `add_three` to keep chaining methods since it returns `nil`.

This is a very important aspect of chaining methods together: if anywhere along the chain, there's a `nil` return value or an exception is thrown, the entire chained call will break down. If we want the `add_three` method to print the incremented value as well as return it, we have to make this fix:

```ruby
def add_three(n) 
  new_value = n + 3
  puts new_value
  new_value
end
```

We could use `return new_value` as well, but since `new_value` is the last expression in the method definition, it's being implicitly returned.

#### [Method Calls as Arguments](<#### https://launchschool.com/books/ruby/read/methods#methodcallsasarguments>)   

Now let's call these methods by passing integer values:
```ruby
add(20, 45)
=> 65
# returns 65

subtract(80, 10)
=> 70
# returns 70
```

What is less obvious is that Ruby actually allows us to pass a method call as an argument to other methods. Stated differently, we're saying we can pass `add(20, 45)` and `subtract(80, 10)` as arguments to another method.

Remember that these method calls return integer values which is what allows us to perform such an operation. In other words, the returned value is what is being passed as arguments. We'll illustrate by defining a `multiply` method:
```ruby
def multiply(num1, num2) 
  num1 * num2
end
```

Now, let's pass `add(20, 45)` and `subtract(80, 10)` as arguments to `multiply`:
```ruby
multiply(add(20, 45), subtract(80, 10))
=> 4550
# returns 4550
```

Let's see a more complicated example:
```ruby
add(subtract(80, 10), multiply(subtract(20, 6), add(30, 5)))
=> 560
```

Let's break down what this is doing:
- First, we're passing `add` two arguments: `subtract(80, 10)` and `multiply(subtract(20, 6), add(30, 5))`.
- The first argument, the `subtract` method call, returns `70`.
- The second argument, the `multiply` method call, furthermore has two arguments: `subtract(20, 6)` and `add(30, 5)`. 
    - Here, `subtract(20, 6)` returns `14` and `add(30, 5)` returns `35` thus the method call becomes `multiply(14, 35)`. Evaluating `multiply(14, 35)` now returns `490`.
- Finally, putting together the return values of those two method calls, we have `add(70, 490)` which ultimately returns `560`.

***One very important thing to be aware of when using nested method calls is the use of parentheses to prevent any kind of confusion.***  ^j3zqfr

We've seen that method calls always return a value and we can pass that method call as an argument to another method call based on the returned value. Thus it's vital to know what our defined methods are returning, since in the final analysis, this is what is actually being passed as arguments to other method calls.

#### How to initialize a New Object
This is covered here: [[notes/programming/programming.OOP#Instance Variables https launchschool com books oo_ruby read classes_and_objects_part1 instancevariables|Initializing a New Object]]

#### Accessor Methods
This is covered here: [[notes/programming/programming.OOP#[Accessor Methods](https //launchschool.com/books/oo_ruby/read/classes_and_objects_part1 accessormethods)|Accessor Methods]]

![[notes/programming/programming.OOP#^ltyno8]]

:LiArrowUpCircle: See there for `attr_reader` and `attr_writer`.

#### Accessor Methods in Action
Covered here: [[notes/programming/programming.OOP#Accessor Methods in Action https launchschool com books oo_ruby read classes_and_objects_part1 accessormethodsinaction|Accessor Methods in Action]]

#### Calling methods with `self.`
Covered here: [[notes/programming/programming.OOP#Calling Methods With self https launchschool com books oo_ruby read classes_and_objects_part1 callingmethodswithself|Calling methods with self]]

#### [Predicate methods](https://www.theodinproject.com/lessons/ruby-methods#predicate-methods)  

You will sometimes encounter built-in Ruby methods that have a question mark (`?`) at the end of their name, such as `even?`, `odd?`, or `between?`. These are all **predicate** methods, which is a naming convention that Ruby uses for methods that return a Boolean, that is, they return either `true` or `false`.
```ruby
puts 5.even?  #=> false
puts 6.even?  #=> true
puts 17.odd?  #=> true

puts 12.between?(10, 15)  #=> true
```

You can also create your own method with a `?` at the end of its name to indicate that it returns a Boolean. Ruby doesn’t enforce this naming convention, but you will thank yourself later for following this guideline.  ^2qa9jg

#### [Bang methods](https://www.theodinproject.com/lessons/ruby-methods#bang-methods)  

Observe the example below:
```ruby
whisper = "HELLO EVERYBODY"

puts whisper.downcase #=> "hello everybody"
puts whisper #=> "HELLO EVERYBODY"
```

What gives? We thought we downcased that thing! So why was it back to all uppercase when we called it again?

When we call a method on an object, such as our `whisper` string above, it does not modify the original value of that object. A general rule in programming is that you do not want your methods to overwrite the objects that you call them on. This protects you from irreversibly overwriting your data by accident. You _are_ able to overwrite your data by explicitly re-assigning a variable (such as `whisper = whisper.downcase`). Another way to do this type of reassignment is with **bang methods**, which are denoted with an exclamation mark (`!`) at the end of the method name.

By adding a `!` to the end of your method, you indicate that this method performs its action and simultaneously overwrites the value of the original object with the result.
```ruby
puts whisper.downcase! #=> "hello everybody"
puts whisper #=> "hello everybody"
```

Writing `whisper.downcase!` is the equivalent of writing `whisper = whisper.downcase`.

#### [Writing Methods](https://ruby-for-beginners.rubymonstas.org/writing_methods.html): Ruby for Beginners 

Everything in programming is about data, and doing interesting things with it. If you think about Twitter, it essentially takes 140 characters of text (which is data) from their users and displays it to others.

You have already learned about the most important primitive (simple) types of data in Ruby: numbers, strings, true, false and nil. And we’ve had a look at the two most common data structures, Arrays and Hashes.

All of this is about the _data_ part. Methods on the other hand are about the _doing interesting things_ part.

##### Methods define behavior 

Methods are all about defining _behavior_, so that they can be applied to different bits of data in different contexts easily.

Another way of putting this is: Methods are a way of assigning a name to a certain piece of code. Just like a variable allows to “look up” or refer to the object that the name was assigned to … methods allow to execute their code.

> [!NOTE]
> Variables name things, methods name behavior (code).

Methods make code re-usable, by the way of packaging (“encapsulating”) code and sticking a name on it.

##### Defining a method  

Suppose we need to define a simple method that takes a number, adds the number `2` to it, and returns the result. Here’s how we can do that:
```ruby
def add_two(number) 
  number + 2
end
```

This _defines_ a method. It does not _use_ it, yet: You only build and place that [vending machine](https://arc.net/l/quote/xcqbuxix), so it can be used (by yourself, or others) later.

Let’s walk through this method definition step by step:

Ruby will start reading the code at the top, and find the keyword `def`. This tells Ruby that we’re about to define a new method.

Methods need a name, so Ruby looks for it next, and finds the word `add_two`.

Ruby then checks if we define anything to “input” to the method (remember, this is optional). She finds the parentheses, and knows that we’re about to define a list of things that can be given to the method. This list is called an _argument list_.

> [!NOTE]
> An argument list defines names for objects passed to the method, enclosed by parentheses right after the method name.

In our case the argument list has one single argument `number`, which means our method can accept one single thing (object).

The next line is the block of code that our method has (“encapsulates”). This is also referred to as the _method body_. In our case that’s just one single line because the operation that our method encapsulates is very simple. Other methods (think of `sort`, defined on Arrays) would require more code, and are longer.

Inside the method body the arguments are known as local variables: You can see how the code in our method body uses the variable name `number`.

Finally the keyword `end` tells Ruby that we’re done with the method body, and the method definition.

All we’ve done so far is defining the method, we haven’t used it for anything, yet. We’ll do that in the next chapter.

> [!NOTE]
> On formatting: Note that the keywords `def` and `end` sit on the same level, while the method body is indented by two spaces. Also, there are no space before or inside the argument list, i.e. the `()` parentheses.

##### printing things 

So far, we have mostly used the method `puts` to do that.

However, there’s another method that is even more useful when we are trying to figure out what a program is doing, why it is doing it, and what a certain error might be about.

This method is the method `p`. In order to understand `p` better, we want to look at another method first, which is the method `inspect`.

The method `inspect` is available on any object in Ruby. It returns a string that is a representation of the object itself: a representation that is as close as possible to the code that you use to create the object. So `inspect` is useful to inspect objects, duh :)

This becomes more clear when you try it in IRB:
```
$ irb
> puts 5.inspect
5

> puts "A string".inspect
"A string"

> puts [1, 2, 3].inspect
[1, 2, 3]
```

As you can see the string returned from `inspect` is exactly the same as the Ruby code that we used to create the object. That is really convenient.

However, typing `puts something.inspect` is quite a bit of work to do. That’s 12 characters to type next to the object itself!

Therefore Ruby has a method to make our lives easier, and does this work for us. That’s the method `p`. <- The p method.

This method is implemented like so:
```ruby
def p(object) 
  puts object.inspect
end
```

Whenever you are trying to figure out what a certain line of code does, what’s assigned to a variable, or what a method call returns, we recommend to use `p` because it tells you exactly what the thing that you are looking at is.

`puts` on the other hand tries to be smart.

For example when you pass an array to `puts` then it will output each of the objects on a separate line:
```ruby
$ irb
> something = [1, 2, 3]
> puts something
1
2
3
```

Also, the output for numbers and strings that contain numbers is exactly the same when you use `puts`:

```ruby
$ irb
> puts 123
123
> puts "123"
123
```

From the output of `puts` it often is not clear whether the object that you are looking it is an array that contains numbers, or an array that contains strings, or just a long string that contains linebreaks.

In short, `puts` is useful when you are writing a program that is supposed to actually output something to the screen. Like, this could be a command line tool that you write in order to make your own life easier at your job, and that is helpful at automating some repetitive work. Or it is useful in Ruby programming exercises :)

On the other hand `p` is useful when you are trying to understand what your code does, e.g. when you are trying to figure out a certain error.
#### [The Call Stack](https://launchschool.com/books/ruby/read/methods#callstack): Launch School  

One important aspect of methods that all programmers need to understand is the concept of the **call stack**, or more casually, the **stack**.

The call stack helps Ruby keep track of what method is executing as well as where execution should resume when it returns. To do that, it works like a stack of books: if you have a stack of books, you can put a new book on the top or remove the topmost book from the stack. In much the same way, the call stack puts information about the current method on the top of the stack, then removes that information when the method returns.

In Ruby, methods aren't the only thing that uses the call stack. Blocks, procs, and lambdas also use the call stack; in fact, they all use the same call stack as Ruby uses for methods. For simplicity, we will usually just mention methods when discussing the call stack. However, you should always remember that blocks, procs, and lambdas are also part of this process.

Let's assume that we have the following code:
```ruby
def first 
  puts "first method"
end

def second 
  first
  puts "second method"
end

second
```

When this program starts running, the call stack initially has one item -- called a **stack frame** -- that represents the global (top-level) portion of the program. The initial stack frame is sometimes called the `main` method. Ruby uses this frame to keep track of what part of the main program it is currently working on.

|Call Stack|
|---|
|-|
|-|
|-|
|main|

When program execution reaches the method invocation on line 10, it first updates the `main` stack frame with the current program location. Ruby will use this location later to determine where execution should resume when `second` finishes running.

After setting the location in the current stack frame, Ruby creates a new stack frame for the `second` method and places it on the top of the call stack: we say that the new frame is **pushed** onto the stack. Our call stack now looks like this:

|Call Stack|
|---|
|-|
|-|
|second|
|main: line 10|

Note that the frame for the `second` method is now _stacked_ on top of the `main` frame. While the `second` frame is still on the stack, `main` remains stuck beneath it, inaccessible. At the same time, the `main` method becomes dormant and the `second` method becomes active.

The `second` method calls the `first` method on line 6. That action causes Ruby to update the `second` frame so that Ruby will know where to resume execution later. It then creates a new stack frame for the `first` method and pushes it to the call stack.

|Call Stack|
|---|
|-|
|first|
|second: line 6|
|main: line 10|

Once the `first` method begins executing, it invokes the `puts` method. All Ruby methods, including the built-in ones like `puts`, share the same call stack. Therefore, we need to record our current location and then push a new frame to the stack:

|Call Stack|
|---|
|puts|
|first: line 2|
|second: line 6|
|main: line 10|

Chances are, `puts` also has several internal method calls. However, we will ignore them and just assume that `puts` does all its work without any additional method calls. Instead, it just logs the message `first method` to the console, then immediately returns.

When `puts` returns, Ruby removes -- **pops** -- the top frame from the call stack. That's the frame for `puts` in this example. That leaves the previous stack frame exposed. Ruby uses this frame to determine where execution should resume. In this case, execution resumes immediately after line 2.

|Call Stack|
|---|
|-|
|first: line 2|
|second: line 6|
|main: line 10|

Eventually, the `first` method will return. When that happens, the `first` frame gets popped from the stack. That exposes the stack frame for `second`, and that, in turn, tells Ruby that it should resume execution on line 6.

|Call Stack|
|---|
|-|
|-|
|second: line 6|
|main: line 10|

Next, execution jumps to the `puts` call on line 7. Like before, the current location is recorded and a new frame is pushed to the stack:

|Call Stack|
|---|
|-|
|puts|
|second: line 7|
|main: line 10|

When this `puts` call returns, the stack frame gets popped and execution returns to `second`.

|Call Stack|
|---|
|-|
|-|
|second: line 7|
|main: line 10|

When `second` finishes executing, the stack frame for `second` gets popped from the call stack, exposing the stack frame for `main`. The `main` frame tells Ruby to resume execution on line 10.

|Call Stack|
|---|
|-|
|-|
|-|
|main: line 10|

Eventually, the `main` method has no more code to run. When this happens, the `main` frame gets popped from the stack, and the program ends.

|Call Stack|
|---|
|-|
|-|
|-|
|-|

> [!NOTE]
> The call stack has a limited size that varies based on the Ruby implementation. That size is usually sufficient for more than 10000 stack entries. If the stack runs out of room, you will see a `SystemStackError` exception.

### [Basic Ruby methods](https://www.theodinproject.com/lessons/ruby-arrays#basic-methods)    

Ruby gives you many methods to manipulate arrays and their contents (over 150!), many of which are beyond the scope of this lesson. To learn about other methods, go to the official documentation ([docs.ruby-lang.org](https://docs.ruby-lang.org/en/3.2/)) and browse the [Array](https://docs.ruby-lang.org/en/3.2/Array.html) page, where you can find methods listed alphabetically (by scrolling the left sidebar) or summarized and grouped by purpose (by reading under “[What’s Here](https://docs.ruby-lang.org/en/3.2/Array.html#class-Array-label-What-27s+Here)”).

Calling the `#methods` method on an array will also yield a long list of the available methods.
```ruby
num_array.methods       #=> A very long list of methods
```

Here is a brief look at some other common array methods you might run into:
```ruby
[].empty?               #=> true
[[]].empty?             #=> false
[1, 2].empty?           #=> false

[1, 2, 3].length        #=> 3

[1, 2, 3].reverse       #=> [3, 2, 1]

[1, 2, 3].include?(3)   #=> true
[1, 2, 3].include?("3") #=> false

[1, 2, 3].join          #=> "123"
[1, 2, 3].join("-")     #=> "1-2-3"
```

### [debugging](https://www.theodinproject.com/lessons/ruby-debugging)
#### [Reading the stack trace](https://www.theodinproject.com/lessons/ruby-debugging#reading-the-stack-trace) 

When your Ruby program crashes after encountering a runtime error or exception, it will produce a wall of text known as a **stack trace** that is then output in your terminal. A stack trace looks something like this:
![Sample stack trace](https://cdn.statically.io/gh/TheOdinProject/curriculum/a2cfa47e944fa8127ccf5faa6e1c7c328de42428/ruby/basic_ruby/debugging/imgs/00.png)
Don’t let the stack trace intimidate you. You don’t need to read it all or even know what most of it means.

The stack trace prints each line of code in your program that was executed before it crashed. The very first line of the stack trace will generally provide the most useful information about the error your program encountered:
![First line of stack trace](https://cdn.statically.io/gh/TheOdinProject/curriculum/a2cfa47e944fa8127ccf5faa6e1c7c328de42428/ruby/basic_ruby/debugging/imgs/01.png)

First, this line of the stack trace will tell you what specific line caused the runtime error. In the above example, the error was encountered in line 31 of the file `bottles.rb`. This line also provides a brief explanation of the error and the name of the error. (In this case, it’s a [`NameError`](https://docs.ruby-lang.org/en/3.2/NameError.html)). And yes, in Ruby, [errors](https://docs.ruby-lang.org/en/3.2/Exception.html) are _also_ objects.

There you have it. At this point, you know where in your code the exception is being raised, and you know the type of error you’re dealing with. You might even know what fixes need to be implemented in your code.

But what if you don’t know how to fix your code? Then it’s time to dive into debugging!

#### [Debugging with puts](https://www.theodinproject.com/lessons/ruby-debugging#debugging-with-puts) 

The debugging process is all about confirming assumptions about your code until you find something that goes against your assumptions. For example, does a variable or method return what you expect? Does a calculation or iteration over an array or hash give the output you expect?

The easiest and quickest way to confirm your assumptions while debugging is by using `puts` statements to output the return value of variables, methods, calculations, iterations, or even entire lines of code to your terminal.

Let’s say that for _whatever_ reason, we need to write a method that takes a string and checks if the string is an **isogram** (a word that has no repeating letters) or not. Perhaps it’s a hostage situation that requires a pro debugger? Let’s take a look at a first draft:
```ruby
def isogram?(string) 
  original_length = string.length
  string_array = string.downcase.split
  unique_length = string_array.uniq.length
  original_length == unique_length
end

isogram?("Odin")

#=> false
```

Okay, that didn’t work. We didn’t expect that. Why? Because the string _Odin_ is an isogram but we got `false`. The method didn’t throw an exception, so we don’t even have a line to start debugging at. Now what?

We know that `original_length == unique_length` returns `false` since it’s the last statement, so why not place a `puts` on the line before that to see what `unique_length` is. As an alternative to `puts`, `p` is also commonly used for debugging; `p` is a combination of `puts` and `inspect` (more on that below). To better show the differences between what Ruby is printing to the terminal and returning, the examples in this section use the full IRB syntax, which is exactly what you’d see if you typed these commands into your own terminal IRB session.

```ruby
irb(main):001:1* def isogram?(string)
irb(main):002:1*   original_length = string.length
irb(main):003:1*   string_array = string.downcase.split
irb(main):004:1*   unique_length = string_array.uniq.length
irb(main):005:1*
irb(main):006:1*   p unique_length
irb(main):007:1*
irb(main):008:1*   original_length == unique_length
irb(main):009:0> end
=> :isogram?
irb(main):010:0> isogram?("Odin")
1
=> false
```

_INTERESTING_. Using `p` on `unique_length` prints it to the console and shows us something must be wrong with how we called `#uniq` on `string_array` because we know that we have `4` unique characters in our input but we got `1` as output. For verification, let’s place another `p` statement before the `unique_length` statement:
```ruby
irb(main):001:1* def isogram?(string)
irb(main):002:1*   original_length = string.length
irb(main):003:1*   string_array = string.downcase.split
irb(main):004:1*
irb(main):005:1*   p string_array
irb(main):006:1*
irb(main):007:1*   unique_length = string_array.uniq.length
irb(main):008:1*
irb(main):009:1*   p unique_length
irb(main):010:1*
irb(main):011:1*   original_length == unique_length
irb(main):012:0> end
=> :isogram?
irb(main):013:0> isogram?("Odin")
["odin"]
1
=> false
```

Indeed, we didn’t use `#split` correctly, as this particular creates an array with the given string rather than creating an array of characters of the given string. Why? By default, if we didn’t provide arguments, [#split](https://docs.ruby-lang.org/en/3.2/String.html#method-i-split) will divide the string using `whitespace` as the delimiter. Try running the above code in a REPL or IRB using `#split('')` instead, and you’ll see the difference.

Hostage situation resolved! That wasn’t so bad, was it?

##### Debugging with `puts` and `nil` 

Using `puts` is a great way to debug, but there’s a **HUGE** caveat with using it: calling `puts` on anything that is `nil` or an empty string or collection will just print a blank line to your terminal.

This is one instance where using `p` will yield more information. As mentioned above, `p` is a combination of `puts` and [#inspect](https://docs.ruby-lang.org/en/3.2/Object.html#method-i-inspect), the latter of which essentially prints a string representation of whatever it’s called on. To illustrate this, try the following in a REPL:
```ruby
puts "Using puts:"
puts []
p "Using p:"
p []
```

#### [Debugging with Pry-byebug](https://www.theodinproject.com/lessons/ruby-debugging#debugging-with-pry-byebug) 

[Pry](https://github.com/pry/pry) is a Ruby gem that provides you with an interactive [REPL](https://www.rubyguides.com/2018/12/what-is-a-repl-in-ruby/) while your program is running. The REPL provided by Pry is very similar to IRB but has added functionality. The recommended Ruby gem for debugging is [Pry-byebug](https://github.com/deivid-rodriguez/pry-byebug) and it includes Pry as a dependency. Pry-byebug adds step-by-step debugging and stack navigation.

To use Pry-byebug, you’ll first need to install it in your terminal by running `gem install pry-byebug`. You can then make it available in your program by requiring it at the top of your file with `require 'pry-byebug'`. Finally, to use Pry-byebug, you just need to call `binding.pry` at any point in your program.

To follow along with these examples save the code into a Ruby file (e.g., `script.rb`) and then run the file in your terminal (e.g., `ruby script.rb`)
```ruby
require 'pry-byebug'

def isogram?(string) 
  original_length = string.length
  string_array = string.downcase.split

  binding.pry

  unique_length = string_array.uniq.length
  original_length == unique_length
end

isogram?("Odin")
```

When your code executes and gets to `binding.pry`, it will open an IRB-like session in your terminal. You can then use that session to check the values of anything within the scope of where you included `binding.pry`. However, keep in mind that any code written _after_ the `binding.pry` statement will not have been evaluated during the Pry session.

For example, here `original_length` and `string_array` are in scope. However, `unique_length` is not in scope, because it is written after `binding.pry` and has not been evaluated yet.

Thus, adding a `binding.pry` line in our code is similar to creating a breakpoint in JavaScript.

To see this point in action, try running the following:
```ruby
require 'pry-byebug'

def yell_greeting(string) 
  name = string

  binding.pry

  name = name.upcase
  greeting = "WASSAP, #{name}!"
  puts greeting
end

yell_greeting("bob")
```

During the session, if you check for the value of `name`, you will notice that you get back the value `bob` instead of `BOB`. What value do you think `greeting` will return? Yup, it will be `nil`. This is because `name = name.upcase` and `greeting = "WASSAP, #{name}!"` occurred after the `binding.pry` call and were never evaluated.

Using the same example above, you can use one of pry-byebug’s commands to figure out what `name = name.upcase` will return. You won’t need to quit the session or add another `binding.pry` beneath it. Enter `next` to step over to the next line.
```ruby
[1] pry(main)> name
=> "bob"
[2] pry(main)> greeting
=> nil
[3] pry(main)> next 

     5: def yell_greeting(string)
     6:   name = string
     7:
     8:   binding.pry
     9:
    10:   name = name.upcase
 => 11:   greeting = "WASSAP, #{name}!" 
    12:   puts greeting
    13: end

[4] pry(main)> name
=> "BOB"

```

It stops after evaluating the next line. `name` now returns `BOB`. Calling `next` again will evaluate the following line. Try it out to know what `greeting` will return. Pry-byebug has a few more commands, play around with them to get a feel of what they do. You can find the commands with a short description of what they do [here](https://github.com/deivid-rodriguez/pry-byebug).

As you can see, using Pry-byebug for debugging achieves the same outcome as `puts` debugging: it allows you to confirm the assumptions you have about particular parts of your code. If your code is complex, Pry-byebug will probably allow you to debug quicker thanks to its interactive runtime environment. In such scenarios, Pry-byebug will be easier to interact with than having to add `puts` statements everywhere and re-running your code each time.

There is far, far more that you can do with Pry-byebug, but that’s beyond the scope of this lesson. Check out the Assignments and Additional Resources to find out where you can learn more about this useful gem.

#### [How to start debugging](https://www.theodinproject.com/lessons/ruby-debugging#how-to-start-debugging) 

Programs generally go wrong due to two main reasons:
1. The program encounters an error and won’t run. For example, a typo may cause a syntax error to be raised that causes the program to crash. In this case, Ruby provides a stack trace. 
2. The program runs but does not work the way you expect. For example, you expect a method to return a `2`, but it actually returns `6` when you run it. In this case, there is no stack trace.

Obviously, if available, the stack trace is the first place you should look when debugging. If there’s no stack trace, then `puts` and Pry are the easiest and quickest tools you can use to get yourself back up and running.


#### RubyGuides: debugging 
```ruby
/tmp/stack.rb:6:in 'method2': undefined local variable or method 'invalid_variable' for main:Object (NameError) 
    from /tmp/stack.rb:2:in 'method1'
    from /tmp/stack.rb:9:in '<main>'
</main>
```
**Here’s the deal**:

| TEXT                                                      | DESCRIPTION          |
| :-------------------------------------------------------- | :------------------- |
| /tmp/**stack.rb**:6                                       | File and line number |
| in `**method2**‘                                          | Method name          |
| undefined local variable or method ‘**invalid_variable**‘ | Error message        |
| main:**Object**                                           | Class name           |
| (NameError)                                               | Exception name       |
By the way, you can find a [list of exceptions here](https://ruby-doc.org/core-2.4.1/Exception.html).

Every line in the stack trace below the first one tells you how the code got here.

It’s basically a method chain, if you keep going down you should eventually find the main method of your app.

Here is a general algorithm for dealing with a **stack trace**:
1. Read the top line of the stack trace
2. If the file is part of your project: open the faulting file on the indicated line number. If it isn’t, keep going down the stack trace until you find the first reference to a file you recognize
3. See if anything obvious jumps out to you and fix it (look for things mentioned on the error message)
4. If that doesn’t help then you will need to find more information, like the values of the affected variables.
##### Pry 
The power of pry doesn't end here. For example, you can use the `ls` command to see what methods and instance variables an object has access to. ^yxjzwm

What I like to do is to have a macro/snippet on my editor that already includes the require in the same line than the breakpoint, so when I delete it I will be deleting both things: ^0ts10l
```ruby
require 'pry'; binding.pry
```

##### gems 
Finally, if you are dealing with an issue that looks like it's coming from some external gem, an obvious step is to inspect the gem's source code.

You can use the **gem open** command to open the source code on your configured editor. 

### [Enumerable Methods](https://www.theodinproject.com/lessons/ruby-basic-enumerable-methods)

**Enumerables** are a set of convenient built-in methods in Ruby that are included as part of both arrays and hashes. There are some iteration patterns that you’ll find yourself doing again and again, such as transforming, searching for, and selecting subsets of elements in your collections. Enumerables were designed to make implementing these iteration patterns (and therefore your life as a developer) much, much easier.

We will run through the enumerable methods that you will most commonly use and see out in the wild. This is certainly not an exhaustive list, so be sure to have a look at the [Ruby docs](https://docs.ruby-lang.org/en/3.2/) to see what else the [Enumerable module](https://docs.ruby-lang.org/en/3.2/Enumerable.html) offers.

#### [Life before enumerables](https://www.theodinproject.com/lessons/ruby-basic-enumerable-methods#life-before-enumerables)   

Let’s say that you wanted to make an invite list for your birthday using your `friends` array but that you don’t want to invite your friend Brian because he’s a bit of a nutcase at parties and always drinks way too much.

With the loops you’ve learned so far, you might do something like this:
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = []

for friend in friends do 
  if friend != 'Brian'
  invited_list.push(friend)
  end
end

invited_list #=> ["Sharon", "Leo", "Leila", "Arun"]
```
_Warning:_ The **do** is optional in a for loop in Ruby and may cause issues if used in IRB

That’s not too hard, but imagine having to do that for every party you host from now until the end of time! It might be easier to just stop hanging out with Brian.

Using the `#select` enumerable method (which we’ll get into much more detail about later), you could change the above code to this:
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' } 
 #=> ["Sharon", "Leo", "Leila", "Arun"]
```

or even better and more to the point:
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.reject { |friend| friend == 'Brian' } 
 #=> ["Sharon", "Leo", "Leila", "Arun"]
```

You just cut down what was previously an 8 line program down to 2 lines. Amazing! Imagine all the time you’ll save sorting your invite lists now.

#### [The each method](https://www.theodinproject.com/lessons/ruby-basic-enumerable-methods#the-each-method)   

`#each` is the granddaddy of the enumerable methods. It’s a bit like Chuck Norris: it can do anything. As you’ll see throughout this lesson, though, just because you can use `#each` to do just about anything doesn’t mean it’s always the best or most efficient tool for the job.

Calling `#each` on an array will iterate through that array and will yield each element to a code block, where a task can be performed:
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| puts "Hello, " + friend }

#=> Hello, Sharon
#=> Hello, Leo
#=> Hello, Leila
#=> Hello, Brian
#=> Hello, Arun

#=> ["Sharon", "Leo", "Leila", "Brian" "Arun"]
```

Let’s break down this syntax:
- `friends` is the array that contains strings of your friends’ names.
- `.each` is the enumerable method you are calling on your `friends` array.
- `{ |friend| puts "Hello, " + friend }` is a **block**, and the code inside this block is run for each element in your array. Because we have 5 friends in our array, this block will be run 5 times, once with each of the 5 elements.
- Within the block, you’ll notice that we have `|friend|`, which is known as a **block variable**. This is the element from your array that the block is currently iterating over. You can use any variable name that you find helpful here; in this example, we could have used `|x|`, but `|friend|` is more descriptive of what each element is. In the first iteration, the value of `|friend|` will be `'Sharon'`; in the second iteration, its value will be `'Leo'`; in the third, `'Leila'`; and so on until it reaches the end of the array.

What if the block you want to pass to a method requires more logic than can fit on one line? It starts to become less readable and looks unwieldy. For multi-line blocks, the commonly accepted best practice is to change up the syntax to use `do...end` instead of `{...}`:
```ruby
my_array = [1, 2]

my_array.each do |num| 
  num *= 2
  puts "The new number is #{num}."
end

#=> The new number is 2.
#=> The new number is 4.

#=> [1, 2]
```

`#each` also works for hashes with a bit of added functionality. By default, each iteration will yield both the key and value individually or together (as an array) to the block depending on how you define your block variable:
```ruby
my_hash = { "one" => 1, "two" => 2 }

my_hash.each { |key, value| puts "#{key} is #{value}" }

one is 1
two is 2
#=> { "one" => 1, "two" => 2}

my_hash.each { |pair| puts "the pair is #{pair}" }

the pair is ["one", 1]
the pair is ["two", 2]
#=> { "one" => 1, "two" => 2}
```

You may have noticed in the above code examples that `#each` returns the original array or hash regardless of what happens inside the code block. This is an important thing to keep in mind when debugging your code as it can lead to some confusion.

Take this code as an example:
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| friend.upcase }

#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
```

You might expect this to return `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`, but you’d be wrong—dead wrong. It actually returns the original array you called `#each` on. You’re _still_ not invited, Brian.

#### [The each_with_index method](https://www.theodinproject.com/lessons/ruby-basic-enumerable-methods#the-eachwithindex-method)   

This method is nearly the same as `#each`, but it provides some additional functionality by yielding two **block variables** instead of one as it iterates through an array. The first variable’s value is the element itself, while the second variable’s value is the index of that element within the array. This allows you to do things that are a bit more complex.

For example, if we only want to print every other word from an array of strings, we can achieve this like so:
```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.each_with_index { |fruit, index| puts fruit if index.even? }

#=> apple
#=> strawberry
#=> ["apple", "banana", "strawberry", "pineapple"]
```

Just like with the `#each` method, `#each_with_index` returns the original array it’s called on.

#### [The map method](https://www.theodinproject.com/lessons/ruby-basic-enumerable-methods#the-map-method)    

> Map is a Ruby method that you can use with Arrays, Hashes & Ranges.
> 
> The main use for map is to TRANSFORM data. ([source](https://arc.net/l/quote/ngqdoheo))

`map` is also `collect`. they are the exact same method. `map` is more common in open-source projects. Just use `map`.

Remember when we tried to use `#each` to write all of your friends’ names in all caps? For reference, this is the code that we tried:
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| friend.upcase }

#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
```

As we can see, `#each` returns the original array, but that’s not what we want. WE WANT CAPS!

Let’s modify our `#each` code to get it to work:
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
shouting_at_friends = []

friends.each { |friend| shouting_at_friends.push(friend.upcase) }
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

shouting_at_friends #=> ['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']
```

It works! It took quite a bit of extra work, though. We had to introduce another array that could store the transformed elements. This code is starting to look more clunky and suspiciously like the `for` loop example in the first section that we’re trying to get away from.

Luckily, we have the `#map` enumerable method to save us from our misery!

The `#map` method (also called `#collect`) transforms each element from an array according to whatever block you pass to it and returns the transformed elements in a new array. `#map` may seem confusing at first, but it is extremely useful. We’ll go through several examples and use cases, which should help you understand how and when you can use this enumerable power for good.

First, let’s use `#map` to improve on our code that transforms all of our friends’ names to uppercase:
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
```

We’re back down to two lines of code, baby! Isn’t it beautiful?

Maybe now you’re getting hungry from all this intense learning and you want to change your McDonald’s order from medium to extra large. With `#map` and [`#gsub`](https://docs.ruby-lang.org/en/3.2/String.html#method-i-gsub), that’s easy peasy:
```ruby
my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']

my_order.map { |item| item.gsub('medium', 'extra large') }
#=> ["extra large Big Mac", "extra large fries", "extra large milkshake"]
```

Maybe you’ve decided that it’s time for you to get your finances in order, and you want to deduct your rent payments from your salary over the past few months to make sure that you haven’t been spending all of your remaining money on extra large Big Mac meals:
```ruby
salaries = [1200, 1500, 1100, 1800]

salaries.map { |salary| salary - 700 }
#=> [500, 800, 400, 1100]
```

Whenever you want to return a new array with the results of running your block of code, `#map` is the method for you!

##### [Map with Index](https://arc.net/l/quote/faeulzbp)    
If you need an index with your values you can use the `with_index` method.

**Here’s an example**:
```ruby
array = %w(a b c)

array.map.with_index { |ch, idx| [ch, idx] } 

 # => [["a", 0], ["b", 1], ["c", 2]]
```
**Bonus tip**:
You can pass a parameter to `with_index` if you don’t want to start from index 0.

##### [Map (method) Shorthand with &](https://arc.net/l/quote/icewtjke)    

You can use a shorthand version for `map` when you’re calling a method that **doesn’t need any arguments**.

**Example**:
```ruby
["11", "21", "5"].map(&:to_i)
```
**Example**:
```ruby
["orange", "apple", "banana"].map(&:class)
# returns an array with each item replaced by its Ruby class.
```
This & syntax is not limited to `map`, it can also be used with other [enumerable methods](https://www.rubyguides.com/2016/03/enumerable-methods/).

#### [The select method](https://www.theodinproject.com/lessons/ruby-basic-enumerable-methods#the-select-method)   

You’ve already seen the `#select` method in action at the beginning of this lesson in our quest to make Brian an outcast.

The `#select` method (also called `#filter`) passes every item in an array to a block and returns a new array with only the items for which the condition you set in the block evaluated to `true`.

First, let’s explore how we would accomplish the same thing using `#each`:
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = []

friends.each do |friend| 
  if friend != 'Brian' 
    invited_list.push(friend)
  end
end

invited_list 
 #=> ["Sharon", "Leo", "Leila", "Arun"]
```

Using our shiny new `#select` method, this code can be simplified down to two lines:
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' } 

 #=> ["Sharon", "Leo", "Leila", "Arun"]
```

Now that we’ve cut out Brian, we can send out the invites! Let’s say that the friends who you invited to your party have gotten back to you, and their responses are all recorded in a hash. Let’s use `#select` to see who’s coming. Recall that when you use an enumerable method with a hash, you need to set up block variables for both the key and the value:

```ruby
responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
responses.select { |person, response| response == 'yes'}
#=> {"Sharon"=>"yes", "Arun"=>"yes"}
```

Looks like only Sharon and Arun can go. You’re going to need more people for a good party. Sounds like it’s time for you to reluctantly call Brian, who you know will bring a batch of his awful home-brewed IPA. Maybe his last batch has gotten better?

#### [The reduce method](https://www.theodinproject.com/lessons/ruby-basic-enumerable-methods#the-reduce-method)   
if `reduce` seems confusing, read through this [article](https://medium.com/@baweaver/reducing-enumerable-part-one-the-journey-begins-ddc1d4108490) for a deeper breakdown.

The `#reduce` method (also called `#inject`) is possibly the most difficult-to-grasp enumerable for new coders. The general idea is that it takes an array or hash and reduces it down to a single object. You should use `#reduce` when you want to get an output of a single value.

A classic example of when `#reduce` is useful is obtaining the sum of an array of numbers. First, let’s explore how we would achieve this using `#each`:
```ruby
my_numbers = [5, 6, 7, 8]
sum = 0

my_numbers.each { |number| sum += number }

sum
#=> 26
```

This isn’t too bad in terms of number of lines of code, but we had to introduce a temporary local variable (`sum`) outside of the enumerable. It would be much nicer if we could do all of this within the enumerable:
```ruby
my_numbers = [5, 6, 7, 8]

my_numbers.reduce { |sum, number| sum + number }
#=> 26
```

Whoa! What?! There’s a lot happening here, so let’s walk through what it’s doing step by step.

The first block variable in the `#reduce` enumerable (`sum` in this example) is known as the **accumulator**. The result of each iteration is stored in the accumulator and then passed to the next iteration. The accumulator is also the value that the `#reduce` method returns at the end of its work. By default, the initial value of the accumulator is the first element in the collection, so for each step of the iteration, we would have the following:

1. Iteration 0: sum = 5 + 6 = 11
2. Iteration 1: sum = 11 + 7 = 18
3. Iteration 2: sum = 18 + 8 = 26

We can also set a different initial value for the accumulator by directly passing in a value to the `#reduce` method.
```ruby
my_numbers = [5, 6, 7, 8]

my_numbers.reduce(1000) { |sum, number| sum + number }
#=> 1026
```

Now let’s look at a more elaborate example that shows just how powerful this method can be. This one is much more complicated, so don’t be discouraged if you don’t fully understand it at this point. Just know that `#reduce` can save you many lines of code in certain scenarios.

Now that you know who’s coming to your party, you need to decide where to go. You don’t actually like making decisions very much, so you put it to a vote among your friends.

The options are St. Mark’s Bistro, a classy place suited for a sophisticated person such as yourself. The other option is Bob’s Dirty Burger Shack, which you know is Brian’s favorite place. Since he’s coming to the party now, it’s best to include it as an option to avoid any arguments. Your friends’ votes are collected in the `votes` array.
```ruby
votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]

votes.reduce(Hash.new(0)) do |result, vote| 
  result[vote] += 1
  result
end
#=> {"Bob's Dirty Burger Shack"=>2, "St. Mark's Bistro"=>1}
```

Alright, so what happened here? Other than Brian ruining your party. Again.

First, we passed in a much more interesting initial value for our accumulator this time. When we pass in an argument to `Hash.new`, that becomes the default value when accessing keys that do not exist in the hash. For example, we could say the following:
```ruby
hundreds = Hash.new(100)
hundreds["first"]         #=> 100
hundreds["mine"]          #=> 100
hundreds["yours"]         #=> 100
```

Once you set the value for a key equal to something else, the default value is overwritten:
```ruby
hundreds = Hash.new(100)
hundreds["new"]           #=> 100
hundreds["new"] = 99
hundreds["new"]           #=> 99
```

Now that we know that this new hash with a default value of `0` is our accumulator (which is called `result` in the code block), let’s see what happens in each iteration:
1. Iteration 0: 
    - result = {}
    - Remember, this hash already has default values of `0`, so `result["Bob's Dirty Burger Shack"] == 0` and `result["St. Mark's Bistro"] == 0`
2. Iteration 1: 
    - The method runs `result["Bob's Dirty Burger Shack"] += 1`
    - result = {“Bob’s Dirty Burger Shack” => 1}
3. Iteration 2: 
    - The method runs `result["St. Mark's Bistro"] += 1`
    - result = {“Bob’s Dirty Burger Shack” => 1, “St. Mark’s Bistro” => 1}
4. Iteration 3: 
    - The method runs `result["Bob's Dirty Burger Shack"] += 1`
    - result = {“Bob’s Dirty Burger Shack” => 2, “St. Mark’s Bistro” => 1}

Note that this example returns a hash with several `key => value` pairs. So even though the result is more complicated, `#reduce` still just returns one object, a hash.

#### [Bang methods](https://www.theodinproject.com/lessons/ruby-basic-enumerable-methods#bang-methods)   

Earlier, we mentioned that enumerables like `#map` and `#select` return new arrays but don’t modify the arrays that they were called on. This is by design since we won’t often want to modify the original array or hash and we don’t want to accidentally lose that information. For example, if enumerables did mutate the original array, then using `#select` to filter out Brian from our invitation list would _permanently_ remove him from our friends list. Whoa! That’s a bit drastic. Brian may be a nutcase at parties, but he’s still our friend.

To see this principle in action, let’s go back to an earlier example where we wrote each of our friends’ names in all caps:
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
```

You can see that when we call our original `friends` array again, it remains unchanged.

If you wanted to change your `friends` array instead, you could use the bang method `#map!`:
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map! { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

friends
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
```

Now when we call our original `friends` array again, it returns the changed values from the `#map!` method. Instead of returning a new array, `#map!` modified our original array.

As you’ll recall from the Methods lesson, **bang methods** can be easily identified by their exclamation marks (`!`) at the end of their name. All bang methods are **destructive** and modify the object they are called on. Many of the enumerable methods that return new versions of the array or hash they were called on have a bang method version available, such as `#map!` and `#select!`.

It’s best practice to avoid using these methods, however, as you or a future developer working on your code may need the original version. Remember that violent psychopath who you should expect will end up maintaining your code? Keep that in mind when making the decision to use bang methods.

#### [Return values of enumerables](https://www.theodinproject.com/lessons/ruby-basic-enumerable-methods#return-values-of-enumerables)   

So if it’s not a good idea to use bang methods but we need to reuse the result of an enumerable method throughout our program, what can we do instead?

One option is to put the result of an enumerable method into a local variable:
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends = friends.select { |friend| friend != 'Brian' }

friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends
#=> ["Sharon", "Leo", "Leila", "Arun"]
```

An even better option would be to wrap your enumerable method in a method definition:
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

def invited_friends(friends) 
  friends.select { |friend| friend != 'Brian' }
end

friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends(friends) 
 #=> ["Sharon", "Leo", "Leila", "Arun"]
```
#### [Enumerable Iterators Cheat Sheet](https://www.eriktrautman.com/posts/ruby-explained-map-select-and-other-enumerable-methods)   
- `#each` returns the original object it was called on because it's really used for its side effects and not what it returns
- `#each_with_index` passes not just the current item but whatever position in the array it was located in.
- `#select` returns a new object (e.g. array) filled with only those original items where the block you gave it returned `true`
- `#map` returns a new array filled with whatever gets returned by the block each time it runs.
#### [Some Other Handy Methods](https://www.eriktrautman.com/posts/ruby-explained-map-select-and-other-enumerable-methods)   
Enumerable is a large bunch of methods and you'll only use a half-dozen of them regularly but there are some others that you should be familiar with as well. The full list is available [in the docs here](http://ruby-doc.org/core-2.0/Enumerable.html).
- `#any?` returns true/false (see the question mark?) and answers the question, "do ANY of the elements in this object pass the test in my block?". If your block returns true on any time it runs, `any?` will return true.
- `#all?` returns true/false and answers the question, "do ALL the elements of this object pass the test in my block?". Every time the block runs it must return true for this method to return true.
- `#none?` returns true only if NONE of the elements in the object return true when the block is run.
- `#find` returns the first item in your object for which the block returns true.
#### [Awesome but less common methods](https://www.eriktrautman.com/posts/ruby-explained-map-select-and-other-enumerable-methods)   
- `#group_by` will run your block and return a hash that groups all the different types of returns from that block. For example:
```ruby
> names = ["James", "Bob", "Joe", "Mark", "Jim"]
> names.group_by{|name| name.length}
=> {5=>["James"], 3=>["Bob", "Joe", "Jim"], 4=>["Mark"]} 
```
- `#grep` returns an array with those items that actually match the specified criteria (RegEx) (using a `\===` match)
```ruby
> names.grep(/J/)
=> ["James", "Joe", "Jim"]
```

Some of the methods you've already seen and use are part of Enumerable too -- `#include?`, `#sort`, `#count` etc.
#### [Ruby's Swiss Army Knife: The Enumerable Module](https://www.codementor.io/ruby-on-rails/tutorial/rubys-swiss-army-knife-the-enumerable-module)   
##### Going beyond `#each` 

Learning `#each` is often the moment when programmers coming from other languages start to appreciate the uniqueness of Ruby. Instead of writing the following code:
```ruby
names = ['Lee', 'Tania', 'Louis']

for name in names 
  puts name
end
```

You can write:
```ruby
names = ['Lee', 'Tania', 'Louis']

names.each do |name| 
  puts name
end
```

Or, even more succinctly:
```ruby
names = ['Lee', 'Tania', 'Louis']

names.each { |name| puts name }
```

While some programmers feel Ruby’s `#each` syntax is more readable than a `for` loop, it’s not necessarily less verbose. Even so, using `#each` is the most common way for Rubyists to handle iteration. Many people learning Ruby will stop here. Having learned `#each`, they’ll add conditional logic to `#each` blocks to perform tasks that “The Ects” are built to handle. If your code is littered with usage of the `#each` method, you will probably benefit from learning about some of the other methods in Enumerable.

##### `#collect` 

Also known by another name you may be familiar with — `#map` — `#collect` allows you to loop over objects and add the return value of each loop to an array.

You’ll see many beginner Ruby programmers do this instead:
```ruby
names = ['Lee', 'Tania', 'Louis']
uppercase_names = []

names.each do |name| 
  uppercase_names << name.upcase end uppercase_names #=> ["LEE", "TANIA", "LOUIS"]
```

You can achieve the same thing using `#collect` as follows:
```ruby
names = ['Lee', 'Tania', 'Louis']

uppercase_names = names.collect { |name| name.upcase }

uppercase_names #=> ['LEE', 'TANIA', 'LOUIS']
```

##### `#select` 

The `#select` method allows you loop over a collection and return a list of objects for which a particular expression returns true. In other words, take a collection of objects and ‘select’ those that meet a certain criteria, discarding the rest. Here’s a more verbose example, inspired by the song [Molly Mallone](https://en.wikipedia.org/wiki/Molly_Malone), using our friend `#each`:
```ruby
cockles_and_mussels = ['alive', 'dead', 'dead', 'alive', 'alive', 'dead']
alive_alive_oh = []

cockles_and_mussels.each do |cockle_or_mussel| 
  if cockle_or_mussel == 'alive' 
    alive_alive_oh << cockle_or_mussel end end alive_alive_oh #=> ["alive", "alive", "alive"]
```

Here’s what a solution looks like using `#select`:
```ruby
cockles_and_mussels = ['alive', 'dead', 'dead', 'alive', 'alive', 'dead']

alive_alive_oh = cockles_and_mussels.select do |cockle_or_mussel| 
  cockle_or_mussel == 'alive'
end

alive_alive_oh #=> ['alive', 'alive', 'alive']
```

You can see that any object passed into the block that is evaluated as part of a true/false expression and returns `true` will be added to an array.

##### `#reject` 

The `#reject` method is very similar to `#select`, but the inverse. It will leave behind any objects for which the expression returns `true`, and add only those that return `false` to the resulting array.

Here’s the above example, this time using `#reject`:
```ruby
cockles_and_mussels = ['alive', 'dead', 'dead', 'alive', 'alive', 'dead']

alive_alive_oh = cockles_and_mussels.reject do |cockle_or_mussel| 
  cockle_or_mussel == 'dead'
end

alive_alive_oh #=> ['alive', 'alive', 'alive']
```

Choosing between `#select` and `#reject` is often a matter of style. Both can be used to solve similar problems effectively.

##### `#detect` 

The `#detect` method (also implemented as `#find`) is similar to `#select`, but instead of returning a collection of objects that match the given criteria, it will “detect” the first matching element it finds and return only that object.
```ruby
songs = [ 
  { title: 'Mad World', artist: 'Gary Jules', is_sad: true },
  { title: 'California Gurls', artist: 'Katy Perry', is_sad: false },
  { title: 'Needle in the Hay', artist: 'Elliott Smith', is_sad: true },
  { title: 'Happy', artist: 'Pharrell Williams', is_sad: false }
]

sad_song_to_play_now = songs.detect { |song| song[:is_sad] }

sad_song_to_play_now #=> { title: 'Mad World', artist: 'Gary Jules', is_sad: true }
```

##### `#inject` 

The `#inject` method is wonderfully useful, though often misunderstood. It’s an excellent tool for building up data structures, or adding values together. It’s often used to sum up numbers into a total. Here’s an example of that, and then we’ll dive into a slightly different usage:
```ruby
shopping_cart = [ 
  { name: 'Vermillion Ink', price: 12.99 },
  { name: 'Azure Ink', price: 9.99 },
  { name: 'LAMY Safari Fountain Pen', price: 49.95 }
]

order_total = shopping_cart.inject(0) do |total, item| 
  total + item[:price]
end

order_total #=> 72.93
```

I should note that this example is slightly problematic. For simplicity’s sake I’m using floats to represent monetary values, but this [can cause problems](https://spin.atomicobject.com/2014/08/14/currency-rounding-errors/). In the real world it’s much better to use a class better suited to monetary values, such as [BigDecimal](http://ruby-doc.org/stdlib-1.9.3/libdoc/bigdecimal/rdoc/BigDecimal.html).

Unlike the other “Ect” methods, `#inject` passes two values to the block. The left-hand value is the accumulator. It starts at 0 (the argument to inject is the starting value) and will accumulate the result of the expression in the block. The right-hand argument is the object being iterated over.

We can also use `#inject` to build up data structures. Let’s say we have an array of some employee data:
```ruby
customer = [['full_name', 'Lois Lane'], ['position', 'Journalist']]
```

This looks like the kind of data you might extract from a CSV file. It’s in a format we can work with, but we can do better. Let’s use `#inject` to construct a Hash from this data.
```ruby
customer = [['full_name', 'Lois Lane'], ['position', 'Journalist']]

customer.inject({}) do |result, element| 
  result[element.first] = element.last
  result
end

customer #=> { "full_name"=>"Lois Lane", "position"=>"Journalist" }
```

This is a really useful tool. You might have noticed that we are passing an argument to `#inject`: an empty hash. This will be used as the initial value of the “result” or accumulator variable. We start with this object and then build it up with each successive iteration over the elements in the array.

A few other useful Enumerable methods:
##### `#any` 

The `#any` method returns `true` if any element in the collection match the given expression.
```ruby
pet_names = ['pluto', 'scooby', 'nyan']

find_scooby = pet_names.any? { | pet | pet == 'scooby' }

find_scooby #=> true
```

##### `#all` 

The `#all` method returns `true` if **all** elements in the collection match the given expression.
```ruby
ages = [ 19, 59, 70, 23, 140 ]

valid = ages.all? { | age | age > 0 && age <= 122 } valid #=> false
```

##### `#each_with_index` 

A slight enhancement to the `#each` method, `#each_with_index` iterates over the element in the collection, as well as providing its index.
```ruby
online_opponents = Hash.new
%w(joe87 potatahead coolguy415 ).each_with_index do |item, index| 
  online_opponents[item] = index
end

online_opponents   #=> {"joe87"=>0, "potatahead"=>1, "coolguy415"=>2}
```

##### `#include?` 

The `#include?` method will return true if any elements in the collection are equal to the given object. Object equality is tested using ``[==](https://www.codementor.io/javascript/tutorial/double-equals-and-coercion-in-javascript)`` ([this post](http://www.rian.me/2013/10/15/what-is-the-difference-between-equals-equals-equals-and-equals-equals-in-ruby/) provides a good explanation of the different types of equality in Ruby).
```ruby
superhero_names = ['Wonder Woman', 'Batman', 'Superman']

awesome = superhero_names.include? 'Wonder Woman'

awesome #=> true
```

##### Making Your Own Classes Enumerable 

In the previous examples we’ve been calling Enumerable methods on instances of the Array class. While this is powerful on its own, Enumerable becomes even cooler when you include the module in a class of your own creation, assuming that class is a collection and is well-suited to the kinds of behaviours provided by the module.

Let’s say you want to have a class that represents a football team. Seems like a good candidate for Enumerable, right? To unlock the magic, we need to include the module and define an `#each` method on the class. As you can see, this `#each` method delegates to Enumerable’s implementation of `#each`, which is included in the Array class. Nice!

```ruby
class FootballTeam 
  include Enumerable

  attr_accessor :players

  def initialize 
    @players = []
  end

  def each &block 
    @players.each { |player| block.call(player) }
  end
end
```

With this small addition, we can treat our `FootballTeam` class like the collection it really is, using Enumerable methods like `#map`.
```ruby
irb(main):002:0> require 'football_team.rb'
=> true
irb(main):003:0> football_team = FootballTeam.new
=> #
irb(main):004:0> football_team.players = ['Mesut Özil', 'Leo Messi', 'Xavi Alonso']
=> ["Mesut Özil", "Leo Messi", "Xavi Alonso"]
irb(main):005:0> football_team.map { |player| player.upcase }
=> ["MESUT ÖZIL", "LEO MESSI", "XAVI ALONSO"]
irb(main):006:0>
```

This pattern can help make your code a little bit more object-oriented. Rather than using basic data structures like arrays to represent collections, you can enrich them with behaviours that suit their purpose, without losing all the benefits gained by having access to Enumerable methods.

##### Conclusion 

I hope I’ve encouraged you to play around with the Enumerable module. Next time you reach for the `#each` method to solve a problem, take a moment to consider whether one of `#collect`, `#select`, `#reject`, `#detect,` or ``#inject`` could solve the problem in a more elegant way. And if you’re working with a class that represents a collection, consider enriching the class by including Enumerable.
### [Predicate Enumerable Methods](https://www.theodinproject.com/lessons/ruby-predicate-enumerable-methods#introduction)
#### [Introduction](https://www.theodinproject.com/lessons/ruby-predicate-enumerable-methods#introduction)  

In the previous lesson, you learned about some really handy enumerable methods like `#each`, `#map`, and `#select`. In this lesson, we’re going to learn about _even more_ enumerable methods! Woohoo! The party never ends here at The Odin Project!

This time, we’re focusing on a particular subset of enumerable methods: the **predicate enumerable methods**. You should recall from the Methods lesson that a predicate method is indicated by a question mark (`?`) at the end of the method name and returns either `true` or `false`. Again, we won’t be going through all of the predicate enumerable methods, so be sure to have a look at the [Ruby docs](https://docs.ruby-lang.org/en/3.2/) to see what else [Enumerable](https://docs.ruby-lang.org/en/3.2/Enumerable.html) offers.

For all of the examples throughout this lesson, feel free to follow along in irb or [replit.com](https://replit.com/languages/ruby) (an online REPL environment) to get a better feel for how they work.

#### [The include? method](https://www.theodinproject.com/lessons/ruby-predicate-enumerable-methods#the-include-method)   

The `#include?` method works exactly like you think it should. If we want to know whether a particular element exists in an array, we can use the `#include?` method. This method will return `true` if the element you pass as an argument to `#include?` exists in the array or hash; otherwise, it will return `false`.

First, let’s explore how we would achieve this with the `#each` method:
```ruby
numbers = [5, 6, 7, 8]
element = 6
result = false

numbers.each do |number| 
  if number == element 
    result = true
    break
  end
end

result
# => true

element = 3
result = false

numbers.each do |number| 
  if number == element 
    result = true
    break
  end
end

result
#=> false
```

If you notice, there is a `break` statement in the `if` condition so that loop stops executing once the number is found. Otherwise it would still run over all numbers in the array which is not needed as we have already found the element.

Using `#include?`, this code can be greatly simplified:
```ruby
numbers = [5, 6, 7, 8]

numbers.include?(6)
#=> true

numbers.include?(3)
#=> false
```

For another example, let’s return to the `friends` and `invited_friends` arrays from the previous lesson:
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_list = friends.select { |friend| friend != 'Brian' }

invited_list.include?('Brian')
#=> false
```

#### [The any? method](https://www.theodinproject.com/lessons/ruby-predicate-enumerable-methods#the-any-method)  

You might also be able to guess what the `#any?` method does. It returns `true` if _any_ elements in your array or hash match the condition within the block; otherwise, it will return `false`.

Let’s say we want to see if there is any number greater than 500 or less than 20 in an array of numbers. First, let’s see how we could achieve this using `#each`:
```ruby
numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number| 
  if number > 500 
    result = true
    break
  end
end

result
#=> true

numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number| 
  if number < 20 
    result = true
    break
  end
end

result
#=> false
```

Using `#any?`, this code can be greatly simplified:
```ruby
numbers = [21, 42, 303, 499, 550, 811]

numbers.any? { |number| number > 500 }
#=> true

numbers.any? { |number| number < 20 }
#=> false
```

#### [The all? method](https://www.theodinproject.com/lessons/ruby-predicate-enumerable-methods#the-all-method)  

The `all?` method is also fairly intuitive. It only returns `true` if _all_ the elements in your array or hash match the condition you set within the block; otherwise, it will return `false`.

Let’s say that we want to check whether all the words in our list are more than 3 characters or 6 characters long. First, let’s see how we could achieve this using `#each`:
```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit| 
  if fruit.length > 3 
    matches.push(fruit)
  end
end

result = fruits.length == matches.length
result
#=> true

fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit| 
  if fruit.length > 6 
    matches.push(fruit)
  end
end

result = fruits.length == matches.length
result
#=> false
```

Using `#all?`, this code can be greatly simplified:
```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.all? { |fruit| fruit.length > 3 }
#=> true

fruits.all? { |fruit| fruit.length > 6 }
#=> false
```

Special note to keep in mind while debugging: `#all?` will return `true` by default unless the block returns `false` or `nil`. So if you call `#all?` on an empty array or hash (i.e., there are no elements for the block to evaluate), it will return `true`. ^74u0aa

#### [The none? method](https://www.theodinproject.com/lessons/ruby-predicate-enumerable-methods#the-none-method)  

As you might expect, `#none?` returns `true` only if the condition in the block matches _none_ of the elements in your array or hash; otherwise, it returns `false`.

First, let’s see how this could be achieved using `#each`. You’ll notice that this approach is very similar to what we did for `#all?`.
```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]
result = false

fruits.each do |fruit| 
  if fruit.length > 10 
    result = false
    break
  end

  result = true
end

result
#=> true

fruits = ["apple", "banana", "strawberry", "pineapple"]
result = false

fruits.each do |fruit| 
  if fruit.length > 6 
    result = false
    break
  end

  result = true
end

result
#=> false
```

Using `#none?`, this can be greatly simplified:
```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.none? { |fruit| fruit.length > 10 }
#=> true

fruits.none? { |fruit| fruit.length > 6 }
#=> false
```

> It’s like [unless for if statements](https://www.rubyguides.com/ruby-tutorial/ruby-if-else/). ([source](https://www.rubyguides.com/2018/10/any-all-none-one/))

#### [New Ruby 2.5 Feature](https://www.rubyguides.com/2018/10/any-all-none-one/)   

Since Ruby 2.5 these 4 methods (`any?` / `all?` / `none?` / `one?`) also take an argument which works [like grep’s argument](https://www.rubyguides.com/2018/10/grep-method-with-examples/).

**Here’s what I mean**:
```ruby
[:orange, :apple, :coconut].any?(Symbol)

# true

[1,2,3].all?(1..10)

# true
```

This is a nice little shortcut if you want to check for a class, regular expression or a range.

### [nested collections](https://www.theodinproject.com/lessons/ruby-nested-collections#introduction)  
#### [Introduction](https://www.theodinproject.com/lessons/ruby-nested-collections#introduction) 

This lesson is going to build on your knowledge of arrays and hashes. As you have seen, arrays and hashes are great ways to store data. However, sometimes the data is more complex and needs more structure than a basic array or hash offers.

Let’s take a look at how you can use nested arrays and nested hashes to store more complex data.

#### [Nested arrays](https://www.theodinproject.com/lessons/ruby-nested-collections#nested-arrays) 

Arrays can contain any type of data, including other arrays. An array that contains other arrays is called a nested array, or a multidimensional array.

Nested arrays can be useful to store groups of similar data or positional data. The following nested array of test scores is storing groups of similar data and the teacher mailboxes is storing groups of positional data.
```ruby
test_scores = [ 
  [97, 76, 79, 93],
  [79, 84, 76, 79],
  [88, 67, 64, 76],
  [94, 55, 67, 81]
]

teacher_mailboxes = [ 
  ["Adams", "Baker", "Clark", "Davis"],
  ["Jones", "Lewis", "Lopez", "Moore"],
  ["Perez", "Scott", "Smith", "Young"]
]
```

#### [Accessing elements](https://www.theodinproject.com/lessons/ruby-nested-collections#accessing-elements) 

You already know that every element in an array has an index. Accessing a specific element within a nested array is done by calling `array[x][y]`, where `x` is the index of the nested element and `y` is the index inside of the nested element.
```ruby
teacher_mailboxes[0][0]
#=> "Adams"
teacher_mailboxes[1][0]
#=> "Jones"
teacher_mailboxes[2][0]
#=> "Perez"
```

You can also use negative indices to return elements from the end of an array, starting at [-1].
```ruby
teacher_mailboxes[0][-1]
#=> "Davis"
teacher_mailboxes[-1][0]
#=> "Perez"
teacher_mailboxes[-1][-2]
#=> "Smith"
```

If you try to access an index of a nonexistent nested element, it will raise an `NoMethodError`, because the nil class does not have a `[]` method. However, just like a regular array, if you try to access a nonexistent index inside of an existing nested element, it will return nil.
```ruby
teacher_mailboxes[3][0]
#=> NoMethodError
teacher_mailboxes[0][4]
#=> nil
```

##### `#dig` [[notes/programming/programming.lang.ruby#💾 dig|method]]  
If you want a nil value returned when trying to access an index of a nonexistent nested element, you can use the `#dig` method. This method can also be used when accessing a nonexistent index inside of an existing nested element.
```ruby
teacher_mailboxes.dig(3, 0)
#=> nil
teacher_mailboxes.dig(0, 4)
#=> nil
```

#### [Creating a new nested array](https://www.theodinproject.com/lessons/ruby-nested-collections#creating-a-new-nested-array) 

Now that you have seen how to access values inside a nested array, we need to take a step back to look at creating a new nested array. In a previous lesson you were taught to create a new array, by calling the Array.new method with up to 2 optional arguments (initial size and default value), like `Array.new(3)` or `Array.new(3, 7)`. However, there is one major “gotcha” that is important to point out. According to the [documentation](https://docs.ruby-lang.org/en/3.2/Array.html) the second optional argument, for the default value, should only be used with an immutable (unable to be changed) object such as a number, boolean value, or symbol. Using a string, array, hash, or other mutable object may result in confusing behavior because each default value in the array will actually be a _reference to_ the same default value. Therefore, any change to **one** of the elements will change **all** of the elements in the array.

To create an immutable array of mutable objects (string, array, hash, etc), you will need to pass the default value for `Array.new` via a block, using curly braces, instead of the second optional argument. The code in the block gets evaluated for every slot in the array, creating multiple objects to initialize the array with, rather than references to the same object. ^y71655

To see this for yourself, let’s look at two examples. This first example uses the second optional argument for the default value.
```ruby
mutable = Array.new(3, Array.new(2))
#=> [[nil, nil], [nil, nil], [nil, nil]]
mutable[0][0] = 1000
#=> 1000
mutable
#=> [[1000, nil], [1000, nil], [1000, nil]]
```

Changing the value of the first element in the first nested array, causes the first element to change in all three nested arrays! This same behavior will happen with strings, hashes, or any other mutable objects.

Now, let’s take a look at an example that omits the second optional argument and instead passes in the mutable value in a block.
```ruby
immutable = Array.new(3) { Array.new(2) }
#=> [[nil, nil], [nil, nil], [nil, nil]]
immutable[0][0] = 1000
#=> 1000
immutable
#=> [[1000, nil], [nil, nil], [nil, nil]]
```

Changing the value of the first element in the first nested array does not cause the value to change in any other nested array.

#### [Adding and removing elements](https://www.theodinproject.com/lessons/ruby-nested-collections#adding-and-removing-elements) 

You can add another element to the end of nested array using the `#push` method or the shovel operator `<<`. If you want to add an element to a specific nested array, you will need to specify the index of the nested array.
```ruby
test_scores << [100, 99, 98, 97]
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]
test_scores[0].push(100)
#=> [97, 76, 79, 93, 100]
test_scores
#=> [[97, 76, 79, 93, 100], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]
```

Using this similar syntax, you can add or remove elements from the entire nested array or from a specific nested element.
```ruby
test_scores.pop
#=> [100, 99, 98, 97]
test_scores[0].pop
#=> 100
test_scores
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]
```

#### [Iterating over a nested array](https://www.theodinproject.com/lessons/ruby-nested-collections#iterating-over-a-nested-array) 

Let’s break down how to iterate over a nested array using the `#each_with_index` method. You might find it helpful to think of a nested array as having rows and columns. Each row is the nested element and each column is the index of the nested element. When we iterate over the teacher_mailboxes example, each element will be one row.

```ruby
teacher_mailboxes.each_with_index do |row, row_index| 
  puts "Row:#{row_index} = #{row}"
end
#=> Row:0 = ["Adams", "Baker", "Clark", "Davis"]
#=> Row:1 = ["Jones", "Lewis", "Lopez", "Moore"]
#=> Row:2 = ["Perez", "Scott", "Smith", "Young"]
#=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]
```

To iterate over the individual elements inside of each row, you will need to nest another enumerable method inside:
```ruby
teacher_mailboxes.each_with_index do |row, row_index| 
  row.each_with_index do |teacher, column_index| 
    puts "Row:#{row_index} Column:#{column_index} = #{teacher}"
  end
end
#=> Row:0 Column:0 = Adams
#=> Row:0 Column:1 = Baker
#=> Row:0 Column:2 = Clark
#=> Row:0 Column:3 = Davis
#=> Row:1 Column:0 = Jones
#=> Row:1 Column:1 = Lewis
#=> Row:1 Column:2 = Lopez
#=> Row:1 Column:3 = Moore
#=> Row:2 Column:0 = Perez
#=> Row:2 Column:1 = Scott
#=> Row:2 Column:2 = Smith
#=> Row:2 Column:3 = Young
#=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]
```

Although these examples are a bit contrived, it is important to note that if we only need each teacher’s name it would be beneficial to use `#flatten` before iterating.
```ruby
teacher_mailboxes.flatten.each do |teacher| 
  puts "#{teacher} is amazing!"
end
#=> Adams is amazing!
#=> Baker is amazing!
#=> Clark is amazing!
#=> Davis is amazing!
#=> Jones is amazing!
#=> Lewis is amazing!
#=> Lopez is amazing!
#=> Moore is amazing!
#=> Perez is amazing!
#=> Scott is amazing!
#=> Smith is amazing!
#=> Young is amazing!
#=> ["Adams", "Baker", "Clark", "Davis", "Jones", "Lewis", "Lopez", "Moore", "Perez", "Scott", "Smith", "Young"]
```

Now let’s take a look at a more complicated example of nesting two predicate enumerables together. Using the above nested array of test scores, let’s determine if any student scored higher than 80 on everything.
```ruby
test_scores = [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]

test_scores.any? do |scores| 
  scores.all? { |score| score > 80 }
end
#=> false
```

This seems pretty straight-forward. It returns false, because none of the nested arrays have scores that are all over 80. What do you think will happen if we switch `#any?` and `#all?`? Do you think we will get the same results?
```ruby
test_scores.all? do |scores| 
  scores.any? { |score| score > 80 }
end
#=> true
```

The results are different, because now it is determining if **all** of the nested arrays contain **any** number over 80. This returns true, because each of the nested arrays have at least one number over 80.

#### [Nested hashes](https://www.theodinproject.com/lessons/ruby-nested-collections#nested-hashes) 

The hashes that you’ve seen so far have single key/value pairs. However, just like arrays, they can be nested, or multidimensional. Nested hashes are a very common way to store complex associated data.
```ruby
vehicles = { 
  alice: {year: 2019, make: "Toyota", model: "Corolla"},
  blake: {year: 2020, make: "Volkswagen", model: "Beetle"},
  caleb: {year: 2020, make: "Honda", model: "Accord"}
}
```

#### [Accessing data](https://www.theodinproject.com/lessons/ruby-nested-collections#accessing-data) 

Accessing a specific element in a nested hash is very similar to a nested array. It is done by calling `hash[:x][:y]`, where `:x` is the key of the hash and `:y` is the key of the nested hash:
```ruby
vehicles[:alice][:year]
#=> 2019
vehicles[:blake][:make]
#=> "Volkswagen"
vehicles[:caleb][:model]
#=> "Accord"
```

Similar to nested arrays, if you try to access a key in a nonexistent nested hash, it will raise an `NoMethodError`, therefore you may want to use the `#dig` [[notes/programming/programming.lang.ruby#💾 dig|method]]. As expected, if you try to access a nonexistent key in an existing nested hash, it will return nil.
```ruby
vehicles[:zoe][:year]
#=> NoMethodError
vehicles.dig(:zoe, :year)
#=> nil
vehicles[:alice][:color]
#=> nil
vehicles.dig(:alice, :color)
#=> nil
```

#### [Adding and removing data](https://www.theodinproject.com/lessons/ruby-nested-collections#adding-and-removing-data) 

You can add more nested hashes, just like a regular hash. Let’s say Dave just bought a new vehicle and we want to add it to the list:
```ruby
vehicles[:dave] = {year: 2021, make: "Ford", model: "Escape"}
#=> {:year=>2021, :make=>"Ford", :model=>"Escape"}
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}
```

You can also add an element to one of the nested hashes. Let’s say that Dave really loves his new Escape and thinks we should keep track of the color of the vehicles. To add a new key/value pair to a nested hash, specify the key of the nested hash right before naming the new key:
```ruby
vehicles[:dave][:color] = "red"
#=> "red"
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape", :color=>"red"}}
```

Deleting one of the nested hashes will be just like a regular hash. Let’s say Blake has decided to sell his Beetle and backpack across Europe. So, let’s delete Blake’s car:
```ruby
vehicles.delete(:blake)
#=> {:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape", :color=>"red"}}
```

To delete one of the key/value pairs inside of a nested hash, you first specify the key of the hash. Let’s say Dave decided that we don’t need to specify the color of his vehicle. Therefore, we specify `vehicles[:dave]` before we indicate the key of the nested hash to delete:
```ruby
vehicles[:dave].delete(:color)
#=> "red"
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}
```

#### [Methods](https://www.theodinproject.com/lessons/ruby-nested-collections#methods) for nested hashes 

There are many helpful methods to use with nested hashes. Once you know what data you need from a nested hash, you might find that browsing through the documentation and experimenting with them in IRB is the best way for you to understand how they work.

Let’s look at an example using the vehicles nested hash. Let’s say that we want to know who owns vehicles that are from 2020 or newer. At first glance in the documentation, it looks like `#select` would be a great method to use:
```ruby
vehicles.select { |name, data| data[:year] >= 2020 }
#=> {:caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}
```

Yes, using `#select` gives us the information that we need. However, what if we only want the names of the owners and not another nested hash. Let’s keep looking through the documentation to see what else we find. The `#collect` method sounds very useful for this situation. Let’s collect the names if the year is 2020 or newer:
```ruby
vehicles.collect { |name, data| name if data[:year] >= 2020 }
#=> [nil, :caleb, :dave]
```

Using `#collect` gets us a lot closer to only having the names of the new vehicle owners. If you look at this method in the documentation you will see that `#collect` and `#map` have the same functionality. Both of these methods use the return value of each iteration, so when the if statement is false, it will return a nil value.

Nil values can cause problems down the road, so let’s look through the documentation to see if we can find a method to help solve this problem. The `#compact` method returns an array (or hash) without nil values, so let’s chain it on the end of the block:
```ruby
vehicles.collect { |name, data| name if data[:year] >= 2020 }.compact
#=> [:caleb, :dave]
```

Yes, using `#collect` and `#compact` returns the data that we want. As you can see, chaining methods can be very useful. However, if we continue exploring the documentation, we will find another method that combines the functionality of these two methods. Ruby version 2.7 added a new enumerable method called `#filter_map` that sounds very useful for this situation:
```ruby
vehicles.filter_map { |name, data| name if data[:year] >= 2020 }
#=> [:caleb, :dave]
```

Amazing! We have found a great solution to returning an array that only contains the names of the owners of vehicles from 2020 or newer! Plus, we got experience using other methods that you will probably use in the future. We have found some really useful methods by exploring the documentation when we have a specific use case in mind.

#### [Nested Hash Iteration](https://web.archive.org/web/20220525215038/https://learn.co/lessons/nested-hash-iteration) 

At this point you should be familiar with iterating over hashes that have one level — a series of key/value pairs on a single tier. For example:
```ruby
jon_snow = {
  name: "Jon",
  email: "jon_snow@thewall.we"
}
```

What happens when we want to iterate over a multidimensional hash like the one below? Let's iterate over our nested hash one level at a time; iterating over the first level of our hash would look like this:
```ruby
contacts = {
  "Jon Snow" => {
    name: "Jon",
    email: "jon_snow@thewall.we",
    favorite_ice_cream_flavors: ["chocolate", "vanilla", "mint chip"],
    knows: nil
  },
  "Freddy Mercury" => {
    name: "Freddy",
    email: "freddy@mercury.com",
    favorite_ice_cream_flavors: ["strawberry", "cookie dough", "mint chip"]
  }
}

contacts.each do |person, data|
  puts "#{person}: #{data}"
end
```

This should return:
```ruby
Jon Snow:
{ :name=>"Jon",
  :email=>"jon_snow@thewall.we",
  :favorite_ice_cream_flavors=>["chocolate", "vanilla", "mint chip"],
  :knows=>nil
}

Freddy Mercury:
{ :name=>"Freddy",
:email=>"freddy@mercury.com",
:favorite_ice_cream_flavors=>["strawberry", "cookie dough", "mint chip"]
}
```

On the first level, the keys are our contacts' names, "Jon Snow" and "Freddy Mercury", and our values are the hashes that contain a series of key/value pairs describing them.

Let's iterate over the second level of our `contacts` hash. In order to access the key/value pairs of the second tier (i.e. the name, email, and other data about each contact), we need to iterate _down into_ that level. So, we pick up where we left off with the previous iteration and we keep going:
```ruby
contacts.each do |person, data|
  #at this level, "person" is Jon Snow or Freddy Mercury and "data" is a hash of
  #key/value pairs to iterate over the "data" hash, we can use the following line:

  data.each do |attribute, value|
    puts "#{attribute}: #{value}"
  end
end
```

That should output the following:
```ruby
name: Jon
email: jon_snow@thewall.we
favorite_ice_cream_flavors: ["chocolate", "vanilla", "mint chip"]
knows: nil

name: Freddy
email: freddy@mercury.com
favorite_ice_cream_flavors: ["strawberry", "cookie dough", "mint chip"]
```

Let's take it one step further and print out _just the favorite ice cream flavors_. Once again, we'll need to iterate down into that level of the hash, then we can access the favorite ice cream array and print out the flavors:
```ruby
contacts.each do |person, data|
  #at this level, "person" is Jon Snow or Freddy and "data" is a hash of
  #key/value pairs to iterate over the "data" hash, we can use the following
  #line:

  data.each do |attribute, value|
    #at this level, "attribute" describes the key of :name, :email,
    #:favorite_ice_cream_flavors, or :knows we need to first check and see if
    #the key is :favorite_ice_cream_flavors, if it is, that means the VALUE is
    #an array that we can iterate over to print out each element

    if attribute == :favorite_ice_cream_flavors
      value.each do |flavor|
        # here, each index element in an ice cream flavor string
        puts "#{flavor}"
      end
    end
  end
end
```

This should output:
```ruby
chocolate
vanilla
mint chip
strawberry
cookie dough
mint chip
```

### Operations    
#### [🌐](https://launchschool.com/books/ruby/read/basics#modulovsremainder) Modulo vs. Remainder 
When working with positive integers, we don't need to worry whether we should use the modulo operator or the remainder method; the return value is positive and identical either way. However, if either number is negative, that's where things get confusing. It really isn't easy to keep the above rules in mind, especially when you don't encounter them often. To complicate matters even more, some languages use the `%` operator to compute the remainder instead of the modulo value.

In mathematics, there is a subtle, but important, difference between modulo and remainder operations. We won't get into the [mathematical definitions](https://math.stackexchange.com/questions/801962/difference-between-modulus-and-remainder), but the effect can be summarized as follows:

- Modulo operations return a positive integer when the second operand is positive, and a negative integer when the second operand is negative.
- Remainder operations return a positive integer when the first operand is positive, and a negative integer when the first operand is negative.

We can see this definition at work in this table:

|a|b|a % b (modulo)|a.remainder(b)|a.divmod(b)|
|---|---|---|---|---|
|17|5|2|2|[3, 2]|
|17|-5|-3|2|[-4, -3]|
|-17|5|3|-2|[-4, 3]|
|-17|-5|-2|-2|[3, -2]|

### [🌐](https://launchschool.com/books/ruby/read/basics#basicdatastructures) data structures    
#### arrays 
An **array** is used to organize information into an ordered list. The list can be made up of strings, integers, floats, booleans, or any other data type. In Ruby, an array literal is denoted by square brackets `[ ]`. Inside the brackets you can create a list of elements separated by commas. Let's make one in irb:
```irb
irb :001 > [1, 2, 3, 4, 5]
=> [1, 2, 3, 4, 5]
```

We've created an array of integers 1 through 5. Each element in an array can be accessed via an **index**. The indexes are numbered starting at zero. Thus, if we wanted only the first element in the array we could do this:
```irb
irb :001 > [ 1, 2, 3, 4, 5][0]
=> 1
```
#### hashes 
A **hash**, sometimes referred to as a dictionary, is a set of key-value pairs. Hash literals are represented with curly braces `{ }`. A key-value pair is an association where a key is assigned a specific value. A hash consists of a key, usually represented by a symbol, that points to a value (denoted using a `hash rocket =>`) of any type of data. Let's make some hashes to get the feel of it. Type along!

```irb
irb :001 > {:dog => 'barks'}
=> {:dog => 'barks'}
```

The above is a hash literal that specifies a single key-value pair. Like arrays, we can have multiple items in a hash if we separate them with commas, but they will not necessarily be in any specific order. Let's add some more items to our hash.

```irb
irb :001 > {:dog => 'barks', :cat => 'meows', :pig => 'oinks'}
=> {:dog => 'barks', :cat => 'meows', :pig => 'oinks'}
```

What if we wanted to find out what noise a cat makes? We can retrieve a value by its key:

```irb
irb :001 > {:dog => 'barks', :cat => 'meows', :pig => 'oinks'}[:cat]
=> "meows"
```


### [🌐](https://www.theodinproject.com/lessons/ruby-input-and-output#output-commands) output    
To better show the differences between what Ruby is printing to the terminal and returning, the examples in this lesson use the full irb syntax, which is exactly what you’d see if you typed these commands into your own terminal irb session.
```ruby
irb(main):001:0> print "Learning to code is FUN!"
Learning to code is FUN!=> nil

irb(main):002:0> print "1234"
1234=> nil
```

We can also use the `puts` command:
```ruby
irb(main):001:0> puts "Learning to code is cool!!"
Learning to code is cool!!
=> nil

irb(main):002:0> puts "Hey, I want 2 key lime pies."
Hey, I want 2 key lime pies.
=> nil

irb(main):003:0> x = "My name is ALEX! :)"
=> "My name is ALEX! :)"

irb(main):004:0> puts x
My name is ALEX! :)
=> nil
```
#### print vs. puts vs. p 
- [🌐](https://arc.net/l/quote/aigzskea) To summarize, `puts` & `print`: 
    - Convert things to strings, even if that means an empty string
- Only `puts`: 
    - Adds a new line to the end of your messages
    - Displays array elements one-per-line
    - `puts` & `p` 
        - puts always returns nil
        - p returns the object you pass to it
        - Example: the `numbers` method will display 123 on the screen, but its return value will be `nil`.
```ruby
def numbers 
  puts 123
end

numbers
# nil
```

As you can see, the `puts` and `print` commands are quite similar, but you should have already noticed the small difference between the two: `puts` appends a new line to the argument passed in, whereas `print` keeps things all on one line. A very important thing to notice for both commands is that after printing whatever argument they are passed, `puts` and `print` both return `nil`.

To highlight the difference between `puts` and `print`, we’re going to pull out a piece of rarely used Ruby syntax: [the semicolon](https://stackoverflow.com/questions/3953846/can-you-use-semicolons-in-ruby). In short, semicolons are never required in Ruby, but they allow you to run multiple Ruby commands all on one line. This type of [code golf](https://en.wikipedia.org/wiki/Code_golf) is not generally recommended, but it’s helpful for this example. In a REPL, such as replit.com, the two statements can be written on separate lines without the semicolon and still produce the desired output. However, irb can read only one statement at a time, making the semicolons necessary for this code to work as intended.
```ruby
irb(main):001:0> print "Hello World"; print "I love drinking coffee"
Hello WorldI love drinking coffee=> nil

irb(main):002:0> puts "Hello World"; puts "I love drinking coffee"
Hello World
I love drinking coffee
=> nil
```

### [🌐](https://www.theodinproject.com/lessons/ruby-input-and-output#input-commands) input    
To accept input from a user, we can use the `gets` command. When we use `gets`, program execution will stop and wait for user input. After the user presses Enter, the program will continue its execution.

> One way to get information from the user is to call the `gets` method. `gets` stands for "get string", and is a lot of fun. ([🌐](https://arc.net/l/quote/sufsxxkp))

Let’s give this a go. Open irb, type `gets`, and then type `The Odin Project`. You should see something like the following:
```ruby
irb(main):001:0> gets
The Odin Project
=> "The Odin Project\n"
```

How about that? Let’s break this process down a bit.

You’ll notice that, unlike `puts` and `print`, `gets` actually **returns** the user input instead of returning `nil`. This means that the input can be assigned to a variable for you to then use and manipulate and twist and turn and spit back out.

As you might also remember from the String section of the Basic Data Types lesson, `"\n"` is an escape character that represents a new line. The `gets` command always returns a new line at the end of the input. This command often makes use of a “separator” to read streams and multi-line files, but that’s beyond the scope of this beginner lesson. For now, it’s helpful to know that `#chomp` is a method commonly used to trim separators.
```ruby
irb(main):001:0> new_string = gets.chomp
This is a sentence.
=> "This is a sentence."

irb(main):002:0> puts new_string
This is a sentence.
=> nil
```

### [🌐](https://www.tutorialspoint.com/ruby/ruby_input_output.htm) File I/O    
All the I/O methods are derived from the class IO.

The class _IO_ provides all the basic methods, such as _read, write, gets, puts, readline, getc,_ and _printf_.

This chapter will cover all the basic I/O functions available in Ruby. For more functions, please refer to Ruby Class *IO*.

#### The putc Statement 

Unlike the _puts_ statement, which outputs the entire string onto the screen, the _putc_ statement can be used to output one character at a time.

The output of the following code is just the character H −
```ruby
#!/usr/bin/ruby

str = "Hello Ruby!"
putc str
```

This will produce the following result −
```bash
H
```

## history, style, docs, more:
### [A Brief History of Ruby](https://arc.net/l/quote/kfiaddgs) 

> Ruby was created by Yukihiro Matsumoto, or "Matz", in Japan in the mid 1990's. It was designed for programmer productivity with the idea that programming should be fun for programmers. It emphasizes the necessity for software to be understood by humans first and computers second.

> Ruby continues to gain popularity for its use in web application development. The Ruby on Rails framework, built with the Ruby language by David Heinemeier Hansson, introduced many people to the joys of programming in Ruby. Ruby has a vibrant community that is supportive for beginners and enthusiastic about producing high-quality code.

### [Stylish Ruby](https://launchschool.com/books/ruby/read/preparations#stylishruby) 

> The Ruby language has specific stylistic conventions that make reading and writing Ruby code easier for everyone. These are things you should adopt as quickly as possible, otherwise your code will stand out like a sore thumb.

> 1. Your text editor's tab function should be set to 2 spaces and indenting should be set to use spaces.
> 2. When you see the `#` sign at the beginning of a line, that means anything after it, on the same line, is a comment. Comments are used by programmers to leave notes for other programmers or themselves at a later point in time.
> 3. When you define or initialize a method, variable, or file, you should always use `snake_case` formatting. `snake_case` formatting is created using all lower case letters and separating words with the underscore character.
```ruby
# Naming a file
this_is_a_snake_cased_file.rb

# Assigning a variable
forty_two = 42

# Defining a method
def this_is_a_great_method
  # do stuff
end
```

> 4. When you want to represent a value that will not change in your Ruby program, you define a constant variable, often referred to as a constant. In Ruby, constants are denoted with all uppercase letters.
```ruby
 # Constant declaration
 FOUR = 'four'
 FIVE = 5
```

> 5. When working with `do/end` blocks, prefer `{ }` when the entire code expression fits on one line.

```ruby
  # Multi-line
  [1, 2, 3].each do |i|
  # do stuff
  end

  # Does the same thing in single line
  [1, 2, 3].each { |i| do_some_stuff }
```

> 6. The last style convention you'll need to learn at this point is how to declare a class name. When naming your classes you will use **PascalCase** formatting, based on the naming style used in the Pascal programming language (the word is capitalized to distinguish it from _camelCase_). _PascalCase_ uses no spaces and capitalizes every word. When Pascal came out, what is now known as PascalCase had been previously known as **CamelCase**, or **upper CamelCase**, so be aware that you may see it called this in some materials.

```ruby
  # Class naming
  class MyFirstClass
  end

  class MySecondClass
  end
``` 

> That about covers the most important style conventions to get started. If you'd like some more information about Ruby styling, check out the [Ruby style guide](https://rubystyle.guide/).

### [Reading Documentation](https://launchschool.com/books/ruby/read/preparations#readingdocumentation) 

As you begin your journey to becoming a programmer, one of the most important habits you'll need to develop is learning how to read **documentation**. Ruby, like all popular programming languages, comes with a rich set of standard libraries that you can use out of the box. However, you'll need to study the Ruby documentation - or Ruby docs - to gain familiarity with the different classes and methods available to you. Don't worry about the exact definition of **classes** or **methods** just yet, all that is coming up later in the book. These are terms best learned while working with Ruby. Be aware that some developers also refer to documentation as **API**. API is an acronym for application programming interface, and is a somewhat overloaded term that can refer to both how applications talk to each other, as well as documentation. Just remember, if someone says "Did you take a look at the Array API?", they're talking about the Ruby docs documentation for the `Array` class. But if someone says "What's the FaceBook API?", they're talking about the programmatic interface to FaceBook's services.

It's worth pointing out that the state of the Ruby documentation is wanting. The official documentation is simply not easy to use when you're starting out with Ruby. It's confusingly laid out, has no index to speak of, and important information is just plain missing. Nevertheless, that's the documentation we will reference throughout Launch School's materials. A little later in this chapter, we will mention some other sources that may prove useful as a supplemental resource.

In this section we're interested in understanding how to read Ruby documentation, so let's take a look at an example. The image below is a screenshot for the `String` class from the official Ruby documentation source for the [String class](https://docs.ruby-lang.org/en/3.2/String.html) (note that your screen may look a little different to the screenshot shown):

![Ruby Documentation Example](https://d2aw5xe2jldque.cloudfront.net/books/ruby/images/ruby-lang.jpg)

There's a lot to look at, so we've circled the three main areas to pay attention to.

#### Class name or Module name 

In the first circle at the top, we see the word "String". This is the **Class** or **Module** (again, don't worry about what that is just yet, we will eventually cover it). In some documentation, you'll see the class name being referred to with a `::` symbol, like this: `Encoding::Converter`. Here, the `::` symbol is used to define a **namespace**, which is just a way to group classes in Ruby and differentiate from other classes with the same name. For example `ActiveRecord::Base` is referring to the `Base` class in the `ActiveRecord` module, to differentiate from other classes also named `Base`. However, when looking at the method list on the side bar, the `::` means something different: it means that the method after the `::` is a **class method** - we'll talk about this more later. For now, just realize that whether the top heading says `String` or `Encoding::Converter`, it's referring to the class or module name and the rest of the page will be documenting that class or module.

#### Methods 

As a documentation convention, methods are listed out with either a `::` or a `#` to indicate two different kinds of publicly accessible methods. Methods denoted by `::` are considered _class methods_, while methods denoted by `#` are considered _instance methods_.

Beyond documentation, don't get caught up with these symbols because they have completely different meanings when executed in Ruby code. For example, the `::` symbol is used as a namespace in actual Ruby code, while the `#` is used as a comment. **Their use here in Ruby documentation is completely different from their use in actual code.**

The meat of the Ruby documentation for the `String` class describes String's Public Class Methods and Public Instance Methods. Clicking one of these methods will link to its section on the page showing its parameters, return values, and some example code that you can copy and paste.

Public, as used above, simply refers to methods that you can call when working with strings. We'll talk about "private" and "protected" methods in a later course.

#### Example: Instance Methods vs Class Methods 

The big take away from this documentation is that the Public Instance Methods can be applied to any instance of the class (we'll talk about "instances" and "objects" in the OOP section of the book, for now just follow the examples). We can look at the string `"world wide web"` and directly apply _instance_ methods to it. For example, from the method list sidebar, we see that there's a `#split` method for strings, which means that `split` is an instance method, and we can call that method on any string directly:
```ruby
irb :001 > "world wide web".split 
 => ["world", "wide", "web"]
```

Further, we can see from the methods sidebar that there are two _class methods_: `::new` and `::try_convert`. Public Class Methods are called directly from the class.
```ruby
irb :001 > b = String.new("blue") 
 => "blue"
irb :002 > String.try_convert("red") 
 => "red"
```

For now, these are the three most important things to remember when reading Ruby documentation: the class or module you're looking at, its available class methods, and its available instance methods - and how to use those methods. Knowing how to read a class's methods will help you play around with Ruby code and develop fluency.

Let's now cover the rest of the sections on the documentation page.

#### Parent 

In Ruby every class sub-classes from some "parent". In order to really understand the previous sentence, you need to know object oriented programming, but we don't want to talk about that yet. The thing to understand is that the class you're looking at also has access to methods - both instance and class - documented in the parent class.

So in this example, the `String` class's parent is `Object`.

This means that in addition to the methods described in this doc, the methods of `Object` are also available to strings. This section of the page will link to the parent's documentation and is a good followup read if you aren't familiar with the parent object or you aren't finding methods you'd expect to see.

#### Class/Module Index 

If you want to find a specific Ruby class or module, the quickest way to do so, assuming you know its approximate name, is to click on the Search box and begin entering its name. Once the class name appears, all you have to do is click on it.

If you're not sure of the name and just want to browse the list of classes and modules, click on "Home" in the upper left corner (just above the Search box). Then scroll down on the left side to find the "Class and Module Index":

![Ruby Class/Module Index](https://d2aw5xe2jldque.cloudfront.net/books/ruby/images/ruby-lang_class-module-index.png)

This section contains the names of all the classes and modules installed with Ruby. The list is fairly long, but you can usually find what you're looking for. You can also browse the list if you just want to see what's available.

#### Included Modules 

If you return to the [String documentation](https://docs.ruby-lang.org/en/3.2/String.html), then scroll the navigation bar down a bit, you'll soon spot the "Included Modules" section:

![Ruby Included Modules](https://d2aw5xe2jldque.cloudfront.net/books/ruby/images/ruby-lang_included-modules.png)

Included modules indicate additional modules whose functionality is available to the `String` class. In the `String` example, the `Comparable` module is included. This means we can do something like this:
```ruby
irb 001 > "cat".between?("ant", "zebra") 
 => true
```

The `between?` method is not listed in the `String` class documentation. However, if we look under the linked `Comparable` module, we find the `between?` method listed.

#### Supplemental Resources 

As mentioned earlier in this chapter, the state of the official Ruby documentation is wanting. We will suggest a few other resources in this section.

In some ways, this [unofficial Ruby documentation site](https://rubyapi.org/) is an improvement over the official site, but mostly in terms of appearance: it's easier on the eyes. Its home page is easier to navigate, and its search function is very good. It has documentation going back all the way to Ruby 2.3. We think it's worth checking out.

Another useful site is [RubyDoc.info/stdlib/core](https://rubydoc.info/stdlib/core). Some of the content includes additional information and examples not present in the official documentation. That can be helpful when you're having trouble understanding the official documentation. The site is easy to navigate, and the appearance is a significant step up from the official site. Unfortunately, it may be slow to update. At this writing in late 2023, the latest documentation covers only up to Ruby 3.0.2 (the current Ruby version is 3.2.2).

Another [unofficial Ruby documentation site](https://ruby-doc.org/) is also an improvement over the official site. Again, however, the improvements are mostly visual: the font and colors are easier to read. It's home page is easier to navigate. It includes documentation in multiple languages as well as documentation going back all the way to Ruby 1.8.6. However, the site is ad supported and suffers from broken internal links.

Finally, you can always use your favorite search engine to find answers to your questions. Be careful, though: searches often turn up outdated or incorrect content, so focus on recent items and try to look at several pages for conflicting information. AI tools like ChatGPT may also be helpful, but be extra careful: **AI tools may lie to you. Convincingly**.

#### Summary 

In this section we looked at Ruby's documentation. When in doubt, review the Ruby docs on the [official site](https://docs.ruby-lang.org/en/3.2). If you need to select the documentation for a different Ruby version, start [here](https://docs.ruby-lang.org/en/).

We urge you to get familiar with reading Ruby documentation. It should become a normal part of your workflow.




### [Using the Command Line and irb](https://launchschool.com/books/ruby/read/preparations#usingcommandlineandirb) 

This chapter will only give you a basic list of commands that you will use to run and test Ruby code. It is by no means an exhaustive list and is only the minimal amount needed.

This chapter will also cover how to use Ruby's interactive coding environment - irb. This is where you can test Ruby code snippets in the terminal.

A note to Windows users: the command line commands we show below may not work in Windows' default command prompt. Most Windows developers will use a terminal emulator, or an alternative, like Powershell. We recommend that all Windows developers get familiar with a terminal emulator or with Powershell and issue the commands below there.

#### [Command Line](https://launchschool.com/books/ruby/read/preparations#commandline) 

This book assumes that you know how to find the command line on your computer and type in commands. When you see the `$` symbol, that represents the command line prompt. We'll also refer to the command line as the terminal. The prompt may look different on your computer, which is fine. The prompt varies depending on the machine you are working on.

To create a directory (or folder) called 'new_dir' type the following command:
```irb
$ mkdir new_dir
```

To navigate into the folder you just created:
```irb
$ cd new_dir
```

To create a file called 'new_file':
```irb
$ touch new_file.rb
```

To delete the file you just created:
```irb
$ rm new_file.rb
```

To navigate out of the current folder to the one above:
```irb
$ cd ..
```

To delete the directory you just created:
```irb
$ rmdir new_dir
```

Now, create the directory and file like you did above, again.

To remove the directory and file at the same time, navigate to the directory above 'new_dir' and type the following command:
```irb
$ rm -R new_dir
```

Be very careful with the `rm` command. It's very destructive and there's no way to recover from it. Use with caution. If in doubt, use your file navigation program (e.g. Explorer or Finder) and delete files and folders that way.

These are all of the commands that we are going to cover in the book. We do assume that you know your way around the command line, can navigate to different files, and can use basic commands. If you want to gain more comfort at the command line, there are many online tutorials and books that go into far more depth. Our book, [Introduction to the Command Line](https://launchschool.com/books/command_line), is one such option we recommend for learning more about the command line.

#### [irb](https://launchschool.com/books/ruby/read/preparations#irb) 

Ruby has a built-in interactive environment called "irb" that can be very helpful when writing Ruby code. At the command line type:
```irb
$ irb
```

If you're using AWS Cloud9 and experience weird screen behavior with the `irb` command, try using `irb --nomultiline` instead. If that solves the problems, you can set this as a configuration option. Create (or edit, if it already exists) a `~/.irbrc` file that contains the following command (put the command at the end if the file already has content):
```irb
IRB.conf[:USE_MULTILINE] = false
```

Save the file, then the next time you start `irb`, it should automatically disable multiline mode.

This will produce a prompt that looks something like this:
```irb
3.2.0p-247 :001 >
```

The `3.2.0p-247` is telling us what version of Ruby we are running and the `:001` tells us what line we are on. However, throughout this book, we will refer to the irb prompt like this:
```irb
irb :001 >
```

You can type in a Ruby command after the prompt and see its output and what it returns. For example, if you type the following command and press return to run it:
```irb
irb :001 > puts 'hello world!'
```

The output will look something like this:
```irb
irb :001 > puts 'hello world!'
hello world! 
 => nil
irb :002 >
```

The line `puts 'hello world!'` prints the phrase 'hello world!' to the screen and returns a `nil` object value. We'll talk about method returns later. All you need to know now is that you can test code in Ruby's interactive environment, irb, when you have some doubts about a specific piece of code. It's also a great place to practice!

When you want to exit `irb` back to the command line, just type `exit`. Note that if you type `exit` from the command line, this will exit the _shell_, which means you have to start up your command line application again.

#### [Running Ruby Code](https://launchschool.com/books/ruby/read/preparations#runningrubycode) 

When you have created a Ruby file, denoted by the `.rb` extension, you can run the code in that file by typing the `ruby` command followed by the file name in the command line. The following line shows how to run the code from a file called `example.rb`.

```irb
$ ruby example.rb
```

Pretty simple, eh?

Assuming that the `example.rb` file contained only the line `puts 'hello world!'`, the following would print after running the file.

```irb
$ ruby example.rb
hello world!
$
```

When you run a Ruby file from the command line, the code gets executed by what's called an **interpreter**. You don't need to know a whole lot about the interpreter except the fact that it takes Ruby code and turns it into code that your computer understands.

The last tip is how to stop a running program. Sometimes, you'll have a long running Ruby program, or an error in the logic that results in an infinite loop. To exit out of the program execution loop, use `control-c`. This will send an abort signal to the running program.

#### [Remember...](https://launchschool.com/books/ruby/read/preparations#remember) 

Make sure you understand the difference between these three things that we covered.

1. Using commands to manage files and folders at the command line (or terminal).
2. Running Ruby commands in irb.
3. Running Ruby code from a `.rb` file at the command line.


### [What Are Ruby "Gems"?](https://launchschool.com/books/ruby/read/preparations#whatarerubygems) 

Rubyists call it RubyGems (one word), or just "gems" for short. There are two main sides to this term. The first side refers to a collection of Ruby files, or Ruby library, that performs a certain task. The other side refers to the publishing system that is behind organizing, listing, and publishing those libraries, or gems.

The publishing system behind RubyGems is designed to let you download, publish and use useful Ruby libraries on your system. That system is powered by the website [rubygems.org](https://rubygems.org/). The libraries that the system publishes are called "gems".

RubyGems is integrated into Ruby 1.9 and newer by default to help Rubyists speed up development. The code in a gem is like pre-packaged bundles of code written by someone to solve a useful problem. This means you'll spend time on useful features instead of reinventing the wheel. Ruby gems have versions based on the [Semantic Versioning](http://semver.org/) standard. A gem is said to have been "cut" when a new version becomes available. All the public installable gems are hosted at [http://rubygems.org](http://rubygems.org/), though their code is hosted on a code repository, such as a GitHub repository.

#### How do I use it? 

The `gem` command allows you to use RubyGems. When combined with the `install` command, one can download and install gems with their dependencies and any relevant documentation. The complete command is like so:
```irb
gem install <gem name>
```

where `<gem name>` is the actual name of the gem you want to install.

Installing gems like this is fine for one-time usage but with time, you'll lose track of which gems belong to which project. As you learn more Ruby, you'll be introduced to the `Gemfile` which offers a simple solution for organizing gems and their dependencies in a central location.

You can check out the RubyGems [site](http://guides.rubygems.org/rubygems-basics/) for other useful commands.

For now, just understand that throughout this book and your journey as a Ruby developer, you may be required to `gem install <some_gem>`. All it's doing is going out to rubygems.org and pulling down the appropriate gem for you to use on your local machine.

### [Debugging Ruby Code with Pry](https://launchschool.com/books/ruby/read/preparations#debuggingrubycodewithpry)

[Pry](https://github.com/pry/pry) is a nifty library that doubles as an alternative to `irb` with a host of awesome features. In this section, we'll focus on its code debugging capabilities. To use `pry` we'll first have to install it:
```irb
gem install pry
```

This gives you the `pry` command which when entered in your terminal will open a new session just like you would with `irb`.

#### Use pry for debugging

Next, when you want to use `pry` for debugging you'll have to `require "pry"` and insert a `binding.pry` in your file like so:
```ruby
# preparation.rb
require "pry"

a = [1, 2, 3]
a << 4
binding.pry     # execution will pause here, allowing you to inspect all objects
puts a
```

What this means is that when your program gets to where `binding.pry` has been declared, it'll open a new `pry` session instead of moving on to the next line in the code. This gives you the opportunity to play around with your variables and objects to see why things are not working. This is an extremely powerful debugging technique since it lets you pause execution to inspect the state of all variables and objects at that line of code. After you're done looking at your variables, you can continue the program execution with `Ctrl + D`.

We've just scratched the surface of what you should know to debug simple Ruby code. We just want to introduce you to this debugging technique in Ruby because it's a better alternative to using `puts` for debugging and gives you a good idea of what's really happening within your code.