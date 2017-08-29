defmodule CruiseAmenityReservations.Reservation do
  use CruiseAmenityReservations.Web, :model

  alias CruiseAmenityReservations.Reservation

  schema "reservations" do
    field :reserved_datetime, :naive_datetime

    belongs_to :user, CruiseAmenityReservations.User
    belongs_to :amenity, CruiseAmenityReservations.Amenity

    timestamps()
  end

  @required_fields ~w(reserved_datetime user_id amenity_id)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required([:reserved_datetime, :user_id, :amenity_id])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:amenity_id)
  end

  #Queries
  def get_by_amenity(query \\ Reservation, amenity_id) do
    from r in query,
      where: r.amenity_id == ^amenity_id
  end

  def get_by_user_and_amenity(query \\ Reservation, user_id, amenity_id) do
    from r in query,
      where: r.user_id == ^user_id and r.amenity_id == ^amenity_id
  end
end
