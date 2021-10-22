defmodule KenWeb.LoginController do
  use KenWeb, :controller

  def index(conn, _) do
    render(conn, "index.html")
  end
end
