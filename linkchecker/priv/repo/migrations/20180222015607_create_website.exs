defmodule Repo.Migrations.CreateWesbite do
  use Ecto.Migration

  def change do
    create table(:websites) do
      add :url, :string
      add :disabled, :boolean
      add :results, :string
    end
  end
end
