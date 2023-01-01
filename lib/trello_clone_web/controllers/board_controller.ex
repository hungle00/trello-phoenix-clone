defmodule TrelloCloneWeb.BoardController do
  use TrelloCloneWeb, :controller
  import Phoenix.LiveView.Controller

  alias TrelloClone.Kanban
  alias TrelloClone.Kanban.Board

  def index(conn, _params) do
    boards = Kanban.list_boards()
    render(conn, "index.html", boards: boards)
  end

  def new(conn, _params) do
    changeset = Kanban.change_board(%Board{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"board" => board_params}) do
    case Kanban.create_board(board_params) do
      {:ok, board} ->
        conn
        |> put_flash(:info, "Board created successfully.")
        |> redirect(to: Routes.board_path(conn, :show, board))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    live_render(conn, TrelloCloneWeb.BoardLive, session: %{"board_id" => id})
  end

  def edit(conn, %{"id" => id}) do
    board = Kanban.get_board!(id)
    changeset = Kanban.change_board(board)
    render(conn, "edit.html", board: board, changeset: changeset)
  end

  def update(conn, %{"id" => id, "board" => board_params}) do
    board = Kanban.get_board!(id)

    case Kanban.update_board(board, board_params) do
      {:ok, board} ->
        conn
        |> put_flash(:info, "Board updated successfully.")
        |> redirect(to: Routes.board_path(conn, :show, board))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", board: board, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    board = Kanban.get_board!(id)
    {:ok, _board} = Kanban.delete_board(board)

    conn
    |> put_flash(:info, "Board deleted successfully.")
    |> redirect(to: Routes.board_path(conn, :index))
  end
end
