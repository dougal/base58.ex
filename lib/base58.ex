defmodule Base58 do
  @moduledoc """
  Documentation for Base58.
  """

  @base      58
  @alphabets %{
    flickr:  String.split("123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ", ~r{}, trim: true),
    bitcoin: String.split("123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz", ~r{}, trim: true),
    ripple:  String.split("rpshnaf39wBUDNEGHJKLM4PQRST7VWXYZ2bcdeCg65jkm8oFqi1tuvAxyz", ~r{}, trim: true)
  }

  @doc """
  """
  def int_to_base58(integer, alphabet \\ :flickr)
  def int_to_base58(0, alphabet) do
    Enum.at(@alphabets[alphabet], 0)
  end
  def int_to_base58(integer, alphabet) do
    integer
    |> do_int_to_base58(alphabet)
    |> Enum.join
    |> String.reverse
  end

  defp do_int_to_base58(0, _) do
    []
  end
  defp do_int_to_base58(integer, alphabet) do
    index = rem(integer, @base)
    [ Enum.at(@alphabets[alphabet], index) | do_int_to_base58(div(integer - index, @base), alphabet)]
  end

  def base58_to_int(base58_string, alphabet \\ :flickr) do
    base58_string
    |> String.split(~r{}, trim: true)
    |> do_base58_to_string(alphabet)
  end

  defp do_base58_to_string([], _) do
    0
  end
  defp do_base58_to_string([ char | tail ], alphabet) do
    index_in_alphabet = Enum.find_index(@alphabets[alphabet], fn(x) -> x == char end)
    this_char_value = index_in_alphabet * :math.pow(@base, length(tail))
    this_char_value + do_base58_to_string(tail, alphabet)
  end
end
