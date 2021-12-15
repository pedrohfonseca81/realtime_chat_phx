defmodule RealtimeChatPhxWeb.PageController do
  use RealtimeChatPhxWeb, :controller
  alias RealtimeChatPhx.Chats

  def index(conn, _params) do
    messages = Chats.list_messages()
    render(conn, "index.html", %{:messages => messages})
  end
end
