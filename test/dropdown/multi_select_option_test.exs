defmodule Dropdown.MultiSelectOptionTest do
  use Dropdown.DataCase

  alias Dropdown.MultiSelectOption

  describe "options" do
    alias Dropdown.MultiSelectOption.Option

    import Dropdown.MultiSelectOptionFixtures

    @invalid_attrs %{code: nil, name: nil}

    test "list_options/0 returns all options" do
      option = option_fixture()
      assert MultiSelectOption.list_options() == [option]
    end

    test "get_option!/1 returns the option with given id" do
      option = option_fixture()
      assert MultiSelectOption.get_option!(option.id) == option
    end

    test "create_option/1 with valid data creates a option" do
      valid_attrs = %{code: "some code", name: "some name"}

      assert {:ok, %Option{} = option} = MultiSelectOption.create_option(valid_attrs)
      assert option.code == "some code"
      assert option.name == "some name"
    end

    test "create_option/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MultiSelectOption.create_option(@invalid_attrs)
    end

    test "update_option/2 with valid data updates the option" do
      option = option_fixture()
      update_attrs = %{code: "some updated code", name: "some updated name"}

      assert {:ok, %Option{} = option} = MultiSelectOption.update_option(option, update_attrs)
      assert option.code == "some updated code"
      assert option.name == "some updated name"
    end

    test "update_option/2 with invalid data returns error changeset" do
      option = option_fixture()
      assert {:error, %Ecto.Changeset{}} = MultiSelectOption.update_option(option, @invalid_attrs)
      assert option == MultiSelectOption.get_option!(option.id)
    end

    test "delete_option/1 deletes the option" do
      option = option_fixture()
      assert {:ok, %Option{}} = MultiSelectOption.delete_option(option)
      assert_raise Ecto.NoResultsError, fn -> MultiSelectOption.get_option!(option.id) end
    end

    test "change_option/1 returns a option changeset" do
      option = option_fixture()
      assert %Ecto.Changeset{} = MultiSelectOption.change_option(option)
    end
  end
end
