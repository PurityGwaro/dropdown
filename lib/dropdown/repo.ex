defmodule Dropdown.Repo do
  use Ecto.Repo,
    otp_app: :dropdown,
    adapter: Ecto.Adapters.Postgres
end
