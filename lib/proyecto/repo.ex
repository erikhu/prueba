defmodule Proyecto.Repo do
  use Ecto.Repo,
    otp_app: :proyecto,
    adapter: Ecto.Adapters.Postgres
end
