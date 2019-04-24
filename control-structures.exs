Interactive Elixir (1.7.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> if String.valid?("Hello") do
...(1)> "Valid String"
...(1)> else
...(1)> "Invalid String"
...(1)> end
"Valid String"
iex(2)>
iex(2)> if "a string value" do
...(2)> "Truthy"
...(2)> end
"Truthy"
iex(3)>
Unless # Using unless/2 is like if/2 only it works on the negative:
iex(3)> unless is_integer("hello")do
...(3)> "Not an int"
...(3)> end
"Not an int"
iex(4)>
case  # If it’s necessary to match against multiple patterns we can use case/2:
iex(5)> case {:ok, "Hello World"} do
...(5)> {:ok,result} -> result
...(5)> {:error} -> "Uh oh!"
...(5)> end
"Hello World"
iex(6)>
iex(7)> pie = 3.14
3.14
iex(8)> case "cherry pie" do
...(8)> ^pie -> "Not so tasty"
...(8)> pie -> "I bet #{pie} is tasty"
...(8)> end
"I bet cherry pie is tasty"
iex(9)>

#case/2  support for guard clauses:
iex(10)> case {1,2,3} do
...(10)> {1,x,3} when x >0->
...(10)> "Will match"
...(10)> _->
...(10)> "Won't match"
...(10)> end
"Will match"
iex(11)>

cond #This is akin to else if or elsif from other prog lang
iex(11)> cond do
...(11)> 2+2==5 ->
...(11)> "This will not be true"
...(11)> 2*2 == 4 ->
...(11)> "This will"
...(11)> 1 + 2 == 5 ->
...(11)> "This won't"
...(11)> 1 + 1 == 2 ->
...(11)> "But this will"
...(11)> end
"This will"
iex(12)>
# Like case/2, cond/1 will raise an error if there is no match.
# To handle this, we can define a condition set to true:
