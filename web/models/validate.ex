defmodule Hungry.Validate do
  @moduledoc """
  Provides convenience functions for working with maps.
  """

  alias Hungry.ReservationRendition

  @spec reservation(ReservationRendition.t) :: {:ok, map}
  def reservation(rendition) do
      with {:ok, datetime} <- Timex.parse(rendition.datetime, "{ISO:Extended}") do
        {:ok,  %{
            datetime: datetime,
            name: rendition.name,
            email: rendition.email,
            quantity: rendition.quantity
          }
        }
      end
  end
end
