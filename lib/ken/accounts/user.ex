defmodule Ken.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string, null: false
    field :first_name, :string, null: false
    field :last_name, :string, null: false
    field :password, :string, null: false
    field :phone, :string, null: false

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :password, :phone])
    |> validate_required([:first_name, :last_name, :email, :password, :phone])
    |> unique_constraint(:email)
  end

  def registration_changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :password, :phone])
    |> validate_required([:first_name, :last_name, :email, :password, :phone])
    |> unique_constraint(:email)
    |> encrypt_and_put_password()
  end

  defp encrypt_and_put_password(user) do
    with password <- fetch_field!(user, :password) do
      encrypted_password = Bcrypt.Base.hash_password(password, Bcrypt.gen_salt(12, true))
      put_change(user, :password, encrypted_password)
    end
  end
end
