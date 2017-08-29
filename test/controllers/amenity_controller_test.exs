defmodule CruiseAmenityReservations.AmenityControllerTest do
  use CruiseAmenityReservations.ConnCase

  alias CruiseAmenityReservations.Amenity
  @valid_attrs %{amenity_image: "some content", description: "some content", name: "some content", ship_location_image: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, amenity_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    amenity = Repo.insert! %Amenity{}
    conn = get conn, amenity_path(conn, :show, amenity)
    assert json_response(conn, 200)["data"] == %{"id" => amenity.id,
      "name" => amenity.name,
      "description" => amenity.description,
      "amenity_image" => amenity.amenity_image,
      "ship_location_image" => amenity.ship_location_image}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, amenity_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, amenity_path(conn, :create), amenity: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Amenity, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, amenity_path(conn, :create), amenity: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    amenity = Repo.insert! %Amenity{}
    conn = put conn, amenity_path(conn, :update, amenity), amenity: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Amenity, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    amenity = Repo.insert! %Amenity{}
    conn = put conn, amenity_path(conn, :update, amenity), amenity: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    amenity = Repo.insert! %Amenity{}
    conn = delete conn, amenity_path(conn, :delete, amenity)
    assert response(conn, 204)
    refute Repo.get(Amenity, amenity.id)
  end
end
