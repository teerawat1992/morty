defmodule Morty.CharitableDonation.Donation do
  use Ecto.Schema

  import Ecto.Changeset

  schema "donations" do
    field :amount, :decimal
    belongs_to :charity, Morty.CharitableDonation.Charity

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:amount, :charity_id])
    |> validate_required([:amount, :charity_id])
  end
end
