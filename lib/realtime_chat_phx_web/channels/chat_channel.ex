defmodule RealtimeChatPhxWeb.ChatChannel do
  use RealtimeChatPhxWeb, :channel
  alias RealtimeChatPhx.Chats

  @impl true
  def join("chat:lobby", _payload, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_in("new:msg", payload, socket) do
    broadcast(socket, "received:msg", payload)

    Chats.create_message(payload)

    {:noreply, socket}
  end

  @impl true
  def handle_in("shout", payload, socket) do
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end
end
