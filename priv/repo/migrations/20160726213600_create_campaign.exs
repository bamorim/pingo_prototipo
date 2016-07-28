defmodule Pingo.Repo.Migrations.CreateCampaign do
  use Ecto.Migration

  def change do
    create table(:campaigns) do
      add :name, :string
      add :description, :text
      add :cover, :string

      timestamps()
    end

  end
end
