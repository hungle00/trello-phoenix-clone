defmodule TrelloCloneWeb.Api.CardController do
  use TrelloCloneWeb, :controller
  alias TrelloClone.Kanban

  def update(conn, %{"id" => id, "target_column_id" => target_column_id}) do
    {:ok, card} = Kanban.get_card!(id) |> Kanban.update_card(%{column_id: target_column_id})
    json(conn, %{"id" => card.id})
  end
end
