defmodule Hungry.CapacityTest do
  use Hungry.ModelCase

  alias Hungry.Capacity

  describe "check" do
    test "returns right result at no prior reservations" do
      capacity = 10
      get_reserved_seats = fn(_) -> 0 end
      reservation = %{
        datetime: Timex.parse("2016-02-29T12:30:30.120+00:00Z", "{ISO:Extended}"),
        name: "Mark Seemann",
        email: "mark@ploeh.dk",
        quantity: 4
      }

      actual = Capacity.check(capacity, get_reserved_seats, reservation)

      expected = {:ok, reservation}
      assert expected == actual
    end

    test "returns right result at too little remaining capacity" do
      capacity = 10
      get_reserved_seats = fn(_) -> 7 end
      reservation = %{
        datetime: Timex.parse("2016-02-29T12:30:30.120+00:00Z", "{ISO:Extended}"),
        name: "Mark Seemann",
        email: "mark@ploeh.dk",
        quantity: 4
      }

      actual = Capacity.check(capacity, get_reserved_seats, reservation)

      expected = {:error, :capacity_exceeded}
      assert expected == actual
    end
  end
end

