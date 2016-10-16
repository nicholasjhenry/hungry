defmodule Hungry.Repo do
  use Ecto.Repo, otp_app: :hungry
  # TODO: could be removed with Elixir 1.3.2?
  # https://github.com/jeremyjh/dialyxir/wiki/Phoenix-Dialyxir-Quickstart
  @dialyzer [
              {:nowarn_function, insert_or_update!: 2},
              {:nowarn_function, insert_or_update: 2},
            ]
end
