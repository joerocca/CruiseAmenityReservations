defmodule CruiseAmenityReservations.UserView do
  use CruiseAmenityReservations.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, CruiseAmenityReservations.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, CruiseAmenityReservations.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      ticket_id: user.ticket_id}
  end
end
