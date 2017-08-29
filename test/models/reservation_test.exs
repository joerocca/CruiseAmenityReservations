defmodule CruiseAmenityReservations.ReservationTest do
  use CruiseAmenityReservations.ModelCase

  alias CruiseAmenityReservations.Reservation

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Reservation.changeset(%Reservation{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Reservation.changeset(%Reservation{}, @invalid_attrs)
    refute changeset.valid?
  end
end
