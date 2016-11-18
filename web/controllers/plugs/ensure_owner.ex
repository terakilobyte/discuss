defmodule Discuss.Plugs.EnsureAuth do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Repo
  alias Discuss.Router.Helpers

  def init(_params) do
  end

  def call(conn, _params) do
    topic = Repo.get!(Discuss.Topic, conn.params["id"])
    if conn.assigns.user do
      case topic.user_id == conn.assigns.user.id do
        false ->
          conn
          |> put_flash(:error, "You are not authorized to perform this action")
          |> redirect(to: Helpers.topic_path(conn, :index))
          |> halt()
        true ->
          conn
      end
    else
      conn
    end
  end
end
