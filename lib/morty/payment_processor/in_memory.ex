defmodule Morty.PaymentProcessor.InMemory do
  alias Omise.Charge
  alias Omise.Error

  @behaviour Morty.PaymentProcessor

  def create_charge(_amount_subunit, "valid_card"),
    do: {:ok, %Charge{status: "successful"}}

  def create_charge(_amount_subunit, "fraudulent_card"),
    do: {:ok, %Charge{failure_message: "failed fraud check"}}

  def create_charge(_amount_subunit, "invalid_card"),
    do: {:error, %Error{message: "invalid card token"}}
end
