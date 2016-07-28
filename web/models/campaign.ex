defmodule Pingo.Campaign do
  use Pingo.Web, :model
  use Arc.Ecto.Schema

  schema "campaigns" do
    field :name, :string
    field :description, :string
    field :cover, Pingo.CampaignCover.Type

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description])
    |> cast_attachments(params, [:cover])
    |> validate_required([:name, :description, :cover])
  end
end
