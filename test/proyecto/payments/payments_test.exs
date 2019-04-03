defmodule Proyecto.PaymentsTest do
  use Proyecto.DataCase

  alias Proyecto.Payments

  describe "payment_users" do
    alias Proyecto.Payments.User

    @valid_attrs %{apellidoComprador: "some apellidoComprador", correoComprador: "some correoComprador", descripcionFactura: "some descripcionFactura", documentoComprador: 42, factura: 42, metodoPago: 42, nombreComprador: "some nombreComprador", tipoDocumento: "some tipoDocumento", tokenSeguridad: "some tokenSeguridad", usuario: "some usuario", valor: 120.5}
    @update_attrs %{apellidoComprador: "some updated apellidoComprador", correoComprador: "some updated correoComprador", descripcionFactura: "some updated descripcionFactura", documentoComprador: 43, factura: 43, metodoPago: 43, nombreComprador: "some updated nombreComprador", tipoDocumento: "some updated tipoDocumento", tokenSeguridad: "some updated tokenSeguridad", usuario: "some updated usuario", valor: 456.7}
    @invalid_attrs %{apellidoComprador: nil, correoComprador: nil, descripcionFactura: nil, documentoComprador: nil, factura: nil, metodoPago: nil, nombreComprador: nil, tipoDocumento: nil, tokenSeguridad: nil, usuario: nil, valor: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Payments.create_user()

      user
    end

    test "list_payment_users/0 returns all payment_users" do
      user = user_fixture()
      assert Payments.list_payment_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Payments.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Payments.create_user(@valid_attrs)
      assert user.apellidoComprador == "some apellidoComprador"
      assert user.correoComprador == "some correoComprador"
      assert user.descripcionFactura == "some descripcionFactura"
      assert user.documentoComprador == 42
      assert user.factura == 42
      assert user.metodoPago == 42
      assert user.nombreComprador == "some nombreComprador"
      assert user.tipoDocumento == "some tipoDocumento"
      assert user.tokenSeguridad == "some tokenSeguridad"
      assert user.usuario == "some usuario"
      assert user.valor == 120.5
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payments.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Payments.update_user(user, @update_attrs)
      assert user.apellidoComprador == "some updated apellidoComprador"
      assert user.correoComprador == "some updated correoComprador"
      assert user.descripcionFactura == "some updated descripcionFactura"
      assert user.documentoComprador == 43
      assert user.factura == 43
      assert user.metodoPago == 43
      assert user.nombreComprador == "some updated nombreComprador"
      assert user.tipoDocumento == "some updated tipoDocumento"
      assert user.tokenSeguridad == "some updated tokenSeguridad"
      assert user.usuario == "some updated usuario"
      assert user.valor == 456.7
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Payments.update_user(user, @invalid_attrs)
      assert user == Payments.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Payments.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Payments.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Payments.change_user(user)
    end
  end
end
