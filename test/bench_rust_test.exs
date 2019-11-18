defmodule BenchRustTest do
  use ExUnit.Case
  doctest BenchRust

  test "greets the world" do
    assert BenchRust.hello() == :world
  end
end
