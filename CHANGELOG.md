# Changelog

All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](http://semver.org/) and the [Keep a CHANGELOG](http://keepachangelog.com) format.

> Looking for the history of changes from upstream [elixirs/faker](https://github.com/elixirs/faker) (versions through `0.19.0-alpha.1`)? See [CHANGELOG-PRE-1.0.md](CHANGELOG-PRE-1.0.md).

## Unreleased

### Fixed

- `Faker.Vehicle.En` - ensure generated VINs have the correct check digit [[@rubysolo](https://github.com/rubysolo)]

## [1.0.1](https://github.com/artkay/fakerer/compare/v1.0.0...v1.0.1) (2026-05-12)

### Fixed

- **Docs**: corrected the `mix.exs` migration snippet. Because the Hex package name (`fakerer`) differs from the OTP application name (`:faker`), the dep tuple must use the `hex:` option:

  ```elixir
  {:faker, "~> 1.0", hex: :fakerer, only: :test}
  ```

  The previous form (`{:fakerer, "~> 1.0", only: :test}`) would cause Mix to mismatch the dep atom against the installed `.app` file. No code or behavior changed in this release - only the README and CHANGELOG migration guidance.

## [1.0.0](https://github.com/artkay/fakerer/compare/v0.19.0-alpha.1...v1.0.0) (2026-05-11)

This is the first release of **Fakerer**, a maintained fork of [elixirs/faker](https://github.com/elixirs/faker).

### Fork

- Forked from `elixirs/faker` at `0.19.0-alpha.1`.
- Renamed the Hex package to `fakerer`. The `Faker.*` module API and the underlying OTP application name (`:faker`) are unchanged - migration is a one-line change in `mix.exs`, and `config :faker, ...` keeps working without modification.
- Promoted to `1.0.0` to signal API stability under new maintenance.
- **Raised minimum Elixir to 1.16** The supported matrix is now Elixir 1.16 / 1.17 / 1.18 / 1.19 across OTP 26 / 27 / 28.

### Included from `0.19.0-alpha.1` (upstream's pre-release that never went stable)

- Elixir 1.17 & 1.18 compatibility ([elixirs/faker#565](https://github.com/elixirs/faker/issues/565))
- Fix Elixir deprecation warnings ([elixirs/faker#571](https://github.com/elixirs/faker/issues/571))
- Remove `nil` option for Airports IATA ([elixirs/faker#492](https://github.com/elixirs/faker/issues/492))
- Release automation ([elixirs/faker#581](https://github.com/elixirs/faker/issues/581))
- Add missing `@semantic-release/exec` ([elixirs/faker#584](https://github.com/elixirs/faker/issues/584))
- CI `workflow_call` support ([elixirs/faker#586](https://github.com/elixirs/faker/issues/586))
- CI write permission fix ([elixirs/faker#590](https://github.com/elixirs/faker/issues/590))
- CI permissions fix ([elixirs/faker#591](https://github.com/elixirs/faker/issues/591))
- Fix typo in CI workflow path ([elixirs/faker#585](https://github.com/elixirs/faker/issues/585))
- Makeup packages update ([elixirs/faker#592](https://github.com/elixirs/faker/issues/592))
- Fix docs generation ([elixirs/faker#594](https://github.com/elixirs/faker/issues/594))
