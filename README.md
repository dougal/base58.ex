# Base58

Elixir library for encoding/decoding integers to/from Base58. Supports Flickr, Bitcoin, and Ripple alphabets.


## Usage

Converting an integer into a Base58 string:

```elixir
iex> Base58.int_to_base58(4815162342)
"8kuY1o"
```

Converting a Base58 string to the represented integer:

```elixir
iex> Base58.base58_to_int("8kuY1o")
4815162342
```


## Installation

The package can be installed by adding scatter_swap to your list of dependencies in mix.exs:

```elixir
def deps do
  [{:base58ex, "~> 0.1.0"}]
end
```


## What is Base58?

From [Wikipedia](https://en.wikipedia.org/wiki/Base58):

> Base58 is a group of binary-to-text encoding schemes used to represent large integers as alphanumeric text. It is similar to Base64 but has been modified to avoid both non-alphanumeric characters and letters which might look ambiguous when printed. It is therefore designed for human users who manually enter the data, copying from some visual source, but also allows easy copy and paste because a double-click will usually select the whole string.

Base58 alphabets are made up of the characters a-z, A-Z, and 0-9, with visually ambiguous characters (0, O, I, l) removed.


## Supported Alphabets

This library supports three of of the most common Base58 libraries, which while being identical in their characters, and ordered differently.

The alphabet to be used can be selected by passing an atom for the desired alphabet as a second argument to `ScatterSwap.int_to_base58/2` and `ScatterSwap.base64_to_int/2`.


### Flickr

Identifier: `:flickr`

This is the default alphabet. Used to generate [Flickr short URLs](https://www.flickr.com/groups/api/discuss/72157616713786392/). The order of it's characters is numeric, lowercase-alpha, uppercase-alpha.

    123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ


### Bitcoin

Identifier: `:bitcoin`

The alphabet used by the [Bitcoin](https://en.wikipedia.org/wiki/Bitcoin) protocol. The order of it's characters is numeric, uppercase-alpha, lowercase-alpha.

    123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz


### Ripple

Identifier: `:ripple`

The alphabet used by the [Ripple protocol](https://en.wikipedia.org/wiki/Ripple_(payment_protocol)). The order of the characters were chosen such that the [low values match the primitives of the protocol](http://bitcoin.stackexchange.com/questions/14124/why-is-ripples-base58-alphabet-so-weird).

    rpshnaf39wBUDNEGHJKLM4PQRST7VWXYZ2bcdeCg65jkm8oFqi1tuvAxyz


## Contributing

Source repository is at https://github.com/dougal/base58.ex, please file issues and pull requests there.


## Documentation

Documentation can be found online at [HexDocs](https://hexdocs.pm/base58ex).

Alternatively, you can generate docs from the project root with:

    mix docs


## Copyright and Licence

Copyright (c) 2017, Douglas F Shearer.

Base58 is licensed under the MIT Licence.
