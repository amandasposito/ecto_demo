defmodule EctoDemo.Repo.Migrations.CreateEnrollments do
  use Ecto.Migration

  def change do
    create table(:enrollments) do
      add :status, :string, null: false

      add :class_id, references(:classes), null: false
      add :user_id, references(:users), null: false

      timestamps
    end
  end
end
