defmodule CharDbWeb.LoginView do
  use CharDbWeb, :view

  def logged_in?(user_status), do: user_status

  def render_message(""), do: ""

  def render_message(message) do
    IO.inspect(message, label: :render_message)

    """
      Fel credentials
    """
  end
end
