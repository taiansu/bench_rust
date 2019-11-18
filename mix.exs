defmodule BenchRust.MixProject do
  use Mix.Project

  def project do
    [
      app: :bench_rust,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      compilers: [:rustler] ++ Mix.compilers(),
      rustler_crates: rustler_crates(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.21.0"},
      {:benchee, "~> 1.0", only: :dev},
      {:benchee_html, "~> 1.0", only: :dev},
    ]
  end

  defp rustler_crates do
    [
      ruth: [path: "native/ruth", mode: (if Mix.env() == :prod, do: :release, else: :debug)]
      # ruth: [path: "native/ruth", mode: :release]
    ]
  end
end
