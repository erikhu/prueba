defmodule ProyectoWeb.PageController do
  use ProyectoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def test(conn, _params) do
    render(conn, "test.html")
  end

  def payment(conn, _params) do
    conn
    |> put_flash( :info, "htaohetun")
    |> render("pagos.html" )
  end

  def pay(conn, _params) do
    conn
    |> put_flash(:info, "Pago")
    |> fetch_flash()
    |> render("confirmation.html")
  end

  def confirmation_pay(conn, _params) do
    conn
    |> put_flash(:info, "Confirmo")
    |> fetch_flash()
    |> render("confirmation.html")
  end
end
