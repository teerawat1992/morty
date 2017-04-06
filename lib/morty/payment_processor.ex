defmodule Morty.PaymentProcessor do
  @callback create_charge(String.t | integer, String.t) ::
    {:ok, Omise.Charge.t} | {:error, Omise.Error.t}
end
