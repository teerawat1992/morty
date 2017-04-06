defmodule Morty.PaymentProcessor.HTTPClient do
  @behaviour Morty.PaymentProcessor

  def create_charge(amount_subunit, card) do
    Omise.Charge.create(
      amount: amount_subunit,
      card: card,
      currency: "thb"
    )
  end
end
