defmodule CruiseAmenityReservations.AmenityView do
  use CruiseAmenityReservations.Web, :view

  def render("index.json", %{amenities: amenities}) do
    %{data: render_many(amenities, CruiseAmenityReservations.AmenityView, "amenity.json")}
  end

  def render("show.json", %{amenity: amenity}) do
    %{data: render_one(amenity, CruiseAmenityReservations.AmenityView, "amenity.json")}
  end

  def render("amenity.json", %{amenity: amenity}) do
    %{id: amenity.id,
      name: amenity.name,
      description: amenity.description,
      amenity_image: amenity.amenity_image,
      ship_location_image: amenity.ship_location_image}
  end
end
