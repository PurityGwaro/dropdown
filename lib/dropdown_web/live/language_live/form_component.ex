defmodule DropdownWeb.LanguageLive.FormComponent do
  use DropdownWeb, :live_component

  alias Dropdown.Languages

  import LiveSelect

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage language records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="language-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.live_select
          field={@form[:name]}
          phx-target={@myself}
          mode={:tags}
          placeholder="Select Language(s)"
          update_min_len={1}
        >
          <:option :let={option} class="bg-[#eee]">
            <div class="flex bg-[#eee] px-2">
              &nbsp;<%= option.label %>
            </div>
          </:option>
          <:tag :let={option}>
            &nbsp;<%= option.label %>
          </:tag>
        </.live_select>
        <:actions>
          <.button phx-disable-with="Saving...">Save Language</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def handle_event("live_select_change", %{"text" => text, "id" => live_select_id}, socket) do
    # IO.write("anything--------------")
    languages = Languages.get_languages_with_code(text)
    # IO.inspect(languages)
    send_update(LiveSelect.Component, id: live_select_id, options: languages)

    {:noreply, socket}
  end

  @impl true
  def update(%{language: language} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Languages.change_language(language))
     end)}
  end

  @impl true
  def handle_event("validate", %{"language" => language_params}, socket) do
    changeset = Languages.change_language(socket.assigns.language, language_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"language" => language_params}, socket) do
    save_language(socket, socket.assigns.action, language_params)
  end

  defp save_language(socket, :edit, language_params) do
    languages = language_params["name"] |> Enum.join(",")

    language_params |> Map.replace("name", languages)
    new_params = %{"name" => languages}
    case Languages.update_language(socket.assigns.language, new_params) do
      {:ok, language} ->
        notify_parent({:saved, language})

        {:noreply,
         socket
         |> put_flash(:info, "Language updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_language(socket, :new, language_params) do
    languages = language_params["name"] |> Enum.join(",")

    language_params |> Map.replace("name", languages)
    new_params = %{"name" => languages}
    case Languages.create_language(new_params) do
      {:ok, language} ->
        notify_parent({:saved, language})

        {:noreply,
         socket
         |> put_flash(:info, "Language created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
