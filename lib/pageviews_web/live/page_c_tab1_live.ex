defmodule PageviewsWeb.PageCTab1Live do
  use PageviewsWeb, :live_component

  def render(assigns) do
    ~H"""
    <div id={@id}>
      <h1 class="text-3xl font-bold mb-16 underline decoration-green-500 decoration-4 underline-offset-4">
        Page C, Tab 1
      </h1>

      <nav class="flex flex-row gap-4">
        <.link
          class="bg-amber-500 shadow-lg shadow-amber-500/50 rounded-md p-2 text-black font-bold"
          navigate={~p"/page_b"}
        >
          Page B
        </.link>
      </nav>
    </div>
    """
  end
end
