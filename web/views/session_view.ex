defmodule HospitalityHackathonBackend.SessionView do
  use HospitalityHackathonBackend.Web, :view

  def render("index.json", %{sessions: sessions}) do
    %{data: render_many(sessions, HospitalityHackathonBackend.SessionView, "session.json")}
  end

  def render("show.json", %{session: session}) do
    %{data: render_one(session, HospitalityHackathonBackend.SessionView, "session.json")}
  end

  def render("session.json", %{session: session}) do
    %{token: session.token,
      user_id: session.user_id}
  end
end
