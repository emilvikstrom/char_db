defmodule CharDbWeb.Router do
  use CharDbWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    # plug :protect_from_forgery
    # plug :put_secure_browser_headers
  end

  pipeline :authentication do
    plug CharDbWeb.AuthenticatePlug
  end

  pipeline :get_user do
    plug CharDbWeb.GetUserPlug
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CharDbWeb do
    pipe_through [:browser, :authentication]
    get "/", LoginController, :index
    get "/login", LoginController, :index
    post "/login", LoginController, :login
  end

  scope "/new", CharDbWeb do
    pipe_through :browser
    get "/", NewUserController, :get
    post "/", NewUserController, :create
  end

  scope "/users", CharDbWeb do
    pipe_through [:browser, :authentication, :get_user]

    get "/", UserController, :get
  end

  scope "/home", CharDbWeb do
    pipe_through [:browser, :authentication, :get_user]
    get "/", HomeController, :get
  end

  scope "/character", CharDbWeb do
    pipe_through [:browser, :authentication, :get_user]
    get "/create", CharacterController, :creation
    post "/create", CharacterController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", CharDbWeb do
  #   pipe_through :api
  # end
end
