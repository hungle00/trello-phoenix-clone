defmodule TrelloClone.Kanban.Column do
  use Ecto.Schema
  import Ecto.Changeset

  schema "columns" do
    field :title, :string
    field :order, :integer
    belongs_to :board, TrelloClone.Kanban.Board
    has_many :cards, TrelloClone.Kanban.Card

    timestamps()
  end

  @doc false
  def changeset(column, attrs) do
    column
    |> cast(attrs, [:title, :order, :board_id])
    |> validate_required([:title])
  end
end
