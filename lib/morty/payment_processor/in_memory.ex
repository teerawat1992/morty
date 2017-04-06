defmodule Morty.PaymentProcessor.InMemory do
  @behaviour Morty.PaymentProcessor

  def create_charge(_amount_subunit, "valid_card"),
    do: {:ok, %Omise.Charge{status: "successful"}}
  def create_charge(_amount_subunit, "fraudulent_card"),
    do: {:ok, %Omise.Charge{failure_message: "failed fraud check"}}
  def create_charge(_amount_subunit, "invalid_card"),
    do: {:error, %Omise.Error{message: "invalid card token"}}
end
