defmodule Greeter do
  @moduledoc """
  ....
  """

  @doc """
  Prints Hello Message
  ## Parameters

  - name: String that represents the name of the person.

  ## Examples

  iex> Greeter.hello("Sean")
  "Hello, Sean"

  iex> Greeter.hello("pete")
  "Hello, pete"
  """
  def hello(name) do
    "Hello, " <> name
  end

end
