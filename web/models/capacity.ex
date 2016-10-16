defmodule Hungry.Capacity do
  @spec check(non_neg_integer, (DateTime.t -> non_neg_integer), map) :: {:ok, map} | {:error, :capacity_exceeded}
  def check(capacity, get_reserved_seats, reservation) do
    reserved_seats = get_reserved_seats.(reservation.datetime)
    if capacity < reservation.quantity + reserved_seats do
      {:error, :capacity_exceeded}
    else
      {:ok, reservation}
    end
  end
end
