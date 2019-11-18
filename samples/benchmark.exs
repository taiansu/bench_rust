Benchee.run(%{
  "native add" => fn -> BenchRust.add(1, 2) end,
  "rustler add" => fn -> Ruth.add(1, 2) end,
  },
  formatters: [
    Benchee.Formatters.HTML,
    Benchee.Formatters.Console
])

Benchee.run(%{
  "native map" => fn input -> BenchRust.process_list(input) end,
  "rustler map" => fn input -> Ruth.process_list(input) end,
  },
  inputs: %{
    "Small: 1..1_000" => 1..1_000,
    "Medium: 1.._100_000" => 1..100_000,
    "Large: 1..10_000_000" => 1..10_000_000,
    "Extremely Large: 1..100_000_000" => 1..100_000_000,
  },
  formatters: [
    Benchee.Formatters.HTML,
    Benchee.Formatters.Console
])
