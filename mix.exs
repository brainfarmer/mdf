defmodule Mdf.Mixfile do
  use Mix.Project

  def project do
    [app: :mdf,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps]
  end

  def application do
    [registered: [:mdf],
		 applications: [:cowboy, :plug, :logger],
     mod: {Mdf, []}]
  end

  defp deps do
    [{:cowboy, "~> 1.0.0"},
		 {:plug, "~> 0.11.0"}]
  end
end
