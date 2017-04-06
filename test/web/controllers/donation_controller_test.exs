defmodule Morty.Web.DonationControllerTest do
  use Morty.Web.ConnCase, async: true

  alias Morty.CharitableDonation.{Charity, Donation}
  alias Morty.Repo

  setup do
    charity = Repo.insert!(%Charity{title: "Test charity"})

    {:ok, charity: charity}
  end

  test "navigate to donation index page", %{conn: conn} do
    conn = get conn, donation_path(conn, :index)
    assert html_response(conn, 200) =~ "Donate to the charity you like"
  end

  test "create a donation with valid card",
    %{conn: conn, charity: charity} do
    conn = post conn, donation_path(conn, :create), %{
      "donation" => %{"amount" => "10000", "charity_id" => charity.id},
      "card" => "valid_card",
    }

    assert redirected_to(conn) == donation_path(conn, :index)
    assert get_flash(conn, :info) == "Thanks for donating"
    assert Repo.aggregate(Donation, :count, :id) == 1

    donation = Repo.one(Donation)

    assert donation.amount == Decimal.new(100)
    assert donation.charity_id == charity.id
  end

  test "create a donation with fraudulent card",
    %{conn: conn, charity: charity} do
    conn = post conn, donation_path(conn, :create), %{
      "donation" => %{"amount" => "10000", "charity_id" => charity.id},
      "card" => "fraudulent_card",
    }

    assert redirected_to(conn) == donation_path(conn, :index)
    assert get_flash(conn, :error) == "failed fraud check"
    assert Repo.aggregate(Donation, :count, :id) == 0
  end

  test "create a donation with invalid card",
    %{conn: conn, charity: charity} do
    conn = post conn, donation_path(conn, :create), %{
      "donation" => %{"amount" => "10000", "charity_id" => charity.id},
      "card" => "invalid_card",
    }

    assert redirected_to(conn) == donation_path(conn, :index)
    assert get_flash(conn, :error) == "invalid card token"
    assert Repo.aggregate(Donation, :count, :id) == 0
  end
end
