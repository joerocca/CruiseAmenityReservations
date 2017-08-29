defmodule CruiseAmenityReservations.Router do
  use CruiseAmenityReservations.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CruiseAmenityReservations do
    pipe_through :api

    resources "/sessions", SessionController, only: [:create]
  end

  scope "/api", CruiseAmenityReservations do
    pipe_through [:api, CruiseAmenityReservations.Auth]

    resources "/user", UserController, only: [:show, :update], singleton: true

    resources "/amenities", AmenityController, except: [:new, :edit] do
      resources "/reservations", ReservationController, except: [:new, :edit]
    end
  end

end
