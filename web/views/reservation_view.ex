defmodule CruiseAmenityReservations.ReservationView do
  use CruiseAmenityReservations.Web, :view

  def render("index.json", %{reservations: reservations}) do
    %{data: render_many(reservations, CruiseAmenityReservations.ReservationView, "reservation.json")}
  end

  def render("show.json", %{reservation: reservation}) do
    %{data: render_one(reservation, CruiseAmenityReservations.ReservationView, "reservation.json")}
  end

  def render("reservation.json", %{reservation: reservation}) do
    %{id: reservation.id,
      reserved_datetime: reservation.reserved_datetime,
      amenity_id: reservation.amenity_id,
      user_id: reservation.user_id}
  end
end
