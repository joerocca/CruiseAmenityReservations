defmodule HospitalityHackathonBackend.Repo.Migrations.CreateAmenity do
  use Ecto.Migration

  def change do
    create table(:amenities) do
      add :name, :string
      add :description, :string
      add :amenity_image, :string
      add :ship_location_image, :string

      timestamps()
    end

  end
end
