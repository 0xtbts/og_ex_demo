defmodule OgExDemo.Repo do
  use Ecto.Repo,
    otp_app: :og_ex_demo,
    adapter: Ecto.Adapters.SQLite3
end
