defmodule Ken.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ken.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        created_by: 42,
        title: "some title",
        url: "some url"
      })
      |> Ken.Posts.create_post()

    post
  end
end
