defmodule ElixirConfAfrica.Repo.Migrations.CreateTickets do
  use Ecto.Migration

  def change do
    create table(:tickets) do
      add :type, :string, null: false
      add :description, :string, null: false
      add :price, :decimal, null: false
      add :ticket_number, :integer, null: false
      add :event_id, references(:events, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:tickets, [:event_id])

    alter table(:events) do
      add :tickets, references(:tickets, on_delete: :nothing)
    end
  end
end
