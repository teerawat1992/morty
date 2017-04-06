defmodule Morty.Web.DonationView do
  use Morty.Web, :view

  def charities_list(charties) do
    Enum.map charties, fn(charity) ->
      {charity.title, charity.id}
    end
  end

  def amounts_list do
    [
      {"100 THB", 100_00},
      {"500 THB", 500_00},
      {"1,000 THB", 1_000_00},
      {"3,000 THB", 3_000_00},
      {"5,000 THB", 5_000_00},
    ]
  end

  def year_range do
    year = DateTime.utc_now.year
    year..(year + 10)
  end
end
