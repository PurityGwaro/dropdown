defmodule DropdownWeb.LanguageLive.Show do
  use DropdownWeb, :live_view

  alias Dropdown.Languages

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:language, Languages.get_language!(id))}
  end

  defp page_title(:show), do: "Show Language"
  defp page_title(:edit), do: "Edit Language"
end
