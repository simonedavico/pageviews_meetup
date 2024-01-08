defmodule PageviewsWeb.PageALive do
  use PageviewsWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, page_title: "Page A")
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1 class="text-3xl font-bold mb-16 underline decoration-sky-500 decoration-4 underline-offset-4">
      Page A
    </h1>

    <nav class="flex flex-row gap-4">
      <.link
        class="bg-amber-500 shadow-lg shadow-amber-500/50 rounded-md p-2 text-black font-bold"
        navigate={~p"/page_b"}
      >
        Page B
      </.link>
      <.link
        class="shadow-lg bg-gradient-to-r from-green-500 to-pink-500 rounded-md p-2 text-white font-bold"
        navigate={~p"/page_c"}
      >
        Page C
      </.link>
    </nav>
    """
  end
end
