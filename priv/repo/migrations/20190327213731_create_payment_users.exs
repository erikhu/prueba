defmodule Proyecto.Repo.Migrations.CreatePaymentUsers do
  use Ecto.Migration

  def change do
    create table(:payment_users) do
      add :usuario, :string
      add :factura, :integer
      add :valor, :float
      add :descripcionFactura, :string
      add :tokenSeguridad, :string
      add :metodoPago, :integer
      add :documentoComprador, :integer
      add :tipoDocumento, :string
      add :nombreComprador, :string
      add :apellidoComprador, :string
      add :correoComprador, :string

      timestamps()
    end

  end
end
