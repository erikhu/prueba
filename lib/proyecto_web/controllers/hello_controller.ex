defmodule ProyectoWeb.HelloController do
  use ProyectoWeb, :controller

  plug :put_layout, "admin.html"

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"messenger" => messenger}) do
    conn
    |> assign(:messenger, messenger)
    |> render("show.html")
  end

  def another(conn, %{"id" => id}) do
    html(conn, """
    <div>Algo</div>
    """)
  end

end
