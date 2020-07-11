defmodule CharDb.Repo do
  use Ecto.Repo,
    otp_app: :char_db,
    adapter: Ecto.Adapters.Postgres
end
