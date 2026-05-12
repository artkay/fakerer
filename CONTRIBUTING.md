Contributions are welcome — thanks for considering it.

This is **Fakerer**, a maintained fork of [elixirs/faker](https://github.com/elixirs/faker). The fork keeps the `Faker.*` API stable; new features and fixes are accepted here.

## Maintainers

* [Art Kay](https://github.com/artkay)

Review cadence is **roughly monthly**. This is a personal project, not infrastructure-critical software — I'll get to PRs as I can, but I won't let them sit for a year.

## Submitting a PR

1. Fork the repo.
1. Run the tests. We only take pull requests with passing tests, and it's great to know that you have a clean slate: `mix deps.get && mix test`
1. We do `mix format` to keep our code base consistent and clean.
1. Please add a test for your change. Only refactoring and documentation changes require no new tests. If you are adding functionality or fixing a bug, we need a test!
1. If you're adding doctests, please make sure to include 4 examples. 4 is our magic number in this library and this is our pattern.
1. When removing a method, don't forget to deprecate it. You can use `@deprecated "message"` to deprecate a faker interface method.
1. Push to your fork and submit a pull request.

## Review checklist

When reviewing a PR, I'm asking:

* Does it work as described? A PR should have a great description.
* Is it understandable?
* Is it well implemented?
* Is it well tested?
* Is it well documented?
* Does it follow the structure of the project?
