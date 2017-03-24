defmodule Base58 do
  @moduledoc """
  Documentation for Base58.
  """

  @alphabet String.split("123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ", ~r{}, trim: true)
  @base     58

  @doc """
  """
  def int_to_base58(integer) do
    integer
    |> do_int_to_base58
    |> Enum.join
    |> String.reverse
  end

  defp do_int_to_base58(0) do
    []
  end
  defp do_int_to_base58(integer) do
    index = rem(integer, @base)
    [ Enum.at(@alphabet, index) | do_int_to_base58(div(integer - index, @base))]
  end

  def base58_to_int(base58_string) do
    base58_string
    |> String.split(~r{}, trim: true)
    |> do_base58_to_string
  end

  defp do_base58_to_string([]) do
    0
  end
  defp do_base58_to_string(char_list) do
    [ char | tail ] = char_list

    index_in_alphabet = Enum.find_index(@alphabet, fn(x) -> x == char end)
    this_char_value = index_in_alphabet * :math.pow(@base, length(tail))
    this_char_value + do_base58_to_string(tail)
  end
end
