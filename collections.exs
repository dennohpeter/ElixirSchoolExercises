# Lists
Interactive Elixir (1.7.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> [3.24, ":ok", "Dennis"]
[3.24, ":ok", "Dennis"]
iex(2)> list = [3.24, ":ok", "Dennis"]
[3.24, ":ok", "Dennis"]
iex(3)> ['π'] ++list
[[960], 3.24, ":ok", "Dennis"]
iex(4)> ["π"] ++list             # Prepending  is very fast
["π", 3.24, ":ok", "Dennis"]
iex(5)> list ++ ["Peterson"]    # Appending is very slow
[3.24, ":ok", "Dennis", "Peterson"]
iex(6)>
# Head and Tail
# Head or simply hd
iex(8)> hd list
3.24
# Tail or tl
iex(9)> tl list
[":ok", "Dennis"]
iex(10)>
# You can also use  | operator to split a list
# eg
iex(10)> [head | tail] = list
[3.24, ":ok", "Dennis"]
iex(11)> [head | tail] = ["3.14", :pie, "Apple"]
["3.14", :pie, "Apple"]
iex(12)> head
"3.14"
iex(13)> tail
[:pie, "Apple"]
iex(14)>
# Tuples
#{ Accessing them is fast but modifying them is damn expensive ##immutable }
# They are defined in curly brackets
iex(14)> {3.14, :pie, "Apple"}
{3.14, :pie, "Apple"}
iex(15)>
# They are useful in providing more details about a function
# Keyword lists
#Keys are atoms.
#Keys are ordered.
#Keys Don't have to be unique.
#For these reasons, keyword lists are most commonly used to
#pass options to functions.
iex(15)> [foor: "bar", hello: "world"]
[foor: "bar", hello: "world"]
iex(16)> [{:foo, "bar"}, {:hello, 'world'}]
[foo: "bar", hello: 'world']
iex(17)>

# Maps
# These are 'go-to' key value store.
#They allow keys of any type and are un-ordered.
# You can define a map with the %{} syntax:
iex(19)> map = %{:full => "bar", "hello" => :world }
%{:full => "bar", "hello" => :world}
iex(20)> map[:full]
"bar"
iex(21)> map["hello"]
:world
iex(22)> map["bar"]
nil
# key can also be a variable
iex(23)> key = "hello"
"hello"
iex(24)> %{key => "world"
...(24)> }
%{"hello" => "world"}
iex(25)>
# There is a special syntax for maps containing Atoms
iex(26)> %{ foo: "bar", hello: "world"}
%{foo: "bar", hello: "world"}
iex(27)> %{foo: "bar", hello: "world"} == %{:foo => "bar", :hello => "world"}
true
iex(28)>
# In addition, there is a special syntax for accessing atom keys:
iex(1)> map = %{foo: "bar", hello: "world" }
%{foo: "bar", hello: "world"}
iex(2)> map.foo
"bar"
iex(3)> map.hello
"world"
iex(4)>
# Another interesting property of maps is that they provide their own syntax for updates:
iex(4)> map = %{foo: "bar", hello: "world"}
%{foo: "bar", hello: "world"}                    # Updating a map value
iex(5)> %{map | foo: "cow"}                      # in a special way
%{foo: "cow", hello: "world"}
iex(6)>
