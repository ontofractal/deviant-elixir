defmodule DeviantArtTest do
  use ExUnit.Case
  doctest DeviantArt

  test "DA docs example rss query" do
    feed = DeviantArt.rss(%{query: "frogs", category: "digitalart/drawings", sort: "boost:popular+in"})
    IO.inspect feed
    assert feed.title == "DeviantArt: Popular In:digitalart/drawings frogs"
  end
end
