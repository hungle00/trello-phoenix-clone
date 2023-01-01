defmodule TrelloClone.KanbanFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TrelloClone.Kanban` context.
  """

  @doc """
  Generate a column.
  """
  def column_fixture(attrs \\ %{}) do
    {:ok, column} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> TrelloClone.Kanban.create_column()

    column
  end

  @doc """
  Generate a card.
  """
  def card_fixture(attrs \\ %{}) do
    {:ok, card} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> TrelloClone.Kanban.create_card()

    card
  end
end
