defmodule LinkcheckerTest do
  use ExUnit.Case
  doctest Linkchecker

  test "iterate over a list of links from a .txt file" do
    results = Linkchecker.start('./test_data/test_links.txt')
    assert results([])
  end
end