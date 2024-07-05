defmodule DropdownWeb.LanguageLiveTest do
  use DropdownWeb.ConnCase

  import Phoenix.LiveViewTest
  import Dropdown.LanguagesFixtures

  @create_attrs %{code: "some code", name: "some name"}
  @update_attrs %{code: "some updated code", name: "some updated name"}
  @invalid_attrs %{code: nil, name: nil}

  defp create_language(_) do
    language = language_fixture()
    %{language: language}
  end

  describe "Index" do
    setup [:create_language]

    test "lists all language", %{conn: conn, language: language} do
      {:ok, _index_live, html} = live(conn, ~p"/language")

      assert html =~ "Listing Language"
      assert html =~ language.code
    end

    test "saves new language", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/language")

      assert index_live |> element("a", "New Language") |> render_click() =~
               "New Language"

      assert_patch(index_live, ~p"/language/new")

      assert index_live
             |> form("#language-form", language: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#language-form", language: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/language")

      html = render(index_live)
      assert html =~ "Language created successfully"
      assert html =~ "some code"
    end

    test "updates language in listing", %{conn: conn, language: language} do
      {:ok, index_live, _html} = live(conn, ~p"/language")

      assert index_live |> element("#language-#{language.id} a", "Edit") |> render_click() =~
               "Edit Language"

      assert_patch(index_live, ~p"/language/#{language}/edit")

      assert index_live
             |> form("#language-form", language: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#language-form", language: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/language")

      html = render(index_live)
      assert html =~ "Language updated successfully"
      assert html =~ "some updated code"
    end

    test "deletes language in listing", %{conn: conn, language: language} do
      {:ok, index_live, _html} = live(conn, ~p"/language")

      assert index_live |> element("#language-#{language.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#language-#{language.id}")
    end
  end

  describe "Show" do
    setup [:create_language]

    test "displays language", %{conn: conn, language: language} do
      {:ok, _show_live, html} = live(conn, ~p"/language/#{language}")

      assert html =~ "Show Language"
      assert html =~ language.code
    end

    test "updates language within modal", %{conn: conn, language: language} do
      {:ok, show_live, _html} = live(conn, ~p"/language/#{language}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Language"

      assert_patch(show_live, ~p"/language/#{language}/show/edit")

      assert show_live
             |> form("#language-form", language: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#language-form", language: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/language/#{language}")

      html = render(show_live)
      assert html =~ "Language updated successfully"
      assert html =~ "some updated code"
    end
  end
end
