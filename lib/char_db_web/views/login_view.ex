defmodule CharDbWeb.LoginView do
  use CharDbWeb, :view

  def logged_in?(user_status), do: user_status

  def render_message(""), do: ""

  def render_message(message) do
    """
      Fel credentials
    """
  end
end
