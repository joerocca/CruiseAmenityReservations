defmodule HospitalityHackathonBackend.UserController do
  use HospitalityHackathonBackend.Web, :controller

  alias HospitalityHackathonBackend.User

  def show(conn, _params) do
    user = conn.assigns.current_user
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"user" => user_params}) do
    user = conn.assigns.current_user
    changeset = User.changeset(user, user_params)
    case Repo.update(changeset) do
      {:ok, user} ->
        render(conn, "show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(HospitalityHackathonBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
