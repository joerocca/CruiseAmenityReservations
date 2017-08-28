defmodule HospitalityHackathonBackend.SessionController do
  use HospitalityHackathonBackend.Web, :controller

  alias HospitalityHackathonBackend.User
  alias HospitalityHackathonBackend.Session

  def create(conn, %{"user" => user_params}) do
    user = Repo.get_by(User, ticket_id: user_params["ticket_id"])
    cond do
      user ->
        session_changeset = Session.registration_changeset(%Session{}, %{user_id: user.id})
        {:ok, session} = Repo.insert(session_changeset)
        conn
        |> put_status(:created)
        |> render("show.json", session: session)
      true ->
        changeset = User.changeset(%User{}, user_params)
        case Repo.insert(changeset) do
          {:ok, user} ->
            session_changeset = Session.registration_changeset(%Session{}, %{user_id: user.id})
            {:ok, session} = Repo.insert(session_changeset)
            conn
            |> put_status(:created)
            |> render("show.json", session: session)
          {:error, changeset} ->
            conn
            |> put_status(:unprocessable_entity)
            |> render(HospitalityHackathonBackend.ChangesetView, "error.json", changeset: changeset)
        end
    end
  end
end
