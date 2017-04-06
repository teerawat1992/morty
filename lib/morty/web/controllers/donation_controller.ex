defmodule Morty.Web.DonationController do
  use Morty.Web, :controller

  alias Morty.CharitableDonation

  @payment_processor Application.get_env(:morty, :payment_processor)

  def index(conn, _params) do
    charities = CharitableDonation.list_charities()
    render conn, "index.html", charities: charities
  end

  def create(conn, %{
    "donation" => %{"amount" => amount_subunit, "charity_id" => charity_id},
    "card" => card}) do
    case @payment_processor.create_charge(amount_subunit, card) do
      {:ok, %Omise.Charge{status: "successful"}} ->
        CharitableDonation.create_donation(amount_subunit, charity_id)
        redirect_to_donation_path(conn, :info, "Thanks for donating")

      {:ok, %Omise.Charge{failure_message: message}} ->
        redirect_to_donation_path(conn, :error, message)

      {:error, %Omise.Error{message: message}} ->
        redirect_to_donation_path(conn, :error, message)
    end
  end

  defp redirect_to_donation_path(conn, flash_key, flash_msg) do
    conn
    |> put_flash(flash_key, flash_msg)
    |> redirect(to: donation_path(conn, :index))
  end
end
