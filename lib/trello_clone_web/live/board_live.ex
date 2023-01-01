defmodule TrelloCloneWeb.BoardLive do
  use TrelloCloneWeb, :live_view
  alias TrelloClone.Kanban

  def mount(_params, %{"board_id" => board_id}, socket) do
    board = Kanban.get_board!(board_id)
    {:ok, assign(socket, :board, board)}
  end
end