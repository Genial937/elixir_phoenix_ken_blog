defmodule KenWeb.SessionView do
  use KenWeb, :view
  def render("token.json", %{access_token: access_token}) do
    %{access_token: access_token}
  end
end
