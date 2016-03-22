defmodule DeviantArt do
  use HTTPoison.Base

  @doc """
  Returns %FeederEx.Feed{} with multiple embedded %FeederEx.Item{}
  """
  def rss(opts) do
    %{query: q, category: cat, sort: sort} = opts
    offset = opts[:offset] || 0
    url = "http://backend.deviantart.com/rss.xml?type=deviation&q=#{sort}:#{cat}+#{q}&offset=#{offset}"
      |> URI.encode

    {:ok, %HTTPoison.Response{body: body}} = DeviantArt.get(url)
    {:ok, feed, _} = FeederEx.parse(body)
    feed
  end

end
