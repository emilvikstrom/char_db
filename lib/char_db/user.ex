defmodule CharDb.User do
  @callback exists?(map()) :: boolean()
  def exists?(_), do: true

  @callback create(map()) :: :ok
end
