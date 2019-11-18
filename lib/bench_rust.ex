defmodule BenchRust do
  @moduledoc """
  Documentation for BenchRust.
  """

  def add(x, y) do
    x + y
  end

  def process_list(list) do
    list
    |> Stream.filter(fn i -> rem(i, 2) == 0 end)
    |> Stream.filter(& &1 * 10)
    |> Enum.to_list
  end
end
