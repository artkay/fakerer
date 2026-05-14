defmodule Faker.Gov.ItTest do
  use ExUnit.Case, async: true

  import Faker.Gov.It

  doctest Faker.Gov.It

  @iterations 10_000
  @format ~r/^[BCDFGHLMNPQRSTVZ]{6}\d{2}[ABCDEHLMPRST]\d{2}[ABCDEFGHILMZ]\d{3}[A-Z]$/

  test "fiscal id has the expected shape" do
    Stream.repeatedly(&fiscal_id/0)
    |> Enum.take(@iterations)
    |> Enum.each(fn generated_value ->
      assert String.length(generated_value) == 16
      assert generated_value =~ @format
    end)
  end
end
