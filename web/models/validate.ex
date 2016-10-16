defmodule Hungry.Validate do
  @moduledoc """
  Provides convenience functions for working with maps.
  """
  use Timex
  alias Hungry.ReservationRendition

  @type validation_error :: String.t
  @spec reservation(ReservationRendition.t) :: {:ok, map} | {:error, validation_error}
  def reservation(rendition) do
      with {:ok, datetime} <- Timex.parse(rendition.datetime, "{ISO:Extended}") do
        {:ok, %{
            datetime: datetime,
            name: rendition.name,
            email: rendition.email,
            quantity: rendition.quantity
          }
        }
      else
        {:error, _} -> {:error, "Invalid Date"}
      end
  end
end
