defmodule DeviantArtTest do
  use ExUnit.Case
  doctest DeviantArt

  test "DA docs example rss query" do
    {:ok, feed} = DeviantArt.rss(%{query: "frogs", category: "digitalart/drawings", sort: "boost:popular+in"})
    assert feed.title == "DeviantArt: Popular In:digitalart/drawings frogs"
  end
end
