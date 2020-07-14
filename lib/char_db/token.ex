defmodule CharDb.Token do
  use Joken.Config

  @callback verify_and_validate(String.t()) :: {:ok, String.t()} | {:error, :signature_error}

  @callback valid?(String.t()) :: boolean()
  def valid?(_token), do: true

  @callback create(CharDb.Users.t()) :: {:ok, String.t()} | :error
  def create(%CharDb.Users{id: id}) do
    {:ok, token, _claims} = generate_and_sign(%{"uid" => id})

    token
  end

  defp token_config() do
    # Empty token configuration
    token_config = %{}

    # Let's create a Joken.Claim
    iss = %Joken.Claim{
      generate: fn -> "Emil" end,
      validate: fn claim_val, _claims, _context ->
        claim_val == "Emil"
      end
    }

    exp = %Joken.Claim{
      generate: fn -> unix_time() + expire_time() end,
      validate: fn val, _claims, _context -> val > unix_time() end
    }

    session = %Joken.Claim{
      generate: &create_session/0,
      validate: &validate_session/3
    }

    # Now let's add it to our token config
    Map.put(token_config, "iss", iss)
    |> Map.put("session", session)
    |> Map.put("exp", exp)
  end

  defp create_session, do: 1

  defp validate_session(claim_val, _claims, _context) do
    claim_val == 1
  end

  defp expire_time(), do: Application.get_env(:char_db, :token_expire_time, 30)

  defp unix_time(), do: DateTime.utc_now() |> DateTime.to_unix()
end
