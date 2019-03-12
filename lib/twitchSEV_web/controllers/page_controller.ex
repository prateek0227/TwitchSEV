defmodule TwitchSEVWeb.PageController do
  use TwitchSEVWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def parse(conn, %{"streamers" => streamers}) do
    render(conn, "streamers.html", streamers: streamers)
  end

  def parse(conn, _params) do
    render(conn, "streamers.html", streamers: [])
  end

  def view_channel(conn, %{
        "user_name" => user_name,
        "user_id" => user_id,
        "stream_id" => stream_id
      }) do
    render(conn, "embedded_player.html",
      user_name: user_name,
      user_id: user_id,
      stream_id: stream_id
    )
  end

  def user_follows_event(_conn, params) do
    IO.inspect(params)
  end
end
