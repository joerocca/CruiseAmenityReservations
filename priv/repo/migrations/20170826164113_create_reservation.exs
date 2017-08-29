defmodule CruiseAmenityReservations.Repo.Migrations.CreateReservation do
  use Ecto.Migration

  def change do
    create table(:reservations) do
      add :reserved_datetime, :naive_datetime

      add :user_id, references(:users, on_delete: :delete_all)
      add :amenity_id, references(:amenities, on_delete: :delete_all)

      timestamps()
    end

  end
end
