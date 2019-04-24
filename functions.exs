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
iex(27)> defmodule Greeter do
...(27)> def hello(name), do: phrase() <> name
...(27)> defp phrase, do: "Hello, "
...(27)> end
iex(28)> Greeter.hello("Mutua")
"Hello, Mutua"
iex(29)>
Guards  #  Once Elixir has matched a function any existing guards will be tested.
iex(30)> defmodule Greeter do
...(30)> def hello(names) when is_list(names)do
...(30)> names
...(30)> |> Enum.join(", ")
...(30)> |> hello
...(30)> end
...(30)>
...(30)> def hello(name) when is_binary(name)do
...(30)> phrase() <> name
...(30)> end
...(30)> defp phrase, do: "Hello,  "
...(30)> end
iex(31)> Greeter.hello(["Sean", "Steve"])
"Hello,  Sean, Steve"
iex(32)> Greeter.hello(["Sean", "Dennis"])
"Hello,  Sean, Dennis"
iex(33)>
Default Arguments  # If we want a default value for an argument we use the argument \\ value syntax:
iex(1)> defmodule Greeter do
...(1)> def hello(name, language_code \\ "en") do
...(1)> phrase(language_code) <> name
...(1)> end
...(1)> defp phrase("en"), do: "Hello, "
...(1)> defp phrase("es"), do: "Hola, "
...(1)> end
iex(2)> Greeter.hello("Sean", "en")
"Hello, Sean"
iex(3)> Greeter.hello("Sean", "es")
"Hola, Sean"
iex(4)> Greeter.hello("Sean")
"Hello, Sean"
iex(5)>

// Combining guards and default arguments
// we run into problems Like
iex(1)> defmodule Greeter do
...(1)> def hello(names, lang_code \\ "en") when is_list(names) do
...(1)> names
...(1)> |> Enum.join(", ")
...(1)> |> hello(lang_code)
...(1)> end
...(1)> def hello(names, lang_code \\ "en") when is_binary(names) do
...(1)> phrase(lang_code) <> names
...(1)> end
...(1)> defp phrase("en"), do: "Hello, "
...(1)> defp phrase("es"), do: "Hola, "
...(1)> end
** (CompileError) iex:7: def hello/2 defines defaults multiple times. Elixir allows defaults to be declared once per definition. Instead of:

    def foo(:first_clause, b \\ :default) do ... end
    def foo(:second_clause, b \\ :default) do ... end

one should write:

    def foo(a, b \\ :default)
    def foo(:first_clause, b) do ... end
    def foo(:second_clause, b) do ... end

    iex:7: (module)
iex(1)>
// to mitigate this we use header function with our default value
// like
iex(3)> defmodule Greeter do
...(3)> def hello(names, lang_code \\ "en")
...(3)>
...(3)> def hello(names, lang_code) when is_list(names) do
...(3)> names
...(3)> |> Enum.join(", ")
...(3)> |> hello(lang_code)
...(3)> end
...(3)>
...(3)> def hello(name, lang_code) when is_binary(name) do
...(3)> phrase(lang_code) <> name
...(3)> end
...(3)>
...(3)> defp phrase("en"), do: "Hello, "
...(3)> defp phrase("es"), do: "Hola, "
...(3)> end
{:module, Greeter,
 <<70, 79, 82, 49, 0, 0, 6, 92, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 0, 164,
   0, 0, 0, 18, 14, 69, 108, 105, 120, 105, 114, 46, 71, 114, 101, 101, 116,
   101, 114, 8, 95, 95, 105, 110, 102, 111, 95, ...>>, {:phrase, 1}}
iex(4)> Greeter.hello []
"Hello, "
iex(5)> Greeter.hello ["Dennis", "Steve","Wayua"]
"Hello, Dennis, Steve, Wayua"
iex(6)> Greeter.hello ["Dennis", "Steve","Wayua"], "es"
"Hola, Dennis, Steve, Wayua"
iex(7)>
