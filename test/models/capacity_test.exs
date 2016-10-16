defmodule Hungry.CapacityTest do
  use Hungry.ModelCase

  alias Hungry.Capacity

  describe "check" do
    test "returns right result at no prior reservations" do
      capacity = 10
      reserved_seats = 0
      reservation = %{
        datetime: Timex.parse("2016-02-29T12:30:30.120+00:00Z", "{ISO:Extended}"),
        name: "Mark Seemann",
        email: "mark@ploeh.dk",
        quantity: 4
      }

      actual = Capacity.check(capacity, reserved_seats, reservation)

      expected = {:ok, reservation}
      assert expected == actual
    end
  end
end

