defmodule RealtimeChatPhx.Chats.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :message, :string
    field :nickname, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:message, :nickname])
    |> validate_required([:message, :nickname])
  end
end
