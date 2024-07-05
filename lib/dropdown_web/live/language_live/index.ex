defmodule DropdownWeb.LanguageLive.Index do
  use DropdownWeb, :live_view

  alias Dropdown.Languages
  alias Dropdown.Languages.Language

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :language_collection, Languages.list_language())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Language")
    |> assign(:language, Languages.get_language!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Language")
    |> assign(:language, %Language{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Language")
    |> assign(:language, nil)
  end

  @impl true
  def handle_info({DropdownWeb.LanguageLive.FormComponent, {:saved, language}}, socket) do
    {:noreply, stream_insert(socket, :language_collection, language)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    language = Languages.get_language!(id)
    {:ok, _} = Languages.delete_language(language)

    {:noreply, stream_delete(socket, :language_collection, language)}
  end
end
