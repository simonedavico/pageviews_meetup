defmodule PageviewsWeb.PageBLive do
  use PageviewsWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, page_title: "Page B")
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1 class="text-3xl font-bold mb-16 underline decoration-amber-500 decoration-4 underline-offset-4">
      Page B
    </h1>

    <nav class="flex flex-row gap-4">
      <.link
        class="bg-sky-500 shadow-lg shadow-sky-500/50 rounded-md p-2 text-white font-bold"
        navigate={~p"/page_a"}
      >
        Page A
      </.link>
      <.link
        class="shadow-lg bg-gradient-to-r from-green-400 to-pink-500 rounded-md p-2 text-white font-bold"
        navigate={~p"/page_c"}
      >
        Page C
      </.link>
    </nav>
    """
  end
end
