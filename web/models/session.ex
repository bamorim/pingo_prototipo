defmodule Pingo.Session do
  alias Pingo.{Repo, User}
  import Comeonin.Bcrypt, only: [checkpw: 2]

  def login(username, password) do
    user = Repo.get_by(User, username: username)
    case authenticate(user, password) do
      true -> {:ok, user}
      false -> :error
    end
  end

  def authenticate(user, password) do
    case user do
      nil -> false
      _ -> checkpw(password, user.encrypted_password)
    end
  end
end
