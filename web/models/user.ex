defmodule Pingo.User do
  use Pingo.Web, :model
  import Comeonin.Bcrypt, only: [hashpwsalt: 1, checkpw: 2]

  schema "users" do
    field :username, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @required_fields [:username, :password]

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:username, min: 2)
    |> validate_length(:password, min: 6)
  end

  def encrypt_password(changeset) do
    changeset
    |> put_change(:encrypted_password, hashpwsalt(changeset.params["password"]))
  end
end
