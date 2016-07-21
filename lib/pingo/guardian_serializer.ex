defmodule Pingo.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias Pingo.{Repo, User}

  def for_token(%User{id: id}), do: {:ok, "User:#{id}"}
  def for_token(user = %User{}), do: {:error, "User must be persisted."}
  def for_token(_), do: {:error, "Unknown Resource Type"}

  def to_token("User" <> id), do: {:ok, Repo.get(User, id)}
  def to_token(_), do: {:error, "Unknown Resource Type"}
end
