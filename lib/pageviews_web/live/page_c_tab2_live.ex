defmodule PageviewsWeb.PageCTab2Live do
  use PageviewsWeb, :live_component

  def render(assigns) do
    ~H"""
    <div id={@id}>
      <h1 class="text-3xl font-bold mb-16 underline decoration-pink-500 decoration-4 underline-offset-4">
        Page C, Tab 2
      </h1>

      <nav class="flex flex-row gap-4">
        <.link
          class="bg-sky-500 shadow-lg shadow-sky-500/50 rounded-md p-2 text-white font-bold"
          navigate={~p"/page_a"}
        >
          Page A
        </.link>
      </nav>
    </div>
    """
  end
end
