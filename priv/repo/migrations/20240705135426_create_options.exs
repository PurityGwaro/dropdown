defmodule Dropdown.Repo.Migrations.CreateOptions do
  use Ecto.Migration

  def change do
    create table(:options) do
      add :name, :string
      add :code, :string

      timestamps(type: :utc_datetime)
    end
  end
end
