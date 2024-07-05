defmodule Dropdown.Languages.Language do
  use Ecto.Schema
  import Ecto.Changeset

  schema "language" do
    field :code, :string
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(language, attrs) do
    language
    |> cast(attrs, [:name, :code])
    |> validate_required([:name])
  end
end
