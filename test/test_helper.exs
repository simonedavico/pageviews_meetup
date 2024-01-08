Mox.defmock(PageviewTrackerMock, for: PageviewsWeb.Tracking.PageviewTracker)
Application.put_env(:pageviews, :pageview_tracker, PageviewTrackerMock)

ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(Pageviews.Repo, :manual)
