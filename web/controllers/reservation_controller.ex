defmodule CruiseAmenityReservations.ReservationController do
  use CruiseAmenityReservations.Web, :controller

  alias CruiseAmenityReservations.Reservation
  alias CruiseAmenityReservations.Amenity

  def index(conn, params, user) do
    query = case params do
      %{"amenity_id" => amenity_id, "all" => all} ->
        Reservation.get_by_amenity(amenity_id)
      %{"amenity_id" => amenity_id} ->
        Reservation.get_by_user_and_amenity(user.id, amenity_id)
    end
    reservations = Repo.all(query)
    render(conn, "index.json", reservations: reservations)
  end

  def create(conn, %{"reservation" => reservation_params, "amenity_id" => amenity_id}, user) do
    amenity = Repo.get!(Amenity, amenity_id)
    reservation = build_assoc(user, :reservations)
    reservation = build_assoc(amenity, :reservations, reservation)
    changeset = Reservation.changeset(reservation, reservation_params)

    case Repo.insert(changeset) do
      {:ok, reservation} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", amenity_reservation_path(conn, :show, amenity_id, reservation))
        |> render("show.json", reservation: reservation)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(CruiseAmenityReservations.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, _user) do
    reservation = Repo.get!(Reservation, id)
    render(conn, "show.json", reservation: reservation)
  end

  def update(conn, %{"id" => id, "reservation" => reservation_params}, user) do
    reservation = Repo.get!(user_reservations(user), id)
    changeset = Reservation.changeset(reservation, reservation_params)

    case Repo.update(changeset) do
      {:ok, reservation} ->
        render(conn, "show.json", reservation: reservation)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(CruiseAmenityReservations.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, user) do
    reservation = Repo.get!(user_reservations(user), id)
    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(reservation)
    send_resp(conn, :no_content, "")
  end

  # HELPERS
  defp user_reservations(user) do
    assoc(user, :reservations)
  end

  # OVERRIDES
  def action(conn, _) do
    apply(__MODULE__, action_name(conn),
          [conn, conn.params, conn.assigns.current_user])
  end

end
