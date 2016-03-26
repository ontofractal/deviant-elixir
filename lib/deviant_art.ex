defmodule DeviantArt do
  use HTTPoison.Base

  @doc """
  Returns {:ok, feed} or {:error, error/response} where feed is %FeederEx.Feed{} with multiple embedded %FeederEx.Entry{}
  Example of %FeederEx.Entry{}:
  %FeederEx.Entry{author: nil, duration: nil, enclosure: nil,
     id: "http://thedanimator.deviantart.com/art/Frog-and-Toad-are-Holmes-44279804",
     image: nil,
     link: "http://thedanimator.deviantart.com/art/Frog-and-Toad-are-Holmes-44279804",
     subtitle: nil,
     summary: "This is a submission to the FrogginBlog site.<br />\nWe do weekly challenges based on a theme. This one was on Sherlock Holmes. My twist used the children's book series \"Frog and Toad are Friends\"...<br />\n<br />\n...so this could be fan art I guess.",
     title: "Frog and Toad are Holmes", updated: "Wed, 06 Dec 2006 11:25:39 PST"}
  """
  def rss(opts) do
    %{query: q, category: cat, sort: sort} = opts
    offset = opts[:offset] || 0
    url = "http://backend.deviantart.com/rss.xml?type=deviation&q=#{sort}:#{cat}+#{q}&offset=#{offset}"
      |> URI.encode

    case DeviantArt.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, feed, _} = FeederEx.parse(body)
        {:ok, feed}
      {:ok, response } ->
        {:error, response}
      {:error, error} ->
        {:error, error}
    end

  end

end
