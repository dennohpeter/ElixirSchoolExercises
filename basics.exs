@doc """
basic data types
first enter into interactive mode using iex
"""

Erlang/OTP 21 [erts-10.2.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Interactive Elixir (1.7.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> 2+3
5
iex(2)> 2+3==5
true
iex(3)> String.length("The Lazy Dog Jumped over the fence")  #getting String length
34
iex(4)>

# Integers
iex(1)> 255
255
# binary, octal, and hexadecimal numbers comes built in:
iex(2)> 0b0110
6
iex(3)> 0o644
420
iex(4)> 0x1F
31
# Floats
iex(5)> 3.14
3.14
iex(6)> 0.15
0.15
iex(7)> .15
** (SyntaxError) iex:7: syntax error before: '.'  #is not correct since compiler expects value before .dot

#Booleans
iex> true
true
iex> false
false

# Atoms   #constant whose name is its value
iex(7)> :ok
:ok
iex(8)> :foo
:foo
iex(9)> :foo == :ok
false
iex(10)>

#Name of modules in Elixir are also Atoms e.g MyApp.module
iex(10)> is_atom(MyApp.Mymodule)
true
iex(11)>

# Strings
iex(11)> "Boo"
"Boo"
iex(12)> "Foo"
"Foo"
iex(13)> "Game of Thrones"
"Game of Thrones"
iex(14)>
# Strings support escape sequences and line breaks:

"\n"  is escape sequences
iex(14)> "Game of thrones is \n Liiiittt!!!!"
"Game of thrones is \n Liiiittt!!!!"
iex(15)> "foo
...(15)> bar"
"foo \nbar"          #line break
iex(16)>

# Arithmetics using basic operators like + - * /
# Addition
iex(1)> 1+2
3
iex(2)> 3+4
7
iex(3)>
# Subtraction
iex(3)> 5 - 8
-3
iex(4)> 8- 4
4
iex(5)>
# Multiplication
iex(5)> 4*4
16
iex(6)> 6*9
54
iex(7)>
# Division
iex(7)> 9/6
1.5
iex(8)> 8/2
4.0
iex(9)>

# Elixir  also comes with special inbuilt fnctions to perform operations such
# div , and getting modulo that is reminder
iex(9)> div(9, 3)
3
iex(10)> div(16,2)
8
iex(11)>
# reminder
iex(11)> rem(9, 6)
3
iex(12)> rem(8,2)
0
iex(13)>
# Booleans
# ||
iex> -20 || true
-20
iex> false || 42
42
# &&
iex(18)> 42 && true
true
iex(19)> 42 && nil
nil
iex(20)>
# There are three additional operators whose first argument must be a boolean (true or false):
iex(21)> true and 42
42
iex(22)> false or true
true
iex(23)>
# String Concatenation we use <>
iex(26)> name = "Dennis"
"Dennis"
iex(27)> "Hello " <> name
"Hello Dennis"
iex(28)>
