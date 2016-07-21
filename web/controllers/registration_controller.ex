defmodule Pingo.RegistrationController do
  use Pingo.Web, :controller
  alias Pingo.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})

    conn
    |> render(changeset: changeset)
  end

  def create(conn, params) do
    changeset = User.changeset(%User{}, params["user"])
    |> User.encrypt_password

    case Repo.insert(changeset) do
      {:ok, changeset} ->
        conn
        |> put_flash(:info, "Sua conta foi criada com sucesso.")
        |> redirect(to: "/")
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Erro ao se cadastrar")
        |> render("new.html", changeset: changeset)
    end
  end
end
