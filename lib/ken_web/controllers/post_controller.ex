defmodule KenWeb.PostController do
  use KenWeb, :controller
  alias Ken.Posts

  def home(conn, _) do
    render(conn, "index.html")
  end

  def create(conn, %{"post" => post_params}) do
    {:ok, post} = Posts.create_post(post_params)
    conn
    |> put_status(:created)
    |> put_resp_header("location", Routes.post_path(conn, :show, post))
    |> render("show.json", post: post)
  end

  def show(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    conn
    |> render("show.json", post: post)
  end

  def index(conn, _) do
    posts = Posts.list_posts()
    conn
    |> render("index.json", posts: posts)
  end

  def update(conn, %{"id" => id,"post" => post_params}) do
    post = Posts.get_post!(id)
    {:ok, post} = Posts.update_post(post, post_params)
    conn
    |> put_status(:created)
    |> render("show.json", post: post)
  end

  def delete(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    {:ok, post} = Posts.delete_post(post)
    conn
    |> put_status(:no_content)
    |> render("show.json", post: post)
  end
end
