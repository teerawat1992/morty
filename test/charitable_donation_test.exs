defmodule Morty.CharitableDonationTest do
  use Morty.DataCase, async: true

  alias Morty.CharitableDonation.{Charity, Donation}
  alias Morty.CharitableDonation

  setup do
    charity = Repo.insert!(%Charity{title: "Test charity"})

    {:ok, charity: charity}
  end

  test "list all charities", %{charity: charity} do
    charities = CharitableDonation.list_charities

    assert is_list(charities)
    assert Enum.count(charities) == 1
    assert charity in charities
  end

  test "create a donation", %{charity: charity} do
    {:ok, donation} = CharitableDonation.create_donation(500_00, charity.id)
    donation = Repo.preload(donation, :charity)

    assert donation.__struct__ == Donation
    assert donation.amount == Decimal.new(500)
    assert donation.charity == charity
  end
end
