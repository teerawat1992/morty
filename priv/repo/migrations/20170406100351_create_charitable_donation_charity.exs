defmodule Morty.Repo.Migrations.CreateMorty.CharitableDonation.Charity do
  use Ecto.Migration

  def change do
    create table(:charities) do
      add :title, :string

      timestamps()
    end

  end
end
