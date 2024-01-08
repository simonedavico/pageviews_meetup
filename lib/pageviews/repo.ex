defmodule Pageviews.Repo do
  use Ecto.Repo,
    otp_app: :pageviews,
    adapter: Ecto.Adapters.Postgres
end
