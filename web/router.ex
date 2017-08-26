defmodule HospitalityHackathonBackend.Router do
  use HospitalityHackathonBackend.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HospitalityHackathonBackend do
    pipe_through :api

    resources "/amenities", AmenityController, except: [:new, :edit] do
      resources "/reservations", ReservationController, except: [:new, :edit]
    end
  end
end