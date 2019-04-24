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

// Pattern Matching 
