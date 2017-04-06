defmodule Morty.CharitableDonation.Charity do
  use Ecto.Schema

  import Ecto.Changeset

  schema "charities" do
    field :title, :string
    has_many :donations, Morty.CharitableDonation.Donation

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
