defmodule HospitalityHackathonBackend.Amenity do
  use HospitalityHackathonBackend.Web, :model

  schema "amenities" do
    field :name, :string
    field :description, :string
    field :amenity_image, :string
    field :ship_location_image, :string

    has_many :reservations, HospitalityHackathonBackend.Reservation, on_delete: :delete_all, on_replace: :delete

    timestamps()
  end

  @required_fields ~w(name description amenity_image ship_location_image)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required([:name, :description, :amenity_image, :ship_location_image])
  end
end
