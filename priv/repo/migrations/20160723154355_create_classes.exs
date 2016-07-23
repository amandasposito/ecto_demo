defmodule EctoDemo.Repo.Migrations.CreateClasses do
  use Ecto.Migration

  def change do
    create table(:classes) do
      add :name, :string, null: false
      add :address, :string, null: false
      add :attendees, :integer, null: false, default: 0

      add :course_id, references(:courses)

      timestamps
    end
  end
end
