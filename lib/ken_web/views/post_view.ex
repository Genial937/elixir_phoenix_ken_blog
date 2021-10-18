defmodule KenWeb.PostView do
  use KenWeb, :view

  def render("show.json", %{post: post}) do
    render_one(post, __MODULE__, "post.json")
  end

  def render("index.json", %{posts: posts}) do
    render_many(posts, __MODULE__, "post.json")
  end

  def render("post.json", %{post: post}) do
    %{
      id: post.id,
      title: post.title,
      content: post.content,
      url: post.url,
      created_by: post.created_by
    }
  end
end
