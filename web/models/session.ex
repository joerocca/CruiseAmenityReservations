defmodule HospitalityHackathonBackend.Session do
  use HospitalityHackathonBackend.Web, :model

  schema "sessions" do
    field :token, :string
    belongs_to :user, HospitalityHackathonBackend.User

    timestamps()
  end

  @required_fields ~w(user_id)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
  end

  def registration_changeset(model, params \\ :empty) do
    model
    |> changeset(params)
    |> put_change(:token, SecureRandom.urlsafe_base64())
  end

end
