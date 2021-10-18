defmodule Ken.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :content, :text
      add :url, :string
      add :created_by, :integer

      timestamps()
    end
  end
end
