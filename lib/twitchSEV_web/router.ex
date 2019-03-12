defmodule TwitchSEVWeb.Router do
  use TwitchSEVWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash
  end

  scope "/", TwitchSEVWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/streamers", PageController, :parse
    get "/view-channel/:stream_id/user/:user_id/:user_name", PageController, :view_channel
    get "/user-follows-event", PageController, :user_follows_event
  end

  scope "/api", TwitchSEVWeb do
    pipe_through :api

    post "/parse-streams", PageController, :parse
  end
end
