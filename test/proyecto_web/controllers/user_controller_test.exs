defmodule ProyectoWeb.UserControllerTest do
  use ProyectoWeb.ConnCase

  alias Proyecto.Payments

  @create_attrs %{apellidoComprador: "some apellidoComprador", correoComprador: "some correoComprador", descripcionFactura: "some descripcionFactura", documentoComprador: 42, factura: 42, metodoPago: 42, nombreComprador: "some nombreComprador", tipoDocumento: "some tipoDocumento", tokenSeguridad: "some tokenSeguridad", usuario: "some usuario", valor: 120.5}
  @update_attrs %{apellidoComprador: "some updated apellidoComprador", correoComprador: "some updated correoComprador", descripcionFactura: "some updated descripcionFactura", documentoComprador: 43, factura: 43, metodoPago: 43, nombreComprador: "some updated nombreComprador", tipoDocumento: "some updated tipoDocumento", tokenSeguridad: "some updated tokenSeguridad", usuario: "some updated usuario", valor: 456.7}
  @invalid_attrs %{apellidoComprador: nil, correoComprador: nil, descripcionFactura: nil, documentoComprador: nil, factura: nil, metodoPago: nil, nombreComprador: nil, tipoDocumento: nil, tokenSeguridad: nil, usuario: nil, valor: nil}

  def fixture(:user) do
    {:ok, user} = Payments.create_user(@create_attrs)
    user
  end

  describe "index" do
    test "lists all payment_users", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Payment users"
    end
  end

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :new))
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "create user" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.user_path(conn, :show, id)

      conn = get(conn, Routes.user_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show User"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "edit user" do
    setup [:create_user]

    test "renders form for editing chosen user", %{conn: conn, user: user} do
      conn = get(conn, Routes.user_path(conn, :edit, user))
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "update user" do
    setup [:create_user]

    test "redirects when data is valid", %{conn: conn, user: user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @update_attrs)
      assert redirected_to(conn) == Routes.user_path(conn, :show, user)

      conn = get(conn, Routes.user_path(conn, :show, user))
      assert html_response(conn, 200) =~ "some updated apellidoComprador"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert redirected_to(conn) == Routes.user_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.user_path(conn, :show, user))
      end
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    {:ok, user: user}
  end
end
