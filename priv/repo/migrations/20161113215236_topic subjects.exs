defmodule :"Elixir.Discuss.Repo.Migrations.Topic subjects" do
  use Ecto.Migration

  def change do
    alter table(:topics) do
      add :subject, :string

      timestamps
    end
  end
end
