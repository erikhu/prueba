defmodule Proyecto.Payments.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "payment_users" do
    field :apellidoComprador, :string
    field :correoComprador, :string
    field :descripcionFactura, :string
    field :documentoComprador, :integer
    field :factura, :integer
    field :metodoPago, :integer
    field :nombreComprador, :string
    field :tipoDocumento, :string
    field :tokenSeguridad, :string
    field :usuario, :string
    field :valor, :float

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:usuario, :factura, :valor, :descripcionFactura, :tokenSeguridad, :metodoPago, :documentoComprador, :tipoDocumento, :nombreComprador, :apellidoComprador, :correoComprador])
    |> validate_required([:usuario, :factura, :valor, :descripcionFactura, :tokenSeguridad, :metodoPago, :documentoComprador, :tipoDocumento, :nombreComprador, :apellidoComprador, :correoComprador])
  end
end
