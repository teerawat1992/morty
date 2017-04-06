defmodule Morty.PaymentProcessor.InMemory do
  @behaviour Morty.PaymentProcessor

  def create_charge(_amount, _card) do
    {:ok, %Omise.Charge{}}
  end
end
