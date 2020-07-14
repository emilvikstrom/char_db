defmodule CharDb.Users do
  use Ecto.Schema
  import Ecto.Changeset
  alias CharDb.Repo

  schema "users" do
    field(:username, :string, null: false)
    field(:password, :string, null: false)
    field(:characters, {:array, :integer}, default: [])

    timestamps()
  end

  @type t :: %__MODULE__{}

  @callback exists?(map()) :: boolean()
  def exists?(params) do
    case read(params) do
      nil ->
        false

      %CharDb.Users{} ->
        true
    end
  end

  @callback create(map()) :: :ok
  def create(%{"username" => username, "password" => password}) do
    data = %{
      username: username,
      password: :crypto.hash(:sha256, password) |> Base.encode16()
    }

    cast(%__MODULE__{}, data, [:username, :password])
    |> unique_constraint(:username, name: "users_username_index")
    |> Repo.insert()

    :ok
  end

  @callback read(map()) :: __MODULE__.t()
  def read(%{"username" => username, "password" => password}) do
    credentials = %{
      username: username,
      password:
        :crypto.hash(:sha256, password)
        |> Base.encode16()
    }

    Repo.get_by(__MODULE__, credentials)
  end

  def read(uid) do
    Repo.get_by(__MODULE__, %{id: uid})
  end
end
