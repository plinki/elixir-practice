defmodule CarrotTest do
  use ExUnit.Case
  doctest Carrot

  test "greets the world" do
    assert Carrot.hello() == :world
  end
end
