defmodule HospitalityHackathonBackend.ReservationController do
  use HospitalityHackathonBackend.Web, :controller

  alias HospitalityHackathonBackend.Reservation
  alias HospitalityHackathonBackend.Amenity

  def index(conn, %{"amenity_id" => amenity_id}) do
    # query = from(r in Reservation, where: r.amenity_id == ^amenity_id, where: r.user_id == ^user_id)
    user = conn.assigns.current_user
    query = from(r in Reservation, where: r.amenity_id == ^amenity_id, where: r.user_id == ^user.id)
    # amenity = Repo.get!(Amenity, amenity_id)
    reservations = Repo.all(query)
    render(conn, "index.json", reservations: reservations)
  end

  def create(conn, %{"reservation" => reservation_params, "amenity_id" => amenity_id}) do
    user = conn.assigns.current_user
    reservation_params = reservation_params |> Map.put_new("amenity_id", amenity_id) |> Map.put_new("user_id", user.id)
    changeset = Reservation.changeset(%Reservation{}, reservation_params)

    case Repo.insert(changeset) do
      {:ok, reservation} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", amenity_reservation_path(conn, :show, amenity_id, reservation))
        |> render("show.json", reservation: reservation)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(HospitalityHackathonBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    reservation = Repo.get!(Reservation, id)
    render(conn, "show.json", reservation: reservation)
  end

  def update(conn, %{"id" => id, "reservation" => reservation_params}) do
    reservation = Repo.get!(Reservation, id)
    changeset = Reservation.changeset(reservation, reservation_params)

    case Repo.update(changeset) do
      {:ok, reservation} ->
        render(conn, "show.json", reservation: reservation)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(HospitalityHackathonBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    reservation = Repo.get!(Reservation, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(reservation)

    send_resp(conn, :no_content, "")
  end


  # HELPERS

  defp amenity_reservations(amenity) do
    assoc(amenity, :reservations)
  end

end
