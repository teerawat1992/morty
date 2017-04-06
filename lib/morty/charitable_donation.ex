defmodule Morty.CharitableDonation do
  alias Morty.CharitableDonation.{Charity, Donation}
  alias Morty.Repo

  def list_charities do
    Repo.all(Charity)
  end

  def create_donation(amount_subunit, charity_id) do
    amount =
      amount_subunit
      |> Decimal.new
      |> Decimal.div(Decimal.new(100))

    %Donation{}
    |> Donation.changeset(%{amount: amount, charity_id: charity_id})
    |> Repo.insert
  end
end
