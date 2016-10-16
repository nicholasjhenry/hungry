defmodule Hungry.Capacity do
  @spec check(non_neg_integer, non_neg_integer, map) :: {:ok, map}
  def check(_capacity, _reserved_seats, reservation) do
    {:ok, reservation}
  end
end
