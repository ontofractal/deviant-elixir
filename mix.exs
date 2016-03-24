defmodule DeviantArt.Mixfile do
  use Mix.Project

  def project do
    [app: :deviant_elixir,
     version: "0.0.2",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, ">= 0.0.0"},
      {:feeder_ex, ">= 0.0.0"}
    ]
  end


  defp description do
    """
    WIP. Unstable alpha.
    Elixir API wrapper for Deviant Art. At this moment provides only RSS feeds intergac.
    """
  end

  defp package do
    [# These are the default files included in the package
     files: ["lib", "priv", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
     maintainers: ["Vitalik Daniuk"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/vdaniuk/deviant-elixir"}]
  end
end
