defmodule ProyectoWeb.Router do
  use ProyectoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ProyectoWeb do
    pipe_through [:browser]
    forward "/jobs", BackgroundJob.Plug
    get "/", PageController, :index
    get "/test", PageController, :test
    get "/pagos", PageController, :payment
    post "/pagos", PageController, :pay
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    get "/another/:id", HelloController, :another
    resources "/users", UserController
  end


  # Other scopes may use custom stacks.
  # scope "/api", ProyectoWeb do
  #   pipe_through :api
  # end
end
