defmodule Hungry.Reservations do
  alias Hungry.{ReservationRendition, Capacity, Validate}

  @capacity 10

  # Command Handlers

  def reserve(%{"datetime" => datetime, "name" => name, "email" => email, "quantity" => quantity}) do
    with rendition = %ReservationRendition{datetime: datetime, name: name, email: email, quantity: String.to_integer(quantity)},
      {:ok, reservation_params} <- Validate.reservation(rendition),
      {:ok, reservation_params} <- Capacity.check(@capacity, &get_reserved_seats/1, reservation_params),
    do: save_reservation(reservation_params)
  end

  # Repo

  def get_reserved_seats(_datetime), do: 3
  def save_reservation(_params), do: :ok
end
