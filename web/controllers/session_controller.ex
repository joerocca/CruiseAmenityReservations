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
      # user ->
      #   changeset = Changeset.add_error(%Changeset{}, :user_id, "failed to authenticate")
      #   conn
      #   |> put_status(:unauthorized)
      #   |> render(:errors, data: changeset)
      true ->
        # dummy_checkpw()
        # changeset = Changeset.add_error(%Changeset{}, :user_id, "failed to authenticate")
        # conn
        # |> put_status(:unauthorized)
        # |> render(:errors, data: changeset)
        changeset = User.changeset(%User{}, user_params)

        case Repo.insert(changeset) do
          {:ok, user} ->
            # conn
            # |> put_status(:created)
            # |> put_resp_header("location", user_path(conn, :show, user))
            # |> render("show.json", user: user)
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
