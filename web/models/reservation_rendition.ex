defmodule Hungry.ReservationRendition do
  defstruct datetime: nil, name: nil, email: nil, quantity: nil

  @type t :: %Hungry.ReservationRendition{datetime: String.t, name: String.t, email: String.t, quantity: integer}
end
