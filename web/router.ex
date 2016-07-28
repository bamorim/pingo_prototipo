defmodule Pingo.Router do
  use Pingo.Web, :router
  use ExAdmin.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Pingo do
    pipe_through [:browser, :browser_auth]

    get "/", PageController, :index

    resources "/registrations", RegistrationController, only: [:new, :create]

    get "/login", SessionController, :new, as: :login
    post "/login", SessionController, :create, as: :login
    get "/logout", SessionController, :delete, as: :logout
  end

  scope "/admin", ExAdmin do
    pipe_through :browser
    admin_routes
  end
end
