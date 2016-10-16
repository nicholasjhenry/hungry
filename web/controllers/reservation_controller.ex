defmodule Hungry.ReservationController do
  use Hungry.Web, :controller

  def create(conn, %{"reservation_rendition" => _reservation}) do
    imp = conn.assigns[:imp]
    case imp.() do
      :ok -> send_resp(conn, 200, "OK")
    end
  end
end
