defmodule EctoDemo.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name
    field :email
    field :age, :integer

    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name, :email, :age])
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:age, 18..100)
    |> unique_constraint(:email)
  end
end

defmodule EctoDemo.Course do
  use Ecto.Schema

  schema "courses" do
    field :name
    field :description

    has_many :classes, EctoDemo.Class, on_delete: :delete_all

    timestamps()
  end
end

defmodule EctoDemo.Class do
  use Ecto.Schema

  schema "classes" do
    field :name
    field :address
    field :attendees, :integer, default: 0

    belongs_to :course, EctoDemo.Course
    has_many :enrollments, EctoDemo.Enrollment, on_delete: :delete_all

    timestamps()
  end
end

defmodule EctoDemo.Enrollment do
  use Ecto.Schema

  schema "enrollments" do
    field :status

    belongs_to :class, EctoDemo.Class
    belongs_to :user, EctoDemo.User

    timestamps()
  end
end
