defmodule Pingo.PageController do
  use Pingo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
