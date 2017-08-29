defmodule CruiseAmenityReservations.AmenityTest do
  use CruiseAmenityReservations.ModelCase

  alias CruiseAmenityReservations.Amenity

  @valid_attrs %{amenity_image: "some content", description: "some content", name: "some content", ship_location_image: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Amenity.changeset(%Amenity{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Amenity.changeset(%Amenity{}, @invalid_attrs)
    refute changeset.valid?
  end
end
