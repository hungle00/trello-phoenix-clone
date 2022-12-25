defmodule TrelloClone.TitleFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TrelloClone.Title` context.
  """

  @doc """
  Generate a board.
  """
  def board_fixture(attrs \\ %{}) do
    {:ok, board} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> TrelloClone.Title.create_board()

    board
  end
end
