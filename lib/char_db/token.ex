defmodule CharDb.Token do
  @callback valid?(String.t()) :: boolean()
  def valid?(_token), do: true
end
