defmodule Hungry.ValidateTest do
  use Hungry.ModelCase
  use Timex

  describe "validation" do
    test "returns correct result on valid date" do
      rendition = %{
        datetime: "2016-02-29T12:30:30.120+00:00",
        name: "Mark Seemann",
        email: "mark@ploeh.dk",
        quantity: 4
      }

      actual = Validate.reservation rendition

      expected = {:ok, date = }
    end
  end
end
