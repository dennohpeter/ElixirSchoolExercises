# Anonymous Functions   #quick fns with no name
Interactive Elixir (1.7.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> sum = fn (a, b) -> a + b end
#Function<12.128620087/2 in :erl_eval.expr/5>
iex(2)> sum = fn(a,b) -> a+b end
#Function<12.128620087/2 in :erl_eval.expr/5>
iex(3)> sum.(5, 6)
11
iex(4)>
# Shorthand for Anonymous Functions
iex(4)> sum = &(&1 + &2)
&:erlang.+/2
iex(5)> sum.(1,2)
3
iex(6)> sum.(1,6)
7
iex(7)>

Pattern Matching  #Elixir uses pattern matching to check through all possible match options and select the first matching option to run:
iex(9)> handle_result = fn
...(9)> {:ok, result} -> IO.puts "Handling result"
...(9)> {:ok, _} -> IO.puts "This will never run as previous will be matched beforehand."
...(9)> {:error} -> IO.puts "An error has occurred!"
...(9)> end
warning: variable "result" is unused
  iex:10

#Function<6.128620087/1 in :erl_eval.expr/5>
iex(10)> some_res = 2
2
iex(11)> handle_result.({:ok, some_res})
Handling result
:ok
iex(12)> handle_result.({:error})
An error has occurred!
:ok
iex(13)
Named Functions   # Functions with names so we can easily refer to them later
iex(14)> defmodule Greeter do
...(14)> def hello(name)do
...(14)> "Hello, " <> name
...(14)> end
...(14)> end
{:module, Greeter,
 <<70, 79, 82, 49, 0, 0, 4, 124, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 0, 141,
   0, 0, 0, 15, 14, 69, 108, 105, 120, 105, 114, 46, 71, 114, 101, 101, 116,
   101, 114, 8, 95, 95, 105, 110, 102, 111, 95, ...>>, {:hello, 1}}
iex(15)> Greeter.hello("Dennis")
"Hello, Dennis"
iex(16)>
# in one line
iex(17)> defmodule Greeter do
...(17)> def hello(name), do: "hello, " <> name
...(17)> end
iex(18)> Greeter.hello("Peterson")
"hello, Peterson"
iex(19)>
# Recursion using named functions
iex(1)> defmodule Length do
...(1)> def of([]), do: 0
...(1)> def of([_ | tail]), do: 1 + of(tail)
...(1)> end
iex(2)> Length.of []
0
iex(3)> Length.of [1,2,3]
3
iex(4)> Length.of [1,2,3, 6]
4
iex(5)>
#Function Naming and Arity
iex(6)> defmodule Greeter2 do
...(6)> def hello(), do: "Hello anonymous person!"
...(6)> def hello(name), do: "Hello #{name}"
...(6)> def hello(name1, name2), do: "Hello, #{name1} and #{name2}"
...(6)> end
iex(7)> Greeter2.hello()
"Hello anonymous person!"
iex(8)> Greeter2.hello("Dennis")
"Hello Dennis"
iex(9)> Greeter2.hello("Dennis", "Karim")
"Hello, Dennis and Karim"
iex(10)>
#Functions and Pattern Matching  #Behind the scenes, functions are pattern-matching the arguments that they’re called with.
iex(11)> defmodule Greeter1 do
...(11)> def hello(%{name: person_name}) do
...(11)> IO.puts "Hello, " <> person_name
...(11)> end
...(11)> end
iex(12)> fred = %{
...(12)> name: "Fred Katiwa",
...(12)> age: "95",
...(12)> fav_col: "Taupe"}
%{age: "95", fav_col: "Taupe", name: "Fred Katiwa"}
iex(13)> Greeter1.hello(fred)   # call with entire map
Hello, Fred Katiwa
:ok
iex(14)>
# Making the function retain the properties of the map
# We have to use a variable to assign it {the function}
iex(22)> defmodule Greeter3 do
...(22)> def hello(person = %{name: person_name })do
...(22)> IO.puts "Hello, " <> person_name
...(22)> IO.inspect person
...(22)> end
...(22)> end
{:module, Greeter3,
 <<70, 79, 82, 49, 0, 0, 5, 36, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 0, 170,
   0, 0, 0, 19, 15, 69, 108, 105, 120, 105, 114, 46, 71, 114, 101, 101, 116,
   101, 114, 51, 8, 95, 95, 105, 110, 102, 111, ...>>, {:hello, 1}}
iex(23)> Greeter3.hello(fred)
Hello, Fred Katiwa
%{age: "95", fav_col: "Taupe", name: "Fred Katiwa"}

Private Functions # When we don’t want other modules accessing a specific function we can make the function private
# We define them in Elixir with defp
