defmodule Hungry.ReservationController do
  use Hungry.Web, :controller

  alias Hungry.Reservations

  def create(conn, %{"reservation_rendition" => rendition_params}) do
    imp = conn.assigns[:imp] || &Reservations.reserve/1
    case imp.(rendition_params) do
      :ok -> send_resp(conn, 200, "OK")
      {:error, :capacity_exceeded} -> send_resp(conn, 422, "Capacity Exceeded")
      {:error, _} -> send_resp(conn, 400, "Validation Error")
    end
  end
end
