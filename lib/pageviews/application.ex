defmodule Pageviews.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, %{env: env} = _args) do
    children =
      [
        # Start the Telemetry supervisor
        PageviewsWeb.Telemetry,
        # Start the Ecto repository
        Pageviews.Repo,
        # Start the PubSub system
        {Phoenix.PubSub, name: Pageviews.PubSub},
        # Start Finch
        {Finch, name: Pageviews.Finch},
        # Start the Endpoint (http/https)
        PageviewsWeb.Endpoint
        # Start a worker by calling: Pageviews.Worker.start_link(arg)
        # {Pageviews.Worker, arg}
      ] ++ supervisors(env)

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pageviews.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PageviewsWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp supervisors(:test), do: []
  defp supervisors(_), do: [PageviewsWeb.Tracking.Supervisor]
end
