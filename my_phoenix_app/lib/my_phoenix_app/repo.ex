defmodule MyPhoenixApp.Repo do
  use Ecto.Repo,
    otp_app: :my_phoenix_app,
    adapter: Ecto.Adapters.Postgres
end
