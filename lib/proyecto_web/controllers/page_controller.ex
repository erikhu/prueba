defmodule ProyectoWeb.PageController do
  use ProyectoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def test(conn, _params) do
    render(conn, "test.html")
  end

  def payment(conn, _params) do
    render(conn, "pagos.html")
  end

  def pay(conn, _params) do
    render(conn, "pagos.html")
  end
end
