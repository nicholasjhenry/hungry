defmodule Hungry.ValidateTest do
  use Hungry.ModelCase

  alias Hungry.{ReservationRendition, Validate}

  describe "validation" do
    test "returns correct result on valid date" do
      rendition = struct(ReservationRendition,
        datetime: "2016-02-29T12:30:30.120+00:00Z",
        name: "Mark Seemann",
        email: "mark@ploeh.dk",
        quantity: 4
      )

      actual = Validate.reservation rendition

      expected = {:ok,  %{
          datetime: %DateTime{
            calendar: Calendar.ISO,
            day: 29,
            hour: 12,
            microsecond: {120000, 3},
            minute: 30,
            month: 2,
            second: 30,
            std_offset: 0,
            time_zone: "Etc/UTC",
            utc_offset: 0,
            year: 2016,
            zone_abbr: "UTC"
          },
          name: "Mark Seemann",
          email: "mark@ploeh.dk",
          quantity: 4
        }
      }

      assert expected == actual
    end

    test "returns correct result on invalid date" do
      rendition = struct(ReservationRendition,
        datetime: "Not a date",
        name: "Mark Seemann",
        email: "mark@ploeh.dk",
        quantity: 4
      )

      actual = Validate.reservation rendition

      expected = {:error, "Invalid Date"}

      assert expected == actual
    end
  end
end
