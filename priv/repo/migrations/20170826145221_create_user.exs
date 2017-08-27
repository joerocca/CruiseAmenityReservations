defmodule HospitalityHackathonBackend.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :ticket_id, :string

      timestamps()
    end
    create unique_index(:users, [:ticket_id])
  end
end
