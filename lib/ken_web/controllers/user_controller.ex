defmodule KenWeb.UserController do
  use KenWeb, :controller

  alias Ken.Accounts
  alias Ken.Accounts.User

  action_fallback KenWeb.FallbackController
  def register(conn, %{"user" => user_params}) do
    with {:ok, user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> text("User created successfully with email: " <> " " <> user.email)
    end
  end

end
