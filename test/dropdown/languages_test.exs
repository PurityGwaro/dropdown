defmodule Dropdown.LanguagesTest do
  use Dropdown.DataCase

  alias Dropdown.Languages

  describe "language" do
    alias Dropdown.Languages.Language

    import Dropdown.LanguagesFixtures

    @invalid_attrs %{code: nil, name: nil}

    test "list_language/0 returns all language" do
      language = language_fixture()
      assert Languages.list_language() == [language]
    end

    test "get_language!/1 returns the language with given id" do
      language = language_fixture()
      assert Languages.get_language!(language.id) == language
    end

    test "create_language/1 with valid data creates a language" do
      valid_attrs = %{code: "some code", name: "some name"}

      assert {:ok, %Language{} = language} = Languages.create_language(valid_attrs)
      assert language.code == "some code"
      assert language.name == "some name"
    end

    test "create_language/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Languages.create_language(@invalid_attrs)
    end

    test "update_language/2 with valid data updates the language" do
      language = language_fixture()
      update_attrs = %{code: "some updated code", name: "some updated name"}

      assert {:ok, %Language{} = language} = Languages.update_language(language, update_attrs)
      assert language.code == "some updated code"
      assert language.name == "some updated name"
    end

    test "update_language/2 with invalid data returns error changeset" do
      language = language_fixture()
      assert {:error, %Ecto.Changeset{}} = Languages.update_language(language, @invalid_attrs)
      assert language == Languages.get_language!(language.id)
    end

    test "delete_language/1 deletes the language" do
      language = language_fixture()
      assert {:ok, %Language{}} = Languages.delete_language(language)
      assert_raise Ecto.NoResultsError, fn -> Languages.get_language!(language.id) end
    end

    test "change_language/1 returns a language changeset" do
      language = language_fixture()
      assert %Ecto.Changeset{} = Languages.change_language(language)
    end
  end
end
