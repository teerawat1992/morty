defmodule Morty.Web.Router do
  use Morty.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", Morty.Web do
    pipe_through :browser

    get "/", DonationController, :index
    resources "/donations", DonationController, only: [:index, :create]
    resources "/charities", CharityController, only: [:index]
  end
end
