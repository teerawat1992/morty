defmodule Morty.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :morty,
      version: @version,
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Morty.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [
      {:phoenix,        "~> 1.3.0-rc"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto,   "~> 3.2"},
      {:postgrex,       ">= 0.0.0"},
      {:phoenix_html,   "~> 2.6"},
      {:gettext,        "~> 0.11"},
      {:cowboy,         "~> 1.0"},

      # dev
      {:phoenix_live_reload, "~> 1.0", only: :dev},

      # dev & test
      {:credo, "~> 0.7", only: [:dev, :test]},
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
