# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Morty.Repo.insert!(%Morty.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Morty.CharitableDonation.{Charity, Donation}
alias Morty.Repo

Repo.delete_all(Donation)
Repo.delete_all(Charity)

charity_a = Repo.insert!(%Charity{title: "Elephant Rescue Thailand"})
charity_b = Repo.insert!(%Charity{title: "Natural Resources Defense Council"})

Repo.insert!(%Donation{
  charity_id: charity_a.id,
  amount: Decimal.new(500),
})
Repo.insert!(%Donation{
  charity_id: charity_a.id,
  amount: Decimal.new(1_500),
})
Repo.insert!(%Donation{
  charity_id: charity_b.id,
  amount: Decimal.new(5_000),
})
