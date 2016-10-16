defmodule Hungry.ReservationControllerTest do
  use Hungry.ConnCase

  describe "POST /reservation" do
    test "returns corrects result on success", %{conn: conn} do
      imp = fn -> :ok end
      reservation_rendition = %{
        datetime: "2016-02-29T12:30:30.120+00:00Z",
        name: "Mark Seemann",
        email: "mark@ploeh.dk",
        quantity: 4
      }

      conn = assign(conn, :imp, imp)
      conn = post conn, reservation_path(conn, :create), reservation_rendition: reservation_rendition

      assert conn.status == 200
    end
  end
end
