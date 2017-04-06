defmodule Morty.PaymentProcessor.HTTPClient do
  @behaviour Morty.PaymentProcessor

  def create_charge(amount, card) do
    Omise.Charge.create(
      amount: amount,
      card: card,
      currency: "thb"
    )
  end
end
