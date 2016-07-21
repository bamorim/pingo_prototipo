defmodule Pingo.SessionController do
  use Pingo.Web, :controller
  alias Pingo.Session

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, params) do
    %{"username" => username, "password" => password} = params["session"]
    case Session.login(username, password) do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user)
        |> put_flash(:info, "Bem vindo #{user.username}")
        |> redirect(to: "/")
      :error ->
        conn
        |> put_flash(:error, "Combinação de usuário e senha inválida.")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> Guardian.Plug.sign_out
    |> put_flash(:info, "Você saiu")
    |> redirect(to: "/")
  end
end
