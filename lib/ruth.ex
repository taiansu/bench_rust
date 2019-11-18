defmodule Ruth do
  use Rustler, otp_app: :bench_rust, crate: "ruth"

  def add(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
  def process_list(_a), do: :erlang.nif_error(:nif_not_loaded)
end
