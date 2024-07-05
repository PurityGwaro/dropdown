defmodule Dropdown.Repo.Migrations.CreateLanguage do
  use Ecto.Migration

  def change do
    create table(:language) do
      add :name, :string
      add :code, :string

      timestamps(type: :utc_datetime)
    end
  end
end
