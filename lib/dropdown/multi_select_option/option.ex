defmodule Dropdown.MultiSelectOption.Option do
  use Ecto.Schema
  import Ecto.Changeset

  schema "options" do
    field :code, :string
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(option, attrs) do
    option
    |> cast(attrs, [:name, :code])
    |> validate_required([:name, :code])
  end
end
