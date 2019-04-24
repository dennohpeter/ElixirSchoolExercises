all? # all must meet condition for true to be returned
iex(2)> Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 3 end)
false
iex(3)> Enum.all?(["foo", "boo", "hello"], fn(s) -> String.length(s) > 1 end )
true
iex(4)>
any? # will return true if at least one item evaluates to true:
iex(5)> Enum.any?(["foo", "boo", "hello"], fn(s) -> String.length(s) == 5 end ) true
iex(6)>
chunk_every  #If you need to break your collection up into smaller groups, chunk_every/2 is the function you’re probably looking for:
iex(6)> Enum.chunk_every(["foo", "boo", "hello"], 2)                            [["foo", "boo"], ["hello"]]
iex(7)> Enum.chunk_every(["foo", "boo", "hello", "world"], 2)
[["foo", "boo"], ["hello", "world"]]
iex(8)>

chunk_by # f we need to group our collection based on something other than size, we can use the chunk_by/2 function.
iex(2)> Enum.chunk_by(["one", "two", "three", "four", "five"], fn(s) -> String.length(s) end)
[["one", "two"], ["three"], ["four", "five"]]
iex(3)> Enum.chunk_by(["one", "two", "three", "four", "five", "six"], fn(s) -> String.length(s) end)
[["one", "two"], ["three"], ["four", "five"], ["six"]]
iex(4)>
map_every # # Apply function every three items
iex(5)> Enum.map_every([1,2,3,4,5,6],3, fn(s) -> s + 1000 end)
[1001, 2, 3, 1004, 5, 6]
iex(6)>

each # It may be necessary to iterate over a collection without producing a new value, for this case we use
iex(7)> Enum.each(["one", "two", "three"], fn(s) -> IO.puts(s) end)
one
two
three
:ok
iex(8)>
map # o apply our function to each item and produce a new collection look to the map/2 function:
iex(8)> Enum.map([0,1,2,3,4], fn(s) -> s-1 end)
[-1, 0, 1, 2, 3]
iex(9)>
