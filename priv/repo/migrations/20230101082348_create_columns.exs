defmodule TrelloClone.Repo.Migrations.CreateColumns do
  use Ecto.Migration

  def change do
    create table(:columns) do
      add :title, :string
      add :order, :integer
      add :board_id, references(:boards, on_delete: :delete_all)

      timestamps()
    end

    create index(:columns, [:board_id])
  end
end
