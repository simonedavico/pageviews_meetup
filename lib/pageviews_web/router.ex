defmodule PageviewsWeb.Router do
  use PageviewsWeb, :router

  import PageviewsWeb.Tracking.Plug

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {PageviewsWeb.Layouts, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", PageviewsWeb do
    pipe_through([:browser, :track_session])

    live_session :default,
      session: {PageviewsWeb.Tracking.Hooks, :session, []},
      on_mount: PageviewsWeb.Tracking.Hooks do
      live("/page_a", PageALive)
      live("/page_b", PageBLive)

      scope "/page_c" do
        live("/", PageCLive)

        live("/tab_1", PageCLive, :tab_1)
        live("/tab_2", PageCLive, :tab_2)
      end
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", PageviewsWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:pageviews, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through(:browser)

      live_dashboard("/dashboard",
        metrics: PageviewsWeb.Telemetry
      )

      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
