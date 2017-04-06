defmodule Morty.Repo.Migrations.CreateMorty.CharitableDonation.Donation do
  use Ecto.Migration

  def change do
    create table(:donations) do
      add :amount, :decimal
      add :charity_id, references(:charities, on_delete: :nothing)

      timestamps()
    end

    create index(:donations, [:charity_id])
  end
end
