defmodule HospitalityHackathonBackend.User do
  use HospitalityHackathonBackend.Web, :model

  schema "users" do
    field :name, :string
    field :ticket_id, :string

    timestamps()
  end

  @required_fields ~w(name ticket_id)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required([:name, :ticket_id])
    |> validate_length(:ticket_id, min: 1, max: 25)
    |> unique_constraint(:ticket_id)
  end
end
