defmodule HospitalityHackathonBackend.Repo.Migrations.CreateReservation do
  use Ecto.Migration

  def change do
    create table(:reservations) do
      add :reserved_datetime, :naive_datetime

      add :amenity_id, references(:amenities, on_delete: :delete_all)

      timestamps()
    end

  end
end
