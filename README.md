# Fakerer

[![build](https://github.com/artkay/fakerer/actions/workflows/ci.yaml/badge.svg)](https://github.com/artkay/fakerer/actions/workflows/ci.yaml)
[![Version](https://img.shields.io/hexpm/v/fakerer.svg?style=flat-square)](https://hex.pm/packages/fakerer)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/fakerer/)
[![License](https://img.shields.io/hexpm/l/fakerer.svg?style=flat-square)](https://github.com/artkay/fakerer/blob/main/LICENSE)
[![Issues](https://img.shields.io/github/issues/artkay/fakerer.svg?style=flat-square)](https://github.com/artkay/fakerer/issues)
[![Downloads](https://img.shields.io/hexpm/dt/fakerer.svg?style=flat-square)](https://hex.pm/packages/fakerer)

> More Faker than Faker.

**Fakerer** is a maintained fork of [elixirs/faker](https://github.com/elixirs/faker). It is 100% API-compatible — same `Faker.*` modules, same functions, same behavior. Migrating from Faker to Fakerer is a one-line change in your `mix.exs`.

- [Fakerer](#fakerer)
  - [Why this exists](#why-this-exists)
  - [Credit](#credit)
  - [Migration from Faker](#migration-from-faker)
  - [Quickstart](#quickstart)
  - [Requirements](#requirements)
  - [Usage](#usage)
  - [Troubleshooting](#troubleshooting)
  - [Tools](#tools)
  - [Templating](#templating)
  - [Contributing](#contributing)
  - [License](#license)

## Why this exists

The upstream `faker` package shipped `0.18.0` in February 2024, then a `0.19.0-alpha.1` in February 2025 that has been sitting for over a year without graduating to a stable release. Open issues and PRs going back to 2023 are unaddressed.

I waited. I asked. I even nudged the alpha along. After repeated attempts to engage with the maintainers went unanswered, I decided to fork rather than keep waiting. No drama, no hard feelings — this is what open source forks are for.

## Credit

Fakerer stands entirely on the shoulders of the original library. Faker was created by [Igor Kapkov (@igas)](https://github.com/igas) and has been maintained for years by the [elixirs/faker](https://github.com/elixirs/faker) team and an enormous list of contributors. All of the locale data, all of the generators, all of the patterns — that's their work. The MIT license is preserved, and so is Igor's copyright.

If you use Fakerer, you are using Faker. Please go star [elixirs/faker](https://github.com/elixirs/faker).

## Migration from Faker

Change one line in your `mix.exs`:

```elixir
# Before
{:faker, "~> 0.18", only: :test}

# After
{:fakerer, "~> 1.0", only: :test}
```

That's it. Every `Faker.*` call you already have keeps working — `Faker.Person.first_name/0`, `Faker.Address.city/0`, `Faker.Internet.email/0`, all of it. `Faker.start()` in your `test_helper.exs` is unchanged too. The Hex package is `fakerer`, but the underlying OTP application is still `:faker` — so any `config :faker, locale: :de` (or similar) you have keeps working without modification.

Fakerer `1.0.0` includes everything from Faker `0.18.0` plus the changes that were sitting unreleased in `0.19.0-alpha.1` (Elixir 1.17 & 1.18 compatibility, deprecation warning fixes, the Airports IATA nil fix, and more — see the [CHANGELOG](CHANGELOG.md)).

## Quickstart

* add `{:fakerer, "~> 1.0"}` to your deps in `mix.exs`:

    ```elixir
    defp deps do
      [
        {:fakerer, "~> 1.0", only: :test}
      ]
    end
    ```

* run:

    ```
    mix deps.get
    ```

* add `Faker.start()` to `test/test_helper.exs`:

    ```elixir
    ExUnit.start()
    Faker.start()
    ```

* jump to [usage examples](#usage).

### Requirements

* OTP 26+
* Elixir 1.15+

## Usage

See [documentation](http://hexdocs.pm/fakerer/) and [usage examples](https://github.com/artkay/fakerer/blob/main/USAGE.md).

## Troubleshooting

* If you get a message like the one below when you call `Faker.Address.city/0`,
you need to add `:faker` to your application's mix file, in the `applications`
function, as above. (Yes, `:faker` — the Hex package is `:fakerer`, but the OTP
application name stays `:faker` so existing code, including `config :faker, ...`
in your application config, continues to work unchanged.)

    ```
    ** (FunctionClauseError) no function clause matching in Faker.Address.city_count/1
    lib/faker/address.ex:48: Faker.Address.city_count(nil)
    lib/faker/address.ex:41: Faker.Address.city/0
    ```

## Tools

Fakerer was designed as a lightweight library, that's why it can be easily used
with other tools.

## Templating

You can build templates for testing purposes with the
[Blacksmith](https://github.com/batate/blacksmith) project. See the Blacksmith
[readme](https://github.com/batate/blacksmith#readme) for details.

## Contributing

Contributions are welcome — see [CONTRIBUTING.md](https://github.com/artkay/fakerer/blob/main/CONTRIBUTING.md). Review cadence is roughly monthly.

## [License](https://github.com/artkay/fakerer/blob/main/LICENSE)

Released under the MIT License. Original copyright © Igor Kapkov; fork maintenance copyright © Art Kay.
