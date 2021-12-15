defmodule RealtimeChatPhx.Repo do
  use Ecto.Repo,
    otp_app: :realtime_chat_phx,
    adapter: Ecto.Adapters.Postgres
end
