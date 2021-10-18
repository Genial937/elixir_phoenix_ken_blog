defmodule Ken.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string, null: true
    field :created_by, :integer, null: true
    field :title, :string, null: true
    field :url, :string, null: true

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content, :url, :created_by])
    |> validate_required([:title, :content, :url, :created_by])
  end
end
