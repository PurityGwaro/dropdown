defmodule Dropdown.MultiSelectOptionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Dropdown.MultiSelectOption` context.
  """

  @doc """
  Generate a option.
  """
  def option_fixture(attrs \\ %{}) do
    {:ok, option} =
      attrs
      |> Enum.into(%{
        code: "some code",
        name: "some name"
      })
      |> Dropdown.MultiSelectOption.create_option()

    option
  end
end
