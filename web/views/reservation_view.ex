defmodule HospitalityHackathonBackend.ReservationView do
  use HospitalityHackathonBackend.Web, :view

  def render("index.json", %{reservations: reservations}) do
    %{data: render_many(reservations, HospitalityHackathonBackend.ReservationView, "reservation.json")}
  end

  def render("show.json", %{reservation: reservation}) do
    %{data: render_one(reservation, HospitalityHackathonBackend.ReservationView, "reservation.json")}
  end

  def render("reservation.json", %{reservation: reservation}) do
    %{id: reservation.id,
      reserved_datetime: reservation.reserved_datetime,
      amenity_id: reservation.amenity_id,
      user_id: reservation.user_id}
  end
end
