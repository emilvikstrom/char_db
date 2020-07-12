defmodule CharDb.User do
  @callback exists?(map()) :: boolean()
  def exists?(_), do: true
end
