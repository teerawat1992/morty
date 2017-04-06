defmodule Morty.PaymentProcessor.HTTPClient do
  alias Omise.Charge

  @behaviour Morty.PaymentProcessor

  def create_charge(amount_subunit, card) do
    Charge.create(amount: amount_subunit, card: card, currency: "thb")
  end
end
