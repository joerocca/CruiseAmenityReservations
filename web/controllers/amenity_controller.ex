defmodule HospitalityHackathonBackend.AmenityController do
  use HospitalityHackathonBackend.Web, :controller

  alias HospitalityHackathonBackend.Amenity

  def index(conn, _params) do
    amenities = Repo.all(Amenity)
    render(conn, "index.json", amenities: amenities)
  end

  def create(conn, %{"amenity" => amenity_params}) do
    changeset = Amenity.changeset(%Amenity{}, amenity_params)

    case Repo.insert(changeset) do
      {:ok, amenity} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", amenity_path(conn, :show, amenity))
        |> render("show.json", amenity: amenity)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(HospitalityHackathonBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    amenity = Repo.get!(Amenity, id)
    render(conn, "show.json", amenity: amenity)
  end

  def update(conn, %{"id" => id, "amenity" => amenity_params}) do
    amenity = Repo.get!(Amenity, id)
    changeset = Amenity.changeset(amenity, amenity_params)

    case Repo.update(changeset) do
      {:ok, amenity} ->
        render(conn, "show.json", amenity: amenity)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(HospitalityHackathonBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    amenity = Repo.get!(Amenity, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(amenity)

    send_resp(conn, :no_content, "")
  end
end
