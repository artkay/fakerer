defmodule Faker.Gov.Br do
  @moduledoc """
  Functions for data created/released by the Brazilian government.
  """

  @doc """
  Returns a random Brazilian CPF (Cadastro de Pessoas Físicas) number.

  The CPF is Brazil's individual taxpayer identification number. It contains
  nine base digits and two check digits, formatted as `XXX.XXX.XXX-XX`
  (e.g. `529.982.247-25`). Generated numbers have valid check digits but are
  not verified against government records and may match a real person's CPF.
  Numbers made of a single repeated digit (e.g. `111.111.111-11`) are never
  returned, since they are not valid CPFs.

  See [CPF number](https://en.wikipedia.org/wiki/CPF_number) for the
  full specification.
  """
  @spec cpf() :: String.t()
  def cpf do
    number = Faker.random_between(0, 999_999_999)

    if rem(number, 111_111_111) == 0 do
      cpf()
    else
      base = number |> Integer.to_string() |> String.pad_leading(9, "0")

      "#{base}#{check_digits(base)}"
      |> String.replace(~r/(\d{3})(\d{3})(\d{3})(\d{2})/, "\\1.\\2.\\3-\\4")
    end
  end

  defp check_digits(base) do
    first_check_digit = calculate_cpf_check_digit(base)
    second_check_digit = calculate_cpf_check_digit("#{base}#{first_check_digit}")

    "#{first_check_digit}#{second_check_digit}"
  end

  defp calculate_cpf_check_digit(base) do
    digits = base |> String.graphemes() |> Enum.map(&String.to_integer/1)

    sum =
      Enum.zip(digits, (length(digits) + 1)..2//-1)
      |> Enum.map(fn {digit, weight} -> digit * weight end)
      |> Enum.reduce(&+/2)

    remainder = rem(sum, 11)

    if remainder < 2, do: 0, else: 11 - remainder
  end
end
