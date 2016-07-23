defmodule EctoDemo.Repo.Migrations.CreateCourses do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add :name, :string, null: false
      add :description, :string, null: false

      timestamps
    end
  end
end
