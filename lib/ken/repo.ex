defmodule Ken.Repo do
  use Ecto.Repo,
    otp_app: :ken,
    adapter: Ecto.Adapters.Postgres
end
