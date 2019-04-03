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
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  scope "/", ProyectoWeb do
    pipe_through [:browser]
    forward "/jobs", BackgroundJob.Plug
    get "/", PageController, :index
    get "/payment", PageController, :payment
    end


  # Other scopes may use custom stacks.
   scope "/external", ProyectoWeb do
    pipe_through :api

    post "/payment", PageController, :pay
    post "/payment/confirmation", PageController, :confirmation_pay
  end
end
