defmodule HospitalityHackathonBackend.UserView do
  use HospitalityHackathonBackend.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, HospitalityHackathonBackend.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, HospitalityHackathonBackend.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      ticket_id: user.ticket_id}
  end
end
