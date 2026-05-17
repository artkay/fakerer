defmodule Faker.Mixfile do
  use Mix.Project

  @source_url "https://github.com/artkay/fakerer"
  @version "1.2.0"

  def project do
    [
      app: :faker,
      version: @version,
      elixir: "~> 1.16",
      description: "A maintained fork of Faker. A pure Elixir library for generating fake data.",
      package: package(),
      name: "Fakerer",
      deps: deps(),
      docs: docs(),
      source_url: @source_url,
      homepage_url: @source_url,
      dialyzer: [
        flags: [
          :error_handling,
          :underspecs
        ]
      ]
    ]
  end

  def cli do
    [preferred_envs: ["test.watch": :test]]
  end

  def application do
    [
      # mod: {Faker.Application, []},
      extra_applications: [:crypto, :makeup],
      env: env()
    ]
  end

  defp env do
    [
      locale: :en,
      country: nil,
      random_module: Faker.Random.Elixir
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:earmark, "~> 1.4", only: :dev, runtime: false},
      {:ex_doc, "~> 0.40", only: :dev, runtime: false},
      {:makeup, "~> 1.2"},
      {:makeup_elixir, "~> 1.0"},
      {:mix_test_watch, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["CHANGELOG.md", "README.md"],
      skip_undefined_reference_warnings_on: ["CHANGELOG.md"],
      source_url: @source_url,
      source_ref: "v#{@version}"
    ]
  end

  defp package do
    [
      name: "fakerer",
      maintainers: ["Art Kay"],
      files: ["lib", "mix.exs", "mix.lock", "README.md", "LICENSE", "CHANGELOG.md"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Changelog" => "#{@source_url}/blob/main/CHANGELOG.md",
        "Upstream (elixirs/faker)" => "https://github.com/elixirs/faker"
      }
    ]
  end
end
