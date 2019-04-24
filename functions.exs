// Anonymous Functions   //quick fns with no name
Interactive Elixir (1.7.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> sum = fn (a, b) -> a + b end
#Function<12.128620087/2 in :erl_eval.expr/5>
iex(2)> sum = fn(a,b) -> a+b end
#Function<12.128620087/2 in :erl_eval.expr/5>
iex(3)> sum.(5, 6)
11
iex(4)>
// Shorthand for Anonymous Functions
iex(4)> sum = &(&1 + &2)
&:erlang.+/2
iex(5)> sum.(1,2)
3
iex(6)> sum.(1,6)
7
iex(7)>

Pattern Matching  //Elixir uses pattern matching to check through all possible match options and select the first matching option to run:
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
// Named Functions
