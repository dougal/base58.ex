defmodule Base58.Mixfile do
  use Mix.Project

  def project do
    [app: :base58,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     docs: docs()]
  end


  def application do
    [extra_applications: []]
  end

  defp deps do
    [
      {:credo, "~> 0.7",   only: :dev},
      {:ex_doc, "~> 0.13", only: :dev}
    ]
  end

  defp docs do
    [
      main:       "readme",
      extras:     ["README.md"]
    ]
  end
end
