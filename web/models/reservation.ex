defmodule HospitalityHackathonBackend.Reservation do
  use HospitalityHackathonBackend.Web, :model

  schema "reservations" do
    field :reserved_datetime, :naive_datetime

    # belongs_to :user, HospitalityHackathonBackend.User
    belongs_to :amenity, HospitalityHackathonBackend.Amenity

    timestamps()
  end

  @required_fields ~w(reserved_datetime amenity_id)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required([:reserved_datetime])
  end
end
